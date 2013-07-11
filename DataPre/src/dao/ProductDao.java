package dao;

import pojo.Book;
import pojo.Product;

/**
 * Description:
 * Author: 柳阳
 * Email: ayang1588@163.com
 * Date: 2013-4-8
 * Time: 下午5:49
 */
public interface ProductDao {
    public void addBook(Book book) throws Exception;

    public int addProduct(Product product) throws Exception;

    public int allRowsNum() throws Exception;
}
