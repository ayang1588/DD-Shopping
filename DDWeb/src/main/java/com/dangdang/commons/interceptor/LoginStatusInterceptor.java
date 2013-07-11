package com.dangdang.commons.interceptor;

import com.dangdang.commons.utils.CookieUtils;
import com.dangdang.commons.utils.DateUtils;
import com.dangdang.service.IUserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Description: 拦截所有请求，判断用户cookie信息
 * Author: 柳阳
 * Email: ayang1588@163.com
 * Date: 2013-4-28
 * Time: 下午9:46
 */
public class LoginStatusInterceptor extends HandlerInterceptorAdapter {
    private final static Logger logger = Logger.getLogger(LoginStatusInterceptor.class);

    private IUserService userService;

    private Integer loginValidTime;

    /**
     * 该方法也是需要当前对应的Interceptor的preHandle方法的返回值为true时才会执行。
     * 该方法将在整个请求完成之后，也就是DispatcherServlet渲染了视图执行，
     * 这个方法的主要作用是用于清理资源的，当然这个方法也只能在当前这个Interceptor的preHandle方法的返回值为true时才会执行。
     */
    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
        super.afterCompletion(request, response, handler, ex);
    }

    /**
     * preHandle方法是进行处理器拦截用的，顾名思义，该方法将在Controller处理之前进行调用，SpringMVC中的Interceptor拦截器是链式的，可以同时存在
     * 多个Interceptor，然后SpringMVC会根据声明的前后顺序一个接一个的执行，而且所有的Interceptor中的preHandle方法都会在
     * Controller方法调用之前调用。SpringMVC的这种Interceptor链式结构也是可以进行中断的，这种中断方式是令preHandle的返
     * 回值为false，当preHandle的返回值为false的时候整个请求就结束了。
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String loginEmail = CookieUtils.findCookie("loginEmail", request);
        String loginTime = CookieUtils.findCookie("loginTime", request);
        String loginStatus = CookieUtils.findCookie("loginStatus", request);
        String lastOpTime = CookieUtils.findCookie("lastOpTime", request);
        //1.请求到登录页面 放行
        if (request.getServletPath().equals("/toLogin")) {
            return true;
        }

        //2.判断上次最后操作的时间与当前时间间隔是否超过有效期
        //  如果有登录操作过，并在有效期内
        if (lastOpTime != null &&
                DateUtils.minuteBetweenTwoTime(Long.parseLong(lastOpTime), System.currentTimeMillis()) < loginValidTime) {
            CookieUtils.addCookie("lastOpTime", System.currentTimeMillis() + "", response);
//            CookieUtils.addCookie("loginEmail", user.getEmail(), response);
//            CookieUtils.addCookie("loginTime", System.currentTimeMillis() + "", response);
//            CookieUtils.addCookie("loginStatus", "1", response);
//            CookieUtils.addCookie("lastOpTime", System.currentTimeMillis()+"", response);
        } else {
            CookieUtils.addCookie("loginStatus", "0", response);
        }
        //3. 如果当前用户处于登录有效状态，设置user对象
        //  该步骤放到前台通过javascript实现，因为该拦截器会拦截所有请求，
        //  不会出现登录网站，并且状态为0是显示user

        //4. 如果用户处于登录状态，判断数据库中的该用户的登陆时间是否与cookie中存储的一样
        // 如果不一样则跳转至登录页面
        if ( loginEmail != null && loginTime != null && loginStatus != null && loginStatus.equals(1) &&
                userService.getUserByEmail(loginEmail).getLastLoginTime().longValue() != Long.parseLong(loginTime)) {
            logger.info("账户存在同时异地登录，账号：" + loginEmail);
            response.sendRedirect("/toLogin");
            // 终止拦截器继续执行，return false
            return false;
        }
        return true;
    }

    /**
     * 这个方法只会在当前这个Interceptor的preHandle方法返回值为true的时候才会执行。
     * postHandle是进行处理器拦截用的，它的执行时间是在处理器进行处理之后，也就是在Controller的方法调用之后执行，
     * 但是它会在DispatcherServlet进行视图的渲染之前执行，也就是说在这个方法中你可以对ModelAndView进行操作。
     * 这个方法的链式结构跟正常访问的方向是相反的，也就是说先声明的Interceptor拦截器该方法反而会后调用，
     * 这跟Struts2里面的拦截器的执行过程有点像，只是Struts2里面的intercept方法中要手动的调用ActionInvocation的invoke方法，
     * Struts2中调用ActionInvocation的invoke方法就是调用下一个Interceptor
     * 或者是调用action，然后要在Interceptor之前调用的内容都写在调用invoke之前，要在Interceptor之后调用的内容都写在调用invoke方法之后。
     */
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        super.postHandle(request, response, handler, modelAndView);
    }

    public void setLoginValidTime(Integer loginValidTime) {
        this.loginValidTime = loginValidTime;
    }

    @Autowired
    public void setUserService(IUserService userService) {
        this.userService = userService;
    }
}
