package com.dangdang.dao;

import com.dangdang.commons.pagination.vo.Page;
import com.dangdang.pojo.Book;

import java.util.List;

public interface BookDao {
    int deleteBookByPrimaryKey(Integer id);

    int insertBook(Book book);

    Book selectBookByPrimaryKey(Integer id);

    int updateBookByPrimaryKey(Book book);

    List<Book> selectBookByCategoryId(Page page);

    List<Book> selectHotSellBooks(Page page);

    int getALlRowNum();
}