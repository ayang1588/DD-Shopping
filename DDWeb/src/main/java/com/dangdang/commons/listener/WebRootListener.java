package com.dangdang.commons.listener;

import org.springframework.web.context.ContextLoaderListener;

import javax.servlet.ServletContextEvent;

/**
 * Description: 用来获取webapp路径，并将其放入System.prop中
 * Author: 柳阳
 * Email: ayang1588@163.com
 * Date: 2013-4-19
 * Time: 下午6:29
 */
public class WebRootListener extends ContextLoaderListener {
    @Override
    public void contextDestroyed(ServletContextEvent event) {

    }

    @Override
    public void contextInitialized(ServletContextEvent event) {
        String webAppRootKey = event.getServletContext().getRealPath("/");
        System.setProperty("webapp.root", webAppRootKey);
    }
}
