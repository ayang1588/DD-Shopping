package com.dangdang.pojo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * Description:
 * Author: 柳阳
 * Email: ayang1588@163.com
 * Date: 2013-4-16
 * Time: 下午2:30
 */
public class Category implements Serializable {
    private Integer id;

    /**
     * 显示顺序
     */
    private Integer turn;

    private String name;

    private String description;

    /**
     * 父类别Id
     */
    private Integer parentId;

    /**
     * 子类别
     */
    private List<Category> subCategory = new ArrayList<Category>();

    /**
     * 该类别下所有的商品数量
     */
    private Integer productNum;

    public Category() {
    }

    public Category(Category category) {
        this.id = category.getId();
        this.turn = category.getTurn();
        this.name = category.name;
        this.description = category.getDescription();
        this.parentId = category.getParentId();
        this.subCategory = new ArrayList<Category>(category.getSubCategory());
        this.productNum = category.getProductNum();
    }

    public Integer getProductNum() {
        return productNum;
    }

    public void setProductNum(Integer productNum) {
        this.productNum = productNum;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getTurn() {
        return turn;
    }

    public void setTurn(Integer turn) {
        this.turn = turn;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public List<Category> getSubCategory() {
        return subCategory;
    }

    public void setSubCategory(List<Category> subCategory) {
        this.subCategory = subCategory;
    }
}
