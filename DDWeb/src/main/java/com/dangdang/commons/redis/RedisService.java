package com.dangdang.commons.redis;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.data.redis.connection.RedisConnection;
import org.springframework.data.redis.core.RedisCallback;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.JdkSerializationRedisSerializer;
import org.springframework.stereotype.Service;

/**
 * Description: redis 缓存操作Service
 * Author: 柳阳
 * Email: ayang1588@163.com
 * Date: 2013-5-2
 * Time: 下午2:56
 */
@Service("redisService")
public class RedisService {
    private final static Logger logger = Logger.getLogger(RedisService.class);
    private RedisTemplate redisTemplate;

    /**
     * 向redis里面添加key-value格式的数据
     * @param key   key
     * @param value value
     */

    public void set(final String key, final Object value) {
        redisTemplate.execute(new RedisCallback<Object>() {
            @Override
            public Object doInRedis(RedisConnection redisConnection) throws DataAccessException {
                JdkSerializationRedisSerializer jdkSerializationRedisSerializer = new JdkSerializationRedisSerializer();
                byte[] _key = jdkSerializationRedisSerializer.serialize(key);
                byte[] _value = jdkSerializationRedisSerializer.serialize(value);
                redisConnection.set(_key, _value);
                logger.info("set data in redis db, key = " + key);
                return true;
            }
        });
    }

    /**
     * 根据key从redis里面取出value
     * @param key   key
     */
    public Object get(final String key) {
        return redisTemplate.execute(new RedisCallback() {
            @Override
            public Object doInRedis(RedisConnection redisConnection) throws DataAccessException {
                JdkSerializationRedisSerializer jdkSerializationRedisSerializer = new JdkSerializationRedisSerializer();
                byte[] _key = jdkSerializationRedisSerializer.serialize(key);
                byte[] _value = redisConnection.get(_key);
                logger.info("get data from redis db, key = " + key);
                return jdkSerializationRedisSerializer.deserialize(_value);
            }
        });
    }

    public void del(final String key) {
        redisTemplate.execute(new RedisCallback() {
            @Override
            public Object doInRedis(RedisConnection redisConnection) throws DataAccessException {
                JdkSerializationRedisSerializer jdkSerializationRedisSerializer = new JdkSerializationRedisSerializer();
                byte[] _key = jdkSerializationRedisSerializer.serialize(key);
                redisConnection.del(_key);
                logger.info("delete data from redis db, key = " + key);
                return true;
            }
        });
    }

    /**
     * 查看key是否存在
     * @param key
     * @return
     */
    public boolean exists(final String key) {
        return (Boolean)redisTemplate.execute(new RedisCallback() {
            public Boolean doInRedis(RedisConnection redisConnection) throws DataAccessException {
                return redisConnection.exists(new JdkSerializationRedisSerializer().serialize(key));
            }
        });
    }

    /**
     * 清空所有redis缓存数据
     * @return
     */
    public String clearRedisDB() {
        return (String) redisTemplate.execute(new RedisCallback() {
            @Override
            public String doInRedis(RedisConnection redisConnection) throws DataAccessException {
                redisConnection.flushDb();
                logger.info("flust redis db OK !");
                return "DB is already flush!";
            }
        });
    }

    public long dbSize() {
        return (Long) redisTemplate.execute(new RedisCallback() {
            @Override
            public Object doInRedis(RedisConnection redisConnection) throws DataAccessException {
                return redisConnection.dbSize();
            }
        });
    }

    @Autowired
    public void setTemplate(RedisTemplate redisTemplate) {
        this.redisTemplate = redisTemplate;
    }
}
