<%@page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="date" uri="/dangdang/tags" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta charset="gb2312">
    <title>${nowCategory.name}-当当图书</title>
    <meta name="description" content="当当在线提供大陆原创等热门畅销图书产品；700多城市货到付款，全场购物满29元免运费">
    <link href="${pageContext.request.contextPath}/css/reset_20120710.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/css/publish_20120710.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/recommend_end.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/promotion.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/smart_new.css">
</head>
<body>
<div class="publish_wrap clearfix">

<%@include file="/commons/header.jsp"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/main/booklist.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/cart/shopping_cart.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/commons/cookie_utils.js"></script>
<%@include file="/commons/main_ad.jsp"%>

<div class="breadcrumb" name="B">
    <a href="/index.html">当当网</a><span>&gt;</span>
    <a href="/index.html/" name="B">图书</a><span>&gt;</span>
    <a href="#" name="B" onclick="return false;">${category.name}</a><span>&gt;</span>
    <span class="current">${nowCategory.name}</span>
</div>

<div class="publish_main">
<div id="cpc_cat_11566"></div>
<%--排序筛选开始--%>
<div class="filterbar">
    <div class="filter_panel clearfix">
        <div class="btn_filter">
            <span class="search_tip">排序:</span>
            <a href="/book/bookList/${nowCategory.id}/${nowCategory.parentId}/${nowPageNum}/0"
               <c:if test="${orderType == 0}">class="active"</c:if> title="销量由高到低" name="OC">
                <span class="text">销 量</span><span class="arrow down"></span></a>
            <a href="/book/bookList/${nowCategory.id}/${nowCategory.parentId}/${nowPageNum}/1"
               <c:if test="${orderType == 1}">class="active"</c:if> title="评分由高到低" name="OS">
                <span class="text">收藏次数</span><span class="arrow down"></span></a>
            <a href="/book/bookList/${nowCategory.id}/${nowCategory.parentId}/${nowPageNum}/2"
               <c:if test="${orderType == 2}">class="active"</c:if> title="价格由低到高" name="PI">
            <span class="text">价 格</span><span class="arrow up"></span></a>
            <a href="/book/bookList/${nowCategory.id}/${nowCategory.parentId}/${nowPageNum}/3"
               <c:if test="${orderType == 3}">class="active"</c:if> title="出版时间由近到远" name="OT">
            <span class="text">出版时间</span><span class="arrow down"></span></a>
        </div>
        <div name="P1" class="page_Simplified clearfix">
            <a id="smallnext" href="/book/bookList/${nowCategory.id}/${nowCategory.parentId}/${nowPageNum + 1}/${orderType}"  name="link_page_next">下一页</a>
            <span id="allPageNum">${allPageNum}</span>
            <span>/</span>
            <span id="nowPageNum">${nowPageNum}</span>
            <a id="smallpre" href="/book/bookList/${nowCategory.id}/${nowCategory.parentId}/${nowPageNum - 1}/${orderType}" name="link_page_prev">上一页</a>
        </div>

        <div class="check_filter clearfix" style="display:none;">
            <span class="checkitem"></span>
            <div class="checkitem" name="Prom"><input type="checkbox" id="cx" onclick="">
                <label title="促销" for="cx"></label>
            </div>
        </div>
    </div>
    <div class="border left imageElement"></div>
    <div class="border right imageElement"></div>
</div>
<%--排序筛选结束--%>
<!--收藏成功-->
<div class="myddorder_popup_wrap" style="display: none;" sid="SuccessBox">
    <div class="myddorder_popup">
        <div class="myddorder_popup_title">
            <h2>购物车</h2>
            <a href="javascript:closeCollectionSuccess();" class="close" title="关闭">关闭</a>
        </div>
        <div class="myddorder_popup_main">
            <h3 class="icon_success"><i></i>
                <span id="coll_info">商品已经成功移入“我的收藏”</span><br/><br/>
                <span><a href="/cart/toCart">查看收藏夹</a></span>&nbsp;&nbsp;&nbsp;
                <span><a href="javascript:closeCollectionSuccess();">关闭</a> </span>
            </h3>
        </div>
    </div>
