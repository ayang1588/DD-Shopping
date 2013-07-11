package com.dangdang.commons.utils;

import com.dangdang.pojo.User;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.RandomStringUtils;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

/**
 * Description: 密码安全工具类
 * Author: 柳阳
 * Email: ayang1588@163.com
 * Date: 2013-4-18
 * Time: 下午5:12
 */
public class SecurityUtils {
    /**
     * BASE64解密
     */
    public static byte[] decryptBASE64(String key) throws Exception {
        return (new BASE64Decoder()).decodeBuffer(key);
    }

    /**
     * BASE64加密
     */
    public static String encryptBASE64(byte[] key) throws Exception {
        return (new BASE64Encoder()).encodeBuffer(key);
    }

    /**
     * MD5加密
     */
    public static String encryptMD5(byte[] data) throws Exception {
        return DigestUtils.md5Hex(data);
    }

    /**
     * SHA加密
     */
    public static String encryptSHA(byte[] data) throws Exception {
        return DigestUtils.sha1Hex(data);
    }

    /**
     * 注册时根据user对象生成密码
     */
    public static String generatePwd(String password) throws Exception {
        return encryptMD5(password.getBytes());
    }

    /**
     * 注册时根据user.email生成邮箱验证码
     */
    public static String generateEmailValidateCode(User user) throws Exception {
        return encryptBASE64((customEncrypt(user.getEmail()) +
                "_" + System.currentTimeMillis() +
                "_" + RandomStringUtils.randomAlphanumeric(10)).getBytes());
    }

    /**
     * 自定义加密
     */
    public static String customEncrypt(String str) throws Exception{
        StringBuffer enStrBuff = new StringBuffer();
        for (int i = 0; i < str.length(); i++) {
            int tmpch = str.charAt(i);
            tmpch ^= 1;
            tmpch ^= 0xa;
            enStrBuff.append(Integer.toHexString(tmpch));
        }
        return enStrBuff.toString().toUpperCase();
    }

    /**
     * 自定义解密
     */
    public static String customDecrypt(String str) throws Exception{
        String deStr = str.toLowerCase();
        StringBuffer deStrBuff = new StringBuffer();
        for (int i = 0; i < deStr.length(); i += 2) {
            String subStr = deStr.substring(i, i + 2);
            int tmpch = Integer.parseInt(subStr, 16);
            tmpch ^= 1;
            tmpch ^= 0xa;
            deStrBuff.append((char) tmpch);
        }
        return deStrBuff.toString();
    }
}
