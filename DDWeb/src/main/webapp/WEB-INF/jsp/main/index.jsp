<%@page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>当当图书-全球最大的中文网上书店，有小说、少儿、教辅、青春、文艺等40多大品类的图书、特价书。提供图书阅读风向标—畅销榜</title>
    <meta name="description" content="全球最大的中文网上书店，全网最低价,快递送货上门，货到付款，为您提供方便快捷的网上购物体验！当当榜、特价书市等特色频道为您提供超级专业、实惠的购物享受！">
    <link href="${pageContext.request.contextPath}/css/reset_20120314.css" rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath}/css/book_20120314.css" rel="stylesheet" type="text/css">
</head>
<body>

<!-- 头部开始 -->
<%@include file="/commons/header.jsp" %>

<!-- 此处引用页头 -->
<div class="book_wrap clearfix">
<!--广告-->
<%@include file="/commons/main_ad.jsp" %>

<div class="book_siderbar">
    <div class="slogan"></div>
    <div class="category_panel" name="__CategorgView">
        <h2>图书分类</h2>
        <div class="category_content">
            <c:forEach var="category" items="${categoryList}" varStatus="flag">
                <h3 <c:if test="${flag.first}">class="first"</c:if>>
                    <a title="${category.name}">${category.name}</a>
                </h3>
                <div class="category_sub_content clearfix">
                    <c:forEach var="subCategory" items="${category.subCategory}" varStatus="subFlag">
                        <a <c:if test="${subFlag.first}">class="first"</c:if>
                           <c:if test="${subFlag.last}">class="last"</c:if>
                           title="${subCategory.name}" href="/book/bookList/${subCategory.id}/${subCategory.parentId}">${subCategory.name}</a>
                    </c:forEach>
                </div>
            </c:forEach>

            <div class="btn_panel">
                <a href="#">详细分类>></a>
            </div>
            <h3>&nbsp;</h3>
            <div></div>
        </div>
    </div>
    <div class="book_recommend" name="__TuiJianGG">
        <h2>推荐功能</h2>
        <div class="book_recommend_content">
            <ul>
                <li class="first"><a href="#" target="_blank" title="在线读书">
                    <%--<span class="icon" style="background:url(http://img4.ddimg.cn/00038/book/icon_19x16_01.png) no-repeat 0 0;"></span>--%>
                    <span>在线读书</span></a>
                </li>
            </ul>
        </div>
        <div class="corner left_top imageElement"></div>
        <div class="corner right_top imageElement"></div>
        <div class="corner left_bottom imageElement"></div>
        <div class="corner right_bottom imageElement"></div>
    </div>
    <div class="siderbar_ad" name="__ZhuanTiAD-L1">
        <p><a href="#" target="_blank"><img
                src="${pageContext.request.contextPath}/images/zzbw19090_hw130402.jpg"></a>
        </p>

        <p><a href="#" target="_blank"><img
                src="${pageContext.request.contextPath}/images/nkyxf_1365758237.jpg"></a>
        </p>

        <p><a href="#" target="_blank"><img
                src="${pageContext.request.contextPath}/images/ky_190x90_zyd130307.jpg"></a>
        </p>
    </div>
    <div class="book_brand" name="__PinPaiCBS">
        <h2>品牌出版商</h2>

        <div class="book_brand_content" id="book_brand_content">
            <ul>
                <li class="first  piclist"><a href="#" target="_blank"><img
                        src="${pageContext.request.contextPath}/images/zhongshao_17245_wxj110714.jpg"></a>
                </li>
                <li class=" piclist"><a href="#" target="_blank"><img
                        src="${pageContext.request.contextPath}/images/fhld.jpg"></a>
                </li>
            </ul>
        </div>
    </div>
    <div class="strategic_partner" name="__ZhaiLveHZHB">
        <h2></h2>

        <div class="strategic_partner_content">

        </div>
    </div>
</div>

<div class="book_main">

<div class="book_tab1">
<div class="book_tab1_top" id="book_tab1_top">
    <a id="tab1_host_tab_0" href="javascript:;" title="独家推荐" class="active"><span>独家推荐</span></a>
    <%--<a id="tab1_host_tab_1" href="#" title="" class=""><span></span></a>--%>
    <%--<a id="tab1_host_tab_2" href="#" title=""><span></span></a>--%>
</div>
<div class="book_tab1_content">
<div id="book_tab1_content" class="book1_tab1_slide_content"
     style="position: relative; width: 760px; height: 442px;">
