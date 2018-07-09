package com.cafe24.devbit004.pop.social.config.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.social.connect.Connection;
import org.springframework.social.connect.web.SignInAdapter;
import org.springframework.web.context.request.NativeWebRequest;

import javax.servlet.http.HttpServletResponse;

public class UserCookieSignInAdapter implements SignInAdapter {
    private static final Logger logger = LoggerFactory.getLogger(UserCookieSignInAdapter.class);

    @Override
    public String signIn(String userId,
                         Connection<?> connection,
                         NativeWebRequest request) {
        logger.info("singIn called...");
        logger.info("signing in user {} (connected via {}",
                userId,
                connection.getKey().getProviderId());
        SecurityContext.setCurrentUser(new User(userId));
        UserCookieGenerator userCookieGenerator = new UserCookieGenerator();
        userCookieGenerator.addCookie(userId, request.getNativeResponse(HttpServletResponse.class));
        logger.info("singIn return null...");

        return null;
    }
}
