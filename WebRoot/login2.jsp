<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
<title>学工助理签到平台 V1.0</title>
<!-- for-mobile-apps -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />


<!-- //for-mobile-apps -->
<link href="static/css/style_login.css" rel="stylesheet" type="text/css" media="all" />
</head>
<body>
	<!-- main -->
		<div class="main">
			<h1>学工助理签到平台 V1.0-登录</h1>
			<div class="input_form">
				<form id="login_form" action="user/login.action" method="post" onkeypress="if(event.keyCode==13||event.which==13){ login();}">
					<input type="text" name="username" id="username" value="" placeholder="请输入账号" >
					<input type="password" name="password" id="password" value="" placeholder="请输入密码" >
				</form>
			</div>

			<div class="ckeck-bg">
				<div class="checkbox-form">
					<div class="check-left">
							<input type="submit" onclick="window.location.href='register_student'" value="注册">
					</div>
					<div class="check-right">
							<input onclick="login()" type="submit" value="登录">
					</div>
					<div class="clearfix"> </div>
				</div>
			</div>
		</div>
		<div class="footer">
		</div>
	<!-- //main -->
  
    <script>
        function login() {
            login_form = document.getElementById('login_form');
            
            login_form.submit();
        }
    </script>
    ${obj.msg }
</body>
</html>