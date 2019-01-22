<%@ Page Language="C#" AutoEventWireup="true" CodeFile="article.aspx.cs" Inherits="article" %>

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
                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="selectedCourse" OnItemCommand="Repeater1_ItemCommand">
                        <ItemTemplate>
                        <div class="panel-heading">
                            <ol class="breadcrumb">
                                <li><a href="./Default.aspx">首页</a></li>
                                <li><a href="./list.aspx">全部课程</a></li>
                                <li class="active">课程详情</li>
                            </ol>
                            
                                
                                        <h1 class="center"><%#Eval("课程名") %></h1>
                                    
                            
                        </div>
                        <div class="panel-body">
                            <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                                <img class="center" src="./img/<%#Eval("课程封面") %>" width="300" alt="Alternate Text" /> 
                            </div>
                            <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                                
                                课程学分：<span><%#Eval("课程学分") %></span><hr />课程学时：<span><%#Eval("课程学时") %></span><hr />课程类型：<span><%#Eval("课程类型") %></span><hr />学院：<span><%#Eval("学院") %></span><hr />开课时间：<span><%#Eval("开课时间") %></span><hr />课程描述：<span><%#Eval("备注") %></span><br /><hr /><a class="layui-btn layui-btn-radius layui-btn-normal" onclick="location='./login/membership_login.aspx'">进入选课</a>
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
        <asp:SqlDataSource ID="selectedCourse" runat="server" ConnectionString="<%$ ConnectionStrings:deeptechConnectionString %>" SelectCommand="SELECT [课程名], [课程学分], [课程学时], [课程类型], [学院号], [学院], [开课时间], [课程封面], [备注] FROM [课程表] WHERE ([课程号] = @课程号)">
            <SelectParameters>
                <asp:QueryStringParameter Name="课程号" QueryStringField="course_id" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        
    </form>
</body>
</html>
