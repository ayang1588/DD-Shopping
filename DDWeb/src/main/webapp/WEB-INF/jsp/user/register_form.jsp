<%@page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>新用户注册 - 当当网</title>
    <link type="text/css" href="${pageContext.request.contextPath}/css/register_121015.css" rel="stylesheet">
</head>
<body>
<%@include file="/commons/header_small.jsp"%>
<script src="${pageContext.request.contextPath}/js/commonjs/formValidator-4.1.3.js" type="text/javascript" charset="UTF-8"></script>
<script src="${pageContext.request.contextPath}/js/commonjs/formValidatorRegex.js" type="text/javascript" charset="UTF-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/user/regist.js"></script>
<form id="register_form" method="post" action="/regist/doRegist">
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
                    <tr>
                        <td class="t">
                            用户邮箱：
                        </td>
                        <td>
                            <input type="text" id="email" name="email" class="text" maxlength="40" value="" style="border-color: rgb(127, 157, 185);">
                            <span id="emailTip" style="width:300px"></span>
                            <div>&nbsp;</div>
                            <div id="emailFixTip" style="width:600px"></div>
                        </td>
                    </tr>
                    <tr>
                        <td class="t">
                            用户昵称：
                        </td>
                        <td>
                            <input type="text" id="nickname" name="nickname" class="text"  maxlength="40" value="" style="border-color: rgb(127, 157, 185);">
                                <span id="nicknameTip" style="width:300px"></span>
                                <div>&nbsp;</div>
                                <div id="nicknameFixTip" style="width:600px"></div>
                            </span>
                            </span>
                        </td>
                    </tr>
                    <tr>
                        <td class="t">
                            登录密码：
                        </td>
                        <td>
                            <input type="password" id="password" name="password" class="text"  maxlength="20" value=""
                                   onpaste="return false;" style="border-color: rgb(127, 157, 185);">
                            <span id="passwordTip" style="width:300px"></span>
                            <div>&nbsp;</div>
                            <div id="passwordFixTip" style="width:600px"></div>
                        </td>
                    </tr>
                    <tr>
                        <td class="t">
                            确认密码：
                        </td>
                        <td>
                            <input type="password" id="txtPassword2" name="txtPassword2" class="text"  maxlength="20" value=""
                                   onpaste="return false;" style="border-color: rgb(127, 157, 185);">
                            <span id="txtPassword2Tip" style="width:300px"></span>
                            <div>&nbsp;</div>
                            <div id="txtPassword2FixTip" style="width:600px"></div>
                        </td>
                    </tr>
                    <tr>
                        <td class="t">
                            图形验证码：
                        </td>
                        <td>
                            <input type="text" id="txtVerifyCode" name="txtVerifyCode" maxlength="4" class="text" maxlength="4"
                                   value="" style="border-color: rgb(127, 157, 185);">
                            <script type="text/javascript">
                                function changeImage() {
                                    $("#imgVcode").attr("src","/captcha-image?" + Math.floor(Math.random()*100));
//                                    checkValidateCode();
                                }
                            </script>
                            <a href="javascript:changeImage();" class="vcode_img" tabindex="4">
                                <img id="imgVcode" width="130" height="30" src="/captcha-image">
                            </a>
                            <a href="javascript:changeImage();" tabindex="6">换张图</a>
                            <span id="txtVerifyCodeTip" style="width:300px"></span>
                            <div>&nbsp;</div>
                            <div id="txtVerifyCodeFixTip" style="width:600px"></div>
                        </td>
                    </tr>
                    <tr>
                        <td class="t">
                            &nbsp;
                        </td>
                        <td>
                            <input type="submit" id="btn_register" class="btn_login" name="btn_register" title="注册"
                                   value="" tabindex="7">
                        </td>
                    </tr>
                    <tr>
                        <td class="t">
                            &nbsp;
                        </td>
                        <td class="clause">
                                    <span class="float_l">
                                        <input type="checkbox" id="chb_agreement" name="chb_agreement" checked="checked"
                                               onmouseover="this.style.cursor='pointer';this.style.cursor='hand';"
                                               onclick="" tabindex="8">我已阅读并同意<a href="#" target="_blank" tabindex="9">《当当网交易条款》</a>和<a
                                            href="#" target="_blank" tabindex="10">《当当网社区条款》</a></span>
                            <span id="spn_agreement_wrong" class="cue" style="display: none"></span><span
                                id="spn_err_msg" class="cue" style="display: none"></span>
                        </td>
                    </tr>
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