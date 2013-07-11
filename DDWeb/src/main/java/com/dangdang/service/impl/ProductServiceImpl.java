package com.dangdang.service.impl;

import com.dangdang.dao.ProductDao;
import com.dangdang.pojo.Product;
import com.dangdang.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Description:
 * Author: 柳阳
 * Email: ayang1588@163.com
 * Date: 2013-5-8
 * Time: 下午3:34
 */
@Service("productService")
public class ProductServiceImpl implements IProductService {
    private ProductDao productDao;

    @Override
    public Product getProductById(Integer id) {
        return productDao.selectProductByPrimaryKey(id);
    }

    @Autowired
    public void setProductDao(ProductDao productDao) {
        this.productDao = productDao;
    }
}
