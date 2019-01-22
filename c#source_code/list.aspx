<%@ Page Language="C#" AutoEventWireup="true" CodeFile="list.aspx.cs" Inherits="list" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>全部课程</title>
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
                        <a href="./Default.aspx">首页</a>
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
                    ...
                    </div>
                </div>
                <div class="item">
                    <img src="./img/013.jpg" alt="...">
                    <div class="carousel-caption">
                    ...
                    </div>
                </div>
                <div class="item">
                    <img src="./img/0124.jpg" alt="...">
                    <div class="carousel-caption">
                    ...
                    </div>
                </div>
                <div class="item">
                    <img src="./img/0125.jpg" alt="...">
                    <div class="carousel-caption">
                    ...
                    </div>
                </div>
                </div>  
            </div>
        
       
            <div class="panel panel-default">
                    <div class="panel-heading">
                        <ol class="breadcrumb">
                            <li><a href="./Default.aspx">首页</a></li>
                            <li class="active">全部课程</li>
                        </ol>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:deeptechConnectionString %>" SelectCommand="SELECT [课程号], [课程名], [课程学分], [课程学时], [课程类型], [学院], [开课时间] FROM [课程表]"></asp:SqlDataSource>
                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1" OnItemCommand="Repeater1_ItemCommand">
                            <HeaderTemplate>
                                <script>
                                    var json = [];
                                </script>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <script>
                                    json.push({ '课程号': '<%#Eval("课程号")%>', '课程名': '<%#Eval("课程名")%>', '课程学分': '<%#Eval("课程学分")%>', '课程学时': '<%#Eval("课程学时")%>', '课程类型': '<%#Eval("课程类型")%>', '学院': '<%#Eval("学院")%>', '开课时间': '<%#Eval("开课时间")%>' });
                                </script>
                            </ItemTemplate>
                            <FooterTemplate> 
                                <table class="layui-hide" id="test" lay-filter="test"></table>
                                <script src="./Scripts/layui/layui.js"></script>
                                <script>
                                    var json = JSON.stringify(json);
                                    var datas = JSON.parse(json);
                                    layui.use('table', function () {
                                        var table = layui.table;
                                        table.render({
                                            elem: '#test'
                                            , title: '用户数据表'
                                            , totalRow: true
                                            , cols: [[
                                                { field: '课程号', width: 80, title: '课程号', sort: true, totalRowText: '合计' },
                                                { field: '课程名', title: '课程名', sort: true },
                                                { field: '课程学分', width: 100, title: '课程学分', sort: true, totalRow: true },
                                                { field: '课程学时', title: '课程学时', sort: true },
                                                { field: '课程类型', title: '课程类型', sort: true },
                                                { field: '学院', title: '学院', sort: true },
                                                { field: '开课时间', title: '开课时间', sort: true }
                                            ]]
                                            , data: datas
                                            , page: true
                                        });
                                        table.on('row(test)', function (obj) {
                                            var data = obj.data;
                                            console.log(data);
                                            layer.open({
                                                title: '课程描述',
                                                type: 2,
                                                area: ['800px', '600px'],
                                                content: './article_summary.aspx?course_id=' + data.课程号,
                                                btn: '查看详情',
                                                yes: function () {
                                                    layer.closeAll();
                                                    console.log(parent);
                                                    parent.location = './article.aspx?course_id=' + data.课程号;
                                                }
                                            });

                                            //标注选中样式
                                            obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
                                        });
                                    });
                                </script>
                            </FooterTemplate>
                        </asp:Repeater>
                    </div>
                </div> 
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
    </form>
</body>
</html>

