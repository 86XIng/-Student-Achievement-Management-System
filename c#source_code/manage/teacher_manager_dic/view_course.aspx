<%@ Page Language="C#" AutoEventWireup="true" CodeFile="view_course.aspx.cs" Inherits="manage_teacher_manager_dic_view_course" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="../tools/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="../tools/layui/css/layui.css" rel="stylesheet" />
    <title></title>
    <style>
        .layui-table td, .layui-table th{
            position:initial;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <br />
        <asp:Label ID="lblYear" runat="server" Text="选择学年："></asp:Label>
        <asp:DropDownList ID="ddlYear" runat="server" AppendDataBoundItems="True" DataSourceID="odsYear" DataTextField="学年" DataValueField="学年代码">
        </asp:DropDownList>
        <asp:Label ID="lblTerm" runat="server" Text="选择学期："></asp:Label>
        <asp:DropDownList ID="ddlTerm" runat="server" AppendDataBoundItems="True" DataSourceID="odsTerm" DataTextField="学期" DataValueField="学期代码">
        </asp:DropDownList>
        <asp:Button ID="btnSelect" runat="server" class="layui-btn layui-btn-xs" OnClick="btnSelect_Click" Text="确定" />
    
        <asp:GridView ID="gvCourse" CssClass="layui-table" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="课程号" HeaderText="课程号" SortExpression="课程号" />
                <asp:BoundField DataField="课程名" HeaderText="课程名" SortExpression="课程名" />
                <asp:BoundField DataField="课程学分" HeaderText="课程学分" SortExpression="课程学分" />
                <asp:BoundField DataField="课程学时" HeaderText="课程学时" SortExpression="课程学时" />
                <asp:BoundField DataField="学年代码" HeaderText="学年" SortExpression="学年代码" />
                <asp:BoundField DataField="学期代码" HeaderText="学期" SortExpression="学期代码" />
            </Columns>
        </asp:GridView>
        <asp:ObjectDataSource ID="odsCourse" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByDDL" TypeName="hjyTableAdapters.v_老师上课信息视图TableAdapter">
            <SelectParameters>
                <asp:SessionParameter Name="教工号" SessionField="username" Type="String" />
                <asp:ControlParameter ControlID="ddlYear" Name="学年代码" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="ddlTerm" Name="学期代码" PropertyName="SelectedValue" Type="String" />
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
        <asp:ObjectDataSource ID="odsAllCourse" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllCourse" TypeName="hjyTableAdapters.v_老师上课信息视图TableAdapter">
            <SelectParameters>
                <asp:SessionParameter Name="教工号" SessionField="username" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsTerm" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetTerm" TypeName="hjyTableAdapters.学期代码表TableAdapter" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_学期代码" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="学期" Type="String" />
                <asp:Parameter Name="学期代码" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="学期" Type="String" />
                <asp:Parameter Name="Original_学期代码" Type="String" />
            </UpdateParameters>
        </asp:ObjectDataSource>
    
    </div>
    </form>
</body>
</html>
