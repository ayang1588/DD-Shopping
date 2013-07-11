package com.dangdang.service;

import com.dangdang.pojo.Product;
import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

// 相当于extends SpringJUnit4ClassRunner
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring_config/spring.xml", "classpath:spring_config/spring-mybatis.xml", "classpath:spring_config/spring-redis.xml"})
public class ProductServiceTest {
    private final static Logger logger = Logger.getLogger(ProductServiceTest.class);

    private IProductService productService;

    @Test
    public void test() {
        Product product = productService.getProductById(3);
    }

    @Autowired
    public void setProductService(IProductService productService) {
        this.productService = productService;
    }
}
