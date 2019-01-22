<%@ Page Language="C#" AutoEventWireup="true" CodeFile="all_course.aspx.cs" Inherits="manage_all_course" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="../Scripts/layui/css/layui.css" rel="stylesheet" />
    <script src="../Scripts/jquery-1.10.2.min.js"></script>
    <link href="../Content/bootstrap.css" rel="stylesheet" />
    <script src="../Scripts/bootstrap.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        
    </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:deeptechConnectionString %>" SelectCommand="SELECT [课程号], [课程学时], [课程学分], [课程名], [课程类型], [课程类型代码], [学院号], [学院], [开课时间], [课程封面], [备注] FROM [课程表]"></asp:SqlDataSource>
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
            <HeaderTemplate>
                <script>
                    var json = [];
                </script>
            </HeaderTemplate>
            <ItemTemplate>
                <script>
                    json.push({ '课程号': '<%#Eval("课程号")%>', '课程名': '<%#Eval("课程名")%>', '课程学分': '<%#Eval("课程学分")%>', '课程封面': '<%#Eval("课程封面")%>', '课程学时': '<%#Eval("课程学时")%>', '课程类型': '<%#Eval("课程类型")%>', '学院': '<%#Eval("学院")%>', '开课时间': '<%#Eval("开课时间")%>' });
                </script>
            </ItemTemplate>
            <FooterTemplate> 
                <table class="layui-hide" id="test" lay-filter="test"></table>
                <script type="text/html" id="barDemo">
                  <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
                  <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
                </script>
                <script src="../Scripts/layui/layui.js"></script>
                <script>
                    var json = JSON.stringify(json);
                    var datas = JSON.parse(json);
                    layui.use('table', function () {
                        var table = layui.table;
                        table.render({
                            elem: '#test'
                            , title: '用户数据表'
                            , toolbar: 'default'
                            , cols: [[
                                { field: '课程号', width: 80, title: '课程号', sort: true, totalRowText: '合计' },
                                { field: '课程名', title: '课程名', sort: true },
                                { field: '课程学分', width: 100, title: '课程学分', sort: true, totalRow: true },
                                { field: '课程学时', title: '课程学时', sort: true },
                                { field: '课程类型', title: '课程类型', sort: true },
                                { field: '学院', title: '学院', sort: true },
                                { field: '开课时间', title: '开课时间', sort: true },
                                { field: '课程封面', title: '课程封面', templet: '<div><img src="../img/{{ d.课程封面}}" style="width: 20%;"></div>', style: 'height:48px;width:48px;line-height:48px!important;' },
                                { fixed: 'right', title: '操作', toolbar: '#barDemo', width: 150 }
                            ]]
                            , data: datas
                            , page: true
                        });
                        table.on('toolbar(test)', function (obj) {
                            var checkStatus = table.checkStatus(obj.config.id)
                            , data = checkStatus.data; //获取选中的数据
                            switch (obj.event) {
                                case 'add':
                                    layer.msg('添加');
                                    break;
                                case 'update':
                                    if (data.length === 0) {
                                        layer.msg('请选择一行');
                                    } else if (data.length > 1) {
                                        layer.msg('只能同时编辑一个');
                                    } else {
                                        layer.alert('编辑 [id]：' + checkStatus.data[0].id);
                                    }
                                    break;
                                case 'delete':
                                    if (data.length === 0) {
                                        layer.msg('请选择一行');
                                    } else {
                                        layer.msg('删除');
                                    }
                                    break;
                            };
                        });
                        table.on('row(test)', function (obj) {
                            var data = obj.data;
                            console.log(data);
                            layer.open({
                                title: '课程描述',
                                type: 2,
                                area: ['800px', '600px'],
                                content: './change_course.aspx?course_id=' + data.课程号,
                                btn: '修改',
                                yes: function () {
                                    layer.closeAll();
                                    console.log(parent);
                                    parent.location = '../change_course.aspx?course_id=' + data.课程号;
                                }
                            });

                            //标注选中样式
                            obj.tr.addClass('layui-table-click').siblings().removeClass('layui-table-click');
                        });
                    });
                </script>
            </FooterTemplate>
        </asp:Repeater>
    </form>
</body>
</html>
