package com.cafe24.devbit004.pop.admin.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.GenericTypeResolver;
import org.springframework.core.env.Environment;
import com.cafe24.devbit004.pop.social.api.Cafe24;
import com.cafe24.devbit004.pop.social.api.Product;
import com.cafe24.devbit004.pop.social.api.ProductOperations;
import com.cafe24.devbit004.pop.social.config.util.UserCookieSignInAdapter;
import com.cafe24.devbit004.pop.social.connect.Cafe24OAuth2Connection;
import com.cafe24.devbit004.pop.social.connect.Cafe24OAuth2Template;
import org.springframework.social.connect.*;
import org.springframework.social.connect.support.OAuth2ConnectionFactory;
import org.springframework.social.connect.web.*;
import org.springframework.social.support.URIBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.Assert;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.view.RedirectView;
import org.springframework.web.util.UrlPathHelper;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.security.InvalidKeyException;
import java.security.Key;
import java.security.NoSuchAlgorithmException;
import java.util.*;


@Controller("AdminController")
@RequestMapping("/admin")
public class AdminController extends ConnectController {

    private static final Logger logger = LoggerFactory.getLogger(AdminController.class);
    private static final String ALGORITHM = "HmacSHA256";


    /* SocialContext에서 jdbcUsersConnectionRepository가 주입된다 */
    @Autowired
    private UsersConnectionRepository usersConnectionRepository;
    @Autowired
    private Environment environment;


    private Cafe24 cafe24;

    private final UrlPathHelper urlPathHelper = new UrlPathHelper();

    private final MultiValueMap<Class<?>, ConnectInterceptor<?>> connectInterceptors = new LinkedMultiValueMap<Class<?>, ConnectInterceptor<?>>();
    private final ConnectionFactoryLocator connectionFactoryLocator;

    /* 실질적으로 연결을 DB에 저장하고 찾는 필드로 SocialContext에서 connectionRepository로 Bean이 등록되어 있다. */
    private final ConnectionRepository connectionRepository;

    private final ConnectSupport connectSupport;

    private SessionStrategy sessionStrategy;

    /* Sign in 과 관련된 필드 */
    private final UserCookieSignInAdapter userCookieSignInAdapter;
    private final MultiValueMap<Class<?>, ProviderSignInInterceptor<?>> signInInterceptors = new LinkedMultiValueMap<Class<?>, ProviderSignInInterceptor<?>>();
    /**
     * Constructs a ConnectController.
     *
     * @param connectionFactoryLocator the locator for {@link ConnectionFactory} instances needed to establish connections
     * @param connectionRepository     the current user's {@link ConnectionRepository} needed to persist connections; must be a proxy to a request-scoped bean
     */
    @Inject
    public AdminController(ConnectionFactoryLocator connectionFactoryLocator, ConnectionRepository connectionRepository) {
        super(connectionFactoryLocator, connectionRepository);
        this.connectionFactoryLocator = connectionFactoryLocator;
        this.connectionRepository = connectionRepository;
        this.sessionStrategy = new HttpSessionSessionStrategy();
        this.connectSupport = new ConnectSupport(this.sessionStrategy);
        this.userCookieSignInAdapter = new UserCookieSignInAdapter();
    }


    @RequestMapping(value = "/result")
    public String result(NativeWebRequest request, Model model, @RequestParam(value = "number", required = false) Long number) {
        logger.info("in /result handler");
        ProductOperations productTemplate = cafe24.productOperations();

        /*Cafe24OAuth2Connection cafe24OAuth2Connection = (Cafe24OAuth2Connection) cafe24;
        if (cafe24OAuth2Connection.hasExpired()) {
            cafe24OAuth2Connection.refresh();
        }*/

        logger.debug("result number: " + number);
        Map<String, Object> params = new HashMap<>();
        if (number != null) {
            params.put("limit", number);
        }
        List<Product> productList = productTemplate.getProducts(params.size() > 0 ? params : null);
        logger.info("result productList");



        if (productList != null) {
            for (Product product : productList) {
                logger.info("AdminController result getShopNo: " + product.getShopNo());
                logger.info("AdminController result getProductName: " + product.getProductName());
                logger.info("AdminController result getProductCode: " + product.getProductCode());
                logger.info("AdminController result getProductNo: " + product.getProductNo());
                logger.info("AdminController result getDetailImage: " + product.getDetailImage());
            }
        } else {
            logger.info("AdminController result productList 가져오기 실패");

        }
        model.addAttribute("productList", productList);
        return "user/result";
    }

