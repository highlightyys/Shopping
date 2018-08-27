<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head lang="en">
		<meta charset="UTF-8">
		<title>注册</title>
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<meta name="format-detection" content="telephone=no">
		<meta name="renderer" content="webkit">
		<meta http-equiv="Cache-Control" content="no-siteapp" />

		<link rel="stylesheet" href="${pageContext.request.contextPath}/static/AmazeUI-2.4.2/assets/css/amazeui.min.css" />
		<link href="${pageContext.request.contextPath}/static/css/dlstyle.css" rel="stylesheet" type="text/css">
		<script src="${pageContext.request.contextPath}/static/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/static/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>

	</head>

	<body>

		<div class="login-boxtitle">
			<a href="home/demo.html"><img alt="" src="${pageContext.request.contextPath}/static/images/logobig.png" /></a>
		</div>

		<div class="res-banner">
			<div class="res-main">
				<div class="login-banner-bg"><span></span><img src="${pageContext.request.contextPath}/static/images/big.jpg" /></div>
				<div class="login-box">

						<div class="am-tabs" id="doc-my-tabs">
							<ul class="am-tabs-nav am-nav am-nav-tabs am-nav-justify">
								<li class="am-active"><a>用户注册</a></li>
							</ul>

							<div class="am-tabs-bd" >
								<div class="am-tab-panel am-active">
									<form action="${pageContext.request.contextPath}/user/register" method="post">
										
							   	<div class="user-email">
										<label for="user"><i class="am-icon-user am-icon-fw"></i></label>
										<input type="username" name="username" id="username" placeholder="用户名" onchange="checkun()">
										<span id="tishi" style="font-size:x-small;color: grey;">用户名为9~16个字符，只能包含字母、数字</span>
                 				</div>										
                 				<div class="user-pass" style="margin-top:20px;">
								    <label for="password"><i class="am-icon-lock"></i></label>
								    <input type="password" name="password" id="pwd" placeholder="设置密码" onchange="checkpwd()">
								    <span id="tishi1" style="font-size:x-small;color: grey;">密码为9~16个字符，只能包含字母、数字</span>
                 				</div>										
                				 <div class="user-pass" style="margin-top:20px;">
								    <label for="passwordRepeat"><i class="am-icon-lock"></i></label>
								    <input type="password" name="" id="pwd1" placeholder="确认密码" onchange="checkrepwd()">
								    <span id="tishi2"></span>
                 				</div>	
                 
                 
                 
								
										<div class="am-cf">
											<input type="submit" name="" value="注册" class="am-btn am-btn-primary am-btn-sm am-fl">
										</div>

								</div>
								</form>
								<script>
									$(function() {
									    $('#doc-my-tabs').tabs();
									  })
								</script>

							</div>
						</div>

				</div>
			</div>
			
					<div class="footer ">
						<div class="footer-hd ">
							<p>
								<a href="# ">恒望科技</a>
								<b>|</b>
								<a href="# ">商城首页</a>
								<b>|</b>
								<a href="# ">支付宝</a>
								<b>|</b>
								<a href="# ">物流</a>
							</p>
						</div>
						<div class="footer-bd ">
							<p>
								<a href="# ">关于恒望</a>
								<a href="# ">合作伙伴</a>
								<a href="# ">联系我们</a>
								<a href="# ">网站地图</a>
							</p>
						</div>
					</div>
	</body>
<script type="text/javascript">
	function checkun(){
		var username = $("#username").val();
		var reg = /^[a-zA-Z][a-zA-Z0-9]{8,15}$/
		if(!reg.test(username)){
			$("#tishi").html("用户名格式不正确！");
			$("#tishi").css("color","red");
			
		}else{
			$("#tishi").html("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;√");
			$("#tishi").css("color","green");
			$.post('${pageContext.request.contextPath }/user/checkByName',{username:username},function(data){
				$('#tishi').html(data);	
				$('#tishi').css('color','red');
			},'html');
		}
		
		
		
		
		
		
	}
	function checkpwd(){
		var password = $("#pwd").val();
		var reg = /^[a-zA-Z0-9][a-zA-Z0-9]{8,15}$/
		if(reg.test(password)){
			$("#tishi1").html("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;√");
			$("#tishi1").css("color","green");
		}else{
			$("#tishi1").html("密码格式不正确！");
			$("#tishi1").css("color","red");
		}
	}



	function checkrepwd() {
	      
	    var pwd = $("#pwd").val();
	    var pwd1 = $("#pwd1").val();
	    if(pwd == pwd1)
	     {
	        $("#tishi2").html("两次密码相同");
	         $("#tishi2").css("color","green");
	         $("#tishi2").css("font-size","x-small");
	   		 $("#xiugai").removeAttr("disabled");
	     }
		else {
	        $("#tishi2").html("两次密码不相同");
	         $("#tishi2").css("color","red")
	         $("#tishi2").css("font-size","x-small");
	          $("button").attr("disabled","disabled");  
	      }
	}

</script>
</html>