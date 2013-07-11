package com.dangdang.commons.exception;

/**
 * Description: 自定义业务异常
 * Author: 柳阳
 * Email: ayang1588@163.com
 * Date: 2013-4-18
 * Time: 下午3:03
 */
public class BizException extends Exception{
    public BizException() {
        super();
    }

    public BizException(String message) {
        super(message);
    }

    public BizException(String message, Throwable cause) {
        super(message, cause);
    }

    public BizException(Throwable cause) {
        super(cause);
    }
}