    @RequestMapping(value = "/login")
    public String login() {
        logger.info("in /login handler");

        return "admin/popup_management";
    }

    @Override
    public String connectionStatus(NativeWebRequest request, Model model) {
        logger.info("connectionStatus(NativeWebRequest request, Model model) called...");
        return super.connectionStatus(request, model);
    }

    @Override
    @RequestMapping(value="/{providerId}", method=RequestMethod.GET)
    public String connectionStatus(@PathVariable String providerId, NativeWebRequest request, Model model) {
        logger.info("connectionStatus(String providerId, NativeWebRequest request, Model model) called...");
        return super.connectionStatus(providerId, request, model);
    }


    @RequestMapping(value = "/{providerId}", method = RequestMethod.GET, params = {"mall_id", "hmac"})
    public RedirectView connect(@PathVariable String providerId, @RequestParam HashMap<String , String > params, NativeWebRequest request) {

        logger.debug("connect handler called...");

        if (params.size() > 0) {
            Set<String> keys = params.keySet();
            for (String key : keys) {
                logger.debug("connectionStatus params.get( " + key + " ): " + params.get(key));
            }
        }
        if (params.size() > 0) {
            /* 전달된 hmac 값을 저장 */
            String originHmac = params.get("hmac");

            /* 다른 매개변수들 통해 hmac 값 구하기 */
            Assert.notNull(params, "app 접근시 전달되는 쿼리 스트링이 null이면 안 된다.");
            String hmacDecodedFromQueryString = getHmac(params, environment.getProperty("cafe24.app.secret"));
            logger.debug("connect hmacValue: " + hmacDecodedFromQueryString);

            logger.debug("connect originHmac: " + originHmac);
            if (hmacDecodedFromQueryString.equals(originHmac)) {
                logger.debug("hmac 검사 통과");
            }

        } else {
            logger.debug("params == null so setting default mall_id as utkg3000");
            params.put("mall_id", "utkg3000");
        }

        return super.connect(providerId, request);
    }


    @Override
    @RequestMapping(value = "/{providerId}", method = RequestMethod.GET,  params="code")
    public RedirectView oauth2Callback(@PathVariable String providerId, NativeWebRequest request) {
        try {
            logger.info("oauth2Callback started...");
            logger.info("oauth2Callback providerId: " + providerId);
            logger.info("oauth2Callback getParameter(code): " + request.getParameter("code"));
            OAuth2ConnectionFactory<?> connectionFactory = (OAuth2ConnectionFactory<?>) connectionFactoryLocator.getConnectionFactory(providerId);
            logger.info("oauth2Callback connectionFactory.getClass().getName(): " + connectionFactory.getClass().getName());
            String code = request.getParameter("code");
            logger.info("oauth2Callback code: " + code);

            Connection<?> connection = connectSupport.completeConnection(connectionFactory, request);
            logger.info("oauth2Callback connection done...");

//            cafe24Template = (Cafe24Template) connection.getApi();
            Cafe24OAuth2Connection cafe24OAuth2Connection = (Cafe24OAuth2Connection) connection;

            this.cafe24 =  cafe24OAuth2Connection.getApi();
            addConnection(connection, connectionFactory, request);
            handleSignIn(connection, connectionFactory, request);

        } catch (Exception e) {
            logger.info("e.getMessage: " + e.getMessage());

            e.getStackTrace();
            sessionStrategy.setAttribute(request, PROVIDER_ERROR_ATTRIBUTE, e);
            logger.warn("1111Exception while handling OAuth2 callback (" + e.getMessage() + "). Redirecting to " + providerId +" connection status page.");
        }
//        return connectionStatusRedirect(providerId, request);
        return new RedirectView("/admin/login", true);
    }