</div>
<div class="resultlist">
<ul>
    <c:forEach var="book" items="${books}" varStatus="flag">
        <li class="clearfix">
            <div class="listitem pic" id="22452463_img" name="Pic">
                <a href="/book/bookDetail/${book.id}" title="${book.product.productName}" target="_blank"
                   onclick="">
                    <img src="${pageContext.request.contextPath}/product_images/${book.id}_small.jpg" alt="${book.product.productName}" name="Pic">
                </a>
            </div>
            <%--('${book.id}','类别id','当前页数','排序方式1','排序方式2','排序方式3','排序方式4');--%>
            <div class="listitem detail">
                <ul class="tiplist">
                    <li class="maintitle" name="Name">
                        <a href="/book/bookDetail/${book.id}" title="${book.product.productName}" target="_blank">${book.product.productName}</a>
                    </li>
                    <li class="subtitle">
                        <p></p>
                    </li>
                        <%--<li class="starlevel" name="Comm"><a--%>
                        <%--href="http://union.dangdang.com/transfer_inner.php?ad_id=List_Comm_num&ad_type=0&sys_id=5&backurl=http://comm.dangdang.com/review/reviewlist.php?pid=22452463"--%>
                        <%--class="comment_star" title="显示所有评论" name="Comm" target="_blank"--%>
                        <%--onclick="s('click','','01.01.08.00.00.00','','12062_1_25','','','22452463_0_2_p','http%3A%2F%2Fcategory.dangdang.com%2Fall%2F%3Fcategory_path%3D01.01.02.00.00.00%26page_index%3D1','','');"><img--%>
                        <%--src="${pageContext.request.contextPath}/images/star_all.png"><img src="${pageContext.request.contextPath}/images/star_all.png"><img--%>
                        <%--src="${pageContext.request.contextPath}/imagess/star_all.png"><img src="${pageContext.request.contextPath}/images/star_all.png"><img--%>
                        <%--src="${pageContext.request.contextPath}/images/star_all.png"></a><span>(<a--%>
                        <%--href="http://union.dangdang.com/transfer_inner.php?ad_id=List_Comm_num&ad_type=0&sys_id=5&backurl=http://comm.dangdang.com/review/reviewlist.php?pid=22452463"--%>
                        <%--name="Comm" target="_blank"--%>
                        <%--onclick="s('click','','01.01.08.00.00.00','','12062_1_25','','','22452463_0_2_p','http%3A%2F%2Fcategory.dangdang.com%2Fall%2F%3Fcategory_path%3D01.01.02.00.00.00%26page_index%3D1','','');">25987</a>条评论)</span>--%>
                        <%--</li>--%>
                    <li class="publisher_info">
                        <a href="#" name="Author">${book.author}</a>著
                        /&nbsp;<date:date value="${book.publishTime}" pattern="yyyy-MM-dd"/>&nbsp;/
                        <a href="#" name="Pub">${book.publishing}</a>
                    </li>
                    <li class="describ">
                        <c:if test="${book.contentSummary == ''}">
                            该书暂未有内容介绍
                        </c:if>
                        <c:if test="${book.contentSummary != ''}">
                            ${book.contentSummary}
                        </c:if>
                    </li>
                    <li class="clearfix">
                        <div class="panel operate clearfix">
                            <a name="area_buy" href="/book/bookDetail/${book.productId}">
                                <img src="${pageContext.request.contextPath}/images/btn_buy.gif" title="购买" border="0">
                            </a>
                            <a id="lcase${book.productId}" href="javascript:collection(${book.productId});" name="Fav">
                                <img src="${pageContext.request.contextPath}/images/btn_keep.gif" alt="收 藏" title="收 藏">
                            </a>
                        </div>
                        <div class="panel price">
                            <span class="price_d">￥<em><fmt:formatNumber value="${book.product.dangPrice}" pattern="#0.00"></fmt:formatNumber></em>
                            </span><span class="price_m">￥<fmt:formatNumber value="${book.product.fixedPrice}" pattern="#0.00"></fmt:formatNumber></span>
                            <span class="discount">
                                折扣：<fmt:formatNumber value="${book.product.dangPrice/book.product.fixedPrice*100}" pattern="##" />折
                            </span>
                        </div>
                    </li>
                </ul>
            </div>
        </li>
    </c:forEach>
