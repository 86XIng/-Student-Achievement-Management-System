<%@ Page Language="C#" AutoEventWireup="true" CodeFile="count_student_ByYear.aspx.cs" Inherits="manage_admin_manager_dic_count_count_student_ByYear" %>

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
        <h3 style="color:#009688">学生学分及学时统计</h3>
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
        
    
        <%--<asp:GridView ID="GridView1" class="layui-table" runat="server" AutoGenerateColumns="False" DataSourceID="odsStudentCredit">
            <Columns>
                <asp:BoundField DataField="单位" HeaderText="单位" SortExpression="单位" />
                <asp:BoundField DataField="学号" HeaderText="学号" SortExpression="学号" />
                <asp:BoundField DataField="姓名" HeaderText="姓名" SortExpression="姓名" />
                <asp:BoundField DataField="上学期选课门数" HeaderText="上学期选课门数" SortExpression="上学期选课门数" />
                <asp:BoundField DataField="上学期学时总数" HeaderText="上学期学时总数" SortExpression="上学期学时总数" />
                <asp:BoundField DataField="上学期学分总数" HeaderText="上学期学分总数" SortExpression="上学期学分总数" />
                <asp:BoundField DataField="下学期选课门数" HeaderText="下学期选课门数" SortExpression="下学期选课门数" />
                <asp:BoundField DataField="下学期学时总数" HeaderText="下学期学时总数" SortExpression="下学期学时总数" />
                <asp:BoundField DataField="下学期学分总数" HeaderText="下学期学分总数" SortExpression="下学期学分总数" />
                <asp:BoundField DataField="选课门数" HeaderText="选课门数" SortExpression="选课门数" />
                <asp:BoundField DataField="学时总数" HeaderText="学时总数" SortExpression="学时总数" />
                <asp:BoundField DataField="学分总数" HeaderText="学分总数" SortExpression="学分总数" />
            </Columns>
        </asp:GridView>--%>
        
    
    
        <asp:ObjectDataSource ID="odsStudentCredit" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="hjyTableAdapters.fun_学生学时及学分TableAdapter">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlYear" Name="学年代码" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:ObjectDataSource>
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="odsStudentCredit" Theme="Material">
            <Columns>
                <dx:GridViewDataTextColumn FieldName="单位" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="学号" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="姓名" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewBandColumn Caption="本学年上学期" VisibleIndex="10">
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="上学期选课门数" VisibleIndex="0" Caption="选课门数">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="上学期学时总数" VisibleIndex="1" Caption="学时总数">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="上学期学分总数" VisibleIndex="2" Caption="学分总数">
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:GridViewBandColumn>
                <dx:GridViewBandColumn Caption="本学年下学期" VisibleIndex="11">
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="下学期选课门数" VisibleIndex="0" Caption="选课门数">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="下学期学时总数" VisibleIndex="1" Caption="学时总数">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="下学期学分总数" VisibleIndex="2" Caption="学分总数">
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:GridViewBandColumn>
                <dx:GridViewBandColumn Caption="本学年" VisibleIndex="12">
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="选课门数" VisibleIndex="0">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="学时总数" VisibleIndex="1">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="学分总数" VisibleIndex="2">
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:GridViewBandColumn>
            </Columns>
        </dx:ASPxGridView>
        </div>
    </form>
</body>
</html>
