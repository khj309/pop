package com.cafe24.devbit004.pop.common.config;

import com.cafe24.devbit004.pop.admin.controller.AdminController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.core.env.Environment;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.security.crypto.encrypt.Encryptors;
import org.springframework.social.UserIdSource;
import com.cafe24.devbit004.pop.social.api.Cafe24;
import com.cafe24.devbit004.pop.social.config.util.Cafe24Interceptor;
import com.cafe24.devbit004.pop.social.config.util.ProviderUserIdConnectionSignUp;
import com.cafe24.devbit004.pop.social.config.util.UserCookieSignInAdapter;
import com.cafe24.devbit004.pop.social.connect.Cafe24ConnectionFactory;
import org.springframework.social.config.annotation.ConnectionFactoryConfigurer;
import org.springframework.social.config.annotation.EnableSocial;
import org.springframework.social.config.annotation.SocialConfigurer;
import org.springframework.social.connect.Connection;
import org.springframework.social.connect.ConnectionFactoryLocator;
import org.springframework.social.connect.ConnectionRepository;
import org.springframework.social.connect.UsersConnectionRepository;
import org.springframework.social.connect.jdbc.JdbcUsersConnectionRepository;
import org.springframework.social.connect.web.ConnectController;
import org.springframework.social.connect.web.ProviderSignInController;
import org.springframework.web.context.WebApplicationContext;

import javax.sql.DataSource;

/**
 * @author Petri Kainulainen
 */
@Configuration
@EnableSocial
@EnableJpaRepositories
public class SocialContext implements SocialConfigurer {

    private final static Logger logger = LoggerFactory.getLogger(SocialContext.class);

    @Autowired
    private DataSource dataSource;

    private static JdbcUsersConnectionRepository jdbcUsersConnectionRepository;


    /**
     * 환경 변수를 받아서 Cafe24ConnectionFactory 생성
     * @param env
     * @return cafe24ConnectionFactory 인스턴스 반환
     */
    @Bean
    public Cafe24ConnectionFactory cafe24ConnectionFactory(Environment env){
        Cafe24ConnectionFactory cafe24ConnectionFactory = new Cafe24ConnectionFactory(
                env.getProperty("cafe24.app.id"),
                env.getProperty("cafe24.app.secret"),
                env.getProperty("cafe24.redirect.uri"),
                env.getProperty("cafe24.scope")
        );
        return cafe24ConnectionFactory;
    }

    /**
     * {@link SocialConfigurer}의 addConnectionFactories를 구현하는 메서드.
     * {@link ConnectionFactoryLocator}에 cafe24ConnectionFactory 인스턴스 등록.
     *
     * @param cfConfig 스프링 소셜의 시큐리티 모듈이 클래스패스 상에서 가능할 경우, {@link org.springframework.social.security.SocialAuthenticationServiceRegistry}가 작동하고
     *                 {@link org.springframework.social.security.provider.SocialAuthenticationService}로 ConnectionFactory를 감싼다.
     *                 스프링 소셜의 경우 {@link org.springframework.social.config.annotation.SecurityEnabledConnectionFactoryConfigurer}이 구현체 사용.
     * @param env
     */
    @Override
    public void addConnectionFactories(ConnectionFactoryConfigurer cfConfig, Environment env) {
        logger.debug("addConnectionFactories started..." );
        cfConfig.addConnectionFactory(cafe24ConnectionFactory(env));
    }


    /**
     * {@link org.springframework.social.config.annotation.SocialConfiguration}에 정의된 콜백 메서드.
     * 현재 유저를 유니크하게 식별하는 {@link UserIdSource}를 생성하.
     * @return UserIdSource 타입의 값 반환(ex: {@link SocialConfig}의 SessionIdUserIdSource uuid: baa07bb3-56e1-4fff-a15e-c92424aeb319)
     */
    @Override
    public UserIdSource getUserIdSource() {
        return new SocialConfig().getUserIdSource();
    }


    /**
     * Controller나 api 호출하는 부분에서 api를 요청하는 경우 해당 api 타입에 해당한 primary connection을 찾아서 반환.
     * @param repository
     * @return
     */
    /* Scope 어노테이션이 메서드 레벨에서 @Bean과 함께 사용되면, @Scope는 해당 메서드로부터 반환되는 인스턴스를 위해 사용할 스코프의 이름을 나타낸다 */
    @Bean
    @Scope(value=WebApplicationContext.SCOPE_REQUEST, proxyMode=ScopedProxyMode.TARGET_CLASS)
    public Cafe24 cafe24(ConnectionRepository repository) {
        logger.debug("cafe24 bean called...");
        Connection<Cafe24> connection = repository.findPrimaryConnection(Cafe24.class);
        logger.debug("cafe24 connection getApi().getMallId(): " + connection.getApi().getMallId());
        logger.debug("cafe24 connection getKey().getProviderUserId(): " + connection.getKey().getProviderUserId());
        logger.debug("cafe24 connection getKey().getProviderId(): " + connection.getKey().getProviderId());
        logger.debug("cafe24 connection getDisplayName(): " + connection.getDisplayName());

        return connection != null ? connection.getApi() : null;
    }

    /**
     * LoginController로 유저 진입시 해당 유저에 대한 ConnectionRepository를 유일한 uuid 값으로 생성한다.
     * ConnectionRepository 생성은 JdbcUsersConnectionRepository를 통해서만 가능하다.
     * @return
     */
    @Bean
    @Scope(value=WebApplicationContext.SCOPE_REQUEST, proxyMode=ScopedProxyMode.INTERFACES)
    public ConnectionRepository connectionRepository() {
        logger.debug("connectionRepository called...");
        return jdbcUsersConnectionRepository.createConnectionRepository(getUserIdSource().getUserId());
    }



    @Override
    public UsersConnectionRepository getUsersConnectionRepository(ConnectionFactoryLocator connectionFactoryLocator) {
        logger.debug("getUsersConnectionRepository started..." );

        JdbcUsersConnectionRepository repository = new JdbcUsersConnectionRepository(
                dataSource,
                connectionFactoryLocator,
                Encryptors.noOpText()
        );
        jdbcUsersConnectionRepository = repository;
        repository.setConnectionSignUp(new ProviderUserIdConnectionSignUp());

        return repository;
    }

    /**
     * This bean manages the connection flow between the account provider and
     * the example application.
     */
    @Bean
    public ConnectController connectController(ConnectionFactoryLocator connectionFactoryLocator, ConnectionRepository connectionRepository) {
        ConnectController connectController = new AdminController(connectionFactoryLocator, connectionRepository);
        connectController.addInterceptor(new Cafe24Interceptor());

        return connectController;
    }

    /**
     * The Spring MVC Controller that allows users to sign-in with their provider accounts.
     */
    @Bean
    public ProviderSignInController providerSignInController(ConnectionFactoryLocator connectionFactoryLocator,
                                                             UsersConnectionRepository usersConnectionRepository) {
        ProviderSignInController providerSignInController
                = new ProviderSignInController(connectionFactoryLocator,
                usersConnectionRepository,
                new UserCookieSignInAdapter());
        providerSignInController.setPostSignInUrl("/admin/result");
        return providerSignInController;
    }



}
