package com.dangdang.dao;

import com.dangdang.pojo.Product;

/**
 * Description:
 * Author: 柳阳
 * Email: ayang1588@163.com
 * Date: 2013-5-8
 * Time: 下午3:28
 */
public interface ProductDao {
    int deleteByPrimaryKey(Integer id);

    int insertProduct(Product record);

    Product selectProductByPrimaryKey(Integer id);

    int updateProductByPrimaryKey(Product record);

}
