package com.dangdang.service.impl;

import com.dangdang.dao.CategoryDao;
import com.dangdang.pojo.Category;
import com.dangdang.service.ICategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Description:
 * Author: 柳阳
 * Email: ayang1588@163.com
 * Date: 2013-4-24
 * Time: 下午6:24
 */
@Service("categoryService")
public class CategoryServiceImpl implements ICategoryService {
    private CategoryDao categoryDao;

    @Override
    public List<Category> getCategoryByParentId(Integer parentId) {
        return categoryDao.selectCategoryByParentId(parentId);
    }

    @Override
    public List<Category> getAllCategory() {
        return categoryDao.findAllCategory();
    }

    @Autowired
    public void setCategoryDao(CategoryDao categoryDao) {
        this.categoryDao = categoryDao;
    }
}
