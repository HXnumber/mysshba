$(function(){
	var email ='';
	// 如果点击首页
	$('ul.navbar-nav li').click(function(){
		$(this).addClass('active');
	});
	// 点击登录按钮
	$('#loginModelLoginBtn').click(function(){
		
		// 获取用户输入的用户名和密码
		var username = $('#username').val(),
			password = $('#password').val();
		
		// 如果用户名为空
		if(username == '' || username.indexOf(" ") != -1)
		{
			// 给用户名输入框添加红色的警示色
			$('#usernameInputGroup').addClass('has-error');
			return;
		}
		if(password == '' || password.indexOf(" ") != -1)
		{
			// 给密码输入框添加红色的警示色
			$('#passwordInputGroup').addClass('has-error');
			return;
		}
		
		// 向后台发送ajax请求，验证用户名和密码是否匹配
		$.ajax(
		{
			type: "POST",
			url: ctx + '/userAction!login.action',
			data: {
				"username":username,
				"password":password
			},
			success: function(json)
			{
				// 解析后台传回的json数据为js对象
				var dataObj = eval("(" + json + ")"),
				msg = dataObj["msg"],
				successFlag = dataObj["success"];
				if(successFlag)
				{
					var obj = dataObj["obj"];
					chineseName = obj["chineseName"];
					var loginName=obj["loginName"];
				    var loginPassword=obj["loginPassword"];
				    var userId=obj["userId"];
				    var roleNames=obj["roleNames"];
				    location.reload(true);
					setCookie("loginName", loginName, loginName);   //将用户数据存入cookie中，，默认cookie有效时间为1天
					setCookie("loginPassword", loginPassword, loginPassword);
					setCookie("userId", userId, userId);
					setCookie("roleNames",  roleNames, roleNames);
					setCookie("chineseName",  chineseName, chineseName);
					// 隐藏登录弹出框
					$('#loginModal').modal('hide');
					
					// 刷新页面
					location.reload(true);
				}
				else
				{
					// TODO 可以考虑增加左右晃动的动画来提示用户
					
					// 给用户名输入框添加红色的警示色
					$('#usernameInputGroup').addClass('has-error');
					
					// 给密码输入框添加红色的警示色
					$('#passwordInputGroup').addClass('has-error');
					
					$("#ray").text("用户名或密码错误");
				}
			},
			error: function()
			{
			}
		});
	});
	// 用户名输入框的失去焦点事件
	$('#username').blur(function(){
		// 获取用户输入的用户名
		var username = $('#username').val();
		if(username == '')
		{
			// 给用户名输入框添加红色的警示色
			$('#usernameInputGroup').addClass('has-error'); 
		}
		else
		{
			// 给用户名输入框删除红色的警示色
			$('#usernameInputGroup').removeClass('has-error');
		}
	});
	
	// 密码输入框的失去焦点事件
	$('#password').blur(function(){
		// 获取用户输入的用户名
		var password = $('#password').val();
		if(password == '')
		{
			// 给密码输入框添加红色的警示色
			$('#passwordInputGroup').addClass('has-error');
		}
		else
		{
			// 给密码输入框删除红色的警示色
			$('#passwordInputGroup').removeClass('has-error');
		}
	});
	
	// 密码输入框回车事件绑定
	$('#password').bind('keyup', function(event) {
		if (event.keyCode == "13") {
			// 回车执行
	        $('#loginModelLoginBtn').click();
		}
	});
	
   function setCookie(name, value, expireday) {   //设置cookie
        var exp = new Date();
		exp.setTime(exp.getTime() + expireday*24*60*60*1000); //设置cookie的期限
		document.cookie = name+"="+escape(value)+";expires"+"="+exp.toGMTString();//创建cookie
    }
    function getCookie(name) {    //获取cookie
		var arr,reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
		if(arr=document.cookie.match(reg))
		return unescape(arr[2]);
		else
		return null;
    }
    function  deleteCookie(name)
    {
    	var exp = new Date();
    	exp.setTime(exp.getTime() - 1);
    	var cval=getCookie(name);
    	if(cval!=null)
    	document.cookie= name + "="+cval+";expires="+exp.toGMTString();
    }
    
});