package com.dangdang.dao;

import com.dangdang.pojo.User;

/**
 * Description:
 * Author: 柳阳
 * Email: ayang1588@163.com
 * Date: 2013-4-16
 * Time: 下午2:33
 */
public interface UserDao {
    int insertUser(User user);

    User selectUserByPrimaryKey(Integer id);

    int updateUserByPrimaryKey(User user);

    User selectUserByEmail(String email);

    void updateUserByEmail(User user);

    Integer isUserExist(String email);
}
