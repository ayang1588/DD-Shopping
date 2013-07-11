<%@page contentType="text/html;charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="date" uri="/dangdang/tags" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta charset="utf-8">
    <title>图书详细</title>
    <meta name="keywords" content="${book.product.keywords}">
    <meta name="description" content="${book.product.description}">
    <link href="${pageContext.request.contextPath}/css/style_20130417.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reco_style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/smart_new.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/smart.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/footpop_new.css">
</head>
<body class="w960 narrow_page">
<%--存放隐藏信息--%>
<span id="pid_span" url="" product_id="23177190" main_id="" cname="0" c2c="" name="23177190" type="book" medium="0"
      front="publish" shop_id="0" style="display:none" spid="23177190" all="" describe_map="" category_id="11561"
      is_have_infor="" category_path="01.01.02.00.00.00"></span>
<!-- 页头 begin -->
<%@include file="/commons/header.jsp"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/cart/shopping_cart.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/commons/cookie_utils.js"></script>
<!-- 页头 end -->
<!-- 顶部通栏 begin -->
<%@include file="/commons/main_ad.jsp"%>
<!-- 顶部通栏 end -->
<!-- 主体内容 begin -->
<div class="bd clearfix">
<!-- 面包屑 begin -->
<div class="breadcrumb" name="__Breadcrumb_pub">
    <a href="/index.html" target="_blank" class="domain" name="__Breadcrumb_pub">
        <b class="domain">图书</b>
    </a>&nbsp;>&nbsp;
    <%--<a href="#" target="_blank" name="__Breadcrumb_pub">青春文学</a>&nbsp;>&nbsp;--%>
    <%--<a href="#" target="_blank" name="__Breadcrumb_pub">爱情/情感</a>&nbsp;>&nbsp;--%>
    <span>商品详情</span>
</div>

<!-- 面包屑 end -->

<!-- 右侧主区 begin -->
<div class="main">
<!-- 图书标题 begin -->
<div class="head" name="Title_pub">
    <h1>${book.product.productName}
        <span class="red" id="dp_presell"></span>
    </h1>
</div>
<!-- 图书标题 end -->

