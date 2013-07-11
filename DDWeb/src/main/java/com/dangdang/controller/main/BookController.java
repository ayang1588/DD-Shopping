package com.dangdang.controller.main;

import com.alibaba.fastjson.JSONArray;
import com.dangdang.commons.pagination.vo.Page;
import com.dangdang.commons.redis.RedisService;
import com.dangdang.commons.utils.CookieUtils;
import com.dangdang.pojo.Book;
import com.dangdang.pojo.Category;
import com.dangdang.service.IBookService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Description:
 * Author: 柳阳
 * Email: ayang1588@163.com
 * Date: 2013-4-25
 * Time: 下午2:02
 */
@Controller
@RequestMapping("/book")
public class BookController {
    private final static Logger logger = Logger.getLogger(BookController.class);

    private IBookService bookService;
    private RedisService redisService;

    @RequestMapping("/bookList/{categoryId}/{parentId}")
    public ModelAndView listBook(@PathVariable("categoryId") Integer categoryId,
                                 @PathVariable("parentId") Integer parentId,
                                 HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("main/book_list");

        //从缓存中获取与该类别同级的类别
        List<Category> allCategory = (List<Category>) redisService.get("allCategory");

        Category category = null;
        Category nowCategory = null;
        for (int i = 0; i < allCategory.size(); i++) {
            if (allCategory.get(i).getId().intValue() == parentId.intValue()) {
                category = allCategory.get(i);
                for (int j = 0; j < allCategory.size(); j++) {
                    if (allCategory.get(j).getId().intValue() == categoryId.intValue()) {
                        nowCategory = allCategory.get(j);
                    }
                }
                break;
            }
        }
        // 取出该类别的图书
        Page page = new Page();
        Map map = new HashMap();
        map.put("id", categoryId);
        // 默认按销量排序
        map.put("orderType", 0);
        page.setParams(map);
        List<Book> books = bookService.getBookByCategoryId(page);
        if (books.size() == 0) {
            mav.addObject("allPageNum", 1);
        } else {
            mav.addObject("allPageNum",
                    nowCategory.getProductNum() % books.size() == 0 ?
                            nowCategory.getProductNum() / books.size() :
                            nowCategory.getProductNum() / books.size() + 1);
        }
        // 获取浏览历史
        List<Book> historyList = getHistoryBookByCookie(request);
        mav.addObject("orderType", 0);
        mav.addObject("history", historyList);
        mav.addObject("nowPageNum", page.getPageNo());
        mav.addObject("books", books);
        mav.addObject("nowCategory", nowCategory);
        mav.addObject("category", category);
        return mav;
    }

    @RequestMapping("/bookList/{categoryId}/{parentId}/{goPageNum}/{orderType}")
    public ModelAndView gotoPageOrChangeOrder(
            @PathVariable("categoryId") Integer categoryId,
            @PathVariable("parentId") Integer parentId,
            @PathVariable("goPageNum") Integer goPageNum,
            @PathVariable("orderType") Integer orderType,
            HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("main/book_list");

        //从缓存中获取与该类别同级的类别
        List<Category> allCategory = (List<Category>) redisService.get("allCategory");

        Category category = null;
        Category nowCategory = null;
        for (int i = 0; i < allCategory.size(); i++) {
            if (allCategory.get(i).getId().intValue() == parentId.intValue()) {
                category = allCategory.get(i);
                for (int j = 0; j < allCategory.size(); j++) {
                    if (allCategory.get(j).getId().intValue() == categoryId.intValue()) {
                        nowCategory = allCategory.get(j);
                    }
                }
                break;
            }
        }
        // 取出该类别的图书
        Page page = new Page();
        page.setPageNo(goPageNum);
        Map map = new HashMap();
        map.put("id", categoryId);
        // 设置排序方式
        map.put("orderType", orderType);
        page.setParams(map);
        List<Book> books = bookService.getBookByCategoryId(page);
        if (books.size() == 0) {
            mav.addObject("allPageNum", 1);
        } else {
            mav.addObject("allPageNum",
                    nowCategory.getProductNum() % Page.PAGE_SIZE == 0 ?
                            nowCategory.getProductNum() / Page.PAGE_SIZE :
                            nowCategory.getProductNum() / Page.PAGE_SIZE + 1);
        }
        // 获取浏览历史
        List<Book> historyList = getHistoryBookByCookie(request);
        mav.addObject("history", historyList);
        mav.addObject("nowPageNum", goPageNum);
        mav.addObject("books", books);
        mav.addObject("nowCategory", nowCategory);
        mav.addObject("category", category);
        return mav;
    }