    private RedirectView handleSignIn(Connection<?> connection, ConnectionFactory<?> connectionFactory, NativeWebRequest request) {
        logger.info("handleSignIn called...");
        List<String> userIds = usersConnectionRepository.findUserIdsWithConnection(connection);
        if (userIds.contains(Cafe24OAuth2Template.getMallId())) {
            /* 해당 유저 정보 찾아와서 액세스 토큰 만료됐다면 리프레시*/
        }
        if (userIds != null) {
            logger.info("handleSignIn userIds: " + userIds);
        }
        if (userIds.size() == 0) {
            ProviderSignInAttempt signInAttempt = new ProviderSignInAttempt(connection);
            logger.info("handleSignIn userIds.size() == 0");

            sessionStrategy.setAttribute(request, ProviderSignInAttempt.SESSION_ATTRIBUTE, signInAttempt);
            return redirect("/");
        } else if (userIds.size() == 1) {
            logger.info("handleSignIn userIds.size() == 1");

            /* 해당하는 아이디가 있다면 업데이트 */
            usersConnectionRepository.createConnectionRepository(userIds.get(0)).updateConnection(connection);
            String originalUrl = userCookieSignInAdapter.signIn(userIds.get(0), connection, request);
            postSignIn(connectionFactory, connection, request);
            return originalUrl != null ? redirect(originalUrl) : redirect("/admin/result");
        } else {
            logger.info("handleSignIn userIds.size() > 1");
            /* 해당하는 아이디가 한 개를 초과하면 멀티 유저 에러 */
            return redirect(URIBuilder.fromUri("/admin/result").queryParam("error", "multiple_users").build().toString());
        }
    }

    private RedirectView redirect(String url) {
        return new RedirectView(url, true);
    }


    private void addConnection(Connection<?> connection, ConnectionFactory<?> connectionFactory, WebRequest request) {
        logger.info("addConnection started...");
        try {
            logger.info("addConnection 1");

            connectionRepository.addConnection(connection);
            logger.info("addConnection 2");

            postConnect(connectionFactory, connection, request);
            logger.info("addConnection 3");

        } catch (DuplicateConnectionException e) {
            logger.info("addConnection DuplicateConnectionException");

            sessionStrategy.setAttribute(request, DUPLICATE_CONNECTION_ATTRIBUTE, e);
        }
    }

    @SuppressWarnings({ "rawtypes", "unchecked" })
    private void postConnect(ConnectionFactory<?> connectionFactory, Connection<?> connection, WebRequest request) {
        logger.info("postConnect started...");
        for (ConnectInterceptor interceptor : interceptingConnectionsTo(connectionFactory)) {
            logger.info("postConnect interceptor: " + interceptor.getClass().getName());
            interceptor.postConnect(connection, request);
        }
    }

    private void postSignIn(ConnectionFactory<?> connectionFactory, Connection<?> connection, WebRequest request) {
        for (ProviderSignInInterceptor interceptor : interceptingSignInTo(connectionFactory)) {
            interceptor.postSignIn(connection, request);
        }
    }

    private List<ProviderSignInInterceptor<?>> interceptingSignInTo(ConnectionFactory<?> connectionFactory) {
        Class<?> serviceType = GenericTypeResolver.resolveTypeArgument(connectionFactory.getClass(), ConnectionFactory.class);
        List<ProviderSignInInterceptor<?>> typedInterceptors = signInInterceptors.get(serviceType);
        if (typedInterceptors == null) {
            typedInterceptors = Collections.emptyList();
        }
        return typedInterceptors;
    }

    private List<ConnectInterceptor<?>> interceptingConnectionsTo(ConnectionFactory<?> connectionFactory) {
        logger.info("interceptingConnectionsTo started...");

        Class<?> serviceType = GenericTypeResolver.resolveTypeArgument(connectionFactory.getClass(), ConnectionFactory.class);
        List<ConnectInterceptor<?>> typedInterceptors = connectInterceptors.get(serviceType);
        if (typedInterceptors == null) {
            typedInterceptors = Collections.emptyList();
        }
        return typedInterceptors;
    }


