package com.dangdang.pojo;

import java.io.Serializable;

/**
 * Description: 书籍实体类
 * Author: 柳阳
 * Email: ayang1588@163.com
 * Date: 2013-4-16
 * Time: 下午2:25
 */
public class Book implements Serializable {
    /**
     * 书籍id
     */
    private Integer id;
    /**
     * 商品表id
     */
    private Integer productId;
    /**
     * 作者
     */
    private String author;
    /**
     * 出版社
     */
    private String publishing;
    /**
     * 出版时间
     */
    private Long publishTime;
    /**
     * 版次
     */
    private String whichEdtion;
    /**
     * 总页数
     */
    private String totalPage;
    /**
     * 总字数
     */
    private String wordNumber;
    /**
     * 书籍大小（16开）
     */
    private String bookSize;
    /**
     * 纸张类型
     */
    private String paperType;
    /**
     * 印刷时间
     */
    private Long printTime;
    /**
     * 印刷次数
     */
    private String printNumber;
    /**
     * 书籍编号
     */
    private String isbn;
    /**
     * 包装类型
     */
    private String packType;
    /**
     * 内容简要
     */
    private String contentSummary;
    /**
     * 作者简要
     */
    private String authorSummary;
    /**
     * 目录
     */
    private String catalogue;
    /**
     * 媒体评论
     */
    private String mediaComments;
    /**
     * 对应的商品对象
     */
    private Product product;

    public Book() {

    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public String getContentSummary() {
        return contentSummary;
    }

    public void setContentSummary(String contentSummary) {
        this.contentSummary = contentSummary == null ? null : contentSummary.trim();
    }

    public String getAuthorSummary() {
        return authorSummary;
    }

    public void setAuthorSummary(String authorSummary) {
        this.authorSummary = authorSummary == null ? null : authorSummary.trim();
    }

    public String getCatalogue() {
        return catalogue;
    }

    public void setCatalogue(String catalogue) {
        this.catalogue = catalogue == null ? null : catalogue.trim();
    }

    public String getMediaComments() {
        return mediaComments;
    }

    public void setMediaComments(String mediaComments) {
        this.mediaComments = mediaComments == null ? null : mediaComments.trim();
    }

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

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author == null ? null : author.trim();
    }

    public String getPublishing() {
        return publishing;
    }

    public void setPublishing(String publishing) {
        this.publishing = publishing == null ? null : publishing.trim();
    }

    public Long getPublishTime() {
        return publishTime;
    }

    public void setPublishTime(Long publishTime) {
        this.publishTime = publishTime;
    }

    public String getWhichEdtion() {
        return whichEdtion;
    }

    public void setWhichEdtion(String whichEdtion) {
        this.whichEdtion = whichEdtion == null ? null : whichEdtion.trim();
    }

    public String getTotalPage() {
        return totalPage;
    }

    public void setTotalPage(String totalPage) {
        this.totalPage = totalPage == null ? null : totalPage.trim();
    }

    public String getWordNumber() {
        return wordNumber;
    }

    public void setWordNumber(String wordNumber) {
        this.wordNumber = wordNumber == null ? null : wordNumber.trim();
    }

    public String getBookSize() {
        return bookSize;
    }

    public void setBookSize(String bookSize) {
        this.bookSize = bookSize == null ? null : bookSize.trim();
    }

    public String getPaperType() {
        return paperType;
    }

    public void setPaperType(String paperType) {
        this.paperType = paperType == null ? null : paperType.trim();
    }

    public Long getPrintTime() {
        return printTime;
    }

    public void setPrintTime(Long printTime) {
        this.printTime = printTime;
    }

    public String getPrintNumber() {
        return printNumber;
    }

    public void setPrintNumber(String printNumber) {
        this.printNumber = printNumber == null ? null : printNumber.trim();
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn == null ? null : isbn.trim();
    }

    public String getPackType() {
        return packType;
    }

    public void setPackType(String packType) {
        this.packType = packType == null ? null : packType.trim();
    }
}
