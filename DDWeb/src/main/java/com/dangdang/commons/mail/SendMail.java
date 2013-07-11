package com.dangdang.commons.mail;

import com.dangdang.commons.utils.DateUtils;
import com.dangdang.commons.utils.SecurityUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.joda.time.DateTime;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

/**
 * Description: 发送邮件类
 * Author: 柳阳
 * Email: ayang1588@163.com
 * Date: 2013-4-19
 * Time: 下午2:51
 */
public class SendMail {
    private final static Logger logger = Logger.getLogger(SendMail.class);

    //配置文件xml的路径
    private static String MAIL_CONFIG = SendMail.class.getClassLoader().getResource("properties/mail_config.properties").getPath();

    private final static Properties properties = new Properties();

    private static MailInfo mailInfo = new MailInfo();

    static {
        try {
            InputStream is = new FileInputStream(MAIL_CONFIG);
            properties.load(is);
            parseConfig();
        } catch (FileNotFoundException e) {
            logger.info("propertise文件夹下没有找到邮件的配置文件mail_config.properties");
        } catch (IOException e) {
            logger.info("读取邮件配置文件异常。");
        }
    }

    /**
     * 解析properties配置文件
     */
    private static void parseConfig() {
        mailInfo.setHost(properties.getProperty("host"));
        mailInfo.setFrom(properties.getProperty("from"));
        mailInfo.setTitle(properties.getProperty("title"));
        mailInfo.setUsername(properties.getProperty("username"));
        mailInfo.setPassword(properties.getProperty("password"));
        mailInfo.setContent(properties.getProperty("content"));
    }

    /**
     * Authenticator验证
     */
    private static void sendMailOfValidate() {
        Properties props = System.getProperties();
        //设置邮件服务器的域名或IP
        props.put("mail.smtp.host", mailInfo.getHost());
        //授权邮件,mail.smtp.auth必须设置为true
        props.put("mail.smtp.auth", "true");
        String password = mailInfo.getPassword();
        try {
            //对密码进行解密
            password = SecurityUtils.customDecrypt(password);
        } catch (Exception e) {
            logger.info("邮箱密码解密失败！");
        }
        //用用户名和真是密码构造授权验证对象
        MyAuthenticator myAuthenticator = new MyAuthenticator(mailInfo.getUsername(), password);
        //传入props,myAuthenticator构造邮件收钱的session对象
        Session session = Session.getDefaultInstance(props, myAuthenticator);
        //将Session对象作为MimeMessage构造方法的参数传入构造message对象
        MimeMessage mimeMessage = new MimeMessage(session);
        try {
            mimeMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(mailInfo.getTo()));
            mimeMessage.setFrom(new InternetAddress(mailInfo.getFrom()));
            mimeMessage.setSubject(mailInfo.getTitle());
            //发送html格式
            BodyPart messageBodyPart = new MimeBodyPart();
            //设置html格式，编码utf-8
            Long time = System.currentTimeMillis();
            mailInfo.setContent("<div align=\"center\">" +
                    "<img src=\"cid:ddheader-id\">" +
                    "</div><div align=\"center\">" + mailInfo.getContent() +
                    "</div><div align=\"center\">发送时间：" + DateUtils.getTimeStrCH(time) +
                    "</div><div align=\"center\">有效期至：" + DateUtils.getTimeStrCH(new DateTime(time).plusMinutes(30).getMillis()) + "</div>");
            messageBodyPart.setContent(mailInfo.getContent(), "text/html;charset=utf-8");
            // mimeMessage.setText(mailInfo.getContent());
            //获取文件路径
            String filePath = System.getProperty("webapp.root") + properties.getProperty("img");
            // Create your new message part
            // 创建多部分的整合体
            MimeMultipart multipart = new MimeMultipart("related");
            multipart.addBodyPart(messageBodyPart);
            // 创建图片部分
            messageBodyPart = new MimeBodyPart();
            // 获取图片并放入part
            DataSource fds = new FileDataSource(filePath);
            messageBodyPart.setDataHandler(new DataHandler(fds));
            messageBodyPart.setHeader("Content-ID", "<ddheader-id>");
            multipart.addBodyPart(messageBodyPart);
            // 将整合好的multi-part放入message中
            mimeMessage.setContent(multipart);
            Transport.send(mimeMessage);
        } catch (Exception e) {
            logger.info("邮件message设置异常！Email:" + mailInfo.getTo());
        }
    }

    /**
     * 发送邮件方法
     *
     * @param toAddr    发送地址
     * @param activeUrl 激活Url
     */
    public static void sendMail(String toAddr, String activeUrl) throws Exception {
        logger.debug("activeUrl" + activeUrl);
        if (StringUtils.isEmpty(activeUrl)) {
            throw new Exception("发送邮件内容中激活Url不可为空");
        }
        mailInfo.setTo(toAddr);
        // 先将内容清空
        mailInfo.setContent(properties.getProperty("content"));
        mailInfo.setContent(mailInfo.getContent() + "<a href=\"" + activeUrl + "\" target=_blank>" + activeUrl + "</a>");
        sendMailOfValidate();
    }

}
