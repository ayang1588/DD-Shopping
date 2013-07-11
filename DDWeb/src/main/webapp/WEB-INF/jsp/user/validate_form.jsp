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
                            <span style="font-size: 30px;">恭喜您注册成功！</span>
                        </td>
                    </tr>
                    <tr><td><hr/></td></tr>
                    <tr align="left">
                        <td class="t" style="text-align: center;">
                            为了用户安全，我们已给您发送了验证邮件，请您及时登录您的邮箱进行账号激活。
                        </td>
                    </tr>
                    <tr align="left">
                        <td class="t" style="text-align: center;">
                            邮件地址为：
						    <span style="color: red">
                                <span id="lblEmail">
							        ${email}
						        </span>
                            </span>
                            。
                        </td>
                    </tr>
                    <tr>
                        <td class="t" style="text-align: center;">
                            激活邮件有效时间为
						    <span style="color: red">
                                30分钟
                            </span>
                            。
                        </td>
                    </tr>
                    <tr>
                        <td class="t" style="text-align: center;">
                            如若未收到邮件或激活邮件过期，请您点击
						    <span id="reSendEnable">
                                <a onclick="reSend();">重新发送</a>
                            </span>
                            <span id="reSendDisable" style="color: gray;display: none;">
                                重新发送
                            </span>
                            <span id="showTime" style="color: red;"></span>
                            。
                        </td>
                    </tr>
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
<!--页尾end -->
</body>
</html>