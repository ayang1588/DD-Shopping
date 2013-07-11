package com.dangdang.service;

import com.dangdang.commons.pagination.vo.Page;
import com.dangdang.pojo.Book;

import java.util.List;

/**
 * Description:
 * Author: 柳阳
 * Email: ayang1588@163.com
 * Date: 2013-4-25
 * Time: 下午5:21
 */
public interface IBookService {
    List<Book> getBookByCategoryId(Page page);

    Book getBookByPrimaryKey(Integer id);

    List<Book> getHotSellBooks(Page page);

    int getAllRowNum();
}
