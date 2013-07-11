package com.dangdang.commons.utils;

import org.joda.time.DateTime;

/**
 * Description: 时间处理工具类
 * Author: 柳阳
 * Email: ayang1588@163.com
 * Date: 2013-4-19
 * Time: 下午8:59
 */
public class DateUtils {
    /**
     * 根据long值获取时间，格式为：2013年1月1日 00:00
     */
    public static String getTimeStrCH(long time) {
        DateTime dateTime = new DateTime(time);
        return dateTime.toString("yyyy年MM月dd日 HH:mm");
    }

    /**
     * 判断两个时间之间相隔多少分钟（同一年的同一天的两个时间）
     * @param time1
     * @param time2
     * @return -1错误
     */
    public static int minuteBetweenTwoTime(long time1, long time2) {
        DateTime dateTime1 = new DateTime(time1);
        DateTime dateTime2 = new DateTime(time2);
        if (dateTime1.getYearOfCentury() != dateTime2.getYearOfCentury()) {
            return -1;
        }
        if (dateTime1.getDayOfYear() != dateTime2.getDayOfYear()) {
            return -1;
        }
        return Math.abs(dateTime1.getMinuteOfDay() - dateTime2.getMinuteOfDay());
    }

}
