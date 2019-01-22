<%@ Page Language="C#" AutoEventWireup="true" CodeFile="article_summary.aspx.cs" Inherits="article_summary" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>课程详情</title>
     <link href="./Scripts/layui/css/layui.css" rel="stylesheet" />
    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <link href="./Content/Site.css" rel="stylesheet" />
    <script src="./Scripts/jquery-1.10.2.min.js"></script>
    <link href="./Content/bootstrap.css" rel="stylesheet" />
    <script src="./Scripts/bootstrap.js"></script>
</head>
<body>
    <form id="form1" class="layui-form" runat="server">
    <div>
        <asp:SqlDataSource ID="selectedCourse" runat="server" ConnectionString="<%$ ConnectionStrings:deeptechConnectionString2 %>" SelectCommand="SELECT [课程封面], [课程名], [课程号], [备注], [课程学分], [课程学时], [课程类型], [课程类型代码], [学院号], [学院], [开课时间] FROM [课程表] WHERE ([课程号] = @课程号)">
            <SelectParameters>
                <asp:QueryStringParameter Name="课程号" QueryStringField="course_id" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <div class="container">
            <asp:Repeater ID="Repeater1" runat="server" DataSourceID="selectedCourse">
             <ItemTemplate>
            <div class="panel panel-default">
                <div class="panel-heading">
                    <ol class="breadcrumb">
                        <li class="active">课程描述</li>
                    </ol>                   
                    <h1 class="center"><%#Eval("课程名") %></h1>       
                </div>
                <div class="panel-body">
                    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                        <img class="center" src="./img/<%#Eval("课程封面") %>" width="150"  alt="Alternate Text" /> 
                    </div>
                    <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                    课程描述： <hr />
                    <span><%#Eval("备注") %> </span> <br />
                    </div>
                </div>
            </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
        
    </form>
</body>
</html>
