package util;

import com.gargoylesoftware.htmlunit.NicelyResynchronizingAjaxController;
import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.html.DomElement;
import com.gargoylesoftware.htmlunit.html.DomNode;
import com.gargoylesoftware.htmlunit.html.DomNodeList;
import com.gargoylesoftware.htmlunit.html.HtmlPage;
import org.joda.time.DateTime;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import pojo.Book;
import pojo.Product;
import pojo.UrlVO;

import java.io.*;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

/**
 * Description: 工具类
 * Author: 柳阳
 * Email: ayang1588@163.com
 * Date: 2013-4-8
 * Time: 下午2:00
 */
public class Utils {
    //利用htmlunit模拟浏览器
    //模拟一个浏览器
    private static WebClient webClient = new WebClient();
    //设置webClient的相关参数
    static {
        webClient.setJavaScriptEnabled(true);
        webClient.setCssEnabled(false);
        webClient.setAjaxController(new NicelyResynchronizingAjaxController());
        webClient.setJavaScriptTimeout(30000);
        webClient.setTimeout(35000);
        webClient.setThrowExceptionOnScriptError(false);
    }

    /**
     * 从一个页面获取该页面商品详细信息的url链接和小图片的链接地址
     *
     * @param url
     * @return
     * @throws
     */
    public static void getBookUrlFromPage(String url, List list) throws Exception {
        // timeout 0:不断请求  默认:2000毫秒超时
        Document document = Jsoup.connect(url).timeout(0).get();
        Elements node = document.select(".resultlist");
        Elements elements = node.get(0).child(0).children();
        for (Element item : elements) {
            UrlVO urlVO = new UrlVO();
            urlVO.setProductDetailUrl(item.child(1).child(0).child(0).child(0).attr("href"));
            urlVO.setSmallImageUrl(item.child(0).child(0).child(0).attr("src"));
            if (urlVO.getSmallImageUrl().contains("jpg") &&
                    !urlVO.getSmallImageUrl().contains("23193625-1_l.jpg") && !urlVO.getSmallImageUrl().contains("23171157-1_l.jpg")) {
                list.add(urlVO);
            }
        }
    }

    /**
     * 根据url和页数获取商品详细url
     *
     * @param url
     * @param startPage
     * @param endPage
     * @param list
     */
    public static void getBookUrlByUrlAndPageNum(String url, Integer startPage, Integer endPage, List list) throws Exception {
        try {
            for (int i = startPage; i <= endPage; i++) {
                String urlStr = url + i;
                Utils.getBookUrlFromPage(urlStr, list);
            }
        } catch (Exception e) {
            throw new Exception();
        }
    }

