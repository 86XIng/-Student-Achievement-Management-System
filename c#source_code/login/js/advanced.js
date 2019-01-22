//打开字滑入效果
jQuery(function($){

    $.supersized({
    
        // 功能
        slide_interval     : 1500,    // 转换之间的长度
        transition         : 1,    // 0 - 无，1 - 淡入淡出，2 - 滑动顶，3 - 滑动向右，4 - 滑底，5 - 滑块向左，6 - 旋转木马右键，7 - 左旋转木马
        transition_speed   : 1000,    // 转型速度
        performance        : 1,    // 0 - 正常，1 - 混合速度/质量，2 - 更优的图像质量，三优的转换速度//（仅适用于火狐/ IE浏览器，而不是Webkit的）
    
        // 大小和位置
        min_width          : 0,    // 最小允许宽度（以像素为单位）
        min_height         : 0,    // 最小允许高度（以像素为单位）
        vertical_center    : 1,    // 垂直居中背景
        horizontal_center  : 1,    // 水平中心的背景
        fit_always         : 0,    // 图像绝不会超过浏览器的宽度或高度（忽略分钟。尺寸）
        fit_portrait       : 1,    // 纵向图像将不超过浏览器高度
        fit_landscape      : 0,    // 景观的图像将不超过宽度的浏览器
    
        // 组件
        slide_links        : 'blank',    // 个别环节为每张幻灯片（选项：假的，'民'，'名'，'空'）
        slides             : [    // 幻灯片影像
                                 {image : './images/4.jpg'},
                                 {image : './images/5.jpg'},
                                 {image : './images/6.jpg'}
                       ]
    
    });
    
    });
    
window.onload = function(){
	$(".connect p").eq(0).animate({"left":"0%"}, 600);
	$(".connect p").eq(1).animate({"left":"0%"}, 400);
};
{
// function uploadImg(obj){
//     var file = obj.files[0];
//     var obj = $(obj);
//     var img = obj.next();
//     var data = new FormData(obj);
//     $.ajax({  
//         url: "http://localhost:8080/scenic-area-manage/v1/saveContentPhoto", 
//         type: 'POST',  
//         data: data,  
//         dataType: 'JSON',  
//         cache: false,  
//         processData: false,  
//         contentType: false  ,
//         done: function(data){  
            
//         }
//     }) 
//         // layui.use(['layer','upload'], function (){
//         //     var layer = layui.layer;
//         //     var upload = layui.upload;
//         //     //执行实例
//         //     var uploadInst = upload.render({
//         //         elem: '#upload' //绑定元素
//         //         ,url: '/scenic-area-manage/v1/saveContentPhoto' //上传接口
//         //         ,done: function(res){
//         //           //上传完毕回调
//         //         }
//         //         ,error: function(){
//         //           //请求异常回调
//         //         }
//         //       });
//         //     });
//         // var uploadInst = upload.render({
//         //     elem: '.upload' //绑定元素
//         //     ,url: 'http://localhost:8080/scenic-area-manage/v1/saveContentPhoto' //上传接口
//         //     // ,data: obj.attr("id")
//         //     ,field:'file' //字段名为file
//         //     ,size:'4096' //文件最大为4M
//         //     ,before: function () {
//         //         layer.load(); //上传loading
//         //     }
//         //     ,done: function(res){
//         //         console.log(res);
//         //         layer.closeAll('loading');
//         //         if (res.code = 0) {
//         //             scenicAreaInfo.fun.refreshLogoImg();//刷新img标签中的图片
//         //         } else {
//         //             layer.alert("更新失败，请重试");
//         //         }
//         //     }
//         //     ,error: function(){
//         //         layer.closeAll('loading');
//         //         layer.alert("上传失败，请检查网络或重新登录");
//         //     }
//         // });
//     // });
//     // $.ajaxFileUpload({
//     //         url: 'http://localhost:8080/scenic-area-manage/v1/saveContentPhoto', //用于文件上传的服务器端请求地址
//     //         secureuri: false, //是否需要安全协议，一般设置为false
//     //         fileElementId: obj.attr("id"), //文件上传域的ID
//     //         dataType: 'json', //返回值类型 一般设置为json
//     //         success: function (data, status)  //服务器成功响应处理函数
//     //         {
//     //             img.attr("src", data.imgurl);
//     //             if (typeof (data.error) != 'undefined') {
//     //                 if (data.error != '') {
//     //                     alert(data.error);
//     //                 } else {
//     //                     alert(data.msg);
//     //                 }
//     //             }
//     //         },
//     //         error: function (data, status, e)//服务器响应失败处理函数
//     //         {
//     //             alert(e);
//     //         }
//     // })
//     // console.log(file);
//     // var reader = new FileReader();
//     // reader.onloadstart = function (e){
       
//     // }
//     // reader.onload = function(e){
//     //     console.log(this);
//     //     img.attr('src',e.target.result);
//     // }
//     // reader.readAsDataURL(file);
// }
}


$('#scenicSubManagerForm').submit(function(e){
	$.ajax({
		async: false,
		type: "POST",
		url:'http://localhost:8080/user-info/v1/register/scenicSubManager/',
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		data:$("#scenicSubManagerForm").serialize(),
		dataType: "text",
		success: function (data) {
            console.log(data);
			alert("注册成功");
		  },
		error: function (data) {
            console.log(data);
			alert("注册失败");
		}
	})
	e.preventDefault();
});

//jquery.validate表单验证
$(document).ready(function(){
    $("#registerForm").validate({
		rules:{
			username:{
				required:true,//必填
				minlength:3, //最少6个字符
				maxlength:32,//最多20个字符
				// remote:{
				// 	url:"http://kouss.com/demo/Sharelink/remote.json",//用户名重复检查，别跨域调用
				// 	type:"post",
				// },
			},
			password:{
				required:true,
				minlength:6, 
				maxlength:32,
			},
			email:{
				required:true,
				email:true,
			},
			confirm_password:{
				required:true,
				minlength:3,
				equalTo:'.password'
			},
			phone_number:{
				required:true,
				phone_number:true,//自定义的规则
				digits:true,//整数
			}
		},
		//错误信息提示
		messages:{
			username:{
				required:"必须填写用户名",
				minlength:"用户名至少为3个字符",
				maxlength:"用户名至多为32个字符",
				remote: "用户名已存在",
			},
			password:{
				required:"必须填写密码",
				minlength:"密码至少为6个字符",
				maxlength:"密码至多为32个字符",
			},
			email:{
				required:"请输入邮箱地址",
				email: "请输入正确的email地址"
			},
			confirm_password:{
				required: "请再次输入密码",
				minlength: "确认密码不能少于3个字符",
				equalTo: "两次输入密码不一致",//与另一个元素相同
			},
			phone_number:{
				required:"请输入手机号码",
				digits:"请输入正确的手机号码",
			},
		
		},
	});
	//添加自定义验证规则
	jQuery.validator.addMethod("phone_number", function(value, element) { 
		var length = value.length; 
		var phone_number = /^(((13[0-9]{1})|(15[0-9]{1}))+\d{8})$/ 
		return this.optional(element) || (length == 11 && phone_number.test(value)); 
	}, "手机号码格式错误"); 
});
