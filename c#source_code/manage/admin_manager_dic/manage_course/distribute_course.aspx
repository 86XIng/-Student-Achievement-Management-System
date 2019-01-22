<%@ Page Language="C#" AutoEventWireup="true" CodeFile="distribute_course.aspx.cs" Inherits="manage_admin_manager_manage_course_distribute_course" %>

<%@ Register assembly="DevExpress.Dashboard.v17.1.Web, Version=17.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.DashboardWeb" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="../../tools/layui/css/layui.css" rel="stylesheet" />
    <title>分配课程</title>
    <style type="text/css">
        .auto-style6 {
            height: 60px;
        }
        .layui-table td, .layui-table th{
            position:initial;
        }
    </style>
    
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h3 style="color:#009688">选择老师为其分配课程</h3>
        <%--分配课程--%>     
         
        <%--<asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>--%>
     
        <br />

    </div>
        <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>   --%>   
         
        
        <table style="width: 100%;valign:top">   
            <tr>
                <td colspan="3" style="text-align: left" class="auto-style6">

                    学院：<asp:DropDownList ID="ddlTeacherAcademy" runat="server" DataSourceID="odsAcademy" DataTextField="学院" DataValueField="学院号" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="ddlTeacherAcademy_SelectedIndexChanged">
                    </asp:DropDownList>

                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:GridView ID="gvTeacher" class="layui-table" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="教工号" OnPageIndexChanging="gvTeacher_PageIndexChanging">
                        <Columns>
                            <asp:BoundField DataField="教工号" HeaderText="教工号" ReadOnly="True" SortExpression="教工号" />
                            <asp:BoundField DataField="姓名" HeaderText="姓名" SortExpression="姓名" />
                            <asp:BoundField DataField="学院" HeaderText="学院" SortExpression="学院" />
                            <asp:BoundField DataField="职称" HeaderText="职称" SortExpression="职称" />
                            <asp:HyperLinkField DataNavigateUrlFields="教工号" DataNavigateUrlFormatString="distribute_course_forTeacher.aspx?教工号={0}" Text="分配课程" HeaderText="分配课程" >
                            <ItemStyle Font-Underline="True" />
                            </asp:HyperLinkField>
                        </Columns>
                    </asp:GridView>
                </td>
                
            </tr>
        </table>
        <br />
        <%--</ContentTemplate>
        </asp:UpdatePanel>--%>

        <asp:ObjectDataSource ID="odsAcademy" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetAcademy" TypeName="hjyTableAdapters.学院表TableAdapter" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_学院号" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="学院号" Type="String" />
                <asp:Parameter Name="学院" Type="String" />
                <asp:Parameter Name="排序" Type="Int32" />
                <asp:Parameter Name="是否启用" Type="String" />
                <asp:Parameter Name="备注" Type="String" />
                <asp:Parameter Name="预留字段1" Type="String" />
                <asp:Parameter Name="预留字段2" Type="String" />
                <asp:Parameter Name="预留字段3" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="学院" Type="String" />
                <asp:Parameter Name="排序" Type="Int32" />
                <asp:Parameter Name="是否启用" Type="String" />
                <asp:Parameter Name="备注" Type="String" />
                <asp:Parameter Name="预留字段1" Type="String" />
                <asp:Parameter Name="预留字段2" Type="String" />
                <asp:Parameter Name="预留字段3" Type="String" />
                <asp:Parameter Name="Original_学院号" Type="String" />
            </UpdateParameters>
        </asp:ObjectDataSource>
        <br />
        
        <div>
            <asp:ObjectDataSource ID="odsTeacherByA" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetTeacherByAcademy" TypeName="hjyTableAdapters.教师表TableAdapter" UpdateMethod="Update">
                <DeleteParameters>
                    <asp:Parameter Name="Original_教工号" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="教工号" Type="String" />
                    <asp:Parameter Name="密码" Type="String" />
                    <asp:Parameter Name="姓名" Type="String" />
                    <asp:Parameter Name="学院" Type="String" />
                    <asp:Parameter Name="学院号" Type="String" />
                    <asp:Parameter Name="身份" Type="String" />
                    <asp:Parameter Name="身份代码" Type="String" />
                    <asp:Parameter Name="职称" Type="String" />
                    <asp:Parameter Name="职称代码" Type="String" />
                    <asp:Parameter Name="性别代码" Type="String" />
                    <asp:Parameter Name="性别" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlTeacherAcademy" Name="学院号" PropertyName="SelectedValue" Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="密码" Type="String" />
                    <asp:Parameter Name="姓名" Type="String" />
                    <asp:Parameter Name="学院" Type="String" />
                    <asp:Parameter Name="学院号" Type="String" />
                    <asp:Parameter Name="身份" Type="String" />
                    <asp:Parameter Name="身份代码" Type="String" />
                    <asp:Parameter Name="职称" Type="String" />
                    <asp:Parameter Name="职称代码" Type="String" />
                    <asp:Parameter Name="性别代码" Type="String" />
                    <asp:Parameter Name="性别" Type="String" />
                    <asp:Parameter Name="Original_教工号" Type="String" />
                </UpdateParameters>
            </asp:ObjectDataSource>
        </div>
        
        <br />
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
        <asp:ObjectDataSource ID="odsAllTeacherCourse" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllTeacherCourse" TypeName="hjyTableAdapters.v_上课表信息TableAdapter">
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsAllCourse" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllCourse" TypeName="hjyTableAdapters.课程表TableAdapter" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_课程号" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="课程号" Type="Int32" />
                <asp:Parameter Name="课程名" Type="String" />
                <asp:Parameter Name="课程学分" Type="Double" />
                <asp:Parameter Name="课程学时" Type="Int32" />
                <asp:Parameter Name="课程类型" Type="String" />
                <asp:Parameter Name="课程类型代码" Type="String" />
                <asp:Parameter Name="学院号" Type="String" />
                <asp:Parameter Name="学院" Type="String" />
                <asp:Parameter Name="开课时间" Type="String" />
                <asp:Parameter Name="课程封面" Type="String" />
                <asp:Parameter Name="备注" Type="String" />
                <asp:Parameter Name="预留字段1" Type="String" />
                <asp:Parameter Name="预留字段2" Type="String" />
                <asp:Parameter Name="预留字段3" Type="String" />
                <asp:Parameter Name="预留字段4" Type="String" />
                <asp:Parameter Name="预留字段5" Type="String" />
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
                <asp:Parameter Name="备注" Type="String" />
                <asp:Parameter Name="预留字段1" Type="String" />
                <asp:Parameter Name="预留字段2" Type="String" />
                <asp:Parameter Name="预留字段3" Type="String" />
                <asp:Parameter Name="预留字段4" Type="String" />
                <asp:Parameter Name="预留字段5" Type="String" />
                <asp:Parameter Name="Original_课程号" Type="Int32" />
            </UpdateParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsAllTeacher" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllTeacher" TypeName="hjyTableAdapters.教师表TableAdapter" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_教工号" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="教工号" Type="String" />
                <asp:Parameter Name="密码" Type="String" />
                <asp:Parameter Name="姓名" Type="String" />
                <asp:Parameter Name="学院" Type="String" />
                <asp:Parameter Name="学院号" Type="String" />
                <asp:Parameter Name="身份" Type="String" />
                <asp:Parameter Name="身份代码" Type="String" />
                <asp:Parameter Name="职称" Type="String" />
                <asp:Parameter Name="职称代码" Type="String" />
                <asp:Parameter Name="性别代码" Type="String" />
                <asp:Parameter Name="性别" Type="String" />
                <asp:Parameter Name="预留字段1" Type="String" />
                <asp:Parameter Name="预留字段2" Type="String" />
                <asp:Parameter Name="预留字段3" Type="String" />
                <asp:Parameter Name="预留字段4" Type="String" />
                <asp:Parameter Name="预留字段5" Type="String" />
                <asp:Parameter Name="预留字段6" Type="String" />
                <asp:Parameter Name="预留字段7" Type="String" />
                <asp:Parameter Name="预留字段8" Type="String" />
                <asp:Parameter Name="预留字段9" Type="String" />
                <asp:Parameter Name="预留字段10" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="密码" Type="String" />
                <asp:Parameter Name="姓名" Type="String" />
                <asp:Parameter Name="学院" Type="String" />
                <asp:Parameter Name="学院号" Type="String" />
                <asp:Parameter Name="身份" Type="String" />
                <asp:Parameter Name="身份代码" Type="String" />
                <asp:Parameter Name="职称" Type="String" />
                <asp:Parameter Name="职称代码" Type="String" />
                <asp:Parameter Name="性别代码" Type="String" />
                <asp:Parameter Name="性别" Type="String" />
                <asp:Parameter Name="预留字段1" Type="String" />
                <asp:Parameter Name="预留字段2" Type="String" />
                <asp:Parameter Name="预留字段3" Type="String" />
                <asp:Parameter Name="预留字段4" Type="String" />
                <asp:Parameter Name="预留字段5" Type="String" />
                <asp:Parameter Name="预留字段6" Type="String" />
                <asp:Parameter Name="预留字段7" Type="String" />
                <asp:Parameter Name="预留字段8" Type="String" />
                <asp:Parameter Name="预留字段9" Type="String" />
                <asp:Parameter Name="预留字段10" Type="String" />
                <asp:Parameter Name="Original_教工号" Type="String" />
            </UpdateParameters>
        </asp:ObjectDataSource>
        <br />
    </form>
</body>
</html>
