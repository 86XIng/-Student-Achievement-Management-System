<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin_manager.aspx.cs" Inherits="manage_manage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="./tools/layui/css/layui.css" rel="stylesheet" />
    <link rel="stylesheet" href="./tools/build/css/app.css" media="all">
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
                    <li class="layui-nav-item  layui-nav-itemed">
                        <a class="" href="javascript:;"><i class="fa fa-plug" aria-hidden="true"></i><span>用户管理</span></a>
                        <dl class="layui-nav-child">
                            <dd><a href="javascript:;" kit-target data-options="{url:'admin_manager_dic/manage_user/change_personal_info.aspx',icon:'&#xe612;',title:'修改个人信息',id:'1'}"><i class="layui-icon">&#xe612;  </i><span> 修改个人信息</span></a></dd>
                            <dd><a href="javascript:;" kit-target data-options="{url:'admin_manager_dic/manage_user/change_teacher_info.aspx',icon:'&#xe650;',title:'修改老师信息',id:'2'}",><i class="layui-icon">&#xe650;  </i><span> 修改老师信息</span></a></dd>
                            <dd><a href="javascript:;" kit-target data-options="{url:'admin_manager_dic/manage_user/change_student_info.aspx',icon:'&#xe650;',title:'修改学生信息',id:'3'}"><i class="layui-icon">&#xe650;  </i><span> 修改学生信息</span></a></dd>
                            <dd><a href="javascript:;" kit-target data-options="{url:'admin_manager_dic/manage_user/set_system_switch.aspx',icon:'&#xe650;',title:'设置系统开关',id:'4'}"><i class="layui-icon">&#xe650;  </i><span> 设置系统开关</span></a></dd>
                            <dd><a href="javascript:;" kit-target data-options="{url:'admin_manager_dic/manage_user/release_news.aspx',icon:'&#xe650;',title:'发布新闻',id:'5'}"><i class="layui-icon">&#xe650;  </i><span> 发布新闻</span></a></dd>
                    	</dl>
                    </li>
                     <li class="layui-nav-item layui-nav-itemed">
                        <a class="" href="javascript:;"><i class="fa fa-plug" aria-hidden="true"></i><span>课程管理</span></a>
                        <dl class="layui-nav-child">
                            <dd><a href="javascript:;" kit-target data-options="{url:'admin_manager_dic/manage_course/change_course_info.aspx',icon:'&#xe63c;',title:'修改课程信息',id:'6'}"><i class="layui-icon">&#xe63c;  </i><span>修改课程信息</span></a></dd>
                            <dd><a href="javascript:;" kit-target data-options="{url:'admin_manager_dic/manage_course/distribute_course.aspx',icon:'&#xe63c;',title:'分配课程',id:'7'}"><i class="layui-icon">&#xe63c;  </i><span>分配课程</span></a></dd>
                    	</dl>
                    </li>
                     
                    
                    <li class="layui-nav-item">
                        <a href="javascript:;" data-url="/components/table/table.html" data-name="table" kit-loader><i class="fa fa-plug" aria-hidden="true"></i><span>统计</span></a>
                        <dl class="layui-nav-child">
                            <dd><a href="javascript:;" kit-target data-options="{url:'admin_manager_dic/count/count_teacher_work.aspx',icon:'&#xe63c;',title:'教师工作量统计',id:'8'}"><i class="layui-icon">&#xe63c;  </i><span>教师工作量</span></a></dd>
                            <dd><a href="javascript:;" kit-target data-options="{url:'admin_manager_dic/count/count_student_ByYear.aspx',icon:'&#xe63c;',title:'学生学分',id:'9'}"><i class="layui-icon">&#xe63c;  </i><span>学生学分</span></a></dd>
                            <dd><a href="javascript:;" kit-target data-options="{url:'admin_manager_dic/count/count_grade.aspx',icon:'&#xe63c;',title:'学生成绩',id:'10'}"><i class="layui-icon">&#xe63c;  </i><span>学生成绩</span></a></dd>
                            <dd><a href="javascript:;" kit-target data-options="{url:'admin_manager_dic/count/count_accademy_grade.aspx',icon:'&#xe63c;',title:'学院成绩',id:'11'}"><i class="layui-icon">&#xe63c;  </i><span>学院成绩</span></a></dd>
                            <dd><a href="javascript:;" kit-target data-options="{url:'admin_manager_dic/count/count_graduate.aspx',icon:'&#xe63c;',title:'毕业学生',id:'12'}"><i class="layui-icon">&#xe63c;  </i><span>毕业学生</span></a></dd>
                            <dd><a href="javascript:;" kit-target data-options="{url:'admin_manager_dic/count/count_top_grade.aspx',icon:'&#xe63c;',title:'成绩统计',id:'13'}"><i class="layui-icon">&#xe63c;  </i><span>成绩统计</span></a></dd>
                    	</dl>
                    </li>
                     <li class="layui-nav-item layui-nav-itemed">
                        <a href="javascript:;" data-url="/components/table/table.html" data-name="table" kit-loader><i class="fa fa-plug" aria-hidden="true"></i><span>查看日志</span></a>
                        <dl class="layui-nav-child">
                            <dd><a href="javascript:;" kit-target data-options="{url:'admin_manager_dic/log/log.aspx',icon:'&#xe63c;',title:'查看日志',id:'14'}"><i class="layui-icon">&#xe63c;  </i><span>查看日志</span></a></dd>                   
                    	</dl>
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
        <script src="./tools/layui/layui.js"></script>
        <script src="./tools/bootstrap/js/jquery-2.1.0.js"></script>
        <script>
            var message;
            layui.config({
                base: './tools/build/js/'
            }).use(['app', 'message'], function () {
                var app = layui.app,
                    $ = layui.jquery,
                    layer = layui.layer;
                //将message设置为全局以便子页面调用
                message = layui.message;
                //主入口
                app.set({
                    type: 'iframe'
                }).init();
            });
        </script>
    </form>
</body>
</html>
