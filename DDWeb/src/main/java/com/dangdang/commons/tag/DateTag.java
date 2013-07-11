package com.dangdang.commons.tag;

import org.apache.log4j.Logger;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

/**
 * Description: 处理Long类型时间的tag标记
 * Author: 柳阳
 * Email: ayang1588@163.com
 * Date: 2013-4-25
 * Time: 下午8:21
 */
public class DateTag extends TagSupport {
    private final static Logger logger = Logger.getLogger(TagSupport.class);

    private String value;
    private String pattern;

    @Override
    public int doStartTag() throws JspException {
        Long time = Long.valueOf(value);
        Calendar calendar = Calendar.getInstance();
        calendar.setTimeInMillis(time);
        if (pattern == null || pattern.trim().equals("")) {
            pattern = "yyyy-MM-dd HH:mm:ss";
        }
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(pattern);
        String str = simpleDateFormat.format(calendar.getTime());
        try {
            pageContext.getOut().write(str);
        } catch (IOException e) {
            logger.info("时间转换异常,value= " + value);
            logger.info(e.getMessage());
        }
        return super.doStartTag();
    }

    public void setValue(String value) {
        this.value = value;
    }

    public void setPattern(String pattern) {
        this.pattern = pattern;
    }
}