</ul>
</div>
<div class="paginating clearfix">
    <input type="hidden" id="urlInfo" value="/book/bookList/${nowCategory.id}/${nowCategory.parentId}/">
    <input type="hidden" id="orderType" value="${orderType}">
    <div class="pageform" name="Page">
        <a href="javascript:gotoPage();">确定</a>
        <span>页</span><input id="jumpto" type="text" value="${nowPageNum}"><span>共${allPageNum}页 到第</span>
    </div>
    <div class="pagepanel" name="P2">
        <a class="pagebtn" name="link_page_next"
           href="/book/bookList/${nowCategory.id}/${nowCategory.parentId}/${nowPageNum + 1}"><span>下一页</span></a>
        <span id="pageTarget">…</span>
        <a href="/book/bookList/${nowCategory.id}/${nowCategory.parentId}/${nowPageNum - 1}/${orderType}" class="pagebtn disabled"><span>上一页</span></a>
    </div>
</div>

<%--<div id="best_search_key">--%>
    <%--<div class="most_concern" name="W"><p><span>最受关注：</span><a--%>
            <%--href="http://searchb.dangdang.com/?key=%B9%F9%BE%B4%C3%F7&category_path=01.01.08.00.00.00"--%>
            <%--title="郭敬明">郭敬明</a><a href="http://searchb.dangdang.com/?key=%BA%AB%BA%AE&category_path=01.01.08.00.00.00"--%>
                                  <%--title="韩寒">韩寒</a><a--%>
            <%--href="http://searchb.dangdang.com/?key=%B0%B2%B6%AB%C4%E1&category_path=01.01.08.00.00.00"--%>
            <%--title="安东尼">安东尼</a><a href="http://searchb.dangdang.com/?key=%B5%D1%B0%B2&category_path=01.01.08.00.00.00"--%>
                                  <%--title="笛安">笛安</a><a--%>
            <%--href="http://searchb.dangdang.com/?key=%CD%A9%BB%AA&category_path=01.01.08.00.00.00" title="桐华">桐华</a><a--%>
            <%--href="http://searchb.dangdang.com/?key=%D0%A1%CA%B1%B4%FA&category_path=01.01.08.00.00.00"--%>
            <%--title="小时代">小时代</a><a--%>
            <%--href="http://searchb.dangdang.com/?key=%D4%C3%B6%C1%BC%CD&category_path=01.01.08.00.00.00"--%>
            <%--title="悦读纪">悦读纪</a><a--%>
            <%--href="http://searchb.dangdang.com/?key=%C6%AE%B0%A2%D9%E2&category_path=01.01.08.00.00.00"--%>
            <%--title="飘阿兮">飘阿兮</a><a href="http://searchb.dangdang.com/?key=%D1%C6%C9%E1&category_path=01.01.08.00.00.00"--%>
                                  <%--title="哑舍">哑舍</a><a--%>
            <%--href="http://searchb.dangdang.com/?key=%B6%B7%C6%C6%B2%D4%F1%B7&category_path=01.01.08.00.00.00"--%>
            <%--title="斗破苍穹">斗破苍穹</a></p></div>--%>
<%--</div>--%>

