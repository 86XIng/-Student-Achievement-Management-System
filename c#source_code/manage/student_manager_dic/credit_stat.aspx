<%@ Page Language="C#" AutoEventWireup="true" CodeFile="credit_stat.aspx.cs" Inherits="manage_student_manager_dic_credit_stat" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
.layui-table{width:100%;background-color:#fff;color:#666}.layui-table,.layui-table-view{margin:10px 0}table{border-collapse:collapse;border-spacing:0}
table {
  background-color: transparent;
}
table {
  border-spacing: 0;
  border-collapse: collapse;
}
* {
  -webkit-box-sizing: border-box;
     -moz-box-sizing: border-box;
          box-sizing: border-box;
}
  *,
  *:before,
  *:after {
    color: #000 !important;
    text-shadow: none !important;
    background: transparent !important;
    -webkit-box-shadow: none !important;
            box-shadow: none !important;
  }
  .layui-table tr{transition:all .3s;-webkit-transition:all .3s}
        .layui-table th{
            position:initial;
        }
    .layui-table td,.layui-table th{position:relative;padding:9px 15px;min-height:20px;line-height:20px;font-size:14px;
    top: 189px;
    left: 0px;
}.layui-table td,.layui-table th,.layui-table-fixed-r,.layui-table-header,.layui-table-page,.layui-table-tips-main,.layui-table-tool,.layui-table-view,.layui-table[lay-skin=line],.layui-table[lay-skin=row]{border-width:1px;border-style:solid;border-color:#e6e6e6}.layui-table th{text-align:left;font-weight:400}
th {
  text-align: left;
}
td,
th {
  padding: 0;
}
        .layui-table td{
            position:initial;
        }
        .auto-style1 {
            margin: 0;
            padding: 0;
        }
         .layui-table td, .layui-table th{
            position:initial;
        }

    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:GridView ID="gvCourse" CssClass="layui-table" runat="server" AutoGenerateColumns="False" DataSourceID="odsCredit">
            <Columns>
                <asp:BoundField DataField="学年代码" HeaderText="学年代码" SortExpression="学年代码" />
                <asp:BoundField DataField="学期代码" HeaderText="学期代码" SortExpression="学期代码" />
                <asp:BoundField DataField="选课门数" HeaderText="选课门数" SortExpression="选课门数" />
                <asp:BoundField DataField="学时总数" HeaderText="学时总数" SortExpression="学时总数" />
                <asp:BoundField DataField="学分总数" HeaderText="学分总数" SortExpression="学分总数" />
            </Columns>
        </asp:GridView>
    
    </div>
        <asp:ObjectDataSource ID="odsCredit" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="chenxueTableAdapters.fun_单个学生学分统计TableAdapter">
            <SelectParameters>
                <asp:SessionParameter Name="查询学号" SessionField="username" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </form>
</body>
</html>
