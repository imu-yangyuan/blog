<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="proPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>登录</title>

<link rel="stylesheet" type="text/css" href="${proPath}/css/login.css">
<link rel="stylesheet" type="text/css" href="${proPath}/css/logincss/default.css">
<link rel="stylesheet" media="screen" href="${proPath}/css/logincss/style.css">
</head>

<body>

	<div class="container">
		<div id="particles-js">
			<div class="wrapper">
				<div class="containerchild">
					<h1>登录</h1>
					<form class="form" method="POST" id="login_form"
						action="${pageContext.request.contextPath }/user/login.action">
						${msg } <input name="userName" value="${username}" type="text"
							placeholder="Username"> <input name="userPassword"
							type="password" placeholder="Password"> <input
							type="submit"></input>
					</form>
				</div>
				
				<ul class="bg-bubbles">
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
				</ul>

			</div>

		</div>
	</div>
	<script src="${proPath}/js/loginjs/particles.js"></script>
	<script src="${proPath}/js/loginjs/app.js"></script>
 
   
</body>

</html>