<%@ Page Language="C#" AutoEventWireup="true" CodeFile="count_accademy_grade.aspx.cs" Inherits="manage_admin_manager_dic_count_count_accademy_grade" %>

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
        <h3 style="color:#009688">学院成绩统计</h3>
        <hr /><br />
    
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
        学院：<asp:DropDownList ID="ddlAcademy" runat="server" AutoPostBack="True" DataSourceID="odsAcademy" DataTextField="学院" DataValueField="学院号">
        </asp:DropDownList>
        
    
    
        <asp:ObjectDataSource ID="odsAcademyGrade" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="hjyTableAdapters.fun_学院学年成绩统计TableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlAcademy" Name="学院号" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <%--<asp:GridView ID="GridView1" class="layui-table" runat="server" AutoGenerateColumns="False" DataSourceID="odsAcademyGrade">
            <Columns>
                <asp:BoundField DataField="学年代码" HeaderText="学年代码" SortExpression="学年代码" />
                <asp:BoundField DataField="学期代码" HeaderText="学期代码" SortExpression="学期代码" />
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
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="odsAcademyGrade" Theme="Material">
            <Columns>
                <dx:GridViewDataTextColumn FieldName="学年代码" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="学期代码" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="课程号" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="授课号" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="课程名" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="选课人数" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewBandColumn Caption="期末卷面" VisibleIndex="12">
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="期末卷面最高分" VisibleIndex="0" Caption="最高分">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="期末卷面最低分" VisibleIndex="1" Caption="最低分">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="期末卷面平均分" VisibleIndex="2" Caption="平均分">
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:GridViewBandColumn>
                <dx:GridViewBandColumn Caption="总成绩" VisibleIndex="13">
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
    </form>
</body>
</html>
