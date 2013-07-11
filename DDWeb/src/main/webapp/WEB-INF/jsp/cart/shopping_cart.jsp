<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="date" uri="/dangdang/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>购物车--当当网</title>
    <link href="${pageContext.request.contextPath}/css/shoppingcart.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/css/win_login20130402.css" rel="stylesheet" type="text/css">
</head>
<body>
<!-- 头部开始 -->
<%@include file="/commons/header_small.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/cart/shopping_cart.js"></script>
<!-- 头部结束 -->

<div id="shoppingcart_area" class="shoppingcart_wrapper" sid="shoppingcart">
    <div id="ad_cpt_11850" style="display: none;"></div>
    <div class="shoppingcart_nav">
        <h1>我的购物车</h1>
    </div>
    <div class="notice_bk objhide" sid="div_notice">
    </div>
    <div class="shoppingcart_business_dd_new" sid="shoppingcart_business_dd" style="">
        <p>
            <span sid="shoppingcart_dd">当当网 </span>
            <span sid="free_fee_tip_dd" class="">
                <a name="free_tip" href="#" target="_blank" style="color: #1a66b3;">运费说明>></a>
            </span>
        </p>
    </div>
    <%--载入中--%>
    <div class="shoppingcart_promotions realview_box" sid="publishProductExchange" style="display: none;">
        <div sid="div_exchange">
            <div class="shoppingcart_promotions_info J_exchangePlaceHolder">
                <div sid="exchange_slider" class="shoppingcart_promotions_info_ul">
                    <ul sid="ul_exchange" name="recomzone">
                        <li class="shoppingcart_loading" style="padding-top: 106px;">
                            <img src="${pageContext.request.contextPath}/images/loading11.gif" width="16" height="16">
                        </li>
                    </ul>
                </div>
                <div class="clear"></div>
            </div>
        </div>
    </div>
    <div class="shoppingcart_business_dd shoppingcart_business_none" sid="placeHolder" style="display: none;"></div>
    <a name="ddtop"></a>
    <ul class="shoppingcart_subject" sid="ui_shoppingcart_title">
        <li class="row1">商品名称</li>
        <li class="row2">&nbsp;</li>
        <li class="row3">当当价</li>
        <li class="row4"><span title="在当当价基础上再优惠">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></li>
        <li class="row5">数量</li>
        <li class="row6">操作</li>
    </ul>
    <c:if test="${cart_buys != null && fn:length(cart_buys.items) > 0}">
    <!-- 购物车内商品开始 -->
    <div sid="meal_sign"></div>
    <div id="collection" sid="collection" name="promo_s" style="" class="collection_block shoppingcart_promotions_01">
        <c:forEach var="item" items="${cart_buys.items}">
        <ul class="shoppingcart_list" sid="product_item" main_product_id="0" product_id="" promotion_id="" shop_id="0" name="product_s" meal_id="0">
            <li class="row00">
                <a name="productpic" href="/book/bookDetail/${item.product.id}" target="_blank" title="${item.product.productName}">
                    <img style="max-height: 54px; max-width: 54px" src="${pageContext.request.contextPath}/product_images/${item.product.productPic}_small.jpg">
                </a>
            </li>
            <li class="row11">
                <p>
                    <i></i>
                    <span class="name">
                        <a name="product" target="_blank" href="/book/bookDetail/${item.product.id}" title="${item.product.productName}">
                            ${item.product.productName}
                        </a>
                    </span>
                </p>
            </li>
            <li class="row22">&nbsp;</li>
            <li class="row33">
                <span id="dangprice_${item.product.id}">￥<fmt:formatNumber value="${item.product.dangPrice}" pattern="#0.00" /></span>
                &nbsp;&nbsp;(<fmt:formatNumber value="${item.product.dangPrice/item.product.fixedPrice*100}" pattern="##" />折)
            </li>
            <li class="row44"><span></span></li>
            <li class="row55"><!--[if IE 6]><div></div><![endif]-->
                <input id="number_${item.product.id}" type="text" name="number" value="${item.sum}" />
                <a href="javascript:numberAdd(${item.product.id});" title="数量加一" class="add">+</a>
                <a href="javascript:numberCut(${item.product.id});" title="数量减一" class="cut">-</a>
            </li>
            <li class="row66">
                <a name="movetofavorite" href="/cart/change/${item.product.id}/0"
                   title="此商品将移至“我的收藏”并从购物车中删除" sid="move_23217330_0">收藏</a>
                <a name="delete"  href="javascript:delFromCart(${item.product.id});">删除</a>
            </li>
        </ul>
        </c:forEach>
        <div class="clear"></div>
    </div>
    <div sid="ebook_sign"></div>
    <div sid="shop_sign"></div>
    <!-- 购物车内商品结束 -->
    <div class="shoppingcart_total" sid="div_total" style="">
        <%--<p class="price_calculation">商品金额总计：<span>￥</span><span sid="total_account">16.90</span></p>--%>
        <p class="price">商品金额总计(不含运费)：
            <span>￥</span>
            <span sid="pay_account" id="account">
                <fmt:formatNumber pattern="#0.00" value="${all_cost}" />
            </span>
        </p>
        <p sid="balance" class="clearfix">
            <a name="checkout" id="checkout_btn" sid="checkout_btn" href="javascript:void(dispart_order())"
               class="clearing" title="结算"></a>
            <a href="/index.html" target="_blank" name="goon" class="goon">继续购物</a>
        </p>
        <p class="shoppingcart_total_left">
            <a href="javascript:emptyCartBox();" class="qk">清空购物车</a>
        </p>
    </div>
    </c:if>
    <c:if test="${cart_buys == null || fn:length(cart_buys.items) == 0}">
    <div sid="div_no_choice" class="shoppingcart_general">
        <div class="shoppingcart_general_none">您还没有挑选商品，
            <a sid="no_product" target="_self" name="gotoold" href="/index.html">现在去购买>></a>
        </div>
    </div>
    </c:if>
    <%--加载中--%>
    <div class="shoppingcart_general" sid="loading" style="display: none;">
        <div class="shoppingcart_loading">
            <img width="30" height="30" src="${pageContext.request.contextPath}/images/loading11.gif">
        </div>
    </div>
    <div class="shoppingcart_total shoppingcart_total2" sid="noProduct" style="display: none;"></div>

    <!-- 收藏栏开始 -->

    <div id="wishlist_area" class="shoppingcart_favorites" sid="divCustWishList" name="favoritezone">
        <c:if test="${cart_colls == null || fn:length(cart_colls.items) == 0}">
        <h2>
            收藏夹暂无商品
        </h2>
        </c:if>
        <c:if test="${cart_colls != null && fn:length(cart_colls.items) > 0}">
        <h2>
            <a class="up" name="turnoff" title="up" href="#" sid="pucker_up_wish">折叠</a>
                <span>收藏的商品
                    <span class="login" sid="wishlogin" style="display: none;">
                        -请<a sid="wishlogin_0" href="javascript:void(wishlogin('wishlogin_0',' ','wishupdown'))">登录</a>后查看
                    </span>
                </span>
        </h2>
        <ul class="shoppingcart_subject" sid="wishlist_title" style="">
            <li class="row1">商品名称</li>
            <li class="row2">&nbsp;</li>
            <li class="row3">当当价</li>
            <li class="row4">&nbsp;</li>
            <li class="row5">操作</li>
        </ul>
        <div sid="div_CustWishList">
            <div sid="ul_CustWishList" name="favoritezone" class="objhide" style="display: block;">

                <c:forEach var="collection" items="${cart_colls.items}">
                <ul>
                    <li class="row1">
                        <a title="${collection.product.productName}" target="_blank" href="/book/bookDetail/${collection.product.id}">
                            ${collection.product.productName}
                        </a>
                    </li>
                    <li class="row2">&nbsp;</li>
                    <li class="row3"><span>￥<fmt:formatNumber value="${collection.product.dangPrice}" pattern="#0.00" /></span>
                        &nbsp;&nbsp;(<fmt:formatNumber value="${collection.product.dangPrice/collection.product.fixedPrice*100}" pattern="##" />折)
                    </li>
                    <%--<li class="row4" style="text-align: center"><span>${collection.sum}</span></li>--%>
                    <li class="row4" style="text-align: center"><span>&nbsp;</span></li>
                    <li class="row5">
                        <a href="/cart/change/${collection.product.id}/1" name="movetoshoppingcart_wish">放入购物车</a>
                        <a href="javascript:delFromCollection(${collection.product.id});" name="delete_wish">删除</a>
                    </li>
                </ul>
                </c:forEach>
            </div>
        </div>
        </c:if>
    </div>

    <%--推荐--%>
    <div id="importance_area" class="shoppingcart_promotions shoppingcart_recommend" sid="importance" name="importance"
         style="">
        <h2>
            <a href="javascript:void(0);" sid="div_importance_up_down" onclick="drawImportanceList();" class="up"
               name="turnoff" title="up"></a>
            <span>重点品推荐</span>
        </h2>

        <div sid="div_importance">
            <div class="shoppingcart_promotions_info"><span id="prevBtn_importance"><a name="prevpage" style=""
                                                                                       class="shoppingcart_promotions_l "
                                                                                       href="javascript:void(0);"></a></span>

                <div style="width: 894px; height: 240px; overflow: hidden;" sid="importance_slider"
                     class="shoppingcart_promotions_info_ul">
                    <ul style="width: 1780px;" sid="ul_importance">
                        <li style="float: left;">
                            <p class="pic">
                                <a name="productpic_importance" href="http://product.dangdang.com/product.aspx?product_id=22906836"
                                   target="_blank" title="活着活着就老了（冯唐销量最好作品，最新未删版）">
                                    <img src="${pageContext.request.contextPath}/images/22906836-1_l.jpg">
                                </a>
                            </p>
                            <p class="name">
                                <a name="product_importance" href="http://product.dangdang.com/product.aspx?product_id=22906836"
                                   target="_blank" title="活着活着就老了（冯唐销量最好作品，最新未删版）">活着活着就老了（冯唐销量最好作品，最新未...
                                </a>
                            </p>
                            <p class="price">
                                <span class="price_d">￥23.00</span>
                            </p>
                            <p class="buy">
                                <a name="movetoshoppingcart_importance" href="javascript:void(0);"
                                   onclick="objCart.addToCart(22906836,this,'importance')">放入购物车</a>
                            </p>
                        </li>
                    </ul>
                </div>
                <span id="nextBtn_importance">
                    <a name="nextpage" style="" class="shoppingcart_promotions_r02" href="javascript:void(0);"></a>
                </span>
                <br class="clear"></div>
        </div>
    </div>


    <div class="shoppingcart_footer_experience">对新版购物车满意吗？留下您的意见和建议，
        <a sid="cart_advice" name="feedback" href="http://survey.dangdang.com/html/2410.html" target="_blank">帮我们改进购物车>></a>
    </div>

    <br>
