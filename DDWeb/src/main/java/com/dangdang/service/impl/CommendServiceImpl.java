package com.dangdang.service.impl;

import com.dangdang.commons.pagination.vo.Page;
import com.dangdang.commons.utils.CookieUtils;
import com.dangdang.pojo.Book;
import com.dangdang.service.IBookService;
import com.dangdang.service.ICommendService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.*;

/**
 * Description:
 * Author: 柳阳
 * Email: ayang1588@163.com
 * Date: 2013-5-10
 * Time: 下午2:39
 */
@Service("commendService")
public class CommendServiceImpl implements ICommendService {
    private final static Logger logger = Logger.getLogger(CommendServiceImpl.class);
    
    // 推荐的图书数量
    private final static int COMMEND_NUM = 9;
    // 彩泥喜欢图书数量
    private final static int GUESS_NUM = 10;

    private IBookService bookService;

    public List<Book> getBookGuess(HttpServletRequest request) {
        List<Book> guess = new ArrayList<Book>();
        // 判断浏览历史是否为空
        String his= null;
        try {
            his = CookieUtils.findCookie("proHistory", request);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        // 如果为空----推荐买的最多的10本书
        if (his == null) {
            Page page = new Page();
            page.setPageNo(1);
            page.setPageSize(GUESS_NUM);
            Map params = new HashMap<String, Object>();
            params.put("orderType", 0);
            page.setParams(params);
            guess = bookService.getHotSellBooks(page);
        }
        // 如果不为空，根据浏览历史推荐相关类别下买的最多的10本书
        else {
//            List<Integer> history = (List) JSONArray.parseArray(his);
//            List<Book> historyBooks = new ArrayList<Book>();
//            for (int i = 0; i < history.size(); i++) {
//                historyBooks.add(bookService.getBookByPrimaryKey(history.get(i)));
//                // 如果浏览历史的类别大于10，跳出
//                if (i == GUESS_NUM) {
//                    break;
//                }
//            }
//            // 计算浏览历史中访问过的类别
//            Set<Category> historyCategory = new HashSet<Category>();
//            for (int i = 0; i < historyBooks.size(); i++) {
//                historyCategory.add(categoryService.getCategoryByBookId(historyBooks.get(i).getId()));
//            }
//            int numOfEachCategory = COMMEND_NUM / history.size() + 1;
//            Page page = new Page();
//            Map<String, Object> params = new HashMap<String, Object>();
//            page.setPageSize(numOfEachCategory);
//            page.setPageNo(1);
//            params.put("orderType", 0);
//            page.setParams(params);
//            for (Iterator iter = historyCategory.iterator(); iter.hasNext();) {
//                params.put("id", ((Category)iter.next()).getId());
//                guess.addAll(bookService.getBookByCategoryId(page));
//            }
              guess = getRandomBooks(GUESS_NUM);
        }
        return guess;
    }

    @Override
    public List<Book> getCommendBooks() {
        return getRandomBooks(COMMEND_NUM);
    }

    private List<Book> getRandomBooks(int num) {
        List<Book> books = new ArrayList<Book>();
        Random random = new Random();
        int allRowNum = bookService.getAllRowNum();
        for (int i = 0; i < num; i++) {
            int id = random.nextInt(allRowNum);
            books.add(bookService.getBookByPrimaryKey(id));
        }
        return books;
    }

    @Autowired
    public void setBookService(IBookService bookService) {
        this.bookService = bookService;
    }
}
