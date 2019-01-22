<%@ Page Language="C#" AutoEventWireup="true" CodeFile="release_news.aspx.cs" validateRequest="false" Inherits="manage_admin_manager_release_news" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="../../tools/wangeditor/wangEditor.min.css" rel="stylesheet" />
    <link href="../../tools/layui/css/layui.css" rel="stylesheet" />
    <style>
        h2 {
            color:#009688;
        }
        .layui-form-label {
            text-align:left;
        }
    </style>
</head>
<body>
    <form id="form1" class="layui-form" runat="server">
     <div class="layui-container">
         <br />
         <h2>发布新闻</h2>
         <hr />
    
            <input id="Hiddennewstitle" name="newstitle" runat="server" type="hidden" />
            <input id="Hiddennewsdesc" name="newsdesc" runat="server" type="hidden" />
            <input id="Hiddennewstime" name="newstime" runat="server" type="hidden" />
        <div class="input" aria-sort="none">
            <asp:TextBox runat="server" name="newsdesc" Visible="False" />
            <br />
              <div class="layui-form-item">
                <label class="layui-form-label">新闻标题</label>
                <div class="layui-input-block">
                  <input type="text" id="newstitle" runat="server" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input"/>
                </div>
              </div>
            <div class="layui-form-item">
                <label class="layui-form-label">发布日期</label>
                <div class="layui-input-inline">
                <input type="text" name="date" id="date" lay-verify="date" placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
                </div>
            </div>
              <div class="layui-form-item layui-form-text">
                <label class="layui-form-label">新闻内容</label>
                <div class="layui-input-block">
                
                  <div id="txtBox" runat="server" >
                  
                  </div>
                </div>
              </div>
              <div class="layui-form-item">
                <div class="layui-input-block">
                  <button class="layui-btn" lay-submit lay-filter="input">立即提交</button>
                  <asp:Button ID="submit" runat="server" Text="Button" OnClick="submit_Click" />
                </div>
              </div>
            <div id="div2" runat="server">

            </div>
        </div>
    </div>
    </form>
    <script src="../../tools/wangeditor/wangEditor.js"></script>
    <script src="../../tools/bootstrap/js/jquery-2.1.0.js"></script>
    <script src="../../tools/layui/layui.js"></script>
    <script src="../../tools/xss.js"></script>
    <script>
        //Demo
        var E = window.wangEditor
        var editor = new E('#txtBox')
        editor.customConfig.uploadImgServer = '/file_upload.ashx'
        editor.customConfig.uploadImgMaxLength = 1
        //editor.customConfig.debug = location.href.indexOf('wangeditor_debug_mode=1') > 0
        //editor.customConfig.debug = true
        /*  editor.customConfig.customUploadImg = function (files, insert) {
            // files 是 input 中选中的文件列表
            // insert 是获取图片 url 后，插入到编辑器的方法
            console.log(files)
            // 上传代码返回结果之后，将图片插入到编辑器中
          $.ajax({
                type: "POST",
                url: "/file_upload.ashx",
                //contentType: "application/json", //如果提交的是json数据类型，则必须有此参数,表示提交的数据类型 
                dataType: "json", //表示返回值类型，不必须           
                data: files,
                processData: false,//用于对data参数进行序列化处理 这里必须false
                contentType: false, //必须
                success: function (result) {
                    //在原来的页面跳转到下载word模板的页面
                    //window.location.href = "/InviteBid/ExportTemplateFile";
                    console.log(result);
                    //insert(imgUrl)
                },
                error: function (data) {
                    alert("下载模板失败！");
                }
            }); 

            
        }*/
        editor.create()
        $('#submit').hide();
        $("#Button1").click(function(){
            console.log($('#upPic').prop('files')[0]);
        })
        
        layui.use(['form', 'layedit', 'laydate'], function () {
            var form = layui.form,
                laydate = layui.laydate;;
            laydate.render({
                elem: '#date'
            });
            //监听提交
            form.on('submit(input)', function (data) {
                var title = $("#newstitle").val();
                var time = $('#date').val();
                var desc = editor.txt.html();
                console.log(desc);
                $("#Hiddennewstitle").val(title)
                $('#Hiddennewsdesc').val(desc);
                $('#Hiddennewstime').val(time);
                $('#submit').click();
                return false;
            });
            
        });
        
    </script>
</body>
</html>
