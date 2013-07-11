package com.dangdang.commons.utils;

import com.alibaba.fastjson.JSONArray;
import org.junit.Test;

import java.util.ArrayList;
import java.util.List;

/**
 * Description:
 * Author: 柳阳
 * Email: ayang1588@163.com
 * Date: 2013-4-29
 * Time: 下午5:59
 */
public class JSONTest {
    @Test
    public void testJSON() {
        List list = new ArrayList<Integer>();
        list.add(111);
        list.add(222);
        list.add(333);
        String jsonStr = JSONArray.toJSONString(list);
        System.out.println(jsonStr);
        List list1 = JSONArray.parseArray(jsonStr);
        System.out.println();
    }
}
