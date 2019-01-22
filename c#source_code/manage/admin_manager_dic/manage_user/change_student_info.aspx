<%@ Page Language="C#" AutoEventWireup="true" CodeFile="change_student_info.aspx.cs" Inherits="manage_admin_manager_change_student_info" %>

<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="../../tools/layui/css/layui.css" rel="stylesheet" />
    <style>
        
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
        
        <h2>修改学生信息<asp:ScriptManager ID="StuSm" runat="server" EnablePartialRendering="False">
            </asp:ScriptManager>
        </h2>
        
        <hr />
        <asp:Button ID="btnNew" runat="server" Text="添加学生信息" CssClass="layui-btn layui-btn-sm" OnCommand="btnNew_Command" />
        <br />
&nbsp;<dx:ASPxGridView ID="gvStu" runat="server" AutoGenerateColumns="False" DataSourceID="StuODS" OnRowInserting="gvStu_RowInserting" OnRowUpdating="gvStu_RowUpdating" KeyFieldName="学号" Theme="Material">
            <Templates>
                <EditForm>
                    <table class="">
                        <tr>
                            <td class="auto-style2">姓 名&nbsp;&nbsp;&nbsp;&nbsp; </td>
                            <td class="auto-style4">
                                <dx:ASPxTextBox ID="txtName" runat="server" style="margin-top: 0px; margin-bottom: 0px" Text='<%# Bind("姓名") %>' OnTextChanged="txtName_TextChanged">
                                </dx:ASPxTextBox>
                            </td>
                            <td class="auto-style4">
                                <asp:Label ID="lbleName" runat="server" Text=" "></asp:Label>
                                性 别</td>
                            <td class="auto-style4">&nbsp;</td>
                            <td class="auto-style4">
                                <dx:ASPxComboBox ID="sexCbx" runat="server"  TextField="性别" ValueField="性别代码" DataSourceID="sexOds" SelectedIndex="0">
                                </dx:ASPxComboBox>
                            </td>
                            
                            <td class="auto-style4">&nbsp;</td>
                            
                        </tr>
                        <tr>
                            <td class="auto-style3">学 院</td>
                            <td class="auto-style3">
                                <dx:ASPxComboBox ID="facultyCbx" runat="server" DataSourceID="facultyOds"  TextField="学院" ValueField="学院号" AutoPostBack="True" OnSelectedIndexChanged="facultyCbx_SelectedIndexChanged" >
                                </dx:ASPxComboBox>
                            </td>
                            <td class="auto-style3" colspan="2">专 业</td>
                            <td class="auto-style3" colspan="2">
                                <dx:ASPxComboBox ID="majorCbx" runat="server"  TextField="专业" ValueField="专业号" OnSelectedIndexChanged="maojorCbx_SelectedIndexChanged" AutoPostBack="True" style="height: 24px" >
                                </dx:ASPxComboBox>
                            </td>
                            <td class="auto-style3">
                                班 级</td>
                            <td class="auto-style3">
                                <dx:ASPxComboBox ID="ClassCbx" runat="server" TextField="班级名" ValueField="班级号" >
                                </dx:ASPxComboBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style3">省 份</td>
                            <td class="auto-style3">
                                <dx:ASPxComboBox ID="ProvinceCbx" runat="server" DataSourceID="ProvinceOds"  TextField="省份" ValueField="省份代码" AutoPostBack="True" OnSelectedIndexChanged="provinceCbx_SelectedIndexChanged" >
                                </dx:ASPxComboBox>
                            </td>
                            <td class="auto-style3" colspan="2">城 市</td>
                            <td class="auto-style3" colspan="2">
                                <dx:ASPxComboBox ID="CityCbx" runat="server"  TextField="城市" ValueField="城市代码" AutoPostBack="True" >
                                </dx:ASPxComboBox>
                            </td>
                            <td class="auto-style3">
                                政治面貌</td>
                            <td class="auto-style3">
                                <dx:ASPxComboBox ID="zzmmCbx" runat="server" DataSourceID="zzmmOds" SelectedIndex="0" TextField="政治面貌" ValueField="政治面貌代码">
                                </dx:ASPxComboBox>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btnSave" runat="server" Text="保存" CssClass="layui-btn layui-btn-normal layui-btn-sm" OnCommand="btnSave_Command" />
                            </td>
                            <td colspan="6">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btnCancel" runat="server" Text="返回" CssClass="layui-btn layui-btn-normal layui-btn-sm" OnCommand="btnCancel_Command" />
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td colspan="4">&nbsp;</td>
                            <td colspan="2">&nbsp;</td>
                        </tr>
                    </table>
                </EditForm>
            </Templates>
            <Columns>
                <dx:GridViewDataTextColumn FieldName="班级号" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="班级名" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="学院号" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="学院" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="专业号" VisibleIndex="7" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="专业" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="性别" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="性别代码" VisibleIndex="10" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="姓名" VisibleIndex="11">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="密码" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="学号" VisibleIndex="1" ReadOnly="True">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn VisibleIndex="14" FieldName="政治面貌">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="政治面貌代码" VisibleIndex="15" Visible="False"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="省份" VisibleIndex="16"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="省份代码" VisibleIndex="17" Visible="False"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="城市" VisibleIndex="18"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="城市代码" VisibleIndex="19" Visible="False">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="操作" VisibleIndex="0">
                    <DataItemTemplate>
                        <table class="auto-style1">
                            <tr>
                                <td>
                                    <asp:Button ID="btnEdit" runat="server" CssClass="layui-btn layui-btn-sm"  Text="修改" OnCommand="btnEdit_Command" CommandArgument="<%# Container.VisibleIndex %>" />
                                </td>
                                <td>
                                    <asp:Button ID="btnDelete" runat="server" CssClass="layui-btn layui-btn-sm" Text="删除" OnCommand="btnDelete_Command" CommandArgument="<%# Container.VisibleIndex %>"/>
                                </td>
                            </tr>
                        </table>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                
            </Columns>
        </dx:ASPxGridView>
    </div>
        <asp:ObjectDataSource ID="StuODS" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="liuchuxiongTableAdapters.学生表TableAdapter" UpdateMethod="Update" DeleteMethod="Delete" InsertMethod="Insert">
            <DeleteParameters>
                <asp:Parameter Name="Original_学号" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="班级号" Type="String" />
                <asp:Parameter Name="班级名" Type="String" />
                <asp:Parameter Name="学院号" Type="String" />
                <asp:Parameter Name="学院" Type="String" />
                <asp:Parameter Name="专业号" Type="String" />
                <asp:Parameter Name="专业" Type="String" />
                <asp:Parameter Name="性别" Type="String" />
                <asp:Parameter Name="性别代码" Type="String" />
                <asp:Parameter Name="姓名" Type="String" />
                <asp:Parameter Name="身份代码" Type="String" />
                <asp:Parameter Name="身份" Type="String" />
                <asp:Parameter Name="密码" Type="String" />
                <asp:Parameter Name="学号" Type="String" />
                <asp:Parameter Name="政治面貌" Type="String" />
                <asp:Parameter Name="政治面貌代码" Type="String" />
                <asp:Parameter Name="省份" Type="String" />
                <asp:Parameter Name="省份代码" Type="String" />
                <asp:Parameter Name="城市" Type="String" />
                <asp:Parameter Name="城市代码" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="班级号" Type="String" />
                <asp:Parameter Name="班级名" Type="String" />
                <asp:Parameter Name="学院号" Type="String" />
                <asp:Parameter Name="学院" Type="String" />
                <asp:Parameter Name="专业号" Type="String" />
                <asp:Parameter Name="专业" Type="String" />
                <asp:Parameter Name="性别" Type="String" />
                <asp:Parameter Name="性别代码" Type="String" />
                <asp:Parameter Name="姓名" Type="String" />
                <asp:Parameter Name="身份代码" Type="String" />
                <asp:Parameter Name="身份" Type="String" />
                <asp:Parameter Name="密码" Type="String" />
                <asp:Parameter Name="学号" Type="String" />
                <asp:Parameter Name="政治面貌" Type="String" />
                <asp:Parameter Name="政治面貌代码" Type="String" />
                <asp:Parameter Name="省份" Type="String" />
                <asp:Parameter Name="省份代码" Type="String" />
                <asp:Parameter Name="城市" Type="String" />
                <asp:Parameter Name="城市代码" Type="String" />
                <asp:Parameter Name="Original_学号" Type="String" />
            </UpdateParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="facultyOds" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="liuchuxiongTableAdapters.学院表TableAdapter" DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
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
                <asp:Parameter Name="省份代码" Type="String" />
                <asp:Parameter Name="省份" Type="String" />
                <asp:Parameter Name="Original_省份代码" Type="String" />
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
                <asp:Parameter Name="政治面貌代码" Type="String" />
                <asp:Parameter Name="政治面貌" Type="String" />
                <asp:Parameter Name="Original_政治面貌代码" Type="String" />
            </UpdateParameters>
        </asp:ObjectDataSource>
    </form>
</body>
    <script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
<script>
    $(document).ready(function () {
        $('.layui-btn').each(function () {
            $(this).removeClass("dxbButton");
        })
        $('#gvStu_DXMainTable').addClass('layui-table');
        $('#gvStu_DXMainTable').attr('lay-size', "sm")
        
    })

</script>
</html>
