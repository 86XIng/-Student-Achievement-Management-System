<%@ Page Language="C#" AutoEventWireup="true" CodeFile="student_manager.aspx.cs" Inherits="manage_student_manager" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="../Scripts/layui/css/layui.css" rel="stylesheet" />
    <link rel="stylesheet" href="./tools/build/css/app.css" media="all">
    <script src="../Scripts/jquery-1.10.2.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="layui-layout layui-layout-admin">
            <div class="layui-header">
            <div class="layui-logo">湖北大学课程管理系统</div>
            
            <ul class="layui-nav layui-layout-right">
                <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="../img/deeptech.png" class="layui-nav-img"/>
                    DeepTech
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
                </li>
                <li class="layui-nav-item"><a href="../Default.aspx">退出</a></li>
            </ul>
            </div>
  
            <div class="layui-side layui-bg-black kit-side">
            <div class="layui-side-scroll">
                <div class="kit-side-fold"><i class="layui-icon">&#xe625; </i></div>
                <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
                <ul class="layui-nav layui-nav-tree" lay-filter="kitNavbar" kit-navbar>
                     <li class="layui-nav-item layui-nav-itemed">
                        <a href="javascript:;"><i class="fa fa-plug" aria-hidden="true"></i><span>学生</span></a>
                        <dl class="layui-nav-child">
                            <dd><a href="javascript:;" kit-target data-options="{url:'student_manager_dic/add_course.aspx',icon:'&#xe612;',title:'选课',id:'1'}"><i class="layui-icon">&#xe612;  </i><span>选课</span></a></dd>
                            <dd><a href="javascript:;" kit-target data-options="{url:'student_manager_dic/drop_course.aspx',icon:'&#xe857;',title:'退课',id:'2'}"><i class="layui-icon">&#xe857;  </i><span>退课</span></a></dd>
                            <dd><a href="javascript:;" kit-target data-options="{url:'student_manager_dic/view_selected_course.aspx',icon:'&#xe650;',title:'查看所选课程',id:'3'}"><i class="layui-icon">&#xe650;  </i><span>查看所选课程</span></a></dd>
                            <dd><a href="javascript:;" kit-target data-options="{url:'student_manager_dic/view_score.aspx',icon:'&#xe635;',title:'查看成绩',id:'4'}"><i class="layui-icon">&#xe635;  </i><span>查看成绩</span></a></dd>
                            <dd><a href="javascript:;" kit-target data-options="{url:'student_manager_dic/change_self_info.aspx',icon:'&#xe634;',title:'修改个人信息',id:'5'}"><i class="layui-icon">&#xe634;  </i><span>修改个人信息</span></a></dd>
                         <dd><a href="javascript:;" kit-target data-options="{url:'student_manager_dic/credit_stat.aspx',icon:'&#xe634;',title:'学分统计',id:'6'}"><i class="layui-icon">&#xe634;  </i><span>学分统计</span></a></dd>
                        </dl>
                    </li>
                    <li class="layui-nav-item">
                        <a href="javascript:;" data-url="/components/table/table.html" data-name="table" kit-loader><i class="fa fa-plug" aria-hidden="true"></i><span>其他</span></a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="layui-body" id="container">
            <!-- 内容主体区域 -->
            <div style="padding: 15px;">主体内容加载中,请稍等...</div>
        </div>
  
            <div class="layui-footer">
            <!-- 底部固定区域 -->
            © deeptech - deeptech团队制作
            </div>
        </div>
        <script src="../Scripts/layui/layui.js"></script>
        <script src="../Scripts/jquery-1.10.2.min.js"></script>
        <script>
            var message;
           
            layui.config({
                base: './tools/build/js/'
            }).use(['app', 'message'], function () {
                var app = layui.app,
                    $ = layui.jquery,
                    layer = layui.layer;
                    //var int=self.setInterval("refresh()",1000);
                    
                    
                //将message设置为全局以便子页面调用
                message = layui.message;
                //主入口
                app.set({
                    type: 'iframe'
                }).init();
            });
            //$('iframe')
            
            
        </script>
    </form>
</body>
</html>