<%@page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>新用户注册 - 当当网</title>
    <link type="text/css" href="${pageContext.request.contextPath}/css/register_121015.css" rel="stylesheet">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/commonjs/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/user/regist.js"></script>
</head>
<body>
<%@include file="/commons/header_small.jsp"%>
<form id="register_form" method="post" action="">
    <div id="bd">
        <div class="register_box">
            <div class="head">
                <a href="#" name="help" class="more" tabindex="11">注册帮助</a>

                <h3>
                    注册新用户</h3>
            </div>
            <div class="body">
                <table cellpadding="0" cellspacing="0" border="0" width="100%">
                    <tbody>
                    <tr align="left">
                        <td class="t" style="text-align: center;">
                            <img src="/images/ok.png">
                            <span style="font-size: 30px;">恭喜您激活成功！</span>
                        </td>
                    </tr>
                    <tr><td><hr/></td></tr>
                    <tr><td></td></tr>
                    <tr align="left">
                        <td class="t" style="text-align: center;">
						    <span style="font-weight: bold; font-size: 15px;">
                                恭喜您已完成邮箱验证。
                            </span>
                            <span>可随时进行商品购买、评论投票等其他功能。</span>
                        </td>
                    </tr>
                    <tr align="left">
                        <td class="t" style="text-align: center;">
						    <span style="font-weight: bold; font-size: 15px;">
                                <a href="/toLogin">现在登录</a>
                            </span>
                            <span>&nbsp;&nbsp;&nbsp;</span>
                            <span style="font-weight: bold; font-size: 15px;">
                                <a href="/index.html">返回首页</a>
                            </span>
                        </td>
                    </tr>
                    <tr><td></td></tr>
                    <tr><td></td></tr>
                    <tr><td></td></tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <div id="div_mask_cover" class="mask" style="display: none; height: 728px;">
    </div>
</form>

<!--页尾 开始 -->

<%@include file="/commons/footer_small.jsp"%>

<!-- 页尾 end -->
</body>
</html>