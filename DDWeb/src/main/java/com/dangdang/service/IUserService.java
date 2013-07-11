package com.dangdang.service;

import com.dangdang.pojo.User;

/**
 * Description:
 * Author: 柳阳
 * Email: ayang1588@163.com
 * Date: 2013-4-16
 * Time: 下午2:43
 */
public interface IUserService {
    User getUserById(Integer id);

    void addUser(User user) throws Exception;

    User getUserByEmail(String email) throws Exception;

    void updateUserByEmail(User user) throws Exception;

    Integer isEmailExist(String email);
}
