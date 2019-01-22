<%@ Page Language="C#" AutoEventWireup="true" CodeFile="change_self_info.aspx.cs" Inherits="manage_teacher_manager_dic_change_self_info" %>

<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
     <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
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
            color: #009688;
        }
        .hidden {
            display:none;
        }
    </style>
    <link href="../tools/layui/css/layui.css" rel="stylesheet" />
     <script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="layui-container">
        <br />
        <h2>修改个人信息</h2> 
        <hr />
        <asp:Button ID="btnEdit" runat="server" Text="修改个人信息" CssClass="layui-btn layui-btn-sm" OnCommand="btnEdit_Command" />
        <br />
&nbsp;<dx:ASPxGridView ID="gvTSelf" runat="server" AutoGenerateColumns="False" DataSourceID="TSelfOds" KeyFieldName="教工号" Theme="Material" OnRowUpdating="gvTSelf_RowUpdating">
            <Templates>
                <EditForm>
                    <table class="auto-style1">
                        <tr>
                            <td colspan="2">密码<dx:ASPxTextBox ID="hiddenPassword" runat="server" CssClass="hidden" Width="170px">
                                </dx:ASPxTextBox>
                            </td>
                            <td colspan="2">
                                <dx:ASPxTextBox ID="txtPassword" runat="server" Password="True" Width="170px">
                                </dx:ASPxTextBox>
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
                                <asp:Button ID="btnCancel" runat="server" CssClass="layui-btn layui-btn-sm"  OnCommand="btnCancel_Command" Text="返回" />
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </EditForm>
            </Templates>
            <Columns>
                <dx:GridViewDataTextColumn FieldName="教工号" ReadOnly="True" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="姓名" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="密码" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="学院号" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="学院" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="身份" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="身份代码" VisibleIndex="6" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="职称" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="职称代码" Visible="False" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="性别代码" Visible="False" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="性别" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="政治面貌" VisibleIndex="11">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="政治面貌代码" Visible="False" VisibleIndex="12">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="省份" VisibleIndex="13">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="省份代码" Visible="False" VisibleIndex="14">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="城市" VisibleIndex="15">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="城市代码" Visible="False" VisibleIndex="16">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:ObjectDataSource ID="TSelfOds" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByTno" TypeName="liuchuxiongTableAdapters.教师表TableAdapter" UpdateMethod="Update">
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
            <SelectParameters>
                <asp:SessionParameter Name="教工号" SessionField="username" Type="String" />
            </SelectParameters>
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
<script>
    $(document).ready(function () {
        $('#gvTSelf_ef0_txtPassword_0_I').val($('#gvTSelf_ef0_hiddenPassword_0_I').val())
        $('#gvTSelf_ef0_txtPassword_0').keyup(function () {
            $('#gvTSelf_ef0_hiddenPassword_0_I').val($('#gvTSelf_ef0_txtPassword_0_I').val())
            console.log($('#gvTSelf_ef0_txtPassword_0_I').val())
        });
        //$("#gvTSelf_ef0_CityCbx_0_I").each(function () {
        //    $(this).val("");
        //    console.log($(this).val(""))
        //})
    })
    //txtPassword
</script>
</html>
