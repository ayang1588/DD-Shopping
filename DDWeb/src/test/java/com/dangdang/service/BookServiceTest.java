package com.dangdang.service;

import com.dangdang.commons.pagination.vo.Page;
import com.dangdang.pojo.Book;
import org.apache.log4j.Logger;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Description:
 * Author: 柳阳
 * Email: ayang1588@163.com
 * Date: 2013-4-25
 * Time: 下午5:29
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring_config/spring.xml", "classpath:spring_config/spring-mybatis.xml", "classpath:spring_config/spring-redis.xml"})
public class BookServiceTest {
    private final static Logger logger = Logger.getLogger(UserServiceTest.class);

    private IBookService bookService;

    @Test
    @Ignore
    public void testGetBookByCategoryId() {
//        List<Book> list = bookService.getBookByCategoryId(9);
        Page page = new Page();
        Map map = new HashMap();
        map.put("id", 9);
        map.put("collection_times", 1);
//        page.setPageNo(1000);
        page.setParams(map);
        List<Book> list = bookService.getBookByCategoryId(page);
        System.out.println(list.size());

//        logger.info(JSONArray.toJSONString(list));
//        Book book = bookService.getBookByPrimaryKey(1);
//        logger.info(JSONArray.toJSONString(book));
    }

    @Test
    public void getHotSellBooks() {
        Page page = new Page();
        page.setPageNo(1);
        page.setPageSize(10);
        Map params = new HashMap<String, Object>();
        params.put("orderType", 0);
        page.setParams(params);
        List<Book> books = bookService.getHotSellBooks(page);
        System.out.println(books.size());
    }

    @Autowired
    public void setBookService(IBookService bookService) {
        this.bookService = bookService;
    }
}
