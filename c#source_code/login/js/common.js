var register = {
	url:{
		simpleRegiester:'/user-info/v1/register/user',
	},
	fun:{
		slideText:function(){//打开字滑入效果
			$(".connect p").eq(0).animate({"left":"0%"}, 600);
			$(".connect p").eq(1).animate({"left":"0%"}, 400);
		},
		uploadImg:function(obj){//上传图片
			var file = obj.files[0];
			var obj = $(obj);
			var img = obj.next();
			var data = new FormData(obj);
			var reader = new FileReader();
			reader.onloadstart = function (e){

			}
			reader.onload = function(e){
				console.log(this);
				img.attr('src',e.target.result);
			}
			reader.readAsDataURL(file);
		},
		validate:function() {
			$("#loginForm").validate({
				rules:{
					username:{
						required:true,//必填
						minlength:6, //最少6个字符
						maxlength:32,//最多20个字符
					},
					password:{
						required:true,
						minlength:6, 
						maxlength:32,
					},
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
						minlength:"密码至少为3个字符",
						maxlength:"密码至多为32个字符",
					},
				},
		
			});
			//注册表单验证
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
		}
	}
}
uploadImg = register.fun.uploadImg;
window.onload = function(){
	register.fun.slideText();
	register.fun.validate();
}
//http://localhost:8080/html/register/register.html
// $('#registerForm').submit = register.fun.submitForm;
$('#registerForm').submit(function(e){
	$.ajax({
		type: "POST",
		url: register.url.simpleRegiester,
		data:$("#registerForm").serialize(),
		success: function (data) {
			console.log(data)
			if(data.code==0 || data.code=="0"||data.msg=="ok"){
                layer.open({
                    title: '注册完成'
                    ,content: '<em style="color: black">注册成功，跳转到登录页面或是进入管理员注册页面?</em>'
					,icon:3
					,btn:['前往登录','管理员注册'],
					yes:function (index) {
                        window.location.href = '../loggin/login.html';
                        layer.close(index);
                    },
					btn2:function (index) {
                        window.location.href = './advancedRegister.html';
                        layer.close(index);
                    }
                });
				alert("注册成功");

			} else {
				alert("注册失败"+data.msg);
			}
		  },
		error: function (data) {
			alert("注册失败"+data.msg);
		}
	})
	e.preventDefault();
});

//jquery.validate表单验证
// $(document).ready(function(){
// 	//登陆表单验证
// 	$("#loginForm").validate({
// 		rules:{
// 			username:{
// 				required:true,//必填
// 				minlength:6, //最少6个字符
// 				maxlength:32,//最多20个字符
// 			},
// 			password:{
// 				required:true,
// 				minlength:6, 
// 				maxlength:32,
// 			},
// 		},
// 		//错误信息提示
// 		messages:{
// 			username:{
// 				required:"必须填写用户名",
// 				minlength:"用户名至少为3个字符",
// 				maxlength:"用户名至多为32个字符",
// 				remote: "用户名已存在",
// 			},
// 			password:{
// 				required:"必须填写密码",
// 				minlength:"密码至少为3个字符",
// 				maxlength:"密码至多为32个字符",
// 			},
// 		},

// 	});
// 	//注册表单验证
// 	$("#registerForm").validate({
// 		rules:{
// 			username:{
// 				required:true,//必填
// 				minlength:3, //最少6个字符
// 				maxlength:32,//最多20个字符
// 				// remote:{
// 				// 	url:"http://kouss.com/demo/Sharelink/remote.json",//用户名重复检查，别跨域调用
// 				// 	type:"post",
// 				// },
// 			},
// 			password:{
// 				required:true,
// 				minlength:6, 
// 				maxlength:32,
// 			},
// 			email:{
// 				required:true,
// 				email:true,
// 			},
// 			confirm_password:{
// 				required:true,
// 				minlength:3,
// 				equalTo:'.password'
// 			},
// 			phone_number:{
// 				required:true,
// 				phone_number:true,//自定义的规则
// 				digits:true,//整数
// 			}
// 		},
// 		//错误信息提示
// 		messages:{
// 			username:{
// 				required:"必须填写用户名",
// 				minlength:"用户名至少为3个字符",
// 				maxlength:"用户名至多为32个字符",
// 				remote: "用户名已存在",
// 			},
// 			password:{
// 				required:"必须填写密码",
// 				minlength:"密码至少为6个字符",
// 				maxlength:"密码至多为32个字符",
// 			},
// 			email:{
// 				required:"请输入邮箱地址",
// 				email: "请输入正确的email地址"
// 			},
// 			confirm_password:{
// 				required: "请再次输入密码",
// 				minlength: "确认密码不能少于3个字符",
// 				equalTo: "两次输入密码不一致",//与另一个元素相同
// 			},
// 			phone_number:{
// 				required:"请输入手机号码",
// 				digits:"请输入正确的手机号码",
// 			},
		
// 		},
// 	});
// 	//添加自定义验证规则
// 	jQuery.validator.addMethod("phone_number", function(value, element) { 
// 		var length = value.length; 
// 		var phone_number = /^(((13[0-9]{1})|(15[0-9]{1}))+\d{8})$/ 
// 		return this.optional(element) || (length == 11 && phone_number.test(value)); 
// 	}, "手机号码格式错误"); 
// });
