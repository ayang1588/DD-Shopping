<%--
    Author: 柳阳
    Email: ayang1588@163.com
    Date: 2013-4-23
    Time: 下午10:53
--%>
<%@ page language="java" pageEncoding="UTF-8" %>

<style type="text/css">
    .public_footer_box {
        width: 100%;
        margin: 0 auto;
        font: 12px "\5b8b\4f53", Arial, Helvetica, sans-serif;
        clear: both;
    }

    .public_footer {
        margin: 0 auto;
        width: 950px;
        padding: 32px 5px 0;
        font: 12px;
        color: #666;
        overflow: hidden;
    }

    .public_footer a {
        color: #666 !important;
        text-decoration: none;
        font-size: 12px;
    }

    .public_footer a:hover {
        color: #f60 !important;
        text-decoration: underline;
    }

    .public_footer .sep {
        display: inline-block;
        padding: 0 18px;
    }

    .public_footer .footer_copyright {
        padding-left: 168px;
        margin: 0 auto;
        width: 792px;
    }

    .public_footer .footer_copyright span {
        float: left;
        display: inline
    }

    .public_footer .footer_copyright span {
        padding-top: 10px;
    }

    .public_footer .footer_copyright a {
        padding-right: 4px;
    }

    .public_footer .footer_icon {
        margin: 10px 0 0 335px;
        width: 300px;
        height: 57px;
    }

    .public_footer .validator, .public_footer .knet {
        float: left;
        display: inline;
        padding: 0 5px;
        width: 135px;
        height: 47px;
    }

</style>

<div class="public_footer_box">
    <div class="public_footer">
        <div class="footer_copyright"><span>Copyright (C) 当当网 2004-2012, All Rights Reserved</span><span
                class="sep">|</span><span><a href="#" target="_blank">京ICP证041189号</a></span><span><a href="#"
                                                                                                      target="_blank">音像制品经营许可证
            京音网8号</a></span>

            <div class="clear"></div>
        </div>
        <div class="footer_icon">
            <div class="validator"><a href="#" target="_blank" class="footer_img"><img
                    src="${pageContext.request.contextPath}/images/validate.gif"></a></div>
            <div class="knet">

                <!-- 可信网站LOGO安装开始 -->


                <a href="#" tabindex="-1" id="urlknet" target="_blank">
                    <img width="128" height="47" alt="可信网站" name="CNNIC_seal" border="true"
                         src="${pageContext.request.contextPath}/images/knetSealLogo.png" oncontextmenu="return false;"
                         onclick="">
                </a>

                <!-- 可信网站LOGO安装结束 -->
            </div>
            <div class="clear"></div>
        </div>

    </div>
</div>