<!-- 图书展示区域 begin -->
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
<div class="show clearfix">
    <div class="show_pic" name="Mainimg_pub">
        <div class="big">
            <a title="${book.product.productName}" class="pic" name="__bigpic_pub" href="#" target="_blank">
                <img id="largePic" alt="" style="max-width: 200px; max-height: 200px;"
                     src="${pageContext.request.contextPath}/product_images/${book.product.productPic}_big.jpg">
            </a>
        </div>
        <%--大图片下方的小图--%>
        <div class="dp_slide">
            <%--<div id="mainimg_pic" class="overflow">--%>
                <%--<ul class="pic_list clearfix" style="left:0;">--%>
                    <%--<li class="on"><a href="javascript:void(0)" id="http://img30.ddimg.cn/3/20/23177190-1_b.jpg" value="0">--%>
                        <%--<img src="${pageContext.request.contextPath}/images/23177190-1_x.jpg"></a></li>--%>
                <%--</ul>--%>
            <%--</div>--%>
            <%--<a title="" id="mainimg_pic_pre" class="btn_a prev_none" href="javascript:;"><span></span></a>--%>
            <%--<a title="" id="mainimg_pic_next" class="btn_a next_none" href="javascript:;"><span></span></a>--%>
        </div>

        <div class="read  clearfix">
            <%--<a href="http://f.dangdang.com/share/share.php?product_id=23177190&type=shortreview"--%>
                <%--target="_blank" name="mainimg_Recommend"><span class="icon icon_reco"></span>推荐此书</a>--%>
            <%--<a href="#" target="_blank" name="mainimg_Amplification"><span class="icon icon_zoom"></span>点击看大图</a>--%>
        </div>
        <div class="share_wrap">
            <div class="share">
                分享到：
                <span class="share_sina">
                    <a title="新浪微博" target="_blank" name="__sina"  href=""></a>
                </span>
                <span class="share_qq">
                    <a title="腾讯微博" href="" name="__tencent" onclick=""></a>
                </span>
                <span class="share_rr">
                    <a title="人人网" name="__renren" href=""></a>
                </span>
                <span class="share_kx">
                    <a title="开心网" name="__kaixin001" href=""></a>
                </span>
            </div>
    </div>
    </div>
    <div class="show_info">
        <p class="item_id" id="prd_item_id">商品编号：<i>${book.id}</i></p>
        <span id="priceclass" value=""></span>
        <div class="sale">
            <p>当 当 价：
                <b id="d_price" class="d_price ">
                    <span class="yen">￥</span>
                    <fmt:formatNumber value="${book.product.dangPrice}" pattern="#0.00"></fmt:formatNumber>
                </b>
                <span class="break"></span>
            </p>
            <p>
                <span class="ws2">定 价：</span>
                <i class="m_price">￥<fmt:formatNumber value="${book.product.fixedPrice}" pattern="#0.00"></fmt:formatNumber></i>
                <span class="discount">折扣：
                    <i class="red">
                        <fmt:formatNumber value="${book.product.dangPrice/book.product.fixedPrice*100}" pattern="##" />
                    </i>折
                </span>
            </p>
            <%--<p>--%>
                <%--<span class="starlevel s5"></span>--%>
                <%--<span id="comm_num_up">已有<a id="comm_num_down" name="__Commentnum_pub" href="http://product.dangdang.com/product.aspx?product_id=23177190#review_point"><i>7967</i></a>人评论，--%>
                    <%--<i class="orange">99.5%</i>推荐</span>--%>
            <%--</p>--%>
            <p id="pubbang" style="display: none;"></p>
            <span id="stock_span" shop_id="0" prd_id="23177190" page_type="book"></span>
        </div>
        <ul class="intro clearfix" name="Infodetail_pub">
            <li>
                <span class="c1">
                    <span class="ws2">作 者：</span><a href="#" name="__infodetail_pub" target="_blank">${book.author}</a>　著
                </span>
            </li>
            <li>
                <span class="c1">
                    <span class="ws1">出 版 社：</span><a href="#" name="__infodetail_pub" target="_blank">${book.publishing}</a>
                </span>
            </li>
            <li>
                <span class="c1">出版时间：<date:date value="${book.publishTime}" pattern="yyyy-MM-dd"></date:date> </span>
            </li>
            <li>
                <span class="c3"><span class="ws2">版 次：</span>${book.printNumber}</span>
                <span class="c3"><span class="ws2">页 数：</span>${book.totalPage}</span>
                <span class="c3"><span class="ws2">字 数：</span>${book.wordNumber}</span>
            </li>
            <li>
                <span class="c3">印刷时间：<date:date value="${book.printTime}" pattern="yyyy-MM-dd"></date:date> </span>
                <span class="c3"><span class="ws2">开 本：</span>${book.bookSize}</span>
                <span class="c3"><span class="ws2">纸 张：</span>${book.paperType}</span>
            </li>
            <li>
                <span class="c3"><span class="ws2">印 次：</span>${book.printNumber}</span>
                <span class="c3"><i class="ws4">I S B N：</i>${book.isbn}</span>
                <span class="c3"><span class="ws2">包 装：</span>${book.packType}</span>
            </li>
        </ul>
        <div name="operation_pub" class="buy_area">
            <div>
                <label for="num">我要买：</label>
                <input onpaste="return false" type="text" value="1" name="buy_num" id="buy_num" class="text" style="ime-mode:disabled">件
                <span id="buy_num_text" class="reminder" style="display:none" buy_num="1" olbn="0" plbn="0">
                    <i class="red">请输入购买数量</i>
                </span>
            </div>
            <div class="btn_p">
                <span id="newpresale">
                    <a href="javascript:buy(${book.productId});" class="btn btn_buy" title="购买" id="part_buy_button" name="__Shopcar_pub"></a>
                </span>
                <a href="javascript:collection(${book.productId});" id="lcase${book.productId}" title="收藏" class="btn btn_collect" name="__Wishlist_pub"></a>
            </div>
        </div>
        <p class="jifen">
            收藏人气：<i>${book.product.collectionTimes}</i>
        </p>
        <span id="prd_span" name="23177190" is_direct_buy="0" shippingfee="0.00" stock_status="1" product_type="0" pre_sale="0" presalemonth="02" presaleday="28" status="0"></span>
    </div>
</div>
<!-- 图书展示区域 end -->

<div id="bothbuy" name="Bothbuy_pub" isloaded="1" style="display: none;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>

<!-- 促销活动 begin -->
<!-- 促销活动 end -->

<!-- 最佳拍档 begin -->
<!-- 最佳拍档 end -->

<!-- 优惠套餐 begin -->
<!-- 优惠套餐 end -->

