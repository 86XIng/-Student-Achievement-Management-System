<%@ Page Language="C#" AutoEventWireup="true" CodeFile="period_stat.aspx.cs" Inherits="manage_teacher_manager_dic_period_stat" %>

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
        .layui-table td, .layui-table th{
            position:initial;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="padding:30px">
    
        <asp:Label ID="lblYear" runat="server" Text="选择学年1："></asp:Label>
        <asp:DropDownList ID="ddlYear" runat="server" AppendDataBoundItems="True" DataSourceID="odsYear" DataTextField="学年" DataValueField="学年代码">
        </asp:DropDownList>
        <asp:Label ID="lblTerm" runat="server" Text="选择学年2："></asp:Label>
        <asp:DropDownList ID="ddlYear0" runat="server" AppendDataBoundItems="True" DataSourceID="odsYear" DataTextField="学年" DataValueField="学年代码">
        </asp:DropDownList>
        <asp:Button ID="btnSelect" runat="server" class="layui-btn layui-btn-xs" OnClick="btnSelect_Click" Text="确定" />
    
        <asp:Label ID="lblError" runat="server"></asp:Label>
    
        <asp:GridView ID="gvCourse" CssClass="layui-table" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="学年" HeaderText="学年" SortExpression="学年" />
                <asp:BoundField DataField="授课门数" HeaderText="授课门数" SortExpression="授课门数" />
                <asp:BoundField DataField="学时总数" HeaderText="学时总数" SortExpression="学时总数" />
            </Columns>
        </asp:GridView>
    
    </div>
        <asp:ObjectDataSource ID="odsStat" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="chenxueTableAdapters.fun_单个教师工作量统计TableAdapter">
            <SelectParameters>
                <asp:SessionParameter Name="教工号" SessionField="username" Type="String" />
                <asp:ControlParameter ControlID="ddlYear" Name="学年代码1" PropertyName="SelectedValue" Type="String" DefaultValue="value" />
                <asp:ControlParameter ControlID="ddlYear0" Name="学年代码2" PropertyName="SelectedValue" Type="String" DefaultValue="value" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsYear" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetYear" TypeName="hjyTableAdapters.学年代码表TableAdapter" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_学年代码" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="学年" Type="String" />
                <asp:Parameter Name="学年代码" Type="String" />
                <asp:Parameter Name="排序" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="学年" Type="String" />
                <asp:Parameter Name="排序" Type="Int32" />
                <asp:Parameter Name="Original_学年代码" Type="String" />
            </UpdateParameters>
        </asp:ObjectDataSource>
    </form>
</body>
</html>
