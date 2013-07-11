package services;

import pojo.Book;
import pojo.CategoryProduct;
import pojo.Product;

/**
 * Description:
 * Author: 柳阳
 * Email: ayang1588@163.com
 * Date: 2013-4-14
 * Time: 上午7:14
 */
public interface AddProCatService {
    public void addProductCategory(Product product, Book book, CategoryProduct categoryProduct) throws Exception;
}
