package com.dangdang.service;

import com.alibaba.fastjson.JSON;
import com.dangdang.pojo.User;
import org.apache.log4j.Logger;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * Description:
 * Author: 柳阳
 * Email: ayang1588@163.com
 * Date: 2013-4-16
 * Time: 下午3:02
 */
// 相当于extends SpringJUnit4ClassRunner
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring_config/spring.xml", "classpath:spring_config/spring-mybatis.xml"})
public class UserServiceTest {
    private final static Logger logger = Logger.getLogger(UserServiceTest.class);

    private IUserService userService;

    @Test
    @Ignore
    public void test1() throws Exception {
        User user = userService.getUserById(1);
        logger.info(JSON.toJSONStringWithDateFormat(user, "yyyy-MM-dd HH:mm:ss"));
    }

    @Test
    @Ignore
    public void test2() throws Exception {
        User user = userService.getUserByEmail("414137789@qq.com");
        logger.info(JSON.toJSONString(user));
    }

    @Test
    public void testIsUserExist() throws Exception {
        Integer num = userService.isEmailExist("4137789@qq.com");
        System.out.println(num);
    }

    @Autowired
    public void setUserService(IUserService userService) {
        this.userService = userService;
    }
}