    @RequestMapping("/bookDetail/{bookId}")
    public ModelAndView toBookDetail(@PathVariable("bookId") Integer bookId, HttpServletRequest request, HttpServletResponse response) {
        ModelAndView mav = new ModelAndView("main/book_detial");
        Book book = bookService.getBookByPrimaryKey(bookId);
        // 查看用户浏览商品的历史-------------------------------------------------------
        List<Book> historyList = new ArrayList<Book>();
        try {
            String jsonHistory = CookieUtils.findCookie("proHistory", request);
            List<Integer> parseList = new ArrayList<Integer>();
            // 如果历史不为空，取出历史cookie，添加该商品（未浏览过）
            // 同时查出历史数据，返回给页面
            if (jsonHistory != null) {
                parseList = (List) JSONArray.parseArray(jsonHistory);
                // 浏览过的记一次
                if (!parseList.contains(bookId)) {
                    parseList.add(bookId);
                }
                // 把当前商品放入返回列表的第一个
                historyList.add(book);
                CookieUtils.addCookie("proHistory", JSONArray.toJSONString(parseList), response, 3 * 365 * 24 * 60 * 60);
                // 取数据返回给页面
                int endIndex = parseList.size() <= 6 ? 0 : parseList.size() - 6;
                // 从后往前去取
                for (int i = parseList.size() - 1; i >= endIndex; i--) {
                    // 当前访问的商品就不在经过数据库查询
                    if (parseList.get(i).intValue() != book.getId().intValue()) {
                        historyList.add(bookService.getBookByPrimaryKey(parseList.get(i)));
                    }
                }
            }
            // 如果历史为空，添加该商品历史，设置cookie
            // 返回本次数据
            else {
                parseList.add(bookId);
                CookieUtils.addCookie("proHistory", JSONArray.toJSONString(parseList), response, 3*365*24*60*60);
                historyList.add(book);
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        // ----------------------------------------------------------------------------
        mav.addObject("history", historyList);
        mav.addObject("book", book);
        return mav;
    }

    /**
     * 根据cookie获取浏览历史list
     * @param request
     * @return
     */
    private List<Book> getHistoryBookByCookie(HttpServletRequest request) {
        // 查看用户浏览商品的历史-------------------------------------------------------
        List<Book> historyList = null;
        try {
            String jsonHistory = CookieUtils.findCookie("proHistory", request);
            List<Integer> parseList = null;
            // 如果历史不为空，取出历史cookie
            // 同时查出历史数据，返回给页面
            if (jsonHistory != null) {
                historyList = new ArrayList<Book>();
                parseList = (List) JSONArray.parseArray(jsonHistory);
                // 取数据返回给页面
                int endIndex = parseList.size() <= 6 ? 0 : parseList.size() - 6;
                // 从后往前去取
                for (int i = parseList.size() - 1; i >= endIndex; i--) {
                    historyList.add(bookService.getBookByPrimaryKey(parseList.get(i)));
                }
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return historyList;
    }

    @Autowired
    public void setBookService(IBookService bookService) {
        this.bookService = bookService;
    }

    @Autowired
    public void setRedisService(RedisService redisService) {
        this.redisService = redisService;
    }
}
