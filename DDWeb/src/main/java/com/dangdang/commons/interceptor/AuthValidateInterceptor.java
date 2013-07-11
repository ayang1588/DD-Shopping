package com.dangdang.commons.interceptor;

import com.dangdang.commons.utils.CookieUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;

/**
 * Description: 需要用户登录才可操作的拦截器
 * Author: 柳阳
 * Email: ayang1588@163.com
 * Date: 2013-5-4
 * Time: 下午4:09
 */
public class AuthValidateInterceptor extends HandlerInterceptorAdapter {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String loginStatus = null;
        String loginEmail = null;
        try {
            loginStatus = CookieUtils.findCookie("loginStatus", request);
            loginEmail = CookieUtils.findCookie("loginEmail", request);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        // 如果没有登录状态或者登录状态为0
        if (loginEmail == null || loginStatus == null || loginStatus.trim().equals("0")) {
            response.sendRedirect("/toLogin");
            return false;
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        super.postHandle(request, response, handler, modelAndView);
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        super.afterCompletion(request, response, handler, ex);
    }
}