    /**
     * 根据商品详细页面获取Product对象,并保存大图片url
     * @param urlVO
     * @return
     */
    public static Product getProductFromUrl(UrlVO urlVO) throws IOException {
        Product product = new Product();
        //模拟浏览器打开一个目标网址
        HtmlPage rootPage = webClient.getPage(urlVO.getProductDetailUrl());
        //关键字
        String keywords = rootPage.getElementByName("keywords").getAttribute("content");
        product.setKeywords(keywords);
        //描述
        String description = rootPage.getElementByName("description").getAttribute("content");
        product.setDescription(description);
        //商品名
        String productName = rootPage.getElementsByTagName("h1").get(0).asText();
        product.setProductName(productName);
        //添加时间(随机生成距现在1000天内的时间)
        Random random = new Random();
        DateTime dateTime = new DateTime();
        dateTime = dateTime.minusDays(random.nextInt(1000));
        dateTime = dateTime.minus(random.nextInt(24*3600*1000));
        product.setAddTime(dateTime.getMillis());
        //固定价格
        String fixPricePath = "/html/body/div[3][@class='bd clearfix']/div[2][@class='main']/div[2][@class='show clearfix']/div[2][@class='show_info']/div[1][@class='sale']/p[2]/i[@class='m_price']";
        List fixPriceList = rootPage.getByXPath(fixPricePath);
        if (fixPriceList.size() == 0) {
            fixPricePath = "/html/body/div[3][@class='bd clearfix']/div[2][@class='main']/div[2][@class='show clearfix']/div[2][@class='show_info']/div[2][@class='sale']/p[2]/i[@class='m_price']";
        }
        DomNode fixPriceNode = (DomNode) rootPage.getByXPath(fixPricePath).get(0);
        String fixPriceStr = fixPriceNode.getFirstChild().asText().split("¥")[1].trim();
        //当当价格
        String dangPriceStr = rootPage.getElementById("d_price").asText().split("¥")[1].trim();
        product.setFixedPrice(Double.parseDouble(fixPriceStr));
        product.setDangPrice(Double.parseDouble(dangPriceStr));
        //是否删除
        product.setHasDeleted(Short.parseShort("0"));
        //获取大图url
        String bigPicUrl = rootPage.getElementById("largePic").getAttribute("src").split("b.jpg")[0]+"w.jpg".trim();
        urlVO.setBigImageUrl(bigPicUrl);
        //收藏次数
        String collTimesStr = rootPage.getElementById("prd_span").getPreviousElementSibling().getLastChild().asText().trim();
        product.setCollectionTimes(Integer.parseInt(collTimesStr));
        //被购买次数
        int collTimes = Integer.parseInt(collTimesStr);
        product.setPurchaseTimes(collTimes/4 + random.nextInt(collTimes*3/4));
        return product;
    }

    /**
     * 根据url获取Book对象
     *
     * @param urlVO
     * @return
     */
    public static Book getBookInfoFromUrl(UrlVO urlVO) throws Exception {
        Book book = new Book();
        //模拟浏览器打开一个目标网址
        HtmlPage rootPage = webClient.getPage(urlVO.getProductDetailUrl());
        //图书信息ul
        DomElement infoDom = rootPage.getElementByName("Infodetail_pub");
        //作者
        String author = infoDom.getFirstChild().asText();
        if (!author.contains("著")) {
            throw new Exception();
        }
        author = author.substring(author.indexOf("：") + 1, author.indexOf("著")).trim();
        book.setAuthor(author);
        //出版社
        String publishing = infoDom.getChildNodes().get(1).getFirstChild().getLastChild().asText().trim();
        book.setPublishing(publishing);
        //出版时间
        String publishTime = infoDom.getChildNodes().get(2).getFirstChild().asText().split("：")[1].trim();
        DateTime dateTime = new DateTime(publishTime);
        book.setPublishTime(dateTime.getMillis());
        //版次
        String whichEditon = infoDom.getChildNodes().get(3).getFirstChild().asText().split("：")[1].trim();
        book.setWhichEdtion(whichEditon);
        //页数
        String totalPage = infoDom.getChildNodes().get(3).getChildNodes().get(2).asText().trim();
        if (totalPage.split("：").length > 1) {
            totalPage = totalPage.split("：")[1].trim();
            book.setTotalPage(totalPage);
        }
        //字数
        String wordNum = infoDom.getChildNodes().get(3).getChildNodes().get(4).asText().trim();
        if (wordNum.split("：").length > 1) {
            wordNum = wordNum.split("：")[1].trim();
            book.setWordNumber(wordNum);
        } else {
            book.setWordNumber("");
        }
        //纸张大小
        String paperSize = infoDom.getChildNodes().get(4).getChildNodes().get(2).asText().split("：")[1].trim();
        book.setBookSize(paperSize);
        //纸张类型
        String paperType = infoDom.getChildNodes().get(4).getChildNodes().get(4).asText().split("：")[1].trim();
        book.setPaperType(paperType);
        //印刷时间
        String printTime = infoDom.getChildNodes().get(4).getFirstChild().asText().split("：")[1].trim();
        DateTime pTime = new DateTime(printTime);
        book.setPrintTime(pTime.getMillis());
        //印次
        String printTimes = infoDom.getChildNodes().get(5).getFirstChild().asText().split("：")[1].trim();
        book.setPrintNumber(printTimes);
        //isbn
        String isbn = infoDom.getChildNodes().get(5).getChildNodes().get(2).asText().split("：")[1].trim();
        book.setIsbn(isbn);
        //包装
        String packType = infoDom.getChildNodes().get(5).getChildNodes().get(4).asText().split("：")[1].trim();
        book.setPackType(packType);
        //模拟访问动态推荐内容页面
        String productId = rootPage.getElementById("pid_span").getAttribute("product_id").trim();
        String dynamicInfoUrl = "http://product.dangdang.com/detail/main.php?product_id=" + productId + "&type=all";
        HtmlPage dynamicInfoPage = webClient.getPage(dynamicInfoUrl);
//        String editorCommendHtml = dynamicInfoPage.getElementById("abstract_all").getNextSibling().asText();
//        String editorCommendStr = editorCommendHtml.split("<p>")[1].split("</p>")[0].trim();
//        book.setEditorCommend(editorCommendStr);
        //内容推荐
        String contentSummary = dynamicInfoPage.getElementById("content_all").getNextSibling().asText().split("<p><span")[0].trim();
        book.setContentSummary(contentSummary);
        //作者简介
        DomNode authorSummary = dynamicInfoPage.getElementById("authorintro_all");
        if (authorSummary != null) {
            book.setAuthorSummary(authorSummary.getNextSibling().asText().trim());
        }
        //目录
        DomNode test = dynamicInfoPage.getElementById("catalog_all");
        DomNode catalogue = dynamicInfoPage.getElementById("catalog_all");
        if (catalogue != null) {
            book.setCatalogue(catalogue.getNextSibling().asText().trim());
        }
        //媒体评论
        DomNode mediaComments = dynamicInfoPage.getElementById("mediafeedback_all");
        if (mediaComments != null) {
            book.setMediaComments(mediaComments.getNextSibling().asText().trim());
        }
        return book;
    }

