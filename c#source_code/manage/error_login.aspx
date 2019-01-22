<%@ Page Language="C#" AutoEventWireup="true" CodeFile="error_login.aspx.cs" Inherits="manage_error" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script>
        function countDown() {
            var time = document.getElementById("time");

            if (time.innerHTML == 0) {
                window.location.href = "../login/membership_login.aspx";
            } else {
                time.innerHTML = time.innerHTML - 1;
            }
        }
        window.setInterval("countDown()", 1000);
		</script>

</head>
<body>
    <form id="form1" runat="server">
<%-- <meta http-equiv="refresh" content="5; url='../login/membership_login.aspx'">--%>
    <div style="position:absolute;top:210px; left:36%;">
        <img src="../img/erro4.png" width="60" />
        <h2 style="color:#707070;position:relative; top: -62px; left: 70px;">您没有权限访问此页面，<span id="time">3</span>秒后重新登录！</h2>
    </div>
    </form>
</body>
</html>
