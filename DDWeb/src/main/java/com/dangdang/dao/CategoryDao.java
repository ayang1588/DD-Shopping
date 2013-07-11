package com.dangdang.dao;

import com.dangdang.pojo.Category;

import java.util.List;

public interface CategoryDao {
    int deleteByPrimaryKey(Integer id);

    int insertCategory(Category record);

    Category selectByPrimaryKey(Integer id);

    int updateCategoryByPrimaryKey(Category record);

    List<Category> selectCategoryByParentId(Integer parentId);

    List<Category> findAllCategory();
}