package main;

import dao.CategoryProductDao;
import dao.ProductDao;
import dao.impl.CategoryProductImpl;
import dao.impl.ProductDaoImpl;
import org.joda.time.DateTime;
import org.joda.time.Duration;
import pojo.Book;
import pojo.CategoryProduct;
import pojo.Product;
import pojo.UrlVO;
import services.impl.AddProCatServiceImpl;
import util.Utils;

import java.util.ArrayList;
import java.util.List;

/**
 * Description:
 * Author: 柳阳
 * Email: ayang1588@163.com
 * Date: 2013-4-8
 * Time: 下午12:29
 */
public class ProductMain {

    public static void main(String[] args) {
        //-----------------------------------------------------//
        //需要设置的参数
        String categoryPath = "01.01.02.00.00.00";
        Integer categoryId = 15;
        Integer startPage = 6;
        Integer endPage = 10;
        //-----------------------------------------------------//
        int successNumber = 0;
        AddProCatServiceImpl addProCatService = new AddProCatServiceImpl();
        ProductDao productDao = new ProductDaoImpl();
        CategoryProductDao categoryProductDao = new CategoryProductImpl();
        addProCatService.setProductDao(productDao);
        addProCatService.setCategoryProductDao(categoryProductDao);

        //-------------- Start Time ---------------------------
        Long startTime = System.currentTimeMillis();
        String strUrl = "http://category.dangdang.com/all/?category_path=" + categoryPath + "&page_index=";
        // 获取某url下指定页数所包含的商品详细url和小图片url
        List<UrlVO> urlList = new ArrayList<UrlVO>();
        try {
            Utils.getBookUrlByUrlAndPageNum(strUrl, startPage, endPage, urlList);
        } catch (Exception e) {
            System.out.println("有页面访问错误！");
            System.exit(0);
        }

        // 获取当前数据总数
        int allSum = 0;
        try {
            allSum = productDao.allRowsNum();
        } catch (Exception e) {
            e.printStackTrace();
        }
        // 进入每个商品详细页面url抓取数据
        for (int i = 1; i <= urlList.size(); i++) {
            try {
                // 获取Product对象
                Product product = Utils.getProductFromUrl(urlList.get(i - 1));
                // 设置图片名字
                product.setProductPic((allSum + i) + "");
                // 获取Book对象
                Book book = Utils.getBookInfoFromUrl(urlList.get(i - 1));
                // 如有不符合格式的页面则将allSum -- , 以保证id递增
                if (book == null) {
                    allSum--;
                    continue;
                }
                // 设置添加时间不能早于出版时间
                DateTime strartTime = new DateTime(book.getPublishTime());
                DateTime endTime = new DateTime(System.currentTimeMillis());
                //计算区间毫秒数
                Duration d = new Duration(strartTime, endTime);
                long time = d.getMillis();
                double num = Math.random();
                while (num == 0.0) {
                    num = Math.random();
                }
                product.setAddTime(book.getPublishTime() + new Double(time * num).longValue());
                // 保存Product对象和Book对象
                // 保存商品类别关联表信息
                CategoryProduct categoryProduct = new CategoryProduct();
                categoryProduct.setCategoryId(categoryId);
                addProCatService.addProductCategory(product, book, categoryProduct);
                // 保存图片
                Utils.saveImageByUrlAndName(urlList.get(i - 1).getSmallImageUrl(), "productimage/" + product.getProductPic() + "_small.jpg");
                Utils.saveImageByUrlAndName(urlList.get(i - 1).getBigImageUrl(), "productimage/" + product.getProductPic() + "_big.jpg");
                successNumber++;
            } catch (Exception e) {
                e.printStackTrace();
                allSum--;
                continue;
            }
        }
        //-------------- End Time ---------------------------
        Long endTime = System.currentTimeMillis();
        System.out.println("共用时：" + new DateTime(endTime - startTime).getMinuteOfHour() + " 分钟");
        System.out.println("共访问商品页面：" + urlList.size() + " 个");
        System.out.println("成功抓取数据：" + successNumber + " 个");
        try {
            System.out.println("共下载图片：" + successNumber * 2 + " 个");
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("过滤数据页面：" + (urlList.size() - successNumber) + " 个");
        System.out.println("平均抓取时间：" + new DateTime((endTime - startTime) / successNumber).getMillis() + " 毫秒");
    }


}
