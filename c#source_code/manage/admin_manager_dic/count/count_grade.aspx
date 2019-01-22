<%@ Page Language="C#" AutoEventWireup="true" CodeFile="count_grade.aspx.cs" Inherits="manage_admin_manager_dic_count_count_grade" %>

<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="../../tools/layui/css/layui.css" rel="stylesheet" />
    <title></title>
    <style type="text/css">

table{border-collapse:collapse;border-spacing:0}
.layui-table td, .layui-table th{
            position:initial;
        }
        </style>
    
</head>
<body>
    <form id="form1" runat="server">
    <div style="padding:30px">
        <h3 style="color:#009688">某学年学期按单位、课程的学生成绩统计</h3>
        <hr /><br />
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
            学年：<asp:DropDownList ID="ddlYear" runat="server" AutoPostBack="True" DataSourceID="odsYear" DataTextField="学年" DataValueField="学年代码">
            </asp:DropDownList>
        
    
        学期：<asp:DropDownList ID="ddlTerm" runat="server" AutoPostBack="True" DataSourceID="odsTerm" DataTextField="学期" DataValueField="学期代码">
        </asp:DropDownList>
        
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
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="odsStudentGrade" Theme="Material">
            <Columns>
                <dx:GridViewDataTextColumn FieldName="单位" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="课程号" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="授课号" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="课程名" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="选课人数" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewBandColumn Caption="期末卷面" VisibleIndex="10">
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="期末卷面最高分" VisibleIndex="0" Caption="最高分">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="期末卷面最低分" VisibleIndex="1" Caption="最低分">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="期末卷面平均分" VisibleIndex="2" Caption="平均分">
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:GridViewBandColumn>
                <dx:GridViewBandColumn Caption="总成绩" VisibleIndex="11">
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="总成绩最高分" VisibleIndex="0" Caption="最高分">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="总成绩最低分" VisibleIndex="1" Caption="最低分">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="总成绩平均分" VisibleIndex="2" Caption="平均分">
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:GridViewBandColumn>
            </Columns>
        </dx:ASPxGridView>
    
    </div>
        <%--<asp:GridView ID="GridView1" class="layui-table" runat="server" AutoGenerateColumns="False" DataSourceID="odsStudentGrade">
            <Columns>
                <asp:BoundField DataField="单位" HeaderText="单位" SortExpression="单位" />
                <asp:BoundField DataField="课程号" HeaderText="课程号" SortExpression="课程号" />
                <asp:BoundField DataField="授课号" HeaderText="授课号" SortExpression="授课号" />
                <asp:BoundField DataField="课程名" HeaderText="课程名" SortExpression="课程名" />
                <asp:BoundField DataField="选课人数" HeaderText="选课人数" SortExpression="选课人数" />
                <asp:BoundField DataField="期末卷面最高分" HeaderText="期末卷面最高分" SortExpression="期末卷面最高分" />
                <asp:BoundField DataField="期末卷面最低分" HeaderText="期末卷面最低分" SortExpression="期末卷面最低分" />
                <asp:BoundField DataField="期末卷面平均分" HeaderText="期末卷面平均分" SortExpression="期末卷面平均分" />
                <asp:BoundField DataField="总成绩最高分" HeaderText="总成绩最高分" SortExpression="总成绩最高分" />
                <asp:BoundField DataField="总成绩最低分" HeaderText="总成绩最低分" SortExpression="总成绩最低分" />
                <asp:BoundField DataField="总成绩平均分" HeaderText="总成绩平均分" SortExpression="总成绩平均分" />
            </Columns>
        </asp:GridView>--%>
        <asp:ObjectDataSource ID="odsStudentGrade" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="hjyTableAdapters.fun_学年成绩统计TableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlYear" Name="学年代码" PropertyName="SelectedValue" Type="String" />
                <asp:ControlParameter ControlID="ddlTerm" Name="学期代码" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        
    </form>
</body>
</html>
