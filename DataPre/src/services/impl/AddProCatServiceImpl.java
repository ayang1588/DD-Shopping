package services.impl;

import dao.CategoryProductDao;
import dao.ProductDao;
import pojo.Book;
import pojo.CategoryProduct;
import pojo.Product;
import services.AddProCatService;
import util.DBUtils;

/**
 * Description:
 * Author: 柳阳
 * Email: ayang1588@163.com
 * Date: 2013-4-14
 * Time: 上午7:15
 */
public class AddProCatServiceImpl implements AddProCatService{
    private CategoryProductDao categoryProductDao;
    private ProductDao productDao;
    @Override
    public void addProductCategory(Product product, Book book, CategoryProduct categoryProduct) throws Exception {
        try {
            DBUtils.beginTx();
            int productId = productDao.addProduct(product);
            book.setProductId(productId);
            categoryProduct.setProductId(productId);
            productDao.addBook(book);
            categoryProductDao.addCategoryProduct(categoryProduct);
            DBUtils.commitTx();
        } catch (Exception e) {
            DBUtils.rollbackTx();
            throw new Exception("Service Exception", e);
        } finally {
            DBUtils.closeConnection();
        }
    }

    public CategoryProductDao getCategoryProductDao() {
        return categoryProductDao;
    }

    public void setCategoryProductDao(CategoryProductDao categoryProductDao) {
        this.categoryProductDao = categoryProductDao;
    }

    public ProductDao getProductDao() {
        return productDao;
    }

    public void setProductDao(ProductDao productDao) {
        this.productDao = productDao;
    }




}