<!-- 购买本商品的顾客还购买过 begin -->
<!-- 购买本商品的顾客还购买过 end -->

<!-- 相关的兴趣小组 begin -->
<!-- 相关的兴趣小组 end -->

<!-- 商品详情 begin -->
<a name="review_point" id="review_point" class="browser">&nbsp;</a>
<div id="product_tab" class="t_box" isloaded="1">
    <div class="tab_panel">
        <div id="all_tab_div" class="tab" style="position: relative;">
            <a href="javascript:;" id="detail_tab" name="__tab_detail_pub" class="on">商品详情</a>
            <%--<a href="javascript:;" id="comment_tab" name="__tab_comment_pub" class="middle">商品评价<font id="commnum" style="">(7967条)</font></a>--%>
            <%--<a href="javascript:;" id="question_tab" name="__tab_wenda_pub" class="">商品问答<font id="questionnum" style="">(0条)</font></a>--%>
        </div>
        <div class="line"></div>
    </div>
<div class="pro_content" id="detail_all" name="Detail_pub" style="">
    <c:if test='${book.contentSummary != null && book.contentSummary != ""}'>
        <div id="content" class="section">
            <div class="tit">内容推荐</div>
            <div class="descrip">
                <span id="content_all">
                    ${book.contentSummary}
                </span>
                <textarea style="display:none">
                    ${book.contentSummary}
                </textarea>
            </div>
        </div>
    </c:if>
    <c:if test='${book.authorSummary != null && book.authorSummary != ""}'>
        <div id="authorintro" class="section">
            <div class="tit">作者简介</div>
            <div class="descrip">
                <span id="authorintro_all">
                    ${book.authorSummary}
                </span>
                <textarea style="display:none">
                    ${book.authorSummary}
                </textarea>
            </div>
        </div>
    </c:if>
    <c:if test='${book.catalogue != null && book.catalogue != ""}'>
        <div id="catalog" class="section">
            <div class="tit"><a id="catalog_icon" class="icon icon_down" href="javascript:;"></a>目录</div>
            <div class="descrip">
                ${book.catalogue}
                <textarea style="display:none">
                    ${book.catalogue}
                </textarea>
                <p id="catalog_link" class="tr">
                    <a href="#">显示全部信息</a>
                </p>
            </div>
        </div>
    </c:if>
    <c:if test='${book.mediaComments != null && book.mediaComments != ""}'>
        <div id="mediafeedback" class="section">
            <div class="tit">媒体评论</div>
            <div class="descrip">
                <span id="mediafeedback_all">
                    ${book.mediaComments}
                </span>
                <textarea style="display:none">
                    ${book.mediaComments}
                </textarea>
            </div>
        </div>
    </c:if>
