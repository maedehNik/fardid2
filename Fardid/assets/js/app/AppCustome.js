function createCookie(cookieName, cookieValue, daysToExpire) {
    var date = new Date();
    date.setTime(date.getTime() + (daysToExpire * 24 * 60 * 60 * 1000));
    document.cookie = cookieName + "=" + cookieValue + "; expires=" + date.toGMTString();
}
function accessCookie(cookieName) {
    var name = cookieName + "=";
    var allCookieArray = document.cookie.split(';');
    for (var i = 0; i < allCookieArray.length; i++) {
        var temp = allCookieArray[i].trim();
        if (temp.indexOf(name) == 0)
            return temp.substring(name.length, temp.length);
    }
    return "";
}

function AddCookie() {
    var Cookie = accessCookie("Fardid_Cookie");

    $.ajax({
        url: 'Admin_Ajax/SetSeenCookie.aspx?Cookie=' + Cookie ,
        type: "post",
        contentType: "application/json; charset=utf-8",
        success: function (response) {
            if (response != "Seen") {
                createCookie("Fardid_Cookie", response, 1);
            }
        },
        error: function (jqXHR, textStatus, errorThrown) {
            alert("مشکل در برقراری ارتباط با سرور");
        }
    });



}