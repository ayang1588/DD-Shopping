package com.dangdang.controller.user;

import com.dangdang.commons.utils.CookieUtils;
import com.dangdang.commons.utils.SecurityUtils;
import com.dangdang.commons.vo.JsonType;
import com.dangdang.pojo.User;
import com.dangdang.service.IUserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;

/**
 * Description:
 * Author: 柳阳
 * Email: ayang1588@163.com
 * Date: 2013-4-24
 * Time: 下午2:30
 */
@Controller
public class LoginController {
    private final static Logger logger = Logger.getLogger(LoginController.class);
    private IUserService userService;

    @RequestMapping("/toLogin")
    public ModelAndView tFoLogin() {
        ModelAndView mav = new ModelAndView("user/login_form");
        return mav;
    }

    @RequestMapping("/checkEmail")
    @ResponseBody
    public JsonType checkEmail(@RequestParam("email") String email) {
        JsonType jsonType = new JsonType();
        int isEmailExist = userService.isEmailExist(email);
        // 没有用户
        if (isEmailExist == 0) {
            jsonType.setStatus(1);
        }
        // 用户存在
        else {
            jsonType.setStatus(0);
        }
        return jsonType;
    }

    @RequestMapping("/checkPassword")
    @ResponseBody
    public JsonType checkPassword(@RequestParam("password") String password, @RequestParam("email") String email) {
        JsonType jsonType = new JsonType();
        User user = null;
        try {
            user = userService.getUserByEmail(email);
            if (SecurityUtils.generatePwd(password).equals(user.getPassword())) {
                jsonType.setStatus(1);
            } else {
                jsonType.setStatus(0);
            }
        } catch (Exception e) {
            logger.info("根据邮箱验证密码错误，邮箱：" + email + e.getMessage());
        }
        return jsonType;
    }

    @RequestMapping("/checkValidateCode")
    @ResponseBody
    public JsonType checkValidateCode(@RequestParam("txtVerifyCode") String code,
                                      HttpServletRequest request) {
        JsonType jsonType = new JsonType();
        String sessionCode = (String) request.getSession().getAttribute(com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY);
        if (code.trim().equalsIgnoreCase(sessionCode)) {
            jsonType.setStatus(1);
        } else {
            jsonType.setStatus(0);
        }
        return jsonType;
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(@ModelAttribute User user, HttpServletRequest request, HttpServletResponse response) {
        try {
            long loginTime =  System.currentTimeMillis();
            CookieUtils.addCookie("loginEmail", user.getEmail(), response);
            CookieUtils.addCookie("loginTime", loginTime + "", response);
            CookieUtils.addCookie("loginStatus", "1", response);
            CookieUtils.addCookie("lastOpTime", loginTime + "", response);
            // 更改最后登录信息
            User u = new User();
            u.setEmail(user.getEmail());
            u.setLastLoginTime(loginTime);
            u.setLastLoginIp(request.getRemoteAddr());
            try {
                userService.updateUserByEmail(u);
            } catch (Exception e) {
                logger.info("更新用户最后操作信息失败，email ：" + user.getEmail());
            }
        } catch (UnsupportedEncodingException e) {
            logger.info("添加登陆cookie信息失败！" + e.getMessage());
        }
        return "redirect:/index.html";
    }

    // 购买下订单时要检查是否已邮箱验证
    @Autowired
    public void setUserService(IUserService userService) {
        this.userService = userService;
    }
}
