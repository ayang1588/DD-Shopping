package com.dangdang.commons.listener;

import com.dangdang.commons.redis.RedisService;
import com.dangdang.pojo.Category;
import com.dangdang.service.ICategoryService;
import com.dangdang.service.ICommendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;

import java.util.ArrayList;
import java.util.List;

/**
 * Description: web容器启动时初始化操作类
 * Author: 柳阳
 * Email: ayang1588@163.com
 * Date: 2013-4-24
 * Time: 下午5:40
 */
public class WebInitListener implements ApplicationListener {
    private RedisService redisService;
    private ICategoryService categoryService;
    private ICommendService commendService;

    /**
     * 容器启动时初始化操作
     *
     * @param applicationEvent
     */
    @Override
    public void onApplicationEvent(ApplicationEvent applicationEvent) {
        //spring容器启动完成，刷新上下文
        if (applicationEvent instanceof ContextRefreshedEvent) {
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
//            redisService.clearRedisDB();
            redisService.set("categoryList", categoryList);
            redisService.set("allCategory", list);
            redisService.set("commendList", commendService.getCommendBooks());
        }
    }

    @Autowired
    public void setCategoryService(ICategoryService categoryService) {
        this.categoryService = categoryService;
    }

    @Autowired
    public void setRedisService(RedisService redisService) {
        this.redisService = redisService;
    }

    @Autowired
    public void setCommendService(ICommendService commendService) {
        this.commendService = commendService;
    }
}