</div>
<div class="box_loading" sid="window_loading">
    <img src="${pageContext.request.contextPath}/images/window_loading.gif" alt="载入状态">
    <p>请稍候...</p>
</div>
<div sid="locListDiv" class="objhide" style="position: absolute; z-index: 9999; display: none;"></div>
<div sid="div_survey" style="position:absolute;"></div>
<div sid="hidden_div" style="display: none;"></div>

<!--清空成功-->
<div class="myddorder_popup_wrap" style="display: none;" sid="EmptyCartBox">
    <div class="myddorder_popup">
        <div class="myddorder_popup_title">
            <h2>购物车</h2><a href="javascript:objCart.closeEmptyCartBox();" class="close" title="关闭">关闭</a>
        </div>
        <div class="myddorder_popup_main">
            <h3 class="icon_warning"><i></i><span>确定清空购物车中的所有商品？</span></h3>

            <div class="myddorder_popup_btn">
                <button onclick="objCart.confirmEmptyCart()">确 定</button>
                <button class="btn2" onclick="objCart.closeEmptyCartBox();">取 消</button>
            </div>
        </div>
    </div>
</div>

<!--收藏成功-->
<div class="myddorder_popup_wrap" style="display: none;" sid="SuccessBox">
    <div class="myddorder_popup">
        <div class="myddorder_popup_title">
            <h2>购物车</h2><a href="javascript: void(0);" class="close" onclick="objCart.closeBox(this); return false;"
                           title="关闭">关闭</a>
        </div>
        <div class="myddorder_popup_main">
            <h3 class="icon_success"><i></i><span>商品已经成功移入“我的收藏”</span></h3>
        </div>
    </div>
</div>


<%@include file="/commons/footer_small.jsp"%>
</body>
</html>