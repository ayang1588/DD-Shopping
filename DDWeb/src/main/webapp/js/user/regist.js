/**
 * Description: 注册
 * Author: 柳阳
 * Email: ayang1588@163.com
 * Date: 13-4-18
 * Time: 下午3:32
 */

$(function(){
    $.formValidator.initConfig({
        theme:"126",
        submitOnce:true,
        formID:"register_form",
        onError:function(msg){alert(msg);},
        submitAfterAjaxPrompt : '有数据正在异步验证，请稍等...'
    });

    $("#email").formValidator({
        onShowFixText:"6~18个字符，包括字母、数字、下划线，以字母开头，字母或数字结尾。",
        onCorrect:"邮箱格式正确"}).inputValidator({
            min:6,
            max:40,
            onError:"你输入的邮箱长度非法,请确认！"}).regexValidator({
            regExp:"^([\\w-.]+)@(([[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.)|(([\\w-]+.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(]?)$",
            onError:"你输入的邮箱格式不正确！"}).ajaxValidator({
            dataType : "json",
            async : true,
            url : "/checkEmail",
            success : function(data){
                if( data.status == "1" ) {
                    return true;
                } else {
                    return "该用户名已存在，请更换用户名！";
                }
            },
//            error: function(jqXHR, textStatus, errorThrown){alert("服务器没有返回数据，可能服务器忙，请重试"+errorThrown);},
            onError : "该用户名已存在，请更换用户名！",
            onWait : "正在进行合法性校验，请稍候..."
        });

    $("#nickname").formValidator({
        onShowFixText:"由英文字母、中文、数字组成，长度为4－20个字符。",
        onCorrect:"昵称格式正确"}).inputValidator({
            min:4,
            max:20,
            onError:"你输入的昵称长度非法,请确认！"
        });

    $("#password").formValidator({
        onShowFixText:"密码可以由大小写英文字母、数字组成，长度6－20位。。",
        onCorrect:"密码格式正确"}).inputValidator({
            min:6,
            max:20,
            onError:"你输入的密码长度非法,请确认！"
        });

    $("#txtPassword2").formValidator({
        onShowFixText:"请再次输入密码",
        onCorrect:"密码一致"}).inputValidator({
            min:6,
            max:20,
//            empty:{
//                leftEmpty:false,rightEmpty:false,emptyError:"重复密码两边不能有空符号"},
            onError:"你输入的密码长度非法,请确认！"}).compareValidator({
            desID:"password",
            operateor:"=",
            onError:"两次密码不一致,请确认！"});

    //检测验证码
    $("#txtVerifyCode").formValidator({
        onShow:"请输入图片中的验证码。",
        onCorrect:"验证码输入正确"}).inputValidator({
            min:4,
            max:4,
            onError:"你输入的验证码错误，请确认！"
        }).ajaxValidator({
            type:"POST",
            url:"/checkValidateCode",
            dataType:"json",
            timeout:6000,
            success:function(data){
                if( data.status == 1 ) {
                    return true;
                } else {
                    return "验证码填写错误,请核对...";
                }
            },
            onError:"验证码填写错误,请核对...",
            onWait:"正在等待服务器返回数据...",
            ajaxExistsError:"前面的校验尚未完成，请稍候..."
        });
});

/**
 * 重新发送
 */
function reSend() {
    $("#reSendEnable").css("display", "none");
    $("#reSendDisable").css("display", "inline");
    var email = $("#lblEmail").html().trim();
    $.ajax({
        type: "post",
        cache: false,
        url: "/regist/reSend",
        dataType: "json",
        data: {
            email: email
        },
        async: false,
        error: function (xhr) {
            alert("Oopsie: " + xhr.statusText);
            return false;
        },
        success: function (data) {
            if(data.status == 0) {
                alert(data.desc);
            }
        }
    });
    showTime();
}

/**
 * 再次重新发送倒计时
 */
function showTime() {
    var html = "秒后可再次发送";
    var i = 10;
    setInterval(function () {
        if (i == 0) {
            $("#reSendEnable").css("display", "inline");
            $("#reSendDisable").css("display", "none");
            $("#showTime").css("display", "none");
            return;
        }
        $('#showTime').html(i-- + html);
    }, 1000);
}