</div>
<%--<div id="comment_all" class="mbox3 comment" name="Comment_pub" style=""><h3 class="tit">商品评论<i>（<a id="comm_total_count" href="javascript:;">7967</a>条）</i></h3>--%>
    <%--<div class="score_wrap clearfix">--%>
        <%--<div class="book_score">--%>
            <%--<div class="num"><span id="comment_recommend_per" class="precent red">99.5</span><span class="red">&nbsp;%&nbsp;</span>强烈推荐购买</div>--%>
            <%--<p class="gray">7967人参与评分</p>--%>
            <%--<ul class="rate">--%>
                <%--<li class="clearfix">--%>
                    <%--<div class="star_line">推荐(5星、4星)</div>--%>
                    <%--<div style="width: 100px;" class="energy_line"></div>--%>
                    <%--<div class="p_number">99.5%</div>--%>
                <%--</li>--%>
                <%--<li class="clearfix">--%>
                    <%--<div class="star_line">一般(3星、2星)</div>--%>
                    <%--<div style="width: 0px;" class="energy_line"></div>--%>
                    <%--<div class="p_number">0.5%</div>--%>
                <%--</li>--%>
                <%--<li class="clearfix">--%>
                    <%--<div class="star_line">不推荐(1星)</div>--%>
                    <%--<div style="width: 0px;" class="energy_line"></div>--%>
                    <%--<div class="p_number">0.0%</div>--%>
                <%--</li>--%>
            <%--</ul>--%>
            <%--<p class="gray">只有购自当当的用户才能参与评分</p>--%>
        <%--</div>--%>
        <%--<div class="score_text">--%>
            <%--<h3>写购物评价，赚当当积分，赢购物礼券！<a target="_blank" href="http://support.dangdang.com/helpcenter/api_cms/helpcenter/question_sort/2247/180130.shtml#6" name="jifen_pub">查看积分规则>></a></h3>--%>
            <%--<div class="tips">这些人写评价得积分获礼券</div>--%>
            <%--<span url="http://commapi.dangdang.com/api/customersapi.php?custId=33999001,12815110,92846497,23155380,99803281" name="33999001,12815110,92846497,23155380,99803281" id="all_vote_user_top"></span><!--写评分获礼券用户-->--%>
            <%--<ul id="show_comm_user_top_list"><li><a href="http://comm.dangdang.com/member/myfirst.php?displayid=8221542334778" target="_blank" name="head_pub"><img src="./下载_book_detail_files/8221542334778-1_d.png"></a><a href="http://comm.dangdang.com/member/myfirst.php?displayid=8221542334778" title="lyyecho" target="_blank" name="head_name_pub">lyyecho</a></li><li><a href="http://comm.dangdang.com/member/myfirst.php?displayid=6536863534615" target="_blank" name="head_pub"><img src="./下载_book_detail_files/6536863534615-1_d.png"></a><a href="http://comm.dangdang.com/member/myfirst.php?displayid=6536863534615" title="hswindking" target="_blank" name="head_name_pub">hswindking</a></li><li><a href="http://comm.dangdang.com/member/myfirst.php?displayid=9516097271177" target="_blank" name="head_pub"><img src="./下载_book_detail_files/9516097271177-1_d.png"></a><a href="http://comm.dangdang.com/member/myfirst.php?displayid=9516097271177" title="Fancy1989" target="_blank" name="head_name_pub">Fancy1989</a></li><li><a href="http://comm.dangdang.com/member/myfirst.php?displayid=6658985315828" target="_blank" name="head_pub"><img src="./下载_book_detail_files/6658985315828-1_d.png"></a><a href="http://comm.dangdang.com/member/myfirst.php?displayid=6658985315828" title="小调皮女人" target="_blank" name="head_name_pub">小调皮女人</a></li><li><a href="http://comm.dangdang.com/member/myfirst.php?displayid=5039793180386" target="_blank" name="head_pub"><img src="./下载_book_detail_files/5039793180386-1_d.png"></a><a href="http://comm.dangdang.com/member/myfirst.php?displayid=5039793180386" title="无昵称用户" target="_blank" name="head_name_pub">无昵称用户</a></li><li class="write"><a href="http://comm.dangdang.com/review/reviewbuy.php" target="_blank" name="pingjia_pub">写购物评价>></a></li></ul>--%>
        <%--</div>--%>
        <%--<div class="score_btn comment_btn"><a href="http://f.dangdang.com/share/share.php?product_id=23177190&type=shortreview" title="推荐这本书" target="_blank" name="recommend_pub"></a><span>好书不要私藏哦，分享给别人吧！</span></div>--%>
    <%--</div>--%>
    <%--<div class="score_tab"><!--推荐、一般、不推荐tab切换-->--%>
        <%--<a href="http://union.dangdang.com/transfer_inner.php?ad_id=Item_More_comm1&ad_type=0&sys_id=5&backurl=http://comm.dangdang.com/review/reviewlist.php?pid=23177190" class="more" target="_blank">查看更多评价>></a><a id="comm_tab_1" href="javascript:;" class="on">全部(7967)<i></i></a><a id="comm_tab_2" href="javascript:;">推荐(7927)<i></i></a><a id="comm_tab_3" href="javascript:;">一般(38)<i></i></a><a id="comm_tab_4" href="javascript:;">不推荐(2)<i></i></a>    </div>--%>
    <%--<div id="comment_list">--%>
        <%--<!--用户评论区-->--%>
        <%--<div class="text clearfix">--%>
            <%--<div class="pl_photo" id="pl_dispalyid23155380" name="pl_dispalyid23155380"><p><a href="http://comm.dangdang.com/member/myfirst.php?displayid=6658985315828" target="_blank" name="head_pub"><img src="./下载_book_detail_files/6658985315828-1_e.png" class="show_user_info" id="show_user_info2|23155380" width="60" height="60"></a></p><p class="name"><a href="http://comm.dangdang.com/member/myfirst.php?displayid=6658985315828" target="_blank" title="小调皮女人" name="head_name_pub">小调皮女人</a></p><p class="icon_diamond"><span></span></p></div><!-- 评论用户头像 -->--%>
            <%--<div class="title_top"><!-- 评论标题 -->--%>
                <%--<a title="" href="http://comm.dangdang.com/member/myreviewdetail.php?review_id=42409748" target="_blank" name="title_top_pub">期待桐华5月新作</a>--%>
            <%--</div>--%>
            <%--<div class="title clearfix"><span class="level">发表于2013-04-25 13:28:18</span><span class="starlevel s5"></span><span class="time">购买于2013-04-11 14:50:03</span></div><!-- 评论时间 -->--%>
            <%--<div class="s_cont"><!-- 评论内容 -->--%>
                <%--期待桐华5月新作《长相思》2，原来没有看过桐华的作品，值得一看                    </div>--%>
            <%--<div class="operation">--%>
                <%--<a href="javascript:void(0);" id="vote_helpful42409748" name="__Useful"><span id="vote_help_gmark42409748">赞</span>(<font id="votespan42409748">0</font>)</a>--%>
                <%--<a class="icon_hf" href="http://comm.dangdang.com/member/myreviewdetail.php?reviewId=42409748#new_feedback" target="_blank" name="__Reply">回复(0)</a>--%>
                <%--<a class="icon_zt" href="http://f.dangdang.com/share/share.php?product_id=23177190&type=shortreview" target="_blank" name="Push">转推</a>--%>
            <%--</div>--%>
        <%--</div>--%>
        <%--<span id="product_reviews_ids" name="23155380,99803281,106862999,2948744,23526913" url="http://commapi.dangdang.com/api/customersapi.php?custId=23155380,99803281,106862999,2948744,23526913"></span><!--评论用户ids-->--%>
        <%--<div class="fanye"><a class="fanye_page" href="javascript:;" id="comm_page_next"><span>下一页</span></a><a href="javascript:;" id="comm_page_403"><span>403</span></a><a href="javascript:;" id="comm_page_402"><span>402</span></a><span class="dot">...</span><a href="javascript:;" id="comm_page_2"><span>2</span></a><a href="javascript:;" id="comm_page_1" class="nonce"><span>1</span></a><a class="fanye_page fanye_none" href="javascript:;" id="comm_page_pre"><span>上一页</span></a></div>--%>
        <%--<div id="user_float_div" style="position: absolute; z-index: 10; top: 1922.5px; left: 238.5px; display: none;"></div>--%>
    <%--</div>--%>
