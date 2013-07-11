package com.dangdang.commons.exception;

/**
 * Description: 自定义数据库异常
 * Author: 柳阳
 * Email: ayang1588@163.com
 * Date: 2013-4-18
 * Time: 下午3:07
 */
public class DBException extends Exception{
    public DBException(Throwable cause) {
        super(cause);
    }

    public DBException() {
        super();
    }

    public DBException(String message) {
        super(message);
    }

    public DBException(String message, Throwable cause) {
        super(message, cause);
    }
}
