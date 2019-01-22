<%@ Page Language="C#" AutoEventWireup="true" CodeFile="teacherLogin.aspx.cs" Inherits="login_teacherLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="shortcut icon" href="../favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="../static/css/font.css"/>
    <link rel="stylesheet" href="../static/css/weadmin.css"/>
    <link href="./verify/css/verify.css" rel="stylesheet" />
    <script src="../lib/layui/layui.js" charset="utf-8"></script>
    <script src="./js/jquery-3.3.1.js"></script>
</head>
<body class="login-bg">
    <form id="form1" runat="server">
    <div class="login">
        <div class="message">教师登陆</div>
        <div id="darkbannerwrap"></div>
            <input id="verify" name="verify" runat="server" type="hidden" value="0" />
            <input name="username" id="username" placeholder="用户名"  type="text" lay-verify="required" class="layui-input" />
            <hr class="hr15" />
            <input name="password" id="password" lay-verify="required" placeholder="密码"  type="password" class="layui-input"/>
            <hr class="hr15" />
            <div id="mpanel4" style="margin-top:10px;">
            </div>
            <hr class="hr15" />
         <%--<input class="loginin" value="登录" lay-submit lay-filter="login" style="width:100%;" type="submit" />--%>
            <asp:Button ID="loginBtn"  runat="server" class="loginin" lay-submit lay-filter="login" Text="登录" OnClick="Button1_Click" />
            <hr class="hr20" />
            <div><a href="login.aspx">返回</a>&nbsp;&nbsp; <a href="forget_pass.aspx">忘记密码</a> </div>
         
    </div>
    <script src="./verify/js/verify.js"></script>
    <script type="text/javascript">

        layui.extend({
            admin: '{/}./static/js/admin'
        });
        layui.use(['jquery', 'form', 'admin'], function () {
            var $ = layui.jquery;
            var form = layui.form
              , admin = layui.admin;

        });
        $('#mpanel4').slideVerify({
		type : 2,		//类型
		vOffset : 5,	//误差量，根据需求自行调整
		vSpace : 5,	//间隔
		imgName: ['4.jpg', '5.jpg', '6.jpg'],
		imgSize : {
			width: '336px',
			height: '180px',
		},
		blockSize : {
			width: '40px',
			height: '40px',
		},
		barSize : {
			width : '336px',
			height : '35px',
		},
		ready : function() {
		},
		success: function () {
		    $('#verify').val('1');
			//......后续操作
		},
		error : function() {
//		        	alert('验证失败！');
		}
		
	});
    </script>  
    <!-- 底部结束 -->
    </form>
</body>
</html>
