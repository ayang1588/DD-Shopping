<%@page contentType="text/html;charset=utf-8" %>
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
</div>
<div align="center">
    <div>&nbsp;<div/>
    <div><span style="font-size: 20px;font-weight:bold;font-family:Microsoft YaHei;color: red;"><h3>${errMsg}</h3></span></div>
    <div>&nbsp;</div>
    <a href="/index.html"> <img src="/images/page_error.jpg" align="center" />  </a>
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