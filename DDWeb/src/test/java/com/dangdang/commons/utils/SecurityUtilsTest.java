package com.dangdang.commons.utils;

import com.dangdang.pojo.User;
import org.junit.Ignore;
import org.junit.Test;

/**
 * Description:
 * Author: 柳阳
 * Email: ayang1588@163.com
 * Date: 2013-4-18
 * Time: 下午5:21
 */
public class SecurityUtilsTest {

    @Test
    @Ignore
    public void test1() throws Exception {
        String email = "ayang1588@163.com";
        String password = "liuyang";
        User user = new User();
        user.setEmail(email);
        user.setPassword(password);
        String base = SecurityUtils.encryptBASE64(email.getBytes());
        System.out.println("BASE64加密后："+ base);
        System.out.println("BASE64解密后："+ new String(SecurityUtils.decryptBASE64(base)));
        System.out.println("生成密码：" + SecurityUtils.generatePwd(user.getPassword()));
        System.out.println("生成邮箱验证码" + SecurityUtils.generateEmailValidateCode(user));
        System.out.println(SecurityUtils.generatePwd(user.getPassword()).length());
        System.out.println(SecurityUtils.generateEmailValidateCode(user).length());
        System.out.println(new String(SecurityUtils.decryptBASE64(SecurityUtils.generateEmailValidateCode(user))));
    }

    @Test
    @Ignore
    public void test2() throws Exception{
        String source = "liuyang";
        String s = SecurityUtils.customEncrypt(source);
        System.out.println("de=" + s);
        source = SecurityUtils.customDecrypt(s);
        System.out.println("en=" + source);
    }

    @Test
    @Ignore
    public void test3() throws Exception {
        String email = "414137789@qq.com";
        User user = new User();
        user.setEmail(email);
        String validateCode = SecurityUtils.generateEmailValidateCode(user);
        System.out.println(validateCode);
        String parse = new String(SecurityUtils.decryptBASE64(validateCode));
        System.out.println(parse);
        String[] data = parse.split("_");
        System.out.println(SecurityUtils.customDecrypt(data[0]));
    }
}
