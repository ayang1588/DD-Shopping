package com.dangdang.service;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.dangdang.pojo.Category;
import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;
import java.util.List;

/**
 * Description:
 * Author: 柳阳
 * Email: ayang1588@163.com
 * Date: 2013-4-24
 * Time: 下午6:26
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring_config/spring.xml", "classpath:spring_config/spring-mybatis.xml"})
public class CategoryServiceTest {
    private final static Logger logger = Logger.getLogger(CategoryServiceTest.class);

    private ICategoryService categoryService;

    @Test
    public void testGetCategoryList() {
        List<Category> list = categoryService.getAllCategory();
        List<Category> categoryList = new ArrayList<Category>();
        for (Category category : list) {
            if (category.getParentId() == 1) {
                categoryList.add(category);
            }
        }
        // 组装类别列表
        for (int i = 0; i < categoryList.size(); i++) {
            int sum = 0;
            for (int j = 0; j < list.size(); j++) {
                if (list.get(j).getParentId() == categoryList.get(i).getId()) {
                    sum += list.get(j).getProductNum();
                    categoryList.get(i).getSubCategory().add(list.get(j));
                }
            }
            categoryList.get(i).setProductNum(sum);
        }
        logger.info(JSONArray.toJSONString(categoryList));
    }

    @Autowired
    public void setCategoryService(ICategoryService categoryService) {
        this.categoryService = categoryService;
    }
}
