/**
 * Description:
 * Author: 柳阳
 * Email: ayang1588@163.com
 * Date: 2013-5-9
 * Time: 下午1:59
 */
//清楚浏览历史
function clearHistory() {
    $.cookie('proHistory',null,{path:'/'});
    window.location.reload();
}
