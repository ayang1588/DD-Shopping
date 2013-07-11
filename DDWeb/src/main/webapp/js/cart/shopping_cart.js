/**
 * Description: 购物车
 * Author: 柳阳
 * Email: ayang1588@163.com
 * Date: 2013-5-3
 * Time: 下午11:12
 */
function collection(productId) {
    $.ajax({
        type: "post",
        cache: false,
        url: "/cart/add",
        dataType: "json",
        data: {
            productId: productId
        },
        async: true,
        error: function (xhr) {
            window.location = "/toLogin"
            return false;
        },
        success: function (data) {
            // 加入收藏夹失败
            if (data.status == 0) {
                $("#coll_info").html("对不起，加入收藏夹失败，请您重新尝试");
            }
            // 显示消息提示窗口
            var offset = $("#lcase" + productId).offset();
            $(".myddorder_popup_wrap").css("left",(offset.left - 135 * 2) + "px");
            $(".myddorder_popup_wrap").css("top",(offset.top - 50 * 2) + "px");
            $(".myddorder_popup_wrap").show();
        }
    });
}

function closeCollectionSuccess() {
    $(".myddorder_popup_wrap").css("display", "none");
}

function buy(productId) {
    var num = $("#buy_num").val();
    // 输入不是数字
    if (isNaN(num)) {
        $("#buy_num_text").css("display", "inline");
        return false;
    }
    if (parseInt(num) < 1) {
        $("#buy_num_text").css("display", "inline");
        return false;
    }
    window.location.href = "/cart/toCart/" + productId + "/" + num;
}

function numberAdd(productId) {
    var target = "#number_" + productId;
    $(target).val(parseInt($(target).val()) + 1);
    var account = parseFloat($("#account").html()) + parseFloat($("#dangprice_" + productId).html().split("￥")[1]);
    $("#account").html(account.toFixed(2));
}

function numberCut(productId) {
    var target = "#number_" + productId;
    var now = $(target).val();
    if (isNaN(now)) {
        alert("输入错误！请输入数字！");
        return false;
    }
    if (parseInt(now) <= 1) {
        alert("输入错误！请输入数字！");
        return false;
    }
    $(target).val(parseInt(parseInt(now) - 1));
    var account = parseFloat($("#account").html()) - parseFloat($("#dangprice_" + productId).html().split("￥")[1]);
    $("#account").html(account.toFixed(2));
}

function delFromCollection(productId) {
    if (confirm("确定要将该商品从收藏夹中删除吗？")) {
         window.location.href = "/cart/del/" + productId + "/1";
    }
}

function delFromCart(productId) {
    if (confirm("确定要将该商品从购物车中删除吗？")) {
        window.location.href = "/cart/del/" + productId + "/0";
    }
}


function emptyCartBox() {
    if (confirm("确定要清除购物车吗？")) {
        window.location.href = "/cart/empty";
    }
}