<%--<div class="list_feedback_panel" name="S">--%>
    <%--<p><span class="icon"></span><span class="tip">对商品列表页面有意见或建议</span><a href="javascript:void(0)"--%>
                                                                          <%--id="list_feedback_show">我要说两句</a><span--%>
            <%--class="thanks hidden" id="list_feedback_hit">谢谢您的反馈！</span></p>--%>

    <%--<div class="feedback_form hidden" id="list_feedback_content_div">--%>
        <%--<textarea class="default" id="list_feedback_content">请留下您对商品列表页的意见或建议</textarea>--%>

        <%--<div class="btn_panel"><a href="javascript:void(0)" id="list_feedback_submit"><span>提&nbsp;&nbsp;交</span></a><a--%>
                <%--href="javascript:void(0)" id="list_feedback_cancel" name="Cancel_S"><span>取&nbsp;&nbsp;消</span></a>--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</div>--%>
<div id="search_tuijian_content">
    <div id="recobar" style="margin-top:30px;"></div>
</div>
<!--和您兴趣相似的人还关注-->
<div id="ad_cpt_bottom_cat_11566" class="alllist_tabad"></div>
<!--底部广告-->
</div>
<div class="fixedbar">
    <div class="backtop hidden" id="backtop">
        <div class="window_suspend"><a href="#"><span
                class="icon_top imageElement"></span>返回顶部</a></div>
    </div>
