<%@ Page Language="C#" AutoEventWireup="true" CodeFile="distribute_course_forTeacher.aspx.cs" Inherits="manage_admin_manager_dic_manage_course_distribute_course_forTeacher" %>

<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="../../tools/layui/css/layui.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            height: 50px;
        }
        .auto-style2 {
            height: 45px;
        }
        .layui-table td, .layui-table th{
            position:initial;
        }
        .auto-style3 {
            height: 26px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/manage/admin_manager_dic/manage_course/distribute_course.aspx">返回</asp:HyperLink>
&nbsp;<table style="width:100%">
            <tr>
                <td class="auto-style1">
                    <h3 style="color:#009688">选择要为老师分配的课程</h3>
                </td>
                <td class="auto-style1">
                    <h3 style="color:#009688">已为老师分配的课程</h3>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="lblYear" runat="server" Text="选择学年："></asp:Label>
                    <asp:DropDownList ID="ddlYear" runat="server" DataSourceID="odsYear" DataTextField="学年" DataValueField="学年代码" AppendDataBoundItems="True" OnSelectedIndexChanged="ddlYear_SelectedIndexChanged">
        </asp:DropDownList>
                    <asp:Label ID="lblTearm" runat="server" Text="选择学期："></asp:Label>
                    <asp:DropDownList ID="ddlTerm" runat="server" DataSourceID="odsTerm" DataTextField="学期" DataValueField="学期代码" AppendDataBoundItems="True" OnSelectedIndexChanged="ddlTerm_SelectedIndexChanged">
        </asp:DropDownList>

                    <asp:Label ID="lblValidate" runat="server"></asp:Label>

                    </td>
                <td class="auto-style3">

                    <asp:Label ID="lblMessage" runat="server"></asp:Label>

                    </td>
            </tr>
            <tr>
                <td style="width:50%; text-align: left;" valign="top">
                    <asp:GridView ID="gvCourse" class="layui-table" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="课程号" DataSourceID="odsAllCourse" PageSize="7">
                        <Columns>
                            <asp:BoundField DataField="课程号" HeaderText="课程号" ReadOnly="True" SortExpression="课程号" />
                            <asp:BoundField DataField="课程名" HeaderText="课程名" SortExpression="课程名" />
                            <asp:BoundField DataField="课程学分" HeaderText="课程学分" SortExpression="课程学分" />
                            <asp:BoundField DataField="课程学时" HeaderText="课程学时" SortExpression="课程学时" />
                            <asp:BoundField DataField="课程类型" HeaderText="课程类型" SortExpression="课程类型" />
                            <asp:BoundField DataField="课程类型代码" HeaderText="课程类型代码" SortExpression="课程类型代码" Visible="False" />
                            <asp:BoundField DataField="学院" HeaderText="学院" SortExpression="学院" />
                            <asp:TemplateField HeaderText="选择课程">
                                <ItemTemplate>
                                    <asp:Button ID="btnSelect" class="layui-btn layui-btn-xs" runat="server" CommandArgument='<%# Eval("课程号") %>' OnClick="btnSelect_Click" Text="选择课程" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>

                </td>
                <td valign="top">
                    <asp:GridView ID="gvTeacherCourse" class="layui-table" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="授课号" DataSourceID="odsTC" PageSize="7">
                        <Columns>
                            <asp:BoundField DataField="授课号" HeaderText="授课号" SortExpression="授课号" ReadOnly="True" />
                            <asp:BoundField DataField="教工号" HeaderText="教工号" SortExpression="教工号" />
                            <asp:BoundField DataField="姓名" HeaderText="姓名" SortExpression="姓名" />
                            <asp:BoundField DataField="课程号" HeaderText="课程号" SortExpression="课程号" />
                            <asp:BoundField DataField="课程名" HeaderText="课程名" SortExpression="课程名" />
                            <asp:BoundField DataField="学年" HeaderText="学年" SortExpression="学年" />
                            <asp:BoundField DataField="学年代码" HeaderText="学年代码" SortExpression="学年代码" Visible="False" />
                            <asp:BoundField DataField="学期" HeaderText="学期" SortExpression="学期" />
                            <asp:BoundField DataField="学期代码" HeaderText="学期代码" SortExpression="学期代码" Visible="False" />
                            <asp:TemplateField HeaderText="删除">
                                <ItemTemplate>
                                    <asp:Button ID="btnDeleteRow" class="layui-btn layui-btn-xs" runat="server" CommandArgument='<%# Eval("授课号") %>' OnClick="btnDeleteRow_Click" Text="删除" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>

                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>

                </td>
            </tr>
        </table>
        
        <asp:ObjectDataSource ID="odsTC" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetTCByTeacherID" TypeName="hjyTableAdapters.v_教师课程TableAdapter">
            <SelectParameters>
                <asp:QueryStringParameter Name="教工号" QueryStringField="教工号" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
           
    </div>

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
        <asp:ObjectDataSource ID="odsCourseType" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetCourseType" TypeName="hjyTableAdapters.课程类型代码表TableAdapter" UpdateMethod="Update">
            <DeleteParameters>
                <asp:Parameter Name="Original_课程类型代码" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="课程类型代码" Type="String" />
                <asp:Parameter Name="课程类型" Type="String" />
                <asp:Parameter Name="排序" Type="Int32" />
                <asp:Parameter Name="是否启用" Type="String" />
                <asp:Parameter Name="备注" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="课程类型" Type="String" />
                <asp:Parameter Name="排序" Type="Int32" />
                <asp:Parameter Name="是否启用" Type="String" />
                <asp:Parameter Name="备注" Type="String" />
                <asp:Parameter Name="Original_课程类型代码" Type="String" />
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
