package dao.impl;

import dao.CategoryProductDao;
import pojo.CategoryProduct;
import util.DBUtil_noTX;
import util.DBUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 * Description:
 * Author: 柳阳
 * Email: ayang1588@163.com
 * Date: 2013-4-11
 * Time: 下午3:17
 */
public class CategoryProductImpl implements CategoryProductDao {
    @Override
    public void addCategoryProduct(CategoryProduct categoryProduct) throws Exception {
        Connection conn = DBUtils.getConnection();
        String sql = "insert into d_category_product(product_id,category_id) values (?,?)";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, categoryProduct.getProductId());
        pstmt.setInt(2, categoryProduct.getCategoryId());
        pstmt.execute();
    }
}
