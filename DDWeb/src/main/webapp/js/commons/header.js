/**
 * Description:
 * Author: 柳阳
 * Email: ayang1588@163.com
 * Date: 2013-4-28
 * Time: 下午10:41
 */
// 头部加载，判断cookie用户信息
$(function(){
    var loginStatus = $.cookie("loginStatus");
    if (loginStatus != null && loginStatus == 1) {
        $("[name = yhm]").html($.cookie("loginEmail"));
        $("#notLogin").css("display", "none");
        $("#hasLogin").css("display", "inline");
    } else {
        $("#notLogin").css("display", "inline");
        $("#hasLogin").css("display", "none");
    }
});

function logout() {
    $.cookie("loginStatus", 0);
    $.cookie("lastOpTime", new Date().getMilliseconds());
    location.reload();
}