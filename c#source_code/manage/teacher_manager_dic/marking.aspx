<%@ Page Language="C#" AutoEventWireup="true" CodeFile="marking.aspx.cs" Inherits="manage_teacher_manager_dic_marking" EnableEventValidation="false" %>

<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>打分</title>
    <link href="../tools/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <link href="../tools/layui/css/layui.css" rel="stylesheet" />
    <style>
        .layui-table td, .layui-table th{
            position:initial;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h3 style="color:#009688">打分</h3>
        <hr />
        <asp:Label ID="Label1" runat="server" Text="平时成绩所占比例"></asp:Label>
        <asp:TextBox ID="txtPacPro" runat="server"></asp:TextBox>
        <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="txtPacPro" ErrorMessage="请输入0-100之间的数" MaximumValue="100" MinimumValue="0" Type="Double"></asp:RangeValidator>
        <br />
        <asp:Label ID="Label2" runat="server" Text="期中成绩所占比例"></asp:Label>
        <asp:TextBox ID="txtMidPro" runat="server"></asp:TextBox>
        <asp:RangeValidator ID="RangeValidator3" runat="server" ControlToValidate="txtMidPro" ErrorMessage="请输入0-100之间的数" MaximumValue="100" MinimumValue="0" Type="Double"></asp:RangeValidator>
        <br />
        <asp:Label ID="Label3" runat="server" Text="期末成绩所占比例"></asp:Label>
        <asp:TextBox ID="txtEndPro" runat="server" OnTextChanged="txtEndPro_TextChanged"></asp:TextBox>
        <asp:RangeValidator ID="RangeValidator4" runat="server" ControlToValidate="txtEndPro" ErrorMessage="请输入0-100之间的数" MaximumValue="100" MinimumValue="0" Type="Double"></asp:RangeValidator>
        <br />
        <asp:Label ID="Label4" runat="server" Text="请选择打分的课程"></asp:Label>
        <asp:DropDownList ID="ddlTCID" runat="server" DataSourceID="odsCourse" DataTextField="课程名" DataValueField="授课号" OnSelectedIndexChanged="ddlTCID_SelectedIndexChanged" AppendDataBoundItems="True" AutoPostBack="True">
        </asp:DropDownList>
        <asp:Button ID="btnOk" class="layui-btn layui-btn-xs" runat="server" Text="确定" OnClick="btnOk_Click" />
        <asp:Label ID="lblCourse" runat="server" Visible="False"></asp:Label>
        <asp:GridView ID="gvCourse" class="layui-table" runat="server" AutoGenerateColumns="False" DataKeyNames="学号" Visible="False">
            <Columns>
                <asp:BoundField DataField="教工号" HeaderText="教工号" SortExpression="教工号" Visible="False" />
                <asp:BoundField DataField="授课号" HeaderText="授课号" ReadOnly="True" SortExpression="授课号" />
                <asp:BoundField DataField="学号" HeaderText="学号" ReadOnly="True" SortExpression="学号" />
                <asp:BoundField DataField="姓名" HeaderText="姓名" SortExpression="姓名" />
                <asp:BoundField DataField="课程名" HeaderText="课程名" SortExpression="课程名" />
                <asp:BoundField DataField="专业" HeaderText="专业" SortExpression="专业" />
                <asp:BoundField DataField="平时成绩" HeaderText="平时成绩" SortExpression="平时成绩" Visible="False" />
                <asp:BoundField DataField="期中成绩" HeaderText="期中成绩" SortExpression="期中成绩" Visible="False" />
                <asp:BoundField DataField="期末成绩" HeaderText="期末成绩" SortExpression="期末成绩" Visible="False" />
                <asp:BoundField DataField="成绩" HeaderText="成绩" SortExpression="成绩" Visible="False" />
                <asp:TemplateField HeaderText="平时成绩">
                    <ItemTemplate>
                        <asp:TextBox ID="txtPac" runat="server" OnTextChanged="txtPac_TextChanged" AutoPostBack="True" Text='<%# Bind("平时成绩") %>'></asp:TextBox>
                        <asp:Label ID="lblPac" runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="期中成绩">
                    <ItemTemplate>
                        <asp:TextBox ID="txtMid" runat="server" OnTextChanged="txtMid_TextChanged" AutoPostBack="True" Text='<%# Bind("期中成绩") %>'></asp:TextBox>
                        <asp:Label ID="lblMid" runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="期末成绩">
                    <ItemTemplate>
                        <asp:TextBox ID="txtEnd" runat="server" OnTextChanged="txtEnd_TextChanged" AutoPostBack="True" Text='<%# Bind("期末成绩") %>'></asp:TextBox>
                        <asp:Label ID="lblEnd" runat="server"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="成绩">
                    <ItemTemplate>
                        <asp:Label ID="lblScore" runat="server" Text='<%# Eval("成绩") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
&nbsp;<asp:ObjectDataSource ID="objCourseInfo" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="selectCourseScore" TypeName="chenxueTableAdapters.V_打分表1TableAdapter">
            <SelectParameters>
                <asp:SessionParameter Name="教工号" SessionField="username" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsCourseDDL" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByDDL" TypeName="hjyTableAdapters.V_打分表TableAdapter">
            <SelectParameters>
                <asp:SessionParameter Name="教工号" SessionField="username" Type="String" />
                <asp:ControlParameter ControlID="lblCourse" Name="授课号" PropertyName="Text" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsCourse" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDDLByTCID" TypeName="chenxueTableAdapters.V_老师上课信息TableAdapter">
            <SelectParameters>
                <asp:SessionParameter Name="教工号" SessionField="username" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <asp:ObjectDataSource ID="odsSubmit" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="insertGrade" TypeName="hjyTableAdapters.QueriesTableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlTCID" Name="授课号" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnSave" class="layui-btn" runat="server" Text="保存" Visible="False" OnClick="btnSave_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnSubmit" class="layui-btn" runat="server" Text="提交" Visible="False" OnClick="btnSubmit_Click" />
    &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnDc" class="layui-btn" runat="server" Text="导出" Visible="False" OnClick="btnDc_Click" />
    </div>
    </form>
</body>
</html>