<%--</div>--%>
<%--<div id="question_all" class="mbox3 comment" name="Question_pub" style="">    <!-- 商品问答暂无 begin -->--%>
    <%--<div class="mbox3">--%>
        <%--<h3 class="tit">商品问答<i>（<a href="javascript:;">0</a>条）</i></h3>--%>
        <%--<div class="ques_none clearfix">--%>
            <%--<input type="button" class="btn_ask right" value="我要提问" pid="23177190" id="question_new" name="__Submit_qa_book">--%>
            <%--目前没有问答--%>
        <%--</div>--%>
    <%--</div>--%>
    <%--<!-- 商品问答暂无 end -->--%>
<%--</div>--%>
</div>
<!-- 商品详情 end -->

<!-- 商品评论 begin -->
<!-- 商品评论 end -->

<!-- 商品问答 begin -->
<!-- 商品问答 end -->

<!-- 商品所属分类 begin -->
<!-- 商品所属分类 end -->
</div>
<!-- 右侧主区 end -->

<!-- 左侧栏 aside begin -->
<div class="aside">
<!--相关分类-->
<!--相关分类结束-->

<!--浏览历史history-->
<div class="abox" id="history" name="History_pub" isloaded="1">
    <h3 class="nobg">您的浏览历史</h3>
    <ul class="list">
        <c:if test="${history == null}">
            <div align="center">暂无浏览历史</div>
        </c:if>
        <c:if test="${history != null}">
        <c:forEach var="his" items="${history}" varStatus="flag">
            <li>
                <a class="pic54" target="_blank" href="/book/bookDetail/${his.id}" title="" name="history_name">
                    <img src="${pageContext.request.contextPath}/product_images/${his.product.productPic}_small.jpg"
                         style="max-height: 55px; max-width: 55px;" alt="" name="history_pic">
                </a>
                <a class="name" target="_blank" href="/book/bookDetail/${his.id}" title="" name="history_name">
                    ${his.product.productName}
                </a>
                <span class="d_price">￥${his.product.dangPrice}</span>
            </li>
        </c:forEach>
            <li style="text-align: right;">
                <a href="javascript:clearHistory();">清空历史</a>
            </li>
        </c:if>
    </ul>
    <div class="spacer"></div>
