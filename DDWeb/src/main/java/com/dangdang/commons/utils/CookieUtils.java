package com.dangdang.commons.utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;

/**
 * Description: cookie操作工具类
 * Author: 柳阳
 * Email: ayang1588@163.com
 * Date: 2013-4-24
 * Time: 下午2:13
 */
public class CookieUtils {
    private static String path = "/";
    private static int age = 365 * 24 * 3600;

    /**
     * 添加cookie,指定cookie有效期(秒)
     * @param name
     * @param value
     * @param response
     */
    public static void addCookie(String name, String value, HttpServletResponse response, int maxAge) throws UnsupportedEncodingException {
        Cookie cookie = new Cookie(name, URLEncoder.encode(value, "utf-8"));
        cookie.setMaxAge(maxAge);
        cookie.setPath(path);
        response.addCookie(cookie);
    }

    /**
     * 默认有效期1年
     * @param name
     * @param value
     * @param response
     * @throws UnsupportedEncodingException
     */
    public static void addCookie(String name, String value, HttpServletResponse response) throws UnsupportedEncodingException {
        addCookie(name, value, response, age);
    }

    /**
     * 根据cookie的名字返回值，如果没有则返回null
     * @param name
     * @param request
     * @return
     * @throws UnsupportedEncodingException
     */
    public static String findCookie(String name, HttpServletRequest request) throws UnsupportedEncodingException {
        String value = null;
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (int i = 0; i < cookies.length; i++) {
                Cookie cookie = cookies[i];
                if (cookie.getName().equals(name)) {
                    value = URLDecoder.decode(cookie.getValue(), "utf-8");
                }
            }
        }
        return value;
    }

    /**
     * 删除cookie
     * @param name
     * @param response
     */
    public static void deleteCookie(String name, HttpServletResponse response) {
        Cookie cookie = new Cookie(name, "");
        cookie.setMaxAge(0);
        cookie.setPath(path);
        response.addCookie(cookie);
    }

}
