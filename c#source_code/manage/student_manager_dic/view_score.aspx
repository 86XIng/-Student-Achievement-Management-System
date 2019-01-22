<%@ Page Language="C#" AutoEventWireup="true" CodeFile="view_score.aspx.cs" Inherits="manage_student_manager_dic_view_score" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>   <link href="../tools/layui/css/layui.css" rel="stylesheet" />
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
    <div  class="layui-container">
     <br>
        <h2>查看成绩</h2>
        <hr>
        <asp:GridView class="layui-table" ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="objScore">
            <Columns>
                <asp:BoundField DataField="学号" HeaderText="学号" SortExpression="学号" />
                <asp:BoundField DataField="课程名" HeaderText="课程名" SortExpression="课程名" />
                <asp:BoundField DataField="课程学分" HeaderText="课程学分" SortExpression="课程学分" />
                <asp:BoundField DataField="成绩" HeaderText="成绩" SortExpression="成绩" />
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="objScore" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="selectScore" TypeName="chenxueTableAdapters.V_成绩查询TableAdapter">
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
                if (i != 0)
                    window.location.href = window.location.href
            })
            $('body').mouseleave(function () {
                i = 1;
                //    window.location.href=window.location.href
            })
        })

    </script>
</body>
</html>