    /* 연결/비연결 여부를 알려주는 페이지로 리다이렉트하기 위한 메서드 */
    protected RedirectView connectionStatusRedirect(String providerId, NativeWebRequest request) {
        logger.info("connectionStatusRedirect started...");
        HttpServletRequest servletRequest = request.getNativeRequest(HttpServletRequest.class);
        String path = "/admin/result/" +  getPathExtension(servletRequest);
        logger.info("connectionStatusRedirect path: " + path);

        if (prependServletPath(servletRequest)) {
            path = servletRequest.getServletPath() + path;
            logger.info("connectionStatusRedirect path in if(prependServletPath): " + path);

        }
        return new RedirectView(path, true);
    }

    private boolean prependServletPath(HttpServletRequest request) {
        logger.info("prependServletPath started...");

        return !this.urlPathHelper.getPathWithinServletMapping(request).equals("");
    }

    private String getPathExtension(HttpServletRequest request) {
        logger.info("getPathExtension started...");

        String fileName = extractFullFilenameFromUrlPath(request.getRequestURI());
        logger.info("getPathExtension fileName: " + fileName);

        String extension = StringUtils.getFilenameExtension(fileName);
        logger.info("getPathExtension extension: " + extension);

        return extension != null ? "." + extension : "";
    }

    private String extractFullFilenameFromUrlPath(String urlPath) {
        logger.info("extractFullFilenameFromUrlPath started...");

        int end = urlPath.indexOf('?');
        if (end == -1) {
            end = urlPath.indexOf('#');
            if (end == -1) {
                end = urlPath.length();
            }
        }
        int begin = urlPath.lastIndexOf('/', end) + 1;
        logger.info("extractFullFilenameFromUrlPath begin: " + begin);

        int paramIndex = urlPath.indexOf(';', begin);
        logger.info("extractFullFilenameFromUrlPath paramIndex: " + paramIndex);

        end = (paramIndex != -1 && paramIndex < end ? paramIndex : end);
        logger.info("extractFullFilenameFromUrlPath end: " + end);
        String result = urlPath.substring(begin, end);
        logger.info("extractFullFilenameFromUrlPath result: " + result);

        return result;
    }

    private static String getHmac(Map<String, String> params, String clientKey) {
        /* hmac은 필요없으므로 삭제 */
        params.remove("hmac");
        /* GET으로 온 변수들을 이름순으로 정렬 */
        List<String > keys = new ArrayList<>(params.keySet());
        Collections.sort(keys);

        /* 이름순으로 정렬된 변수를 사용하여 "변수=값&변수=값&..." 형식의 쿼리 스트링 만들기 */
        StringBuilder sb = new StringBuilder();
        for (String key : keys) {
            sb.append(key).append("=").append(params.get(key)).append(!keys.get(keys.size() - 1).equals(key) ? "?" : "");

        }
        String queryString = new String(sb);
        logger.debug("getHmac queryString: " + queryString);

        String result = null;
        try {
            /* 쿼리 스트링을 URL 인코딩 하기 */
            String urlEncodedQueryString
                    = URLEncoder.encode(queryString, "UTF-8")
                    .replaceAll("(\\%3D)", "=")
                    .replaceAll("(\\%3F)", "&");

            /* key 등록 및 필요한 알고리즘 가져오기 */
            Key key = new SecretKeySpec(clientKey.getBytes("UTF-8"), ALGORITHM);
            Mac sha256 = Mac.getInstance(key.getAlgorithm());
            sha256.init(key);

            /* 쿼리 스트링 해싱하기 */
            byte[] resultByte = sha256.doFinal(urlEncodedQueryString.getBytes("UTF-8"));

            /* 해싱된 쿼리 스트링을 base64로 인코딩하기 */
            byte[] base64EncodedResultByte = Base64.getEncoder().encode(resultByte);
            result = new String(base64EncodedResultByte);
            logger.debug("getHmac result: " + result);
        } catch (NoSuchAlgorithmException | UnsupportedEncodingException | InvalidKeyException e) {
            e.printStackTrace();
        }
        return result;
    }
}
