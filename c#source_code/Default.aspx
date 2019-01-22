<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%--<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>--%>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

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
                    <a class="active" href="">首页</a>
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
            <!-- <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                <a href="">首页</a>
            </div>
            <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                <a href="">教务概况</a>
            </div>
            <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                <a href="">教务管理</a>
            </div>
            <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                <a href="">质量监控</a>
            </div>
            <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                <a href="">教学研究</a>
            </div>
            <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2">
                <a href="">实践教学</a>
            </div> -->
        </div>
    </div>

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
    
    <div class="importantNews">
        <div class="container-fluid">
            <div class="row">
                <div class="left col-xs-2 col-sm-2 col-md-2 col-lg-2">
                    <p>
                    <span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>
                    <span onclick="location='all_news.aspx'">重要通知：</span> 
                    </p>
                </div>
                <div class="right col-xs-10 col-sm-10 col-md-10 col-lg-10">
                    <ul>
                        <asp:SqlDataSource ID="sqlNews" runat="server" ConnectionString="<%$ ConnectionStrings:deeptechConnectionString %>" SelectCommand="SELECT [新闻编号], [新闻标题], [发布时间] FROM [V_新闻表降序排序]"></asp:SqlDataSource>
                        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="sqlNews">
                            <ItemTemplate>
                                <li><a href='./news.aspx?newsid=<%#Eval("新闻编号") %>'><span><%#Eval("发布时间") %></span><%#Eval("新闻标题") %></a></li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                </div>
            </div>
        </div>
        
    </div>

    <div class="news">
        <div class="news_inner">
            <div class="focus">
                <div class="row">
                    <div class="card col-xs-2 col-sm-2 col-md-2 col-lg-2">
                        <h3 class="text-center">
                            聚焦<strong>&nbsp; 湖大 </strong>
                        </h3>
                        <h1 class="text-center" style="font-size: large">
                            日思日睿
                            <br>
                            笃志笃行
                        </h1>
                        <p>
                            <span style="color: rgb(0, 0, 0);  font-size: 15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: center; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgba(0, 185, 119, 0.05); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">湖大信息&nbsp; </span>权威发布</p>
                        <p>
                            <span style="color: rgb(0, 0, 0);  font-size: 15px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: center; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgba(0, 185, 119, 0.05); text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">包括话题文章和各类活动</span></p>
                        <p>
                        <a class="btn btn-warning" href="all_news.aspx">学术动态</a></p>
&nbsp;</div>
                    <div class="card col-xs-2 col-sm-2 col-md-2 col-lg-2">
                        <div class="imgBox">
                            <img src="./img/400100133.jpg" alt="">
                        </div>
                        
                        <h3>
                            体育运动学讲座
                        </h3>
                        <p>
                            2018年10月11日
                        </p>
                    </div>
                    <div class="card col-xs-2 col-sm-2 col-md-2 col-lg-2">
                        <div class="imgBox">
                            <img src="./img/400100107.jpg" alt="">
                        </div>
                        
                        <h3>
                            图书管理学讲座
                        </h3>
                        <p>
                            2018年10月21日
                        </p>
                    </div>
                    <div class="card col-xs-2 col-sm-2 col-md-2 col-lg-2">
                        <div class="imgBox">
                            <img src="./img/400100057.png" alt="">
                        </div>
                        
                        <h3>
                            图书管理学讲座
                        </h3>
                        <p>
                            2018年10月31日
                        </p>
                    </div>
                    
                </div>
            </div>
        </div>
        
    </div>
    <div class="allCourses">
        <div class="container">
            <div class="row">  
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <h1 class="title">
                        全部课程
                     
                        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DataSetTableAdapters.课程表TableAdapter" UpdateMethod="Update">
                            <DeleteParameters>
                                <asp:Parameter Name="Original_课程号" Type="String" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="课程号" Type="String" />
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
                                <asp:Parameter Name="Original_课程号" Type="String" />
                            </UpdateParameters>
                        </asp:ObjectDataSource>
                    </h1>
                </div>
                <asp:Repeater ID="allCourses" runat="server" DataSourceID="courseSource" >
                    <ItemTemplate>
                    <div class="card col-xs-3 col-sm-3 col-md-3 col-lg-3" onclick="location='article.aspx?course_id=<%#Eval("课程号") %>'">
                      <p>
                        <%#Eval("课程名") %>
                      </p>
                        <div class="imgBox">
                            <img src="./img/<%#Eval("课程封面") %>" alt="">
                        </div>
                    </div>
                    </ItemTemplate>
                </asp:Repeater>
                
                <asp:SqlDataSource ID="courseSource" runat="server" ConnectionString="<%$ ConnectionStrings:deeptechConnectionString %>" SelectCommand="SELECT [课程号], [课程名], [课程学分], [课程封面] FROM [课程表] WHERE ([课程号] &lt;= @课程号)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="10" Name="课程号" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                
                
                <div class="card col-xs-3 col-sm-3 col-md-3 col-lg-3" onclick="location='/list'">
                    <p>
                       更多课程>>
                    </p>
                </div>
                <div class="card col-xs-3 col-sm-3 col-md-3 col-lg-3" onclick="location='/login/membership_login.aspx'">
                    <p>
                       进入选课
                    </p>
                </div>
                
            </div>
        </div>
    </div>
</asp:Content>
