/**
 * Description: 登陆js
 * Author: 柳阳
 * Email: ayang1588@163.com
 * Date: 2013-4-24
 * Time: 下午2:53
 */
var isEmailOk = false;
var isPwdOk = false;
var isValidate = false;
//监听回车事件

$(function(){
    $("#login_panel_right").keydown(function(event){
        if (event.which == 13) {
            login();
        }
    });
});

function login() {
    // 验证正确，提交
    if (isEmailOk && isPwdOk && isValidate) {
        $("#Form1").submit();
    }
    // 验证错误
    else {
        return false;
    }
}

function checkEmail() {
    var email = $("#email").val();
    if (!email) {
        $("#liDivErrorMessage").css("color", "red");
        $("#liDivErrorMessage").html("邮箱地址不可为空，请输入！");
        isEmailOk = false;
        return;
    }
    $.ajax({
        type: "post",
        cache: false,
        url: "/checkEmail",
        dataType: "json",
        data: {
            email: email
        },
        async: true,
        error: function (xhr) {
            alert("Oopsie: " + xhr.statusText);
            return false;
        },
        success: function (data) {
            // 邮箱不存在
            if (data.status == 1) {
                $("#liDivErrorMessage").css("color", "red");
                $("#liDivErrorMessage").html("邮箱地址不存在，请检查！");
                isEmailOk = false;
            }
            // 邮箱存在
            else {
                $("#liDivErrorMessage").css("color", "grey");
                $("#liDivErrorMessage").html("邮箱地址正确！");
                isEmailOk = true;
            }
        }
    });
}

function checkPassword() {
    var password = $("#password").val();
    var email = $("#email").val();
    if (!password) {
        $("#login_password_error").css("color", "red");
        $("#login_password_error").html("密码不可为空，请输入！");
        isPwdOk = false;
        return;
    }
    $.ajax({
        type: "post",
        cache: false,
        url: "/checkPassword",
        dataType: "json",
        data: {
            password: password,
            email: email
        },
        async: true,
        error: function (xhr) {
            alert("Oopsie: " + xhr.statusText);
            return false;
        },
        success: function (data) {
            // 密码不正确
            if (data.status == 0) {
                $("#login_password_error").css("color", "red");
                $("#login_password_error").html("密码不正确，请重新输入！");
                isPwdOk = false;
            }
            // 密码正确
            else {
                $("#login_password_error").css("color", "grey");
                $("#login_password_error").html("密码正确，请登录！");
                isPwdOk = true;
            }
        }
    });
}

function checkValidateCode() {
    var validateCode = $("#txtVerifyCode").val();
    if (!validateCode) {
        $("#login_vcode_error").css("color", "red");
        $("#login_vcode_error").html("验证码有误，请重新输入！");
        isValidate = false;
        return;
    }
    $.ajax({
        type: "post",
        cache: false,
        url: "/checkValidateCode",
        dataType: "json",
        async: true,
        error: function (xhr) {
            alert("Oopsie: " + xhr.statusText);
            return false;
        },
        data: {
            txtVerifyCode: validateCode
        },
        success: function (data) {
            // 验证码不正确
            if (data.status == 0) {
                $("#login_vcode_error").css("color", "red");
                $("#login_vcode_error").html("验证码不正确，请重新输入！");
                isValidate = false;
        }
            // 验证码正确
            else {
                $("#login_vcode_error").css("color", "grey");
                $("#login_vcode_error").html("验证码正确，请登录！");
                isValidate = true;
            }
        }
    });
}

function showEmailMessage() {
    $("#liDivErrorMessage").html("请输入您的邮箱地址");
}

function showPwdMessage() {
    $("#login_password_error").html("请输入您的密码");
}

function showValidateMessage() {
    $("#login_vcode_error").html("请输入图片中的验证码");
}
