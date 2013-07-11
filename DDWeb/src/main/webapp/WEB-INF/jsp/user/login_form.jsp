<%@page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>登录 - 当当网</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/commonjs/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/user/login.js"></script>
    <link href="${pageContext.request.contextPath}/css/login2011.css" rel="stylesheet" type="text/css">
</head>

<body>
<form id="Form1" action="/login" method="POST">
<div class="login_wrap">
        <div class="login_header">
            <h1><a href="/index.html"><img src="${pageContext.request.contextPath}/images/logo_20110808.png" alt="当当网" title="当当网"></a>
            </h1>
        </div>
        <div class="login_main" style="background:url(/images/dly_0423_01.jpg) no-repeat center 0;">
            <div class="login_panel">
                <!--登录框开始-->
                <div id="login_panel_right" class="right_panel">
                    <div class="login_frame_top"></div>
                    <div class="login_frame_border">
                        <div class="login_frame">
                            <div class="login_title">
                                <a href="/regist/toRegist">立即注册</a>
                                <i></i>还不是当当网用户？
                            </div>
                            <div class="login_frist clearfix" id="user_div_name">
                                <label>用户名</label>
                                        <span class="login_input">
                                            <input type="text" name="email" id="email" value=""
                                                   maxlength="40" class="tip"
                                                   onfocus="showEmailMessage();"
                                                   errordata="0" onkeyup=""
                                                   onblur="checkEmail();" tabindex="1">
                                        </span>
                                <span class="hint" id="liDivErrorMessage"></span>
                            </div>

                            <p class="clearfix" id="password_div">
                                <label>密&nbsp;&nbsp;码</label>
                                        <span class="login_input">
                                            <input type="password" id="password" name="password" maxlength="20"
                                                   onkeyup="" errordata="0"
                                                   onfocus="showPwdMessage();"
                                                   onblur="checkPassword();" tabindex="2">
                                        </span>
                                <a href="#" class="forgotpassword"
                                   tabindex="7">忘记密码</a>
                                <span class="hint" id="login_password_error"></span>
                            </p>

                            <p class="clearfix login_noneright" style="display:inline;" id="inputcode">
                                <label>验证码</label>
                                        <span class="login_input vcode">
                                            <input type="text" id="txtVerifyCode" name="txtVerifyCode"
                                                   onkeyup="" maxlength="4"
                                                   errordata="0" onfocus="showValidateMessage();"
                                                   onblur="checkValidateCode();" tabindex="3">
                                        </span>
                                        <span class="login_vcode">
                                            <script type="text/javascript">
                                                function changeImage() {
                                                    $("#imgVcode").attr("src","/captcha-image?" + Math.floor(Math.random()*100));
                                                    checkValidateCode();
                                                }
                                            </script>
                                            <a href="javascript:changeImage();" class="vcode_img" tabindex="4">
                                                <img id="imgVcode" width="130" height="30" src="/captcha-image">
                                            </a>
                                            <a href="javascript:changeImage();" tabindex="5">换张图</a>

                                        </span>
                                <span class="error" id="login_vcode_error" style="color: grey;"></span>
                            </p>

                            <div class="login_btn" id="submit_signin_div">
                                <input id="btnSignCheck" type="button" value="登 录"
                                       onmouseout="this.className=''" onmouseover="this.className='btn_login_hover'"
                                       onclick="login();" tabindex="6" class="">
                            </div>
                            <div class="co_login">
                                <p><span>使用合作网站登录当当：</span></p>

                                <p class="icon clearfix">
                                    <a href="#"
                                       title="支付宝" class="icon01"><span class="icon_alipay"></span>支付宝</a>
                                    <a href="#" title="QQ" class="icon02"><span
                                            class="icon_qq"></span>QQ</a>
                                    <a href="#" title="新浪微博" id="open_sina_sign"
                                       class="icon03"><span class="icon_sina"></span>新浪微博</a>
                                    <a href="#" title="网易" class="icon02"><span
                                            class="icon_163"></span>网易</a>
                                    <a href="#" title="人人网" class="icon04"><span
                                            class="icon_renren"></span>人人网</a>
                                    <a href="#" title="百度" class="icon05"><span
                                            class="icon_baidu"></span>百度</a>
                                    <a href="#" class="icon06" title="MSN"><span
                                            class="icon_msn"></span>MSN</a>
                                    <a href="#" class="icon07" title="飞信"><span
                                            class="icon_fetion"></span>飞信</a>
                                    <a href="#" title="139邮箱" class="icon08"><span
                                            class="icon_139"></span>139邮箱</a>
                                    <a href="#" title="江苏移动" class="icon09"><span
                                            class="icon_139"></span>江苏移动</a>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="login_frame_bottom"></div>
                </div>
                <!--登录框结束-->
            </div>
        </div>
    </div>
    <!--页尾 开始 -->
    <%@include file="/commons/footer_small.jsp" %>
    <!--页尾 end -->
</form>

</body>
</html>
