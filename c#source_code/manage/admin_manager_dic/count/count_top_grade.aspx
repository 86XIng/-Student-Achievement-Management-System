<%@ Page Language="C#" AutoEventWireup="true" CodeFile="count_top_grade.aspx.cs" Inherits="manage_admin_manager_dic_count_count_top_grade" %>

<%@ Register assembly="DevExpress.Web.ASPxPivotGrid.v17.1, Version=17.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPivotGrid" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="padding:30px">
    
    
        <dx:ASPxPivotGrid ID="ASPxPivotGrid1" runat="server" ClientIDMode="AutoID" DataSourceID="ObjectDataSource1">
            <Fields>
                <dx:PivotGridField ID="field" Area="DataArea" AreaIndex="0" FieldName="学年" Name="field" Options-ShowCustomTotals="False" Options-ShowGrandTotal="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="field1" Area="DataArea" AreaIndex="1" FieldName="学期" Name="field1" Options-ShowCustomTotals="False" Options-ShowGrandTotal="False" Options-ShowTotals="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="field2" Area="RowArea" AreaIndex="0" FieldName="课程号" Name="field2">
                </dx:PivotGridField>
                <dx:PivotGridField ID="field3" Area="RowArea" AreaIndex="1" FieldName="课程名" Name="field3">
                </dx:PivotGridField>
                <dx:PivotGridField ID="field4" Area="DataArea" AreaIndex="2" FieldName="平均成绩" Name="field4" Options-ShowCustomTotals="False" Options-ShowGrandTotal="False" Options-ShowTotals="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="field5" Area="DataArea" AreaIndex="3" FieldName="教师姓名" Name="field5" Options-ShowCustomTotals="False" Options-ShowGrandTotal="False" Options-ShowTotals="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="field6" Area="DataArea" AreaIndex="4" FieldName="学生姓名" Name="field6" Options-ShowCustomTotals="False" Options-ShowGrandTotal="False" Options-ShowTotals="False">
                </dx:PivotGridField>
                <dx:PivotGridField ID="field7" Area="DataArea" AreaIndex="5" FieldName="成绩" Name="field7" Options-ShowCustomTotals="False" Options-ShowGrandTotal="False" Options-ShowTotals="False">
                </dx:PivotGridField>
            </Fields>
            <OptionsView ShowColumnGrandTotalHeader="False" ShowColumnGrandTotals="False" ShowRowGrandTotals="False" />
            <OptionsPager RowsPerPage="30">
            </OptionsPager>
            <optionsdata dataprocessingengine="LegacyOptimized" />
        </dx:ASPxPivotGrid>
        <br />
        <br />
        <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource1">
            <Columns>
                <dx:GridViewDataTextColumn FieldName="学年" VisibleIndex="0">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="学期" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="课程号" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="课程名" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="平均成绩" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="教师姓名" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="学生姓名" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="成绩" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <br />
        <br />
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="xingwenshengTableAdapters.成绩统计TableAdapter"></asp:ObjectDataSource>
        <br />
        </div>
    </form>
</body>
</html>
