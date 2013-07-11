package com.dangdang.commons.mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

/**
 * Description: 邮件授权类
 * Author: 柳阳
 * Email: ayang1588@163.com
 * Date: 2013-4-19
 * Time: 下午2:34
 */
public class MyAuthenticator extends Authenticator {
    private String strUsername;
    private String strPassword;

    public MyAuthenticator(String strUsername, String strPassword) {
        this.strUsername = strUsername;
        this.strPassword = strPassword;
    }

    @Override
    protected PasswordAuthentication getPasswordAuthentication() {
        return new PasswordAuthentication(strUsername, strPassword);
    }
}