</div>
<div class="publish_siderbar">
    <div class="category_panel">
        <h2>${category.name}</h2>
        <div class="category_panel_content" id="category_panel_content">
            <c:forEach items="${category.subCategory}" var="cat" varStatus="flag">
                <h3 <c:if test="${flag.first}">class="active"</c:if>
                    <c:if test="${flag.last}">class="last"</c:if> name="C2">
                    <a href="/book/bookList/${cat.id}/${cat.parentId}"
                       title="${cat.name}">
                        <span class="icon none imageElement" title="进入分类"></span><span>${cat.name}(${cat.productNum})</span>
                    </a>
                </h3>
            </c:forEach>

            <%--<a class="btn" href="javascript:void(0);" id="category_btn" title="展开全部"  name="C_MORE">--%>
            <%--<span class="btn_icon icon_down imageElement"></span><span>展开全部</span>--%>
            <%--</a>--%>
        </div>
        <div class="corner left_top imageElement"></div>
        <div class="corner right_top imageElement"></div>
        <div class="corner left_bottom imageElement"></div>
        <div class="corner right_bottom imageElement"></div>
    </div>
    <!--分类名称（公用）-->
    <!--浏览历史history-->
    <div id="browsing_history" name="VH" class="browsing_history">
        <h2>您的浏览历史</h2>
        <div class="browsing_history_content">
            <ul>
                <c:if test="${history == null}">
                    <div align="center">暂无浏览历史</div>
                </c:if>
                <c:if test="${history != null}">
                <c:forEach items="${history}" var="his" varStatus="flag">
                <li class="<c:if test="${flag.first}">first</c:if> clearfix">
                    <div class="pic">
                        <a href="/book/bookDetail/${his.id}" target="_blank" title="${his.product.productName}">
                            <img src="${pageContext.request.contextPath}/product_images/${his.product.productPic}_small.jpg"
                            style="max-height: 55px; max-width: 55px;" alt="" name="history_pic">
                        </a>
                    </div>
                    <div class="detail">
                        <a href="/book/bookDetail/${his.id}" target="_blank" title="">
                                ${his.product.productName}
                        </a>
                        <p class="price"><span class="price_d">￥<em>${his.product.dangPrice}</em></span></p></div>
                </li>
                </c:forEach>
                <li class="browsing_history_btn clearfix">
                    <a href="javascript:clearHistory();" id="clear_view_history" name="Clear_VH">清空历史</a>
                </li>
                </c:if>
            </ul>
        </div>
    </div>
    <!--浏览历史结束-->
    <div id="cpc_0">
        <div class="merchants_hotsale"><h2>商家热卖</h2>

            <div class="merchants_hotsale_content">
                <ul>
                    <li class="first">
                        <div class="item">
                            <div class="pic">
                                <a target="_blank" href="#" rel="nofollow">
                                    <img src="${pageContext.request.contextPath}/images/1094207622-1_f.jpg">
                                </a>
                            </div>
                            <div class="price"><span class="price_d">￥<em>69.00</em></span></div>
                            <div class="name detail">
                                <a target="_blank" href="#" rel="nofollow">顶瓜瓜/顶呱呱 全棉睡裙<br>可爱女士圆领碎花家居服</a>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="item">
                            <div class="pic">
                                <a target="_blank" href="#" rel="nofollow">
                                    <img src="${pageContext.request.contextPath}/images/1086910111-1_f.jpg">
                                </a>
                            </div>
                            <div class="price"><span class="price_d">￥<em>89.00</em></span></div>
                            <div class="name detail">
                                <a target="_blank" href="#" rel="nofollow">牛仔裤韩都衣舍 2013夏<br>装新款修身显瘦超薄五分牛仔</a>
                            </div>
                        </div>
                    </li>
                    <li class="merchants_hotsale_btn"><a href="#" target="_blank">我要推广&gt;&gt;</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <!--商家热卖-->
    <div id="ad_cpt_skyscraper_11566" class="banner_area" style="display: none;"></div>
    <div id="ad_cpt_11340">
        <div class="list_left_ad">
            <div>
                <a href="#" target="_blank" rel="nofollow" title="畅销好书  五折封顶">
                    <img src="${pageContext.request.contextPath}/images/df5115caa748bbcddfc8f0967df5e5bc.jpg" alt="畅销好书  五折封顶">
                </a>
            </div>
        </div>
    </div>

    <!--单品广告-->
    <%--<div id="cpc_1">--%>
    <%--<div class="merchants_hotsale"><h2>商家热卖</h2>--%>

    <%--<div class="merchants_hotsale_content">--%>
    <%--<ul>--%>
    <%--<li class="first">--%>
    <%--<div class="item">--%>
    <%--<div class="pic"><a target="_blank"--%>
    <%--href="http://a.dangdang.com/jump.php?q=awtXLeJyKrAFjLIG%2BfoYWn%2FZNZsgB0R8fQQLl9kyAjtd%2BwbGAcbsEJvlE4pbMBXLFowAZN%2B6qT4ULNmqwJOIBzmMROua7WAJKEsdkpIZ68I6oUJMS2UDbDq%2BynErP4LOErb%2BaF7MXlgnE1itKEVtC6z6BhOb182TV%2F5xTGAirch5l3UIY61s8M7XenBAfCB6STXKQBvXZBSSMbvsmMloRW0Nw%3D%3D"--%>
    <%--rel="nofollow"><img--%>
    <%--src="./下载_category_list_files/1069756212-1_f.jpg"></a></div>--%>
    <%--<div class="price"><span class="price_d">￥<em>59.00</em></span></div>--%>
    <%--<div class="name detail"><a target="_blank"--%>
    <%--href="http://a.dangdang.com/jump.php?q=awtXLeJyKrAFjLIG%2BfoYWn%2FZNZsgB0R8fQQLl9kyAjtd%2BwbGAcbsEJvlE4pbMBXLFowAZN%2B6qT4ULNmqwJOIBzmMROua7WAJKEsdkpIZ68I6oUJMS2UDbDq%2BynErP4LOErb%2BaF7MXlgnE1itKEVtC6z6BhOb182TV%2F5xTGAirch5l3UIY61s8M7XenBAfCB6STXKQBvXZBSSMbvsmMloRW0Nw%3D%3D"--%>
    <%--rel="nofollow">时尚蕾丝七分修身休闲裤<br>特价！仅此一天 可货到付款</a></div>--%>
    <%--</div>--%>
    <%--</li>--%>
    <%--<li>--%>
    <%--<div class="item">--%>
    <%--<div class="pic"><a target="_blank"--%>
    <%--href="http://a.dangdang.com/jump.php?q=aym%2FoJga%2FXbFPnQ8zQPLttD1FNh65X2nI13mX6P7XxcOpylGaKCEQ3H8RfbnUoLqUUQ%2Bn1ZAMhhZHC%2F1zfC%2Bp6Fq7WzIUA69CzjgldBWTIq2SjOgrmmmQlipKwJ3C917DOd%2BaF7MXlgnE1itKEVtC6z6BhOb182TV%2F5xTGAirch5l3UIY61s8M7XenBAfCB6STXKQBvXZBSSMbvsmMloRW0Nw%3D%3D"--%>
    <%--rel="nofollow"><img--%>
    <%--src="./下载_category_list_files/1025582508-1_f.jpg"></a></div>--%>
    <%--<div class="price"><span class="price_d">￥<em>98.00</em></span></div>--%>
    <%--<div class="name detail"><a target="_blank"--%>
    <%--href="http://a.dangdang.com/jump.php?q=aym%2FoJga%2FXbFPnQ8zQPLttD1FNh65X2nI13mX6P7XxcOpylGaKCEQ3H8RfbnUoLqUUQ%2Bn1ZAMhhZHC%2F1zfC%2Bp6Fq7WzIUA69CzjgldBWTIq2SjOgrmmmQlipKwJ3C917DOd%2BaF7MXlgnE1itKEVtC6z6BhOb182TV%2F5xTGAirch5l3UIY61s8M7XenBAfCB6STXKQBvXZBSSMbvsmMloRW0Nw%3D%3D"--%>
    <%--rel="nofollow">千纸鹤2013春夏新款短袖<br>多色可选条纹立领POLO衫</a></div>--%>
    <%--</div>--%>
    <%--</li>--%>
    <%--<li>--%>
    <%--<div class="item">--%>
    <%--<div class="pic"><a target="_blank"--%>
    <%--href="http://a.dangdang.com/jump.php?q=aetPCO3KT%2BnzBcfhMPBUfdO5XtoJEoggytO1C13z3S3vW6lPuqszBAFzkN%2FMiXt6gy7eyXcgSMx7knGfuwHbs7xGanKK3pnNpdssvd3Y92Bu68qgr5%2Feq%2FVo%2Ba8eouCd35M%2BaF7MXlgnE1itKEVtC6z6BhOb182TV%2F5xTGAirch5l3UIY61s8M7XenBAfCB6STXKQBvXZBSSMbvsmMloRW0Nw%3D%3D"--%>
    <%--rel="nofollow"><img--%>
    <%--src="./下载_category_list_files/1035505308-1_f.jpg"></a></div>--%>
    <%--<div class="price"><span class="price_d">￥<em>89.00</em></span></div>--%>
    <%--<div class="name detail"><a target="_blank"--%>
    <%--href="http://a.dangdang.com/jump.php?q=aetPCO3KT%2BnzBcfhMPBUfdO5XtoJEoggytO1C13z3S3vW6lPuqszBAFzkN%2FMiXt6gy7eyXcgSMx7knGfuwHbs7xGanKK3pnNpdssvd3Y92Bu68qgr5%2Feq%2FVo%2Ba8eouCd35M%2BaF7MXlgnE1itKEVtC6z6BhOb182TV%2F5xTGAirch5l3UIY61s8M7XenBAfCB6STXKQBvXZBSSMbvsmMloRW0Nw%3D%3D"--%>
    <%--rel="nofollow">金利来女夏季必备吊带连衣裙<br>花色居家裙时尚搭配外穿短裙</a></div>--%>
    <%--</div>--%>
    <%--<li class="merchants_hotsale_btn"><a href="http://adsmart.dangdang.com/" target="_blank">我要推广&gt;&gt;</a>--%>
    <%--</li>--%>
    <%--</ul>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--</div>--%>
    <!--商家热卖-->
</div>
</div>
<span id="params" style="display:none" have_result="1" key="" page_type="10" category_id="11566"
      category_path="01.01.08.00.00.00"></span>
<link href="${pageContext.request.contextPath}/css/win_login20130402.css" rel="stylesheet" type="text/css">
<!-- 此处引用页尾 -->
<%@include file="/commons/footer.jsp"%>
<!--页尾 end -->
</body>
</html>