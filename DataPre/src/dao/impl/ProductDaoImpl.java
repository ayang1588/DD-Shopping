package dao.impl;

import dao.ProductDao;
import pojo.Book;
import pojo.Product;
import util.DBUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Date;

/**
 * Description:
 * Author: 柳阳
 * Email: ayang1588@163.com
 * Date: 2013-4-8
 * Time: 下午5:49
 */
public class ProductDaoImpl implements ProductDao {
    @Override
    public void addBook(Book book) throws Exception{
        String sql = "insert into d_book(product_id,author,publishing,publish_time,which_edtion,total_page,word_number,book_size,paper_type,print_time,print_number,isbn,pack_type,content_summary,author_summary,catalogue,media_comments) " +
                "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement pstmt = null;
        Connection conn = null;
        try {
            conn = DBUtils.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, book.getProductId());
            pstmt.setString(2, book.getAuthor());
            pstmt.setString(3, book.getPublishing());
            pstmt.setLong(4, book.getPublishTime());
            pstmt.setString(5, book.getWhichEdtion());
            pstmt.setString(6, book.getTotalPage());
            pstmt.setString(7, book.getWordNumber());
            pstmt.setString(8, book.getBookSize());
            pstmt.setString(9, book.getPackType());
            pstmt.setLong(10, book.getPrintTime());
            pstmt.setString(11, book.getPrintNumber());
            pstmt.setString(12, book.getIsbn());
            pstmt.setString(13, book.getPackType());
            pstmt.setString(14, book.getContentSummary());
            pstmt.setString(15, book.getAuthorSummary());
            pstmt.setString(16, book.getCatalogue());
            pstmt.setString(17, book.getMediaComments());

            pstmt.execute();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (pstmt != null) {
                pstmt.close();
            }
        }
    }

    @Override
    public int addProduct(Product product) throws Exception{
        String sql = "insert into d_product(product_name,description,add_time,fixed_price,dang_price,keywords,has_deleted,product_pic,purchase_times,collection_times) " +
                "values(?,?,?,?,?,?,?,?,?,?)";
        ResultSet rs = null;
        PreparedStatement pstmt = null;
        Connection conn = null;
        int id = 0;
        try {
            conn = DBUtils.getConnection();
            pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            pstmt.setString(1, product.getProductName());
            pstmt.setString(2, product.getDescription());
            pstmt.setLong(3, new Date().getTime());
            pstmt.setDouble(4, product.getFixedPrice());
            pstmt.setDouble(5, product.getDangPrice());
            pstmt.setString(6, product.getKeywords());
            pstmt.setInt(7, product.getHasDeleted());
            pstmt.setString(8, product.getProductPic());
            pstmt.setInt(9, product.getPurchaseTimes());
            pstmt.setInt(10, product.getCollectionTimes());
            pstmt.execute();
            rs = pstmt.getGeneratedKeys();
            rs.next();
            id = rs.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (pstmt != null) {
                pstmt.close();
            }
            if (rs != null) {
                pstmt.close();
            }
        }
        return id;
    }

    @Override
    public int allRowsNum() throws Exception {
        String sql = "select count(*) from d_product";
        ResultSet rs = null;
        PreparedStatement pstmt = null;
        Connection conn = null;
        int allNum = 0;
        try {
            conn = DBUtils.getConnection();
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            rs.next();
            allNum = rs.getInt(1);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (pstmt != null) {
                pstmt.close();
            }   if (rs != null) {
                pstmt.close();
            }
        }
        return allNum;
    }
}
