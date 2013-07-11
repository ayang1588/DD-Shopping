package pojo;

/**
 * Description: 商品实体类
 * Author: 柳阳
 * Email: ayang1588@163.com
 * Date: 2013-4-8
 * Time: 下午5:02
 */
public class Product {
    /**
     * 商品id
     */
    private Integer id;
    /**
     * 商品名称
     */
    private String productName;
    /**
     * 商品描述
     */
    private String description;
    /**
     * 添加时间
     */
    private Long addTime;
    /**
     * 固定价格
     */
    private Double fixedPrice;
    /**
     * 当当价格
     */
    private Double dangPrice;
    /**
     * 关键字
     */
    private String keywords;
    /**
     * 是否逻辑删除
     * 0:不是 1:是
     */
    private Short hasDeleted;
    /**
     * 商品图片
     */
    private String productPic;
    /**
     * 购买次数
     */
    private Integer purchaseTimes;
    /**
     * 收藏次数
     */
    private Integer collectionTimes;

    public Product() {

    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName == null ? null : productName.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public Long getAddTime() {
        return addTime;
    }

    public void setAddTime(Long addTime) {
        this.addTime = addTime;
    }

    public Double getFixedPrice() {
        return fixedPrice;
    }

    public void setFixedPrice(Double fixedPrice) {
        this.fixedPrice = fixedPrice;
    }

    public Double getDangPrice() {
        return dangPrice;
    }

    public void setDangPrice(Double dangPrice) {
        this.dangPrice = dangPrice;
    }

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords == null ? null : keywords.trim();
    }

    public Short getHasDeleted() {
        return hasDeleted;
    }

    public void setHasDeleted(Short hasDeleted) {
        this.hasDeleted = hasDeleted;
    }

    public String getProductPic() {
        return productPic;
    }

    public void setProductPic(String productPic) {
        this.productPic = productPic == null ? null : productPic.trim();
    }

    public Integer getPurchaseTimes() {
        return purchaseTimes;
    }

    public void setPurchaseTimes(Integer purchaseTimes) {
        this.purchaseTimes = purchaseTimes;
    }

    public Integer getCollectionTimes() {
        return collectionTimes;
    }

    public void setCollectionTimes(Integer collectionTimes) {
        this.collectionTimes = collectionTimes;
    }

    @Override
    public String toString() {
        return id + "," + productName + "," + description + "," + addTime + "," + fixedPrice + "," + dangPrice + "," + keywords + "," + hasDeleted + "," +
                productPic + "," + purchaseTimes + "," + collectionTimes;
    }
}
