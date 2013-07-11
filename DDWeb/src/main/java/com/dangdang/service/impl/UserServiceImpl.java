package com.dangdang.service.impl;

import com.dangdang.dao.UserDao;
import com.dangdang.pojo.User;
import com.dangdang.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Description:
 * Author: 柳阳
 * Email: ayang1588@163.com
 * Date: 2013-4-16
 * Time: 下午2:43
 */
@Service("userService")
public class UserServiceImpl implements IUserService {
    private UserDao userDao;

    @Override
    public User getUserById(Integer id) {
        return userDao.selectUserByPrimaryKey(id);
    }

    @Override
    public void addUser(User user) throws Exception {
        userDao.insertUser(user);
    }

    @Override
    public User getUserByEmail(String email) throws Exception {
        return userDao.selectUserByEmail(email);
    }

    @Override
    public void updateUserByEmail(User user) throws Exception {
        userDao.updateUserByEmail(user);
    }

    @Override
    public Integer isEmailExist(String email) {
        return userDao.isUserExist(email);
    }

    @Autowired
    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }
}