<div id="tab1_0" class="book_djtg" name="DuJiaTG"
     style="position: absolute; top: 0px; left: 0px; display: block; z-index: 4; opacity: 1; width: 760px; height: 442px;">

    <div class="book_djtg_content clearfix">
        <div id="djtg_area_slide" class="book_djtg_slide_content"
             style="position: relative; width: 759px; height: 410px;">
            <div id="djtg_area_0" class="clearfix"
                 style="position: absolute; top: 0px; left: 0px; display: block; z-index: 11; opacity: 1;">
                <div class="detail">
                    <c:forEach var="commend" items="${commendList}" begin="0" end="0">
                    <div class="pic">
                        <a href="/book/bookDetail/${commend.id}" target="_blank" title="${commend.product.productName}">
                            <img alt="${commend.product.productName}"
                                 src="${pageContext.request.contextPath}/product_images/${commend.product.productPic}_big.jpg"
                                 style="display: inline-block; max-width: 200px; max-height: 200px;">
                        </a>
                        <div class="stemp"></div>
                    </div>
                    <p class="title">
                        <a href="/book/bookDetail/${commend.id}" target="_blank" title="${commend.product.productName}">${commend.product.productName}</a>
                    </p>
                    <p class="tip">当当独家推荐</p>
                    <p>作 者：${commend.author}</p>
                    <p>出版社：${commend.publishing}</p>
                    <p class="price">当当价：
                        <span class="price_d">￥<em>
                            <fmt:formatNumber value="${commend.product.dangPrice}" pattern="#0.00"></fmt:formatNumber></em>
                        </span>
                    </p>
                    <p class="description">${commend.product.description}</p>
                    </c:forEach>
                </div>
                <ul class="clearfix">
                    <c:forEach var="commend" items="${commendList}" begin="1">
                        <li>
                            <div class="pic">
                                <a href="/book/bookDetail/${commend.id}" target="_blank" title="${commend.product.productName}">
                                    <img alt="${commend.product.productName}"
                                         src="${pageContext.request.contextPath}/product_images/${commend.product.productPic}_small.jpg"
                                         style="display: inline-block; max-height: 100px; max-width: 100px;">
                                </a>
                                <div class="stemp"></div>
                            </div>
                            <p class="title><span class=" icon="" title="独家">
                                <a href="/book/bookDetail/${commend.id}" target="_blank" title="${commend.product.productName}">
                                        ${fn:substring(commend.product.productName, 0, 24)}
                                </a>
                            </p>
                            <p class="price">
                                <span class="price_m">￥<fmt:formatNumber value="${commend.product.fixedPrice}" pattern="#0.00"></fmt:formatNumber></span>
                            </p>
                            <p class="price"><span class="price_d">
                                ￥<em><fmt:formatNumber value="${commend.product.dangPrice}" pattern="#0.00"></fmt:formatNumber></em></span>
                            </p>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
</div>
</div>
<div class="border border_left"></div>
<div class="border border_right"></div>
</div>
</div>
<div class="book_guess" id="book_guess" name="__CaiNiXH">
    <div class="book_guess_top">
        <h2>猜你喜欢</h2>
    </div>
    <div class="book_guess_content_panel">
        <div class="book_guess_content clearfix">
            <ul class="clearfix">
                <c:forEach var="guess" items="${guessList}">
                <li>
                    <div class="pic">
                        <a title="${guess.product.productName}" href="/book/bookDetail/${guess.id}" target="_blank">
                            <img alt="${guess.product.productName}" src="${pageContext.request.contextPath}/product_images/${guess.product.productPic}_small.jpg"></a>
                    </div>
                    <p class="title">
                        <a href="/book/bookDetail/${guess.id}" target="_blank" title="${guess.product.productName}">${guess.product.productName}</a>
                    </p>
                    <p class="price">
                        <span class="price_d">￥<em><fmt:formatNumber value="${guess.product.dangPrice}" pattern="#0.00"></fmt:formatNumber></em></span>
                        <span class="discount"><fmt:formatNumber value="${guess.product.dangPrice/guess.product.fixedPrice*100}" pattern="##" />折</span></p>
                </li>
                </c:forEach>
            </ul>
        </div>
        <div class="border border_left"></div>
        <div class="border border_right"></div>
    </div>
</div>
<div class="content_pic_ad" name="__ZhuanTiAD-M2">
    <div class="clear"></div>
</div>
</div>

</div>
<!-- 此处引用页尾 -->
<%@include file="/commons/footer.jsp"%>
<!--页尾 end -->


<!-- 此处引用页尾 -->

</body>
</html>