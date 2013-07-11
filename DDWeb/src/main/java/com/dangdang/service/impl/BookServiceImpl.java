package com.dangdang.service.impl;

import com.dangdang.commons.pagination.vo.Page;
import com.dangdang.dao.BookDao;
import com.dangdang.pojo.Book;
import com.dangdang.service.IBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Description:
 * Author: 柳阳
 * Email: ayang1588@163.com
 * Date: 2013-4-25
 * Time: 下午5:26
 */
@Service("bookService")
public class BookServiceImpl implements IBookService {
    private BookDao bookDao;

    @Override
    public List<Book> getBookByCategoryId(Page page) {
        return bookDao.selectBookByCategoryId(page);
    }

    @Override
    public Book getBookByPrimaryKey(Integer id) {
        return bookDao.selectBookByPrimaryKey(id);
    }

    @Override
    public List<Book> getHotSellBooks(Page page) {
        return bookDao.selectHotSellBooks(page);
    }

    @Override
    public int getAllRowNum() {
        return bookDao.getALlRowNum();
    }

    @Autowired
    public void setBookDao(BookDao bookDao) {
        this.bookDao = bookDao;
    }
}
