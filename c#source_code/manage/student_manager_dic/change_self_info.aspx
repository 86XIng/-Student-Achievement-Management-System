<%@ Page Language="C#" AutoEventWireup="true" CodeFile="change_self_info.aspx.cs" Inherits="manage_student_manager_dic_change_self_info" %>

<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="../tools/layui/css/layui.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 37px;
            height: 44px;
        }
        .auto-style3 {
            height: 28px;
        }
        .auto-style4 {
            height: 44px;
        }
        .auto-style1 {
            width: 100%;
        }
    </style>
    <style type="text/css">
        
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
        <h2>修改个人信息</h2>
        <hr />
&nbsp;<asp:Button ID="btnEdit" runat="server" Text="修改个人信息" CssClass="layui-btn layui-btn-sm" OnCommand="btnEdit_Command" />
        <br />

&nbsp;<dx:ASPxGridView ID="gvStuSelf" runat="server" AutoGenerateColumns="False" DataSourceID="StuSelfOd" KeyFieldName="学号" OnRowInserting="gvStuSelf_RowInserting" OnRowUpdating="gvStuSelf_RowUpdating" Theme="Material">
            <templates>
                <editform>
                    <table class="auto-style1">
                        <tr>
                            <td class="auto-style2">密 码</td>
                            <td class="auto-style2">
                                
                                <dx:ASPxTextBox ID="txtPassword" runat="server" Text='<%# Bind("密码") %>' Width="170px" Password="True" AutoPostBack="False">

                                </dx:ASPxTextBox>
                                    
                            </td>
                            <td class="auto-style2">性 别</td>
                            <td class="auto-style2">

                                <dx:ASPxComboBox ID="sexCbx" runat="server" DataSourceID="sexOds" TextField="性别" ValueField="性别代码">

                                </dx:ASPxComboBox>
                            </td>
                        </tr>
                        <tr>
                            
                            <td>省份</td>
                            <td>
                                
                                <dx:ASPxComboBox ID="ProvinceCbx" runat="server" DataSourceID="ProvinceOds" TextField="省份" ValueField="省份代码" AutoPostBack="True" OnSelectedIndexChanged="ProvinceCbx_SelectedIndexChanged">
                                </dx:ASPxComboBox>
                                    
                            </td>
                                
                            <td>城市</td>
                            <td>

                                <dx:ASPxComboBox ID="CityCbx" runat="server" TextField="城市" ValueField="城市代码">

                                </dx:ASPxComboBox>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>
                                <asp:Button ID="btnSave" runat="server" CssClass="layui-btn layui-btn-sm" OnCommand="btnSave_Command" Text="保存" />
                            </td>
                            <td>&nbsp;</td>
                            <td>
                                <asp:Button ID="btnCancel" runat="server" CssClass="layui-btn layui-btn-sm" OnCommand="btnCancel_Command" Text="返回" />
                            </td>
                        </tr>
                    </table>
                </editform>
            </templates>
            <Columns>
                <dx:GridViewDataTextColumn FieldName="学号" ReadOnly="True" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="姓名" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="密码" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="性别" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="性别代码" Visible="False" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="省份" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="省份代码" Visible="False" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="城市" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="城市代码" Visible="False" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:ObjectDataSource ID="StuSelfOd" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataBySno" TypeName="liuchuxiongTableAdapters.学生表1TableAdapter" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_学号" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="学号" Type="String" />
                <asp:Parameter Name="姓名" Type="String" />
                <asp:Parameter Name="密码" Type="String" />
                <asp:Parameter Name="性别" Type="String" />
                <asp:Parameter Name="性别代码" Type="String" />
                <asp:Parameter Name="省份" Type="String" />
                <asp:Parameter Name="省份代码" Type="String" />
                <asp:Parameter Name="城市" Type="String" />
                <asp:Parameter Name="城市代码" Type="String" />
            </InsertParameters>
            <SelectParameters>

                <asp:SessionParameter Name="学号" SessionField="username" Type="String" />

            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="姓名" Type="String" />
                <asp:Parameter Name="密码" Type="String" />
                <asp:Parameter Name="性别" Type="String" />
                <asp:Parameter Name="性别代码" Type="String" />
                <asp:Parameter Name="省份" Type="String" />
                <asp:Parameter Name="省份代码" Type="String" />
                <asp:Parameter Name="城市" Type="String" />
                <asp:Parameter Name="城市代码" Type="String" />
                <asp:Parameter Name="Original_学号" Type="String" />
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
                <asp:Parameter Name="性别代码" Type="String" />
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
    </div>
    </form>
</body>
</html>
