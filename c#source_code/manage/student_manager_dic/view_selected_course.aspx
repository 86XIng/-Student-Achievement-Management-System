<%@ Page Language="C#" AutoEventWireup="true" CodeFile="view_selected_course.aspx.cs" Inherits="manage_student_manager_dic_view_selected_course" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>查看所选课程</title>
    <link href="../tools/layui/css/layui.css" rel="stylesheet" />
    <style>
        body {
            height: 600px;
        }
        h2 {
            color:#009688;
        }
        .layui-table td, .layui-table th{
            position:initial;
        }
    </style>
    
</head>
<body>
    <form id="form1" runat="server">
    <div class="layui-container">
        <br>
        <h2>已选课程</h2>
        <hr>
        <asp:GridView class="layui-table" ID="gvCourseInfo" runat="server"  Width="608px" AutoGenerateColumns="False" DataKeyNames="学号,授课号" DataSourceID="objInfo" >
            <Columns>
                <asp:BoundField DataField="学号" HeaderText="学号" ReadOnly="True" SortExpression="学号" Visible="False" />
                <asp:BoundField DataField="授课号" HeaderText="授课号" ReadOnly="True" SortExpression="授课号" Visible="False" />
                <asp:BoundField DataField="课程名" HeaderText="课程名" SortExpression="课程名" />
                <asp:BoundField DataField="课程学分" HeaderText="课程学分" SortExpression="课程学分" />
                <asp:BoundField DataField="课程学时" HeaderText="课程学时" SortExpression="课程学时" />
                <asp:BoundField DataField="学院" HeaderText="学院" SortExpression="学院" />
                <asp:BoundField DataField="任课教师" HeaderText="任课教师" SortExpression="任课教师" />
                <%--<asp:BoundField DataField="上课时间" HeaderText="上课时间" SortExpression="上课时间" />--%>
                <%--<asp:BoundField DataField="教室位置" HeaderText="教室位置" SortExpression="教室位置" />--%>
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="objInfo" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="selectCourseInfo" TypeName="chenxueTableAdapters.V_课程信息1TableAdapter">
            <SelectParameters>
                <asp:SessionParameter Name="学号" SessionField="username" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </div>
    </form>
    <script src="../tools/bootstrap/js/jquery-2.1.0.js"></script>
    <script>
        $(document).ready(function () {
           var i = 0;
           $('body').mouseenter(function () {
               if(i!=0)
                    window.location.href=window.location.href
           })
           $('body').mouseleave(function () {
               i = 1;
            //    window.location.href=window.location.href
           })
        })
        
    </script>
</body>
</html>
