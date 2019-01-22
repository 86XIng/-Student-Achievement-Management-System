<%@ Page Language="C#" AutoEventWireup="true" CodeFile="add_course.aspx.cs" Inherits="manage_student_manager_dic_add_course" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link href="../tools/layui/css/layui.css" rel="stylesheet" />
<title>选课</title>
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
        <br />        
        <h2>可选课程</h2>
        <hr>
        <asp:GridView ID="gvCourse" class="layui-table" runat="server" AutoGenerateColumns="False" DataKeyNames="授课号" DataSourceID="objCourse" AllowPaging="True" >
            <Columns>
                <asp:BoundField DataField="授课号" HeaderText="授课号" SortExpression="授课号" Visible="False" ReadOnly="True" />
                <asp:BoundField DataField="课程名" HeaderText="课程名" SortExpression="课程名" />
                <asp:BoundField DataField="课程学分" HeaderText="课程学分" SortExpression="课程学分" />
                <asp:BoundField DataField="课程学时" HeaderText="课程学时" SortExpression="课程学时" />
                <asp:BoundField DataField="课程类型" HeaderText="课程类型" SortExpression="课程类型" />
                <asp:BoundField DataField="学院" HeaderText="学院" SortExpression="学院" />
                <asp:BoundField DataField="教师姓名" HeaderText="教师姓名" SortExpression="教师姓名" />
                <%--<asp:BoundField DataField="上课时间" HeaderText="上课时间" SortExpression="上课时间" />--%>
                <%--<asp:BoundField DataField="教室位置" HeaderText="教室位置" SortExpression="教室位置" />--%>
                <asp:TemplateField HeaderText="选课">
                    <ItemTemplate>
                        <%--<asp:Button ID="btnCourse" runat="server" Text="选课" OnCommand="btnCourse_Command" CommandArgument="<%# Container.VisibleIndex %>" />--%>
                        <asp:Button class="layui-btn layui-btn-xs" ID="btnCourse" runat="server" Text="选课" OnClick="btnCourse_Click"  />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
            <br>
           <h2>已选课程信息</h2>    
           <hr> 
        <asp:GridView ID="gvCourseInfo" class="layui-table" runat="server"  AutoGenerateColumns="False" DataSourceID="objCourseInfo" DataKeyNames="学号,授课号" >
             <Columns>
                <asp:BoundField DataField="学号" HeaderText="学号" ReadOnly="True" SortExpression="学号" />
                <asp:BoundField DataField="授课号" HeaderText="授课号" ReadOnly="True" SortExpression="授课号" />
                <asp:BoundField DataField="课程名" HeaderText="课程名" SortExpression="课程名" />
                <asp:BoundField DataField="课程学分" HeaderText="课程学分" SortExpression="课程学分" />
                <asp:BoundField DataField="课程学时" HeaderText="课程学时" SortExpression="课程学时" />
                <asp:BoundField DataField="学院" HeaderText="学院" SortExpression="学院" />
                <asp:BoundField DataField="任课教师" HeaderText="任课教师" SortExpression="任课教师" />
                 <asp:BoundField DataField="时间" HeaderText="时间" SortExpression="时间" Visible="False" />
            </Columns>
        </asp:GridView>
                
        <asp:ObjectDataSource ID="objCourse" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="selectC" TypeName="chenxueTableAdapters.V_学生选课信息表2TableAdapter">
            <SelectParameters>
                <asp:SessionParameter Name="学号" SessionField="username" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="objCourseInfo" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="selectCourseInfo" TypeName="chenxueTableAdapters.V_课程信息11TableAdapter">
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
