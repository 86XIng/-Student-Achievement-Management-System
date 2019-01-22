<%@ Page Language="C#" AutoEventWireup="true" CodeFile="log.aspx.cs" Inherits="manage_admin_manager_dic_log_log" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
.layui-table{margin:10px 0}
.layui-table{width:100%;background-color:#fff;color:#666}
table {
  border-spacing: 0;
  border-collapse: collapse;
}
table {
  background-color: transparent;
}
table{border-collapse:collapse;border-spacing:0}
  * {
    color: #000 !important;
    text-shadow: none !important;
    background: transparent !important;
    -webkit-box-shadow: none !important;
            box-shadow: none !important;
  }
  * {
  -webkit-box-sizing: border-box;
     -moz-box-sizing: border-box;
          box-sizing: border-box;
}
  .layui-table tr{transition:all .3s;-webkit-transition:all .3s}
        .layui-table th{
            position:initial;
        }
    .layui-table th{text-align:left;font-weight:400}
.layui-table th{border-width:1px;border-style:solid;border-color:#e6e6e6}
    .layui-table th{position:relative;padding:9px 15px;min-height:20px;line-height:20px;font-size:14px;
    top: 189px;
    left: 0px;
}
        .layui-table th{
            position:initial;
        }
    th {
  padding: 0;
}
        th {
  text-align: left;
}
        .layui-table td{
            position:initial;
        }
    .layui-table td{border-width:1px;border-style:solid;border-color:#e6e6e6}
    .layui-table td{position:relative;padding:9px 15px;min-height:20px;line-height:20px;font-size:14px;
    top: 189px;
    left: 0px;
}
td {
  padding: 0;
}
 .layui-table td, .layui-table th{
            position:initial;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
    
        <asp:GridView ID="gvCourse" CssClass="layui-table" runat="server" AutoGenerateColumns="False" DataSourceID="odsLog" AllowPaging="True">
            <Columns>
                <asp:BoundField DataField="username" HeaderText="username" SortExpression="username" />
                <asp:BoundField DataField="opttype" HeaderText="opttype" SortExpression="opttype" />
                <asp:BoundField DataField="systime" HeaderText="systime" SortExpression="systime" />
                <asp:BoundField DataField="tablename" HeaderText="tablename" SortExpression="tablename" />
                <asp:BoundField DataField="cellname" HeaderText="cellname" SortExpression="cellname" />
                <asp:BoundField DataField="typename" HeaderText="typename" SortExpression="typename" />
                <asp:BoundField DataField="newvalue" HeaderText="newvalue" SortExpression="newvalue" />
                <asp:BoundField DataField="oldvalue" HeaderText="oldvalue" SortExpression="oldvalue" />
                <asp:BoundField DataField="ip" HeaderText="ip" SortExpression="ip" />
            </Columns>
        </asp:GridView>
    
        <asp:ObjectDataSource ID="odsLog" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="chenxueTableAdapters.修改日志表TableAdapter" InsertMethod="Insert">
            <InsertParameters>
                <asp:Parameter Name="username" Type="String" />
                <asp:Parameter Name="opttype" Type="String" />
                <asp:Parameter Name="systime" Type="String" />
                <asp:Parameter Name="tablename" Type="String" />
                <asp:Parameter Name="cellname" Type="String" />
                <asp:Parameter Name="typename" Type="String" />
                <asp:Parameter Name="newvalue" Type="String" />
                <asp:Parameter Name="oldvalue" Type="String" />
                <asp:Parameter Name="ip" Type="String" />
            </InsertParameters>
        </asp:ObjectDataSource>
    <div>
    
    </div>
    </form>
</body>
</html>