</div>
<!--浏览历史结束-->
<!--浏览更多同类商品-->
<div id="related" name="Related_pub" isloaded="1"><div class="abox">
    <h3>浏览更多同类商品</h3>
    <ul class="list txt">
        <li><a href="#" target="_blank">爱情/情感</a></li>
        <li><span class="icon icon_dot"></span><a href="#" target="_blank" title="水晶女孩续">水晶女孩续</a></li>
    </ul>
    <p class="tr"><a href="#" target="_blank">更多 >></a></p>

    <ul class="list txt">
        <li><a href="#" target="_blank">大陆原创</a></li>
        <li><span class="icon icon_dot"></span><a href="#" target="_blank" title="异变释放: 杨鹏大幻想系列. 魔幻意境篇">异变释放:&nbsp;杨鹏大幻想系列.&nbsp;魔幻</a></li>
    </ul>
    <p class="tr"><a href="#" target="_blank">更多 >></a></p>
</div>
</div>
<!--浏览更多同类商品结束-->
<!--alsoview-->
<div id="alsoview" name="Alsoview_pub" isloaded="1">
    <div class="abox">
        <h3>浏览本商品的顾客还看过</h3>
        <ul class="list">
            <li>
                <a href="#" title="雲中歌〔六冊〕套書" class="pic54" target="_blank" name="alsoview_pic_pub">
                    <img src="${pageContext.request.contextPath}/images/22924154-1_x.jpg" alt="雲中歌〔六冊〕套書">
                </a>
                <a class="name" target="_blank" href="#" title="雲中歌〔六冊〕套書" name="alsoview_name_pub">雲中歌〔六冊〕套書</a>
                <span class="d_price">￥364.30</span>
            </li>
        </ul>
        <p class="tr"><a href="#" target="_blank" name="__alsoview_pub">更多 >></a></p>
    </div>
</div>
<!--alsoview over-->
<!--与这本书有关的百货 pb2bh_relate-->
<%--<div id="pb2bh_relate" name="Pb2bh_relate_pub" isloaded="1">    --%>
    <%--<div class="abox">--%>
    <%--<h3>与这本书有关的百货</h3>--%>
    <%--<ul class="list">--%>
        <%--<li>--%>
            <%--<a id="pb2bh_relateconf_pic_0" name="pb2bh_relate_pic" class="pic54" href="#" target="_blank" title="YY帆布女包个性潮包双肩休闲包学生包">--%>
                <%--<img src="${pageContext.request.contextPath}/images/1419656501-1_x.jpg" alt="YY帆布女包个性潮包双肩休闲包学生包">--%>
            <%--</a>--%>
            <%--<a title="YY帆布女包个性潮包双肩休闲包学生包" name="pb2bh_relate_name" class="name" href="#" target="_blank">YY帆布女包个性潮包双肩休闲包</a>--%>
            <%--<span class="d_price">￥59.00</span>--%>
        <%--</li>--%>
    <%--</ul>--%>
    <%--</div>--%>
<%--</div>--%>
<!--与这本书有关的百货 pb2bh_relate over-->
<!--买过此商品的还看过-->
<div id="buyafterview" name="Buyafterview_pub" isloaded="1">
    <div class="abox">
        <h3>看过本商品的顾客会买</h3>
        <ul class="list2">
            <!--此需求新推荐api不支持，暂时关闭-->
            <!--<li class="tit"><span class="orange">75%</span>顾客会买本商品，还有：</li>-->
            <li>
                <a href="#" title="最美的时光（桐华《步步惊心》《大漠谣》《回不去的年少时光》后，最浪漫、最虐心都市爱情小说。每个人成长，都有一段最美的时光，无关得失，只因纯粹去爱，无悔付出。）"
                    class="pic" target="_blank" name="buyafterview_pic_pub">
                    <img src="${pageContext.request.contextPath}/images/22820945-1_l.jpg"
                         alt="最美的时光（桐华《步步惊心》《大漠谣》《回不去的年少时光》后，最浪漫、最虐心都市爱情小说。每个人成长，都有一段最美的时光，无关得失，只因纯粹去爱，无悔付出。）">
                </a>
                <p class="data">
                    <span class="orange">29.8%</span>会买：
                    <a href="#" title="最美的时光（桐华《步步惊心》《大漠谣》《回不去的年少时光》后，最浪漫、最虐心都市爱情小说。每个人成长，都有一段最美的时光，无关得失，只因纯粹去爱，无悔付出。）" target="_blank" name="buyafterview_name_pub">最美的时光（桐华《步步惊心》《</a>
                </p>
                <span class="d_price">￥19.80</span>
            </li>
        </ul>
    </div>
