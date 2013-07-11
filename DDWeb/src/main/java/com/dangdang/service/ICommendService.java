package com.dangdang.service;

import com.dangdang.pojo.Book;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Description:
 * Author: 柳阳
 * Email: ayang1588@163.com
 * Date: 2013-5-10
 * Time: 下午2:41
 */
public interface ICommendService {
    List<Book> getBookGuess(HttpServletRequest request);

    List<Book> getCommendBooks();
}
