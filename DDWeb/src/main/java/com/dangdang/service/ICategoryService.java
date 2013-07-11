package com.dangdang.service;

import com.dangdang.pojo.Category;

import java.util.List;

/**
 * Description: 类别service
 * Author: 柳阳
 * Email: ayang1588@163.com
 * Date: 2013-4-24
 * Time: 下午6:22
 */
public interface ICategoryService {
    List<Category> getCategoryByParentId(Integer parentId);

    List<Category> getAllCategory();
}
