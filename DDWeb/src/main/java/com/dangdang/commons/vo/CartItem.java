package com.dangdang.commons.vo;

import com.dangdang.pojo.Product;

import java.io.Serializable;

/**
 * Description:
 * Author: 柳阳
 * Email: ayang1588@163.com
 * Date: 2013-5-8
 * Time: 下午3:21
 */
public class CartItem implements Serializable {
    private Product product;
    private Integer sum;

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Integer getSum() {
        return sum;
    }

    public void setSum(Integer sum) {
        this.sum = sum;
    }

    @Override
    public boolean equals(Object obj) {
        return this.getProduct().getId().intValue() == ((CartItem) obj).getProduct().getId().intValue();
    }
}
