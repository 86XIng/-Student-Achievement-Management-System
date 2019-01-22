<%@ Page Language="C#" AutoEventWireup="true" CodeFile="change_personal_info.aspx.cs" Inherits="manage_admin_manager_change_personal_info" %>

<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
     <link href="../../tools/layui/css/layui.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        td {
            border:0 !important;
        }
        input {
            height:38px !important;
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
    <form id="form1" class="layui-form" runat="server">
    <div class="layui-container">
        <br />
        <h2>修改个人信息</h2>
        <hr />
     
        <dx:ASPxGridView ID="gvManager" runat="server" AutoGenerateColumns="False" KeyFieldName="账号" DataSourceID="ManagerOds" OnRowUpdating="gvManager_RowUpdating" Theme="Material">
            <Templates>
                <EditForm>
                    <table class="layui-table">
                        <tr>
                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 密码</td>

                            <td><asp:TextBox ID="txtPassword" runat="server" Height="16px" TextMode="Password" CssClass="layui-input"></asp:TextBox>

                                

                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="btnSave" runat="server" OnCommand="btnSave_Command" CssClass="layui-btn" Text="保存" />
                            </td>
                            <td>
                                <asp:Button ID="btnCancel" runat="server" OnCommand="btnCancel_Command" CssClass="layui-btn" Text="返回" />
                            </td>
                        </tr>
                    </table>
                </EditForm>
            </Templates>
            <Columns>
                <dx:GridViewDataTextColumn FieldName="账号" ReadOnly="True" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="密码" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="身份" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="操作" VisibleIndex="0">
                    <DataItemTemplate>
                        <table class="auto-style1">
                            <tr>
                                <td>
                                   <dx:ASPxButton ID="btnEdit" runat="server" oncommand="btnEdit_Command"  Text="修改" CommandArgument="<%# Container.VisibleIndex %>" Native="True" CssClass="layui-btn" >
                                   </dx:ASPxButton>                      
                               </td>
                            </tr>
                        </table>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:ObjectDataSource ID="ManagerOds" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByAccount" TypeName="liuchuxiongTableAdapters.管理员表TableAdapter" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_账号" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="账号" Type="String" />
                <asp:Parameter Name="密码" Type="String" />
                <asp:Parameter Name="身份" Type="String" />
                <asp:Parameter Name="身份代码" Type="String" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="账号" SessionField="username" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="密码" Type="String" />
                <asp:Parameter Name="身份" Type="String" />
                <asp:Parameter Name="身份代码" Type="String" />
                <asp:Parameter Name="Original_账号" Type="String" />
            </UpdateParameters>
        </asp:ObjectDataSource>
    </div>
    </form>
</body>
</html>
