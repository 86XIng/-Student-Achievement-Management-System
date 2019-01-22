<%@ Page Language="C#" AutoEventWireup="true" CodeFile="change_teacher_info.aspx.cs" Inherits="manage_admin_manager_change_teacher_info" %>

<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="../../tools/layui/css/layui.css" rel="stylesheet" />
    <link href="../../tools/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            height: 28px;
        }
        .layui-table tbody tr {
            background-color:white !important;
        }
        .layui-btn {
            margin-right:5px;
        }
        td {
            border:0 !important;
        }
        input {
            height:38px !important;
        }
        h2 {
            color: #009688;
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
        <h2>修改老师信息</h2>
        <hr />
        <asp:Button ID="btnNew" runat="server" OnCommand="btnNew_Command"  CssClass="layui-btn layui-btn-sm"  Text="添加老师信息" />
        <br />
        <br />
        <dx:ASPxGridView ID="gvTeacher" runat="server" AutoGenerateColumns="False" DataSourceID="teacherOds" KeyFieldName="教工号" OnRowInserting="gvTeacher_RowInserting" OnRowUpdating="gvTeacher_RowUpdating" Theme="Material" >
            <Templates>
                <EditForm>
                    <table class="auto-style1 table"  lay-size="sm">
                        <tr>
                            <td>姓 名</td>
                            <td>
                                <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("姓名") %>'></asp:TextBox>
                            </td>
                            <td>性 别</td>
                            <td>
                                <dx:ASPxComboBox ID="sexCbx" runat="server" TextField="性别" ValueField="性别代码" DataSourceID="sexOds">
                                </dx:ASPxComboBox>
                            </td>
                        </tr>
                    <tr>
                            <td>职称</td>
                            <td>
                                <dx:ASPxComboBox ID="titleCbx" runat="server" DataSourceID="titleOds" SelectedIndex="0" TextField="职称" ValueField="职称代码">
                                </dx:ASPxComboBox>
                            </td>
                            <td>民族</td>
                            <td>
                                <dx:ASPxComboBox ID="natonCbx" runat="server" DataSourceID="NationOds" SelectedIndex="0" TextField="民族" ValueField="民族号">
                                </dx:ASPxComboBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">政治面貌</td>
                            <td class="auto-style2">
                                <dx:ASPxComboBox ID="zzmmCbx" runat="server" DataSourceID="zzmmOds" SelectedIndex="0" TextField="政治面貌" ValueField="政治面貌代码">
                                </dx:ASPxComboBox>
                            </td>
                            <td class="auto-style2">学院</td>
                            <td class="auto-style2">
                                <dx:ASPxComboBox ID="facultyCbx" runat="server" DataSourceID="facultyOds" TextField="学院" ValueField="学院号">
                                </dx:ASPxComboBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">省份</td>
                            <td class="auto-style1">
                                <dx:ASPxComboBox ID="ProvinceCbx" runat="server" DataSourceID="ProvinceOds" TextField="省份" ValueField="省份代码" AutoPostBack="True" OnSelectedIndexChanged="ProvinceCbx_SelectedIndexChanged">
                                </dx:ASPxComboBox>
                            </td>
                            <td class="auto-style1">城市</td>
                            <td class="auto-style1">
                                <dx:ASPxComboBox ID="CityCbx" runat="server" TextField="城市" ValueField="城市代码">
                                </dx:ASPxComboBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btnSave" runat="server" Text="保存" CssClass="layui-btn layui-btn-normal  layui-btn-sm"  OnCommand="btnSave_Command" />
                            </td>
                            <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btnCancel" runat="server" Text="返回" CssClass="layui-btn layui-btn-normal layui-btn-sm"  OnCommand="btnCancel_Command" />
                            </td>
                        </tr>
                    </table>
                </EditForm>
            </Templates>
            <Columns>
                <dx:GridViewDataTextColumn FieldName="教工号" VisibleIndex="1" ReadOnly="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="姓名" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="密码" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="学院号" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="学院" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="职称" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="职称代码" VisibleIndex="10" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="性别代码" VisibleIndex="11" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="性别" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="政治面貌" VisibleIndex="12">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn VisibleIndex="14" FieldName="省份" >
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn VisibleIndex="15" FieldName="省份代码" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn VisibleIndex="16" FieldName="城市" >
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn VisibleIndex="17" FieldName="城市代码" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn VisibleIndex="13" FieldName="政治面貌代码" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="操作" VisibleIndex="0">
                    <DataItemTemplate>
                        <table class="auto-style1">
                            <tr>
                                <td>
                                   <dx:ASPxButton ID="btnEdit" runat="server" oncommand="btnEdit_Command" CssClass="layui-btn layui-btn-sm"  Text="修改" CommandArgument="<%# Container.VisibleIndex %>" Native="True" > </dx:ASPxButton>
                                </td>
                                <td>
                                    <dx:ASPxButton ID="btnDelete" runat="server" oncommand="btnDelete_Command"  CssClass="layui-btn layui-btn-sm"  Text="删除" CommandArgument="<%# Container.VisibleIndex %>" Native="True" > </dx:ASPxButton>
                                </td>
                            </tr>
                        </table>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
    </div>
        <asp:ObjectDataSource ID="teacherOds" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="liuchuxiongTableAdapters.教师表TableAdapter" DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_教工号" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="教工号" Type="String" />
                <asp:Parameter Name="姓名" Type="String" />
                <asp:Parameter Name="密码" Type="String" />
                <asp:Parameter Name="学院号" Type="String" />
                <asp:Parameter Name="学院" Type="String" />
                <asp:Parameter Name="身份" Type="String" />
                <asp:Parameter Name="身份代码" Type="String" />
                <asp:Parameter Name="职称" Type="String" />
                <asp:Parameter Name="职称代码" Type="String" />
                <asp:Parameter Name="性别代码" Type="String" />
                <asp:Parameter Name="性别" Type="String" />
                <asp:Parameter Name="政治面貌" Type="String" />
                <asp:Parameter Name="政治面貌代码" Type="String" />
                <asp:Parameter Name="省份" Type="String" />
                <asp:Parameter Name="省份代码" Type="String" />
                <asp:Parameter Name="城市" Type="String" />
                <asp:Parameter Name="城市代码" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="姓名" Type="String" />
                <asp:Parameter Name="密码" Type="String" />
                <asp:Parameter Name="学院号" Type="String" />
                <asp:Parameter Name="学院" Type="String" />
                <asp:Parameter Name="身份" Type="String" />
                <asp:Parameter Name="身份代码" Type="String" />
                <asp:Parameter Name="职称" Type="String" />
                <asp:Parameter Name="职称代码" Type="String" />
                <asp:Parameter Name="性别代码" Type="String" />
                <asp:Parameter Name="性别" Type="String" />
                <asp:Parameter Name="政治面貌" Type="String" />
                <asp:Parameter Name="政治面貌代码" Type="String" />
                <asp:Parameter Name="省份" Type="String" />
                <asp:Parameter Name="省份代码" Type="String" />
                <asp:Parameter Name="城市" Type="String" />
                <asp:Parameter Name="城市代码" Type="String" />
                <asp:Parameter Name="Original_教工号" Type="String" />
            </UpdateParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="facultyOds" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="liuchuxiongTableAdapters.学院表TableAdapter" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_学院号" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="学院号" Type="String" />
                <asp:Parameter Name="学院" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="学院号" Type="String" />
                <asp:Parameter Name="学院" Type="String" />
                <asp:Parameter Name="Original_学院号" Type="String" />
            </UpdateParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="zzmmOds" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="liuchuxiongTableAdapters.政治面貌代码表TableAdapter" DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_政治面貌代码" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="政治面貌代码" Type="String" />
                <asp:Parameter Name="政治面貌" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="政治面貌" Type="String" />
                <asp:Parameter Name="Original_政治面貌代码" Type="String" />
            </UpdateParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="sexOds" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="liuchuxiongTableAdapters.性别代码表TableAdapter" DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_性别代码" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="性别代码" Type="String" />
                <asp:Parameter Name="性别" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="性别" Type="String" />
                <asp:Parameter Name="Original_性别代码" Type="String" />
            </UpdateParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="ProvinceOds" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="liuchuxiongTableAdapters.省份代码表TableAdapter" DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_省份代码" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="省份代码" Type="String" />
                <asp:Parameter Name="省份" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="省份" Type="String" />
                <asp:Parameter Name="Original_省份代码" Type="String" />
            </UpdateParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="titleOds" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="liuchuxiongTableAdapters.职称代码表TableAdapter" DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_职称代码" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="职称代码" Type="String" />
                <asp:Parameter Name="职称" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="职称代码" Type="String" />
                <asp:Parameter Name="职称" Type="String" />
                <asp:Parameter Name="Original_职称代码" Type="String" />
            </UpdateParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="NationOds" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="liuchuxiongTableAdapters.民族代码表TableAdapter" DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_民族号" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="民族号" Type="String" />
                <asp:Parameter Name="民族" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="民族" Type="String" />
                <asp:Parameter Name="Original_民族号" Type="String" />
            </UpdateParameters>
        </asp:ObjectDataSource>
    </form>
</body>
</html>
