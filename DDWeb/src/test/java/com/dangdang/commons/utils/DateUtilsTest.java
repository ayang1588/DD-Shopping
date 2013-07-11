package com.dangdang.commons.utils;

import org.joda.time.DateTime;
import org.junit.Ignore;
import org.junit.Test;

/**
 * Description:
 * Author: 柳阳
 * Email: ayang1588@163.com
 * Date: 2013-4-23
 * Time: 下午3:47
 */
public class DateUtilsTest {
    @Test
    @Ignore
    public void test1() {
        DateTime dateTime1 = new DateTime(2013,12,12,10,40);
        DateTime dateTime2 = new DateTime(2013,12,12,11,10);
        System.out.println(DateUtils.minuteBetweenTwoTime(dateTime1.getMillis(), dateTime2.getMillis()));
    }

}
