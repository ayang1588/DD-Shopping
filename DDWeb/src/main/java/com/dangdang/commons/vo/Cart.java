package com.dangdang.commons.vo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * Description:
 * Author: 柳阳
 * Email: ayang1588@163.com
 * Date: 2013-5-8
 * Time: 下午3:23
 */
public class Cart implements Serializable {
    private List<CartItem> items = new ArrayList<CartItem>();

    public List<CartItem> getItems() {
        return items;
    }

    public void setItems(List<CartItem> items) {
        this.items = items;
    }
}
