<%@ page language="java" pageEncoding="UTF-8" %>
<link href="${pageContext.request.contextPath}/css/header_960_130225.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/commonjs/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/commonjs/jquery.cookie.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/commons/header.js"></script>
<div id="hd">
    <div class="tools" id="db">
        <div class="ddnewhead_operate">
            <ul class="ddnewhead_operate_nav">
                <li class="ddnewhead_cart"><a href="/cart/toCart" name="gwc">购物车<span id="cart_items_count"
                                                                           class="cart_num"></span></a></li>
                <li class="ddnewhead_mydd"><a class="menu_btn" target="_blank" href="#" name="mydd" id="a_myddchannel">我的当当</a>

                    <div class="ddnewhead_mydd_panel" style="display: none;" id="__ddnav_mydd">
                        <ul class="ddnewhead_mydd_list">
                            <li><a target="_blank" href="#" name="wddd">我的订单</a></li>
                            <li><a target="_blank" href="#" name="mydd_1">我的收藏</a></li>
                            <li><a target="_blank" href="#" name="mydd_2">我的礼券</a></li>
                            <li><a target="_blank" href="#" name="mydd_3">我的礼品卡</a></li>
                            <li><a target="_blank" href="#" name="mydd_4">我的积分</a></li>
                            <li><a target="_blank" href="#" name="mydd_5">我的评价</a></li>
                            <li><a target="_blank" href="#" name="mydd_6">数字商品</a></li>
                        </ul>
                    </div>
                </li>
                <li><a href="#" name="sjdd">手机当当</a></li>
                <li><a class="menu_btn" href="#" name="qycg" id="a_qycgchannel">企业采购</a>

                    <div class="ddnewhead_gcard_panel" style="display: none;" id="__ddnav_qycg">
                        <ul class="ddnewhead_gcard_list">
                            <li><a href="#" name="qycg_1">大宗购物</a></li>
                            <li><a href="#" name="qycg_2">礼品卡采购</a></li>
                            <li><a href="#" name="gqycg_3">礼品卡激活</a></li>
                            <li><a href="#" name="qycg_4">礼品卡使用</a></li>
                        </ul>
                    </div>
                </li>
                <li><a class="menu_btn" href="#" name="zzfw" id="a_zzfwchannel">自助服务</a>

                    <div class="ddnewhead_gcard_panel" style="display: none;" id="__ddnav_zzfw">
                        <ul class="ddnewhead_gcard_list" style="width:98px;">
                            <li><a href="#" name="zzfw_7">自助补开发票</a></li>
                            <li><a href="#" name="zzfw_1">订单查询与修改</a></li>
                            <li><a href="#" name="zzfw_2">自助取消订单</a></li>
                            <li><a href="#" name="zzfw_3">订单配送查询</a></li>
                            <li><a href="#" name="zzfw_4">自助退货申请</a></li>
                            <li><a href="#" name="zzfw_5">自助换货申请</a></li>
                            <li><a href="#" name="zzfw_6">退换货进度查询</a></li>
                        </ul>
                    </div>
                </li>
                <li><a class="menu_btn" href="#" name="tsjy" id="a_tsjychannel">投诉与建议</a>

                    <div style="display: none" class="ddnewhead_help_panel" id="__ddnav_tsjy">
                        <ul class="ddnewhead_help_list">
                            <li><a href="#" name="tsjy_1">我要投诉</a></li>
                            <li><a href="#" name="tsjy_2">意见建议</a></li>
                        </ul>
                    </div>
                </li>
                <li><a class="menu_btn" href="#" name="ddkf" id="a_ddkfchannel">当当客服</a>

                    <div style="display: none" class="ddnewhead_help_panel" id="__ddnav_ddkf">
                        <ul class="ddnewhead_help_list">
                            <li><a href="#" name="ddkf_1">自助客服</a></li>
                            <li><a href="#" name="ddkf_2">邮件客服</a></li>
                            <li><a href="#" name="ddkf_3">微博客服</a></li>
                            <li><a href="#" name="ddkf_4">电话客服</a></li>
                        </ul>
                    </div>
                </li>
            </ul>
            <p id="nickname">
                <a name="shoucang" class="collect" href="#">
                    <span class="c"></span>
                    <span class="t">收藏当当</span>
                </a>
                <span class="gray">|</span>
                <span id="notLogin">
                    欢迎光临当当网，请
                    <a name="dl" href="/toLogin" target="_self" class="login_link">登录</a>
                    <a name="zc" href="/regist/toRegist" class="login_link">免费注册</a>
                </span>
                <span id="hasLogin">
                    您好，
                    <a name="yhm" href="#" target="_blank" class="login_link"></a>
                    [<a name="tc" href="javascript:logout();" target="_self">退出登录</a>]
                </span>
            </p>
        </div>
    </div>
    <div class="logo_line">
        <div class="logo"><a href="/" title="返回首页" name="ddnav_logo"><img
                src="${pageContext.request.contextPath}/images/dangdang_logo.jpg" width="101" height="48" alt="当当网"></a>
        </div>
        <ul class="menu">

            <li class="first"><a name="nav" href="#">图书5折</a></li>

            <li><a name="nav" href="#">H7N9攻略</a></li>

            <li><a name="nav" href="#">当当优品</a></li>

            <li><a name="nav" href="#">奥特莱斯</a></li>

            <li><a name="nav" href="#">团购</a></li>

            <li><a name="nav" href="#">苹果</a></li>

            <li><a name="nav" href="#">数字馆</a></li>

            <li><a name="nav" href="#">礼品卡</a></li>
        </ul>
    </div>
    <div class="nav_top">
        <ul>
            <li><a name="nav1" href="#">首页</a></li>
            <li class="on"><a name="nav1" href="#">图书</a></li>
            <li><a name="nav1" href="#">音像</a></li>
            <li><a name="nav1" href="#">孕</a></li>
            <li><a name="nav1" href="#">婴</a></li>
            <li><a name="nav1" href="#">童</a></li>
            <li><a name="nav1" href="#">服装</a></li>
            <li><a name="nav1" href="#">鞋靴</a></li>
            <li><a name="nav1" href="#">运动</a></li>
            <li><a name="nav1" href="#">箱包</a></li>
            <li><a name="nav1" href="#">美妆</a></li>
            <li><a name="nav1" href="#">珠宝</a></li>
            <li><a name="nav1" href="#">家居</a></li>
            <li><a name="nav1" href="#">食品</a></li>
            <li><a name="nav1" href="#">酒</a></li>
            <li><a name="nav1" href="#">手机</a></li>
            <li><a name="nav1" href="#">数码</a></li>
            <li><a name="nav1" href="#">电脑</a></li>
            <li><a name="nav1" href="#">家电</a></li>
        </ul>
    </div>
    <div class="sub">
        <ul>
            <li><a name="nav2" href="#">当当图书榜</a></li>
            <li><a name="nav2" href="#">童书</a></li>
            <li><a name="nav2" href="#">中小学教辅</a></li>
            <li><a name="nav2" href="#">教材</a></li>
            <li><a name="nav2" href="#">考试</a></li>
            <li><a name="nav2" href="#">小说</a></li>
            <li><a name="nav2" href="#">青春文学</a></li>
            <li><a name="nav2" href="#">人文社科</a></li>
            <li><a name="nav2" href="#">生活</a></li>
            <li><a name="nav2" href="#">励志</a></li>
            <li><a name="nav2" href="#">新书预售</a></li>
            <li><a name="nav2" href="#">口碑好书</a></li>
            <li><a name="nav2" href="#">热搜排行</a></li>
            <li><a name="nav2" href="#">特价书市</a></li>
        </ul>
    </div>
    <div class="search_box" id="fl">
        <a href="#" id="a_category" name="cate" class="sort_button open">全部商品详细分类</a>

        <div class="search">
            <form action="" name="searchform" id="form_search_new" onsubmit="" method="GET">
                <input type="text" class="text gray" value="" name="key" id="key_S"><span class="icon"></span>
            </form>
            <input type="button" class="button btn" onclick=""><a href="#" class="search_btn"
                                                                  name="ddnav_adv_s">高级搜索</a><span class="hot">热搜: <a
                href="#" name="hotword">读库</a><a href="#" name="hotword">公务员</a><a href="#" name="hotword">烘焙</a></span>
        </div>

    </div>
</div>