    /**
     * 根据图片url和id保存图片
     *
     * @param urlStr
     * @param filename
     */
    public static void saveImageByUrlAndName(String urlStr, String filename) throws Exception {
        // 构造URL
        URL url = new URL(urlStr);
        // 打开连接
        URLConnection con = url.openConnection();
        // 输入流
        InputStream is = con.getInputStream();
        // 1K的数据缓冲
        byte[] bs = new byte[1024];
        // 读取到的数据长度
        int len;
        // 输出的文件流
        OutputStream os = new FileOutputStream(filename);
        // 开始读取
        while ((len = is.read(bs)) != -1) {
            os.write(bs, 0, len);
        }
        os.flush();
        // 完毕，关闭所有链接
        os.close();
        is.close();
    }


    public static void main(String[] args) {
//        List<UrlVO> list = new ArrayList<UrlVO>();
//        try {
//            getBookUrlByUrlAndPageNum("http://category.dangdang.com/all/?category_path=01.03.38.00.00.00&page_index=", 1, 2, list);
////            getBookUrlFromPage("http://category.dangdang.com/all/?category_path=01.03.38.00.00.00&page_index=2", list);
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        System.out.println(list.size());
//        for (UrlVO vo : list) {
////            System.out.println(str);
//        }

        UrlVO urlVO = new UrlVO();
        try {
            urlVO.setProductDetailUrl("http://product.dangdang.com/product.aspx?product_id=23059680");
//            getProductFromUrl(urlVO);
            getBookInfoFromUrl(urlVO);
        } catch (Exception e) {
            e.printStackTrace();
        }


//        String urlStr = "http://img32.ddimg.cn/28/35/23207212-1_l.jpg";
//        try {
//            saveImageByUrlAndName(urlStr, "1.jpg");
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
    }
}
