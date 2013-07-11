package com.dangdang.controller.user;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;

/**
 * Description: 跳转至主注册页面Controller
 * Author: 柳阳
 * Email: ayang1588@163.com
 * Date: 2013-4-17
 * Time: 下午4:27
 */
@Controller
    public class UserController {
        @RequestMapping(value = "/test")
        public ModelAndView toPageError() {
        ModelAndView mav = new ModelAndView("cart/shopping_cart");
        return mav;
    }

    @RequestMapping(value = "hello")
    @ResponseBody
    public Object hello(){
        Map<String,String> maps = new HashMap();
        maps.put("hello","hello");
        return maps;
    }
}
