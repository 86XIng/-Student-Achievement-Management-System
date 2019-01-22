<%@ Page Language="C#" AutoEventWireup="true" CodeFile="news.aspx.cs" Inherits="news" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>新闻详情</title>
    <link href="./Scripts/layui/css/layui.css" rel="stylesheet" />
    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <link href="./Content/Site.css" rel="stylesheet" />
    <script src="./Scripts/jquery-1.10.2.min.js"></script>
    <link href="./Content/bootstrap.css" rel="stylesheet" />
    <script src="./Scripts/bootstrap.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div class="navbar">
                <div class="container">
                    <div class="logo col-xs-4 col-sm-4 col-md-4 col-lg-4">
                        <img src="img/new_logo2.png" alt="">
                    </div>
                    <div class="header col-xs-4 col-sm-4 col-md-4 col-lg-4">
                        <p>学生成绩管理系统</p>
                    </div>
                    <div class="search col-xs-4 col-sm-4 col-md-4 col-lg-4">
                        <input type="text">
                        <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                    </div>
                </div>
            </div>

            <div class="nav">
                <div class="container">
                    <ul class="navlist">
                
                        <li>
                            <a class="active" href="./Default.aspx">首页</a>
                        </li>
                        <li>
                            <a href="">教务概况</a>
                        </li>
                        <li>
                            <a href="">教务管理</a>
                        </li>
                        <li>
                            <a href="">质量监控</a>
                        </li>
                        <li>
                            <a href="">教学研究</a>
                        </li>
                        <li>
                            <a href="">实践教学</a>
                        </li>
                    </ul>
                </div>
            </div>
    
            <div class="container">
        
    
    
                <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="3"></li>
                    </ol>
        
                    <!-- Wrapper for slides -->
                    <div class="carousel-inner" role="listbox">
                    <div class="item active">
                        <img src="./img/012.jpg" alt="...">
                        <div class="carousel-caption">
                
                        </div>
                    </div>
                    <div class="item">
                        <img src="./img/013.jpg" alt="...">
                        <div class="carousel-caption">
                
                        </div>
                    </div>
                    <div class="item">
                        <img src="./img/0124.jpg" alt="...">
                        <div class="carousel-caption">
                
                        </div>
                    </div>
                    <div class="item">
                        <img src="./img/0125.jpg" alt="...">
                        <div class="carousel-caption">
                
                        </div>
                    </div>
                    </div>  
                </div>
        
       
                    <div class="panel panel-default">
                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                        <ItemTemplate>
                        <div class="panel-heading">
                            <ol class="breadcrumb">
                                <li><a href="./Default.aspx">首页</a></li>
                                <li> <a href="./all_news.aspx">全部新闻</a> </li>
                                <li class="active">新闻详情</li>
                            </ol>
                            <h1 class="center"><%#Eval("新闻标题") %></h1>
                            <h4 class="center">发布时间:<%#Eval("发布时间") %></h4>
                        </div>
                        <div class="panel-body" style="padding:10px 100px;font-size:17px;">
                             <div class="center">
                                 <%#Eval("新闻内容") %>
                             </div>
                        </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    </div>
        

        
        
            </div>

    
            <footer class="footer">
        
                <div class="container">
                    <img src="./img/xx.png" alt="">
                    <div class="description">
                        湖北大学成绩管理系统 <br>
                        设计者：DeepTech Team <br>
                        鄂ICP备05003305    邮编：430062 <br>
                        地址：湖北省武汉市武昌区友谊大道368号
                    </div>
            

                </div>
        
        
            </footer>
    </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:deeptechConnectionString %>" SelectCommand="SELECT [新闻标题], [新闻编号], [新闻内容], [发布时间] FROM [新闻表] WHERE ([新闻编号] = @新闻编号)">
            <SelectParameters>
                <asp:QueryStringParameter Name="新闻编号" QueryStringField="newsid" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        
    </form>
</body>
</html>
