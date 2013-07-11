package com.dangdang.controller.user;

import com.dangdang.commons.mail.SendMail;
import com.dangdang.commons.utils.DateUtils;
import com.dangdang.commons.utils.SecurityUtils;
import com.dangdang.commons.vo.JsonType;
import com.dangdang.pojo.User;
import com.dangdang.service.IUserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

/**
 * Description: 注册controller
 * Author: 柳阳
 * Email: ayang1588@163.com
 * Date: 2013-4-18
 * Time: 下午2:55
 */
@Controller
@RequestMapping("/regist")
public class RegistController {
    private final static Logger logger = Logger.getLogger(RegistController.class);

    private IUserService userService;

    //跳转至注册页面
    @RequestMapping(value = "/toRegist", method = RequestMethod.GET)
    public String toRegistForm() {
        return "user/register_form";
    }

    //注册用户，成功跳转至邮箱验证页面
    @RequestMapping(value = "/doRegist", method = RequestMethod.POST)
    public ModelAndView doRegist(@ModelAttribute User user, @RequestHeader("Host") String host) {
        ModelAndView mav = new ModelAndView("user/validate_form");
        try {
            user.setIsEmailVerify(0);
            user.setRegistTime(System.currentTimeMillis());
            // 对密码加密
            user.setPassword(SecurityUtils.generatePwd(user.getPassword()));
            // 生成邮箱验证码                            N
            user.setEmailVerifyCode(SecurityUtils.generateEmailValidateCode(user));
        } catch (Exception e) {
            mav.addObject("errMsg", "系统错误，请稍后再试！");
            logger.info("注册用户加密异常：账号：" + user.getEmail() + "/n" +e.getMessage());
            mav.setViewName("main/error");
        }
        try {
            userService.addUser(user);
            // 添加用户成功，发送邮件
            sendEmailByEmail(user, host);
            mav.addObject("email", user.getEmail());
            mav.addObject("validateCode", user.getEmailVerifyCode());
        } catch (Exception e) {
            mav.addObject("errMsg", "系统错误，请稍后再试！");
            logger.info("注册添加新用户异常：账号：" + user.getEmail() + "/n" +e.getMessage());
            mav.setViewName("main/error");
        }
        return mav;
    }

    // 重新发送邮件
    @RequestMapping(value = "/reSend", method = RequestMethod.POST)
    public @ResponseBody JsonType reSend(@RequestParam("email") String email, @RequestHeader("Host") String host) {
        JsonType jsonType = new JsonType();
        User user = new User();
        try {
            user.setEmail(email);
            // 生成邮箱验证码
            user.setEmailVerifyCode(SecurityUtils.generateEmailValidateCode(user));
            // 更新验证码
            userService.updateUserByEmail(user);
            sendEmailByEmail(user, host);
            jsonType.setStatus(1);
        } catch (Exception e) {
            jsonType.setStatus(0);
            jsonType.setDesc("发送邮件错误：请重新发送！");
            logger.info("重新发送邮件异常：Email：" + email + e.getMessage());
        }
        return jsonType;
    }

    //进行邮箱链接激活的验证
    @RequestMapping("/activate/{verifyCode}")
    public ModelAndView doActivate(@PathVariable("verifyCode") String verifyCode) {
        ModelAndView mav = new ModelAndView("user/validate_ok");
        User user = null;
        try {
            String parseCode = new String(SecurityUtils.decryptBASE64(verifyCode));
            String[] data = parseCode.split("_");
            String email = data[0];
            String time = data[1];
            email = SecurityUtils.customDecrypt(email);
            // 获取user信息
            user = userService.getUserByEmail(email);
            // 判断时间是否过期
            int minute = DateUtils.minuteBetweenTwoTime(System.currentTimeMillis(), Long.parseLong(time));
            if (minute > 30) {
                mav.setViewName("main/error");
                mav.addObject("errMsg", "激活码过期！");
                return mav;
            }
            //　判断激活码是否匹配
            if (!verifyCode.equals(user.getEmailVerifyCode())) {
                mav.setViewName("main/error");
                mav.addObject("errMsg", "激活码错误！");
                return mav;
            }
            user.setIsEmailVerify(1);
            userService.updateUserByEmail(user);
        } catch (Exception e) {
            mav.addObject("errMsg", "激活账户错误，请重试！");
            logger.info("账号激活错误：账号：" + user.getEmail() + "/n" +e.getMessage());
            mav.setViewName("main/error");
        }
        return mav;
    }

    // 发送邮件
    private void sendEmailByEmail(User user, String host) throws Exception{
        String activeURL = "http://" + host + "/regist/activate/" + user.getEmailVerifyCode();
        SendMail.sendMail(user.getEmail(), activeURL);
    }

    @Autowired
    public void setUserService(IUserService userService) {
        this.userService = userService;
    }
}
