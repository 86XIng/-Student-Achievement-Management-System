<%@ Page Language="C#" AutoEventWireup="true" CodeFile="change_course_info.aspx.cs" Inherits="manage_admin_manager_manage_course_change_course_info" %>

<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="../../tools/layui/css/layui.css" rel="stylesheet" />
    <link href="../../tools/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
    <style type="text/css">
        .auto-style2 {
            height: 27px;
        }
        td {
            border:0 !important;
        }
        .layui-btn{
            margin-right:5px;
        }
        .layui-btn:hover{
            background-color: #009688 !important;
        }
        .dxbButtonHover {
            background-color: #009688 !important;
            background-image:none;
        }
        tr:hover {
            background-color:transparent !important;
        }
         h2 {
            color:#009688;
        }
         
         .layui-table td, .layui-table th{
            position:initial;
        }
        .auto-style3 {
            height: 27px;
            width: 170px;
        }
        .auto-style4 {
            width: 170px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="layui-container">
        <br />
        
        <h2>修改课程信息</h2>
        <hr />
        <asp:Button ID="btnNew" runat="server" CssClass="layui-btn" OnCommand="btnNew_Command" Text="添加课程信息" />
        <br />
        <dx:ASPxGridView ID="gvCourse" runat="server" AutoGenerateColumns="False" KeyFieldName="课程号" OnRowInserting="gvCourse_RowInserting" OnRowUpdating="gvCourse_RowUpdating" OnPageIndexChanged="gvCourse_PageIndexChanged" OnRowDeleting="gvCourse_RowDeleting" DataSourceID="CourseOds" Theme="Material" >
            <Templates>
                <EditForm>
                    <table class="table" >
                        <tr>
                            <td class="auto-style2">课 程 名</td>
                            <td class="auto-style2">
                                <asp:TextBox ID="txtCourseName" runat="server" Text='<%# Bind("课程名") %>'></asp:TextBox>
                            </td>
                            <td class="auto-style2">课 程 学 分</td>
                            <td class="auto-style3">
                                <asp:TextBox ID="txtCourseScore" runat="server" Text='<%# Bind("课程学分") %>'></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>课程学时</td>
                            <td>
                                <asp:TextBox ID="txtCourseTime" runat="server" Text='<%# Bind("课程学时") %>' Width="188px"></asp:TextBox>
                            </td>
                            <td>课程类型</td>
                            <td class="auto-style4">
                                <dx:ASPxComboBox ID="CouTypeCbx" runat="server" DataSourceID="CouTypeOds" SelectedIndex="0" TextField="课程类型" ValueField="课程类型代码">
                                </dx:ASPxComboBox>
                            </td>
                        </tr>
                        <tr>
                            <td>学院</td>
                            <td>
                                <dx:ASPxComboBox ID="facultyCbx" runat="server" DataSourceID="facultyOds" SelectedIndex="0" TextField="学院" ValueField="学院号">
                                </dx:ASPxComboBox>
                            </td>
                            <td>开课时间</td>
                            <td class="auto-style4">
                                <asp:TextBox ID="txtOpenCourse" runat="server" TextMode="Month"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>课程封面</td>
                            <td>
                                <dx:ASPxUploadControl ID="CourseUC" runat="server" OnFileUploadComplete="CourseUC_FileUploadComplete" UploadMode="Auto" Width="280px" NullText="点击浏览文件..." style="margin-left: 0px; margin-top: 0px" AutoStartUpload="True" ShowProgressPanel="True" UploadStorage="FileSystem">
                                    <BrowseButton Text="浏览">
                                        <Image Height="30px" Url="~/img/course_7.jpg">
                                        </Image>
                                    </BrowseButton>
                                    <CancelButton Text="返回">
                                    </CancelButton>
                                    <FileSystemSettings UploadFolder="~/img/" />
                                    <BrowseButtonStyle BackColor="#CCFFFF">
                                    </BrowseButtonStyle>
                                </dx:ASPxUploadControl>
                            </td>
                            <td>&nbsp;</td>
                            <td class="auto-style4">&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <asp:Button ID="btnSave"  CssClass="layui-btn" runat="server" OnCommand="btnSave_Command" Text="保存" OnClick="btnSave_Click" />
                            </td>
                            <td colspan="2">
                                <asp:Button ID="btnCancel" CssClass="layui-btn" runat="server" OnCommand="btnCancel_Command" Text="返回" />
                            </td>
                        </tr>
                    </table>
                </EditForm>
            </Templates>
            <SettingsPager PageSize="5">
            </SettingsPager>
            <Columns>
                <dx:GridViewDataTextColumn FieldName="课程号" ReadOnly="True" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="课程名" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="课程学分" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="课程学时" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="课程类型" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="课程类型代码" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="学院号" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="学院" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="开课时间" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="课程封面" VisibleIndex="10">
                    <DataItemTemplate>
                        <dx:ASPxImage ID="CourseImg" runat="server" ImageUrl='<%# Bind("课程封面") %>' ShowLoadingImage="True" Width="50px">
                        </dx:ASPxImage>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="操作" VisibleIndex="0">
                    <DataItemTemplate>
                        <table class="table">
                            <tr>
                                <td>
                                    <dx:ASPxButton ID="btnEdit" CssClass="layui-btn layui-btn-sm" runat="server"  Text="修改" OnCommand="btnEdit_Command" CommandArgument="<%# Container.VisibleIndex %>" >
                                    </dx:ASPxButton>
                                </td>
                                <td>
                                   <dx:ASPxButton ID="btnDelete"  CssClass="layui-btn layui-btn-sm" runat="server"  Text="删除" OnCommand="btnDelete_Command" CommandArgument="<%# Container.VisibleIndex %>" >
                                    </dx:ASPxButton>
                                </td>
                            </tr>
                        </table>
                    </DataItemTemplate>
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:ObjectDataSource ID="CourseOds" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="liuchuxiongTableAdapters.课程表TableAdapter" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_课程号" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="课程名" Type="String" />
                <asp:Parameter Name="课程学分" Type="Double" />
                <asp:Parameter Name="课程学时" Type="Int32" />
                <asp:Parameter Name="课程类型" Type="String" />
                <asp:Parameter Name="课程类型代码" Type="String" />
                <asp:Parameter Name="学院号" Type="String" />
                <asp:Parameter Name="学院" Type="String" />
                <asp:Parameter Name="开课时间" Type="String" />
                <asp:Parameter Name="课程封面" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="课程名" Type="String" />
                <asp:Parameter Name="课程学分" Type="Double" />
                <asp:Parameter Name="课程学时" Type="Int32" />
                <asp:Parameter Name="课程类型" Type="String" />
                <asp:Parameter Name="课程类型代码" Type="String" />
                <asp:Parameter Name="学院号" Type="String" />
                <asp:Parameter Name="学院" Type="String" />
                <asp:Parameter Name="开课时间" Type="String" />
                <asp:Parameter Name="课程封面" Type="String" />
                <asp:Parameter Name="Original_课程号" Type="Int32" />
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
        <asp:ObjectDataSource ID="CouTypeOds" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="liuchuxiongTableAdapters.课程类型代码表TableAdapter" DeleteMethod="Delete" InsertMethod="Insert" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_课程类型代码" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="课程类型代码" Type="String" />
                <asp:Parameter Name="课程类型" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="课程类型" Type="String" />
                <asp:Parameter Name="Original_课程类型代码" Type="String" />
            </UpdateParameters>
        </asp:ObjectDataSource>
    </div>
    </form>
</body>
<script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
<script>
    $(document).ready(function () {
        $('.layui-btn').each(function () {
            $(this).removeClass("dxbButton");
        })
        $('#gvCourse_DXMainTable').addClass('table');
        //$('#gvCourse_DXMainTable').attr('lay-size',"sm")
        $('.dxeImage').each(function () {
            var src = $(this).attr('src');
            $(this).attr('src', '../../../img/' + src);
        })
        $('.dxp-num').click(function () {
            console.log("222")
            var st = setInterval(function () {
                $('.dxeImage').each(function () {
                    var src = $(this).attr('src');
                    $(this).attr('src', '../../../img/' + src);
                })
                $('.layui-btn').each(function () {
                    $(this).removeClass("dxbButton");
                })
                $('#gvCourse_DXMainTable').addClass('table');
                //$('#gvCourse_DXMainTable').attr('lay-size', "sm")
                
            }, 800);
            
            
        })
    })
       
</script>
</html>