</div>
<!--买过此商品的还看过结束-->
<!--您可能感兴趣的百货-->
<%--<div id="pb2bh_interest" name="Pb2bh_interest_pub" isloaded="1">    --%>
    <%--<div class="abox">--%>
        <%--<h3>您可能感兴趣的百货</h3>--%>
        <%--<ul class="list">--%>
            <%--<li>--%>
                <%--<a id="pb2bh_interestconf_pic_0" name="pb2bh_interest_pic" class="pic54" href="#" target="_blank" title="格格 100%桑蚕丝刺绣短旗袍">--%>
                    <%--<img src="${pageContext.request.contextPath}/images/1003523005-1_x.jpg" alt="格格 100%桑蚕丝刺绣短旗袍"></a>--%>
                <%--<a title="格格 100%桑蚕丝刺绣短旗袍" name="pb2bh_interest_name" class="name" href="#" target="_blank">格格&nbsp;100%桑蚕丝刺绣短旗袍</a>--%>
                <%--<span class="d_price">￥358.00</span>--%>
            <%--</li>--%>
        <%--</ul>--%>
    <%--</div>--%>
<%--</div>--%>
<!--您可能感兴趣的百货结束-->
<!--相关新品推荐-->
<div id="recommendnew" name="Recommendnew_pub" isloaded="1"></div>
<!--相关新品推荐结束-->


<!--同类热销榜-->
<!--同类热销榜结束-->

<!--商家热卖-->
<!--商家热卖结束-->

<!--摩天楼广告-->
<div id="ad_cpt_skyscraper_11561" class="banner_area" style="display: none;"></div>
<!--摩天楼广告结束-->
</div>
<!-- 左侧栏 aside begin -->
<!-- 推荐 begin -->
<div id="search_tuijian_content" name="__xingquguanzhu_pub">
    <div class="reco_wrap">
        <h3>
            <span class="right">第<i class="orange" id="reco_now_page">1</i>页（共<span id="reco_total_page">10</span>页)
                <a target="_blank" href="http://reco.dangdang.com/?ref=product_page-recobar-dp">更多 >></a>
            </span>
            根据您的浏览历史为您推荐
        </h3>
        <!--搜索推荐模块内容 开始-->
        <div class="recommend">
            <div class="over" id="reco_pic" style="overflow: hidden;">
                <ul style="position: absolute; top: 0px; left: 0px; display: block; z-index: 11; opacity: 1;">
                    <li>
                        <a target="_blank" class="pic" href="#"
                           title="隐忍力（慈悲之前无敌人，隐忍之人无对手——最适合中国人的成功哲学，佛陀、老子、司马懿、曾国藩、张居正、王阳明等成大事者都在修行的成功法则！马云、冯仑、莫言极度推崇！官场商场职场都需要！）"><img
                                width="150" height="150"
                                alt="隐忍力（慈悲之前无敌人，隐忍之人无对手——最适合中国人的成功哲学，佛陀、老子、司马懿、曾国藩、张居正、王阳明等成大事者都在修行的成功法则！马云、冯仑、莫言极度推崇！官场商场职场都需要！）"
                                src="${pageContext.request.contextPath}/images/23168922-1_l.jpg"></a>
                        <a target="_blank" class="name" title="隐忍力（慈悲之前无敌人，隐忍之人无对手——最适合中国人的成功哲学，佛陀、老子、司马懿、曾国藩、张居正、王阳明等成大事者都在修行的成功法则！马云、冯仑、莫言极度推崇！官场商场职场都需要！）" href="#">隐忍力（慈悲之前无敌人，隐忍之人无对手——</a>
                        <p target="_blank" class="price_p"><span class="d_price">￥22.60</span><i class="m_price">￥32.80</i></p>
                        <p>
                            <span class="starlevel s5"></span>
                            <a target="_blank" href="#">2941</a>条评论</p>
                    </li>
                </ul>
                <ul style="position: absolute; top: 0px; left: 0px; display: none; z-index: 9;">
                    <li>
                        <a target="_blank" class="pic"
                           href="#"
                           title="何以笙箫默（七周年精装珍藏版当当独家发售！顾漫七周年巨献：近万字番外+4张精美明信片+唯美随书海报+经典配图均由eno绘画！）">
                            <img width="150"
                                height="150"
                                alt="何以笙箫默（七周年精装珍藏版当当独家发售！顾漫七周年巨献：近万字番外+4张精美明信片+唯美随书海报+经典配图均由eno绘画！）"
                                src="${pageContext.request.contextPath}/images/21001161-1_l.jpg"></a>
                        <a target="_blank" class="name"
                           title="何以笙箫默（七周年精装珍藏版当当独家发售！顾漫七周年巨献：近万字番外+4张精美明信片+唯美随书海报+经典配图均由eno绘画！）"
                           href="#">何以笙箫默（七周年精装珍藏版当当独家发售！</a>
                        <p target="_blank" class="price_p"><span class="d_price">￥16.30</span><i
                                class="m_price">￥25.00</i></p>
                        <p><span class="starlevel s5"></span>
                            <a target="_blank"  href="#">35224</a>条评论
                        </p>
                    </li>
                </ul>
            </div>
            <!--两侧按钮开始-->
            <a class="btn_slide prev_none" id="a_reco_pic_pre"><span></span></a>
            <a title="上一页" id="reco_pic_pre" class="btn_slide prev"
               href="javascript:;" style="display: none;"><span></span>
            </a>
            <a class="btn_slide next_none" id="a_reco_pic_next"><span></span></a>
            <a title="下一页" id="reco_pic_next" class="btn_slide next"
                href="javascript:;"><span></span>
            </a>
            <!--两侧按钮结束-->
        </div>
    </div>
