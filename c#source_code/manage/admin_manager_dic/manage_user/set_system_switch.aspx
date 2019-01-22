<%@ Page Language="C#" AutoEventWireup="true" CodeFile="set_system_switch.aspx.cs" Inherits="manage_admin_manager_set_system_swicth" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="../../tools/wangeditor/wangEditor.min.css" rel="stylesheet" />
    <link href="../../tools/layui/css/layui.css" rel="stylesheet" />
    <style>
        .layui-form-label {
            width:100px;
        }
         h2 {
            color:#009688;
        }
    </style>
</head>
<body>
    <form id="form1" class="layui-form" runat="server">
    <div class="layui-container">
      <br />
        <h2>系统开关设置</h2>
        <hr />
      <div class="layui-form-item">
        <label class="layui-form-label">学生选课开关</label>
        <div class="layui-input-block">
          <input type="checkbox" id="switchStudent" name="switch" lay-filter="switchStudent"lay-text="ON|OFF" lay-skin="switch">
        </div>
      </div>
      <div class="layui-form-item">
        <label class="layui-form-label">老师打分开关</label>
        <div class="layui-input-block">
          <input type="checkbox" id="switchTeacher" name="switch" lay-filter="switchTeacher"lay-text="ON|OFF" lay-skin="switch">
        </div>
      </div>
      <!-- <div class="layui-form-item">
        <div class="layui-input-block">
          <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
          <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
      </div> -->
    </div>
    </form>
    <script src="../../tools/bootstrap/js/jquery-2.1.0.js"></script>
    <script src="../../tools/layui/layui.js"></script>
</body>
    <script>
    //Demo
    
    layui.use('form', function(){
        var form = layui.form;
        var layer = layui.layer;
        $(document).ready(function(){
          var index = layer.load();
          $.ajax({
            type: "POST",
            url: "/get_switch.ashx",
            success: function(data){
              data = JSON.parse(data);
              if (data.student == 0 || data.student == "-"){
                  $('#switchStudent').attr('checked', 'checked');
                  form.render();
              }
              if (data.teacher == 0 || data.teacher == "0"){
                  $('#switchTeacher').attr('checked', 'checked');
                  form.render();
              }
              layer.close(index);     
            }
          })
        })
        form.on('switch(switchStudent)', function (data) {
          var index = layer.load();
            $.ajax({
              type: "POST",
              url: "/switch_change.ashx",
              data:{'type':'student'},
              success: function(data){
                console.log(data);
                
                console.log(data.teacher);
                layer.close(index);     
              }
            })
            layer.msg('学生选课开关：' + (this.checked ? '开启' : '关闭'), {
                offset: '260px'
            });
        });
        form.on('switch(switchTeacher)', function (data) {
            var index = layer.load();
            $.ajax({
                type: "POST",
                url: "/switch_change.ashx",
                data: { 'type': 'teacher' },
                success: function (data) {
                    console.log(data);
                    layer.close(index);
                }
            })
            layer.msg('老师打分开关：' + (this.checked ? '开启' : '关闭'), {
                offset: '260px'
            });
        });
    });
    </script>
      
</html>
