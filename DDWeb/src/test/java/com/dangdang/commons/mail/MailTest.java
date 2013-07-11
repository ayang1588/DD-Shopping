package com.dangdang.commons.mail;

import org.junit.Ignore;
import org.junit.Test;

/**
 * Description:
 * Author: 柳阳
 * Email: ayang1588@163.com
 * Date: 2013-4-19
 * Time: 下午3:49
 */
public class MailTest {
    @Test
//    @Ignore
    public void testMail() throws Exception {
        SendMail sendMail = new SendMail();
        String activeUrl = "http://localhost:8080/";
        SendMail.sendMail("414137789@qq.com", activeUrl);

    }

    @Test
    @Ignore
    public void testPath() {
//        ClassLoader classLoader = MailTest.class.getClassLoader();
        String url = SendMail.class.getClassLoader().getResource("").getPath();
        System.out.println(url);
//        Toolkit TLK=Toolkit.getDefaultToolkit(); //用来将图片读入
//        static final Image WallImage=TLK.getImage(WallNode.class.getClassLoader().getResource("Image/Wall/Wall.png"));

    }
}
