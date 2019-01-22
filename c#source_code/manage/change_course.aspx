<%@ Page Language="C#" AutoEventWireup="true" CodeFile="change_course.aspx.cs" Inherits="manage_change_course" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>课程详情</title>
     <link href="../Scripts/layui/css/layui.css" rel="stylesheet" />
    <link href="~/favicon.ico" rel="shortcut icon" type="image/x-icon" />
    <link href="../Content/Site.css" rel="stylesheet" />
    <script src="../Scripts/jquery-1.10.2.min.js"></script>
    <link href="../Content/bootstrap.css" rel="stylesheet" />
    <link href="./css/1.css" rel="stylesheet" />
    <script src="../Scripts/bootstrap.js"></script>
    <style>
        .layui-form-label {
            width:110px;
        }
    </style>
    
</head>
<body>
    <form class="layui-form" id="form1" runat="server">
        <div class="layui-form-item">
            <label class="layui-form-label">课程名:</label>
            <div class="layui-input-block" style="width: 300px;">
              <input type="text" name="课程名"  lay-verify="required" autocomplete="off" placeholder="请输入课程名" class="layui-input">
            </div>
          </div>
          <div class="layui-form-item">
            <label class="layui-form-label">课程学分:</label>
            <div class="layui-input-block" style="width: 300px;">
              <input type="text" name="课程学分"  lay-verify="required" placeholder="请输入课程学分" autocomplete="off" class="layui-input">
            </div>
          </div>
        <div class="layui-form-item">
            <label class="layui-form-label">课程学时:</label>
            <div class="layui-input-block" style="width: 300px;">
              <input type="text" name="课程学时" lay-verify="required" placeholder="请输入课程学时" autocomplete="off" class="layui-input">
            </div>
          </div>
        <div class="layui-form-item">
            <label class="layui-form-label">课程类型:</label>
            <div class="layui-input-block" style="width: 300px;">
                <select name="课程类型" lay-filter="aihao">
                <option value=""></option>
                <option value="01">公共选修课</option>
                <option value="02" selected="">专业选修课</option>
                <option value="03" selected="">公共必修课</option>
                <option value="04" selected="">专业必修课</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">学院:</label>
            <div class="layui-input-block" style="width: 300px;">
                <select name="学院" lay-filter="aihao">
                <option value=""></option>
                <option value="01">计算机与信息工程学院</option>
                <option value="02" selected="">数学与统计学院</option>
                <option value="03" selected="">文学院</option>
                <option value="04" selected="">外国语学院</option>
                </select>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">开课时间:</label>
                <div class="layui-input-inline">
                <input type="text" name="开课时间" id="date" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
         <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">备注:</label>
            <div class="layui-input-block">
              <textarea placeholder="请输入内容" name="备注" class="layui-textarea"></textarea>
            </div>
          </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">课程封面:</label>
            <div class="imgCard layui-input-block">
                <div class="imgWrap">
                    <div class="uploadText">
                        <input type="file" name="课程封面" class="inputImg" accept="image/*" onchange="uploadImg(this)">
                        <button class="layui-btn">上传</button>
                    </div>
                    
                    <img src=" " class="img" alt="">
                </div>
                <button class="layui-btn delete" onclick="deletePic(this)">删除</button>
                
            </div>
        </div>
        <div class="layui-form-item layui-form-text" style="margin-left: 120px;">
            
            <asp:Button ID="submit" lay-submit="" class="layui-btn" runat="server" Text="提交" OnClick="submit_Click" />
            <button type="reset" class="layui-btn">重置</button>
        </div>
    <script src="../Scripts/layui/layui.js"></script>
    <script>
        function uploadImg(obj){
            var file = obj.files[0];
            var obj = $(obj);
            var img = obj.parent().next();
            var uploadBtn = obj.next();
            console.log(file);
            // console.log("file.size:"+file.size);
            var reader = new FileReader();
            reader.onloadstart = function (e){
                
            }
            reader.onload = function(e){
                console.log(this);
                uploadBtn.hide();
                img.attr('src',e.target.result);
            }
            reader.readAsDataURL(file);
        }

        function deletePic(obj) {
            var obj = $(obj);
            console.log(obj);
            var img = obj.siblings('.imgWrap').children('img');
            var uploadBtn = obj.siblings('.imgWrap').find('button');
            img.attr('src',' ');
            uploadBtn.show();
        }

    </script>
    <script>
        layui.use(['form', 'layedit', 'laydate'], function () {
            var form = layui.form
            , layer = layui.layer
            , layedit = layui.layedit
            , laydate = layui.laydate;

            //日期
            laydate.render({
                elem: '#date'
            });
            laydate.render({
                elem: '#date1'
            });

            //创建一个编辑器
            var editIndex = layedit.build('LAY_demo_editor');

            //自定义验证规则
            form.verify({
                title: function (value) {
                    if (value.length < 5) {
                        return '标题至少得5个字符啊';
                    }
                }
              , pass: [/(.+){6,12}$/, '密码必须6到12位']
              , content: function (value) {
                  layedit.sync(editIndex);
              }
            });

        });
    </script>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:deeptechConnectionString %>" SelectCommand="SELECT [课程号], [课程名], [课程学分], [课程学时], [课程类型], [课程类型代码], [学院号], [学院], [开课时间], [课程封面], [备注] FROM [课程表] WHERE ([课程号] = @课程号)">
            <SelectParameters>
                <asp:QueryStringParameter Name="课程号" QueryStringField="course_id" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        
        
    </form>
    </body>
</html>
