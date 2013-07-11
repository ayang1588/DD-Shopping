/**
 * Description:
 * Author: 柳阳
 * Email: ayang1588@163.com
 * Date: 2013-4-29
 * Time: 下午2:34
 */
$(function() {
    var allPageNum = $("#allPageNum").html();
    var nowPageNum = $("#nowPageNum").html();
    var urlInfo = $("#urlInfo").val();
    if (nowPageNum == 1) {
        $("#smallpre").attr("onclick", "return false;");
        $("#smallpre").attr("class", "bof imageElement");
        $("#smallnext").attr("class", "nextpage imageElement");
    } else if (nowPageNum == allPageNum) {
        $("#smallnext").attr("onclick", "return false;");
        $("#smallnext").attr("class", "eof imageElement");
        $("#smallpre").attr("class", "prevpage imageElement");
    } else {
        $("#smallnext").attr("class", "nextpage imageElement");
        $("#smallpre").attr("class", "prevpage imageElement");
    }
    if (allPageNum == 0) {
        return ;
    }
    if (allPageNum <= 6) {
        for (var i = 1; i <= allPageNum; i++) {
            var content;
            if (i == nowPageNum) {
                content = '<a href=' + urlInfo + '/' + i + ' class="pagenum current" name="link_page"><span>' + i + '</span></a>';
            } else {
                content = '<a href=' + urlInfo + '/' + i + ' class="pagenum" name="link_page"><span>' + i + '</span></a>';
            }
            $("#pageTarget").after(content);
        }
    }
    if (nowPageNum <= 4) {
        for (var i = 1; i <= 6; i++) {
            var content;
            if (i == nowPageNum) {
                content = '<a href=' + urlInfo + '/' + i + ' class="pagenum current" name="link_page"><span>' + i + '</span></a>';
            } else {
                content = '<a href=' + urlInfo + '/' + i + ' class="pagenum" name="link_page"><span>' + i + '</span></a>';
            }
            $("#pageTarget").after(content);
        }
    } else {
        for (var i = nowPageNum - 3; i <= parseInt(nowPageNum) + 2; i++) {
            var content;
            if (i == nowPageNum) {
                content = '<a href=' + urlInfo + '/' + i + ' class="pagenum current" name="link_page"><span>' + i + '</span></a>';
            } else {
                content = '<a href=' + urlInfo + '/' + i + ' class="pagenum" name="link_page"><span>' + i + '</span></a>';
            }
            $("#pageTarget").after(content);
        }
    }
})

function gotoPage() {
    if (checkPageInput()) {
        var gotoNum = $("#jumpto").val();
        var urlInfo = $("#urlInfo").val();
        var orderType = $("#orderType").val();
        window.location.href = urlInfo + "/" + gotoNum + "/" + orderType;
    } else {
        return false;
    }
}

function checkPageInput() {
    var maxPage = parseInt($("#allPageNum").html());
    var pg = parseInt($('#jumpto').val());
    if ($.trim(pg) != '') {
        var re = /^\d+$/;
        if (!re.test(pg)) {
            alert('请输入正确的页码');
            return false;
        } else if (pg > maxPage) {
            alert('页码不得超过' + maxPage);
            return false;
        } else if (pg <= 0) {
            alert('请输入正确的页码');
            return false;
        } else {
            return true;
        }
    } else {
        return false;
    }
}




