package com.dangdang.commons.redis;

import com.alibaba.fastjson.JSONArray;
import com.dangdang.pojo.User;
import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * Description:
 * Author: 柳阳
 * Email: ayang1588@163.com
 * Date: 2013-4-30
 * Time: 下午4:36
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring_config/spring.xml", "classpath:spring_config/spring-mybatis.xml", "classpath:spring_config/spring-redis.xml"})
public class RedisTest {
    private final static Logger logger = Logger.getLogger(RedisTest.class);

    private RedisService redisService;

    @Test
    public void save() {
        User user = new User();
        user.setEmail("414137789");
        user.setId(1);
        redisService.set("test1", user);
    }

    @Test
    public void get() {
        User user = (User) redisService.get("test1");
        logger.debug(JSONArray.toJSONString(user));
    }

    @Test
    public void exist() {
        logger.debug(redisService.exists("test1"));
    }

    @Test
    public void del() {
        redisService.del("414137789@qq.com_buys");
    }

    @Autowired
    public void setRedisService(RedisService redisService) {
        this.redisService = redisService;
    }
}
