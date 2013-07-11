package com.dangdang.controller.main;

import com.dangdang.commons.redis.RedisService;
import com.dangdang.pojo.Book;
import com.dangdang.service.IBookService;
import com.dangdang.service.ICommendService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * Description: 跳转至主页面Controller
 * Author: 柳阳
 * Email: ayang1588@163.com
 * Date: 2013-4-17
 * Time: 下午4:27
 */
@Controller
@RequestMapping("/index.html")
public class MainController {
    private final static Logger logger = Logger.getLogger(MainController.class);

    ICommendService commendService;
    RedisService redisService;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public ModelAndView toMain(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("main/index");
        mav.addObject("categoryList", redisService.get("categoryList"));
        mav.addObject("commendList", (List<Book>)redisService.get("commendList"));
        mav.addObject("guessList", commendService.getBookGuess(request));
        return mav;
    }



    @Autowired
    public void setRedisService(RedisService redisService) {
        this.redisService = redisService;
    }

    @Autowired
    public void setCommendService(ICommendService commendService) {
        this.commendService = commendService;
    }
}
