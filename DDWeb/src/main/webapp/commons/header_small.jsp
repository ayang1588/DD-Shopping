<%--
    Author: 柳阳
    Email: ayang1588@163.com
    Date: 2013-4-18
    Time: 下午3:45
--%>
<%@ page language="java" pageEncoding="UTF-8" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/commonjs/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/commonjs/jquery.cookie.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/commons/header_small.js"></script>
<link href="${pageContext.request.contextPath}/css/unite_header_1129.css" rel="stylesheet" type="text/css">
<div class="ddnewhead_wrap">
    <div class="ddnewhead_content ddnewhead_content2">
        <div class="ddnewhead_operate" id="__ddnav_menu">
            <ul class="ddnewhead_operate_nav">
                <li class="ddnewhead_cart"><a name="t_1" href="/cart/toCart">购物车<span id="cart_items_count"
                                                                           class="cart_num"></span></a></li>
                <li class="ddnewhead_separate"></li>
                <li><a name="t_2" href="#" target="_blank">我的订单</a></li>
                <li class="ddnewhead_separate"></li>
                <li class="ddnewhead_mydd"><a name="t_3" href="#" target="_blank" class="menu_btn" id="a_myddchannel">我的当当</a>

                    <div class="ddnewhead_mydd_panel" id="__ddnav_mydd">
                        <ul class="ddnewhead_mydd_list">
                            <li><a name="t_3_1" href="#" target="_blank">我的订单</a></li>
                            <li><a name="t_3_2" href="#" target="_blank">购物礼券</a></li>
                            <li><a name="t_3_3" href="#" target="_blank">我的积分</a></li>
                            <li><a name="t_3_4" href="#" target="_blank">我的收藏</a></li>
                            <li><a name="t_3_5" href="#" target="_blank">我的评论</a></li>
                            <li><a name="t_3_6" href="#" target="_blank">数字商品</a></li>
                        </ul>
                    </div>
                </li>
                <li class="ddnewhead_separate"></li>
                <li class="ddnewhead_gcard"><a name="t_4" href="#" class="menu_btn" id="a_lipchannel" target="_blank">礼品卡</a>

                    <div class="ddnewhead_gcard_panel" id="__ddnav_card">
                        <ul class="ddnewhead_gcard_list">
                            <li><a name="t_4_1" href="#" target="_blank">购买</a></li>
                            <li><a name="t_4_2" href="#" target="_blank">激活</a></li>
                        </ul>
                    </div>
                </li>
                <li class="ddnewhead_separate"></li>
                <li><a name="ddheadmobile" href="#" target="_blank">手机当当</a></li>
                <li class="ddnewhead_separate"></li>
                <li><a name="t_5" href="#" target="_blank">企业销售</a></li>
                <li class="ddnewhead_separate"></li>
                <li class="help"><a name="t_6" href="#" target="_blank">帮助</a></li>
            </ul>
            <p id="nickname">欢迎光临当当网，请<a name="ddnav_login" href="/toLogin" target="_self" class="login_link">登录</a>
                <a name="ddnav_register" href="/regist/toRegist" target="_self" class="login_link">免费注册</a>
            </p>
            <p id="nicknamehaslog">
                您好，<a name="useremail" href="#" target="_self" class="login_link"></a>
                <a name="logout" href="javascript:logout();" target="_self" class="login_link">[退出登录]</a>
        </div>
        <div class="ddnewhead_logo"><a href="/" title="返回首页" name="ddnav_logo"><img
                src="${pageContext.request.contextPath}/images/ddnewhead_logo1.gif" alt="当当网"></a></div>
        <div class="clear"></div>
    </div>
    <div class="ddnewcarthead_bottom"></div>
</div>