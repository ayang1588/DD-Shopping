// 头部加载，判断cookie用户信息
$(function(){
    var loginStatus = $.cookie("loginStatus");
    if (loginStatus != null && loginStatus == 1) {
        $("[name = useremail]").html($.cookie("loginEmail"));
        $("#nickname").css("display", "none");
        $("#nicknamehaslog").css("display", "inline");
    } else {
        $("#nickname").css("display", "inline");
        $("#nicknamehaslog").css("display", "none");
    }
});

function logout() {
    $.cookie("loginStatus", 0);
    $.cookie("lastOpTime", new Date().getMilliseconds());
    location.reload();
}