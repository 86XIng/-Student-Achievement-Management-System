<%@ Page Language="C#" AutoEventWireup="true" CodeFile="count_graduate.aspx.cs" Inherits="manage_admin_manager_dic_count_count_graduate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="../../tools/layui/css/layui.css" rel="stylesheet" />
    <title></title>
    <style type="text/css">
table{border-collapse:collapse;border-spacing:0}
.layui-table td, .layui-table th{
            position:initial;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="padding:30px">
        <h3 style="color:#009688">当年毕业生统计</h3>
        <hr />
    
    
        <asp:ObjectDataSource ID="odsGraduate" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="hjyTableAdapters.fun_毕业学生学分统计TableAdapter"></asp:ObjectDataSource>
        <asp:GridView ID="GridView1" class="layui-table" runat="server" AutoGenerateColumns="False" DataSourceID="odsGraduate">
            <Columns>
                <asp:BoundField DataField="学生学号" HeaderText="学生学号" SortExpression="学生学号" />
                <asp:BoundField DataField="学生姓名" HeaderText="学生姓名" SortExpression="学生姓名" />
                <asp:BoundField DataField="学院" HeaderText="学院" SortExpression="学院" />
                <asp:BoundField DataField="专业" HeaderText="专业" SortExpression="专业" />
                <asp:BoundField DataField="学分总数" HeaderText="学分总数" SortExpression="学分总数" />
                <asp:BoundField DataField="选课门数" HeaderText="选课门数" SortExpression="选课门数" />
                <asp:BoundField DataField="学时总数" HeaderText="学时总数" SortExpression="学时总数" />
                <asp:BoundField DataField="是否毕业" HeaderText="是否毕业" SortExpression="是否毕业" />
            </Columns>
        </asp:GridView>
        </div>
    </form>
</body>
</html>
