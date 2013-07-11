package pojo;

/**
 * Description:
 * Author: 柳阳
 * Email: ayang1588@163.com
 * Date: 2013-4-11
 * Time: 下午3:15
 */
public class CategoryProduct {
    private Integer id;

    private Integer productId;

    private Integer categoryId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }
}