</div>
<!-- 推荐 end -->
<div id="ad_cpt_flip_11561" style="display: none;"></div>
</div>
<!-- 主体内容 end -->

<!-- 页尾 begin -->
<%@include file="/commons/footer.jsp"%>
<!--页尾 end -->

<!--回顶部开始-->
<script type="text/javascript">
    $(window).bind("scroll",function(){
        var a=$("#return_top");
        var c=document.body.scrollTop||document.documentElement.scrollTop;
        if(c==0){a.hide()}else{a.show()}
    });
</script>
<div id="return_top" class="fixed_bar">
    <a href="javascript:scroll(0,0);" class="backtop">回顶部</a>
</div>
<!--回顶部结束-->
<!-- 页尾 end -->
<link href="${pageContext.request.contextPath}/css/win_login20130402.css" rel="stylesheet" type="text/css">
<style type="text/css">
    .topbanner_all div {
        border: 1px solid #DCDDDD;
        height: 63px;
        margin: 10px auto 0;
        overflow: hidden;
        position: relative;
        width: 1198px;
    }
    .product_btmad div {
        border: 1px solid #DCDDDD;
        height: 88px;
        margin: 10px auto;
        overflow: hidden;
        position: relative;
        width: 1198px;
    }
</style>

<!-- 249.101 -->

<div class="toolbar" style="" id="toolbar">
    <div class="footpop">
        <div class="inner">
            <div class="arrow"></div>
            <ul id="toolbar_content">
                <li id="toolbar_dd_share">
                    <a href="#" class="flogo" title="当当分享" target="_blank"></a>
                </li>
                <li id="comm_do_message_li">
                    <a href="#" title="消息" id="comm_do_message" class="message" target="_blank">
                        <span class="mail"></span>
                        <span class="red" id="comm_do_message_count">0</span>
                    </a>
                </li>
                <li id="comm_do_review_li">
                    <a href="#" title="待评论" class="reivew" id="comm_do_review" target="_blank">待评论
                        <span class="red" id="comm_do_review_count">0</span>
                    </a>
                </li>
                <li id="comm_ad"><a href="#" target="_blank">雅安芦山地震造成102处文物保护单位受损</a>
                </li>
            </ul>
        </div>
        <div class="open">
            <div class="open_title">提醒<a href="javascript:;" class="closetoolbar" name="toolbar_dd_closed"></a></div>
            <div class="open_content">
                <div class="open_info" id="open_info"></div>
                <div class="open_rut"><em class="e1">◆</em><em class="e2">◆</em></div>
            </div>
        </div>
    </div>
</div>
</body>
</html>