package com.dangdang.commons.vo;

import java.util.Map;

/**
 * Description: ajax请求返回对象
 * Author: 柳阳
 * Email: ayang1588@163.com
 * Date: 2013-4-22
 * Time: 下午1:56
 */
public class JsonType {
    /**
     * 0:异常 1:正常
     */
    private int status;
    private String desc;
    private Map<String, Object> content;

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public Map<String, Object> getContent() {
        return content;
    }

    public void setContent(Map<String, Object> content) {
        this.content = content;
    }
}
