<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="proPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE HTML>
<html>
	<head>
		<title>寒江独钓</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="assets/css/main.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
	</head>
	<body class="single">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
					<header id="header">
						<h1><a href="index.html">寒江独钓</a></h1>
						<nav class="links">
							<ul>
								<li><a href="index.action?type=技术美文">技术美文</a></li>
								<li><a href="index.action?type=心灵鸡汤">心灵鸡汤</a></li>
								<li><a href="index.action?type=心情杂记">心情杂记</a></li>
								<li><a href="index.action?type=旅行游记">旅行游记</a></li>
								<li><a href="#">关于</a></li>
							</ul>
						</nav>
						<nav class="main">
							<ul>
								<li class="search">
									<a class="fa-search" href="#search">Search</a>
									<form id="search" method="get" action="#">
										<input type="text" name="query" placeholder="Search" />
									</form>
								</li>
								<li class="menu">
									<a class="fa-bars" href="#menu">Menu</a>
								</li>
							</ul>
						</nav>
					</header>

				<!-- Menu -->
					<section id="menu">

						<!-- Search -->
							<section>
								<form class="search" method="get" action="#">
									<input type="text" name="query" placeholder="Search" />
                                    <br>
                                    <h2><button style="width: 285px;" class="btn-default" type="button" onclick="javascript:window.location.href='edit.html'">&nbsp;提笔写博客&nbsp;</button></h2>
								</form>
							</section>

						<!-- Links -->
							<section>
								<ul class="links">
                                    <li>
										<a href="#">
											<h2>技术美文</h2>
										    <ul>
                                                <li>
                                                    <a href="#" class="author">
                                                        <h2>  </h2>
                                                    </a>
                                                </li>
                                               
                                            </ul>
										</a>
									</li>
									<li>
										<a href="#">
											<h2>心灵鸡汤</h2>
									   <ul>
                                                <li>
                                                    <a href="#" class="author">
                                                        <h2>知道什么叫真正的努力吗</h2>
                                                    </a>
                                                </li>
                                                
                                            </ul>
										</a>
									</li>
									<li>
										<a href="#">
											<h2>心情杂记</h2>
										   <ul>
                                                <li>
                                                    <a href="#" class="author">
                                                        <h2>今儿高兴</h2>
                                                    </a>
                                                </li>
                                                
                                            </ul>
										</a>
									</li>
									<li>
										<a href="#">
											<h2>旅行游记</h2>
										   <ul>
                                                <li>
                                                    <a href="#" class="author">
                                                        <h2>凭栏观雨</h2>
                                                    </a>
                                                </li>
                                                
                                            </ul>

										</a>
									</li>

								</ul>
							</section>

						<!-- Actions -->
							<section>
								<ul class="actions vertical">
								    <c:if test="${not empty user}">
                                        <a href="#" class="author" style="position: relative; right: 100px;"><span class="name">${ user.userName }</span><img src="${ user.userPhoto }" alt="" /></a>
                                        <li><a href="logout.action" class="button big fit">再见，登出</a></li>
									</c:if>
								</ul>
							</section>

					</section>

				<!-- Main -->

                    <div id="main">

						<!-- Post -->
							<article class="post">
								<header>
									<div class="title">
                                        <div align="center">
										<h2><a href="#">寒江独钓 </a></h2>
                                            <h1><a href="#">记录点滴 </a></h1>
                                        </div>
									</div>
								</header>
								<span class="image featured"><img src="http://oe1rqbymq.bkt.clouddn.com/5.jpg" alt="" /></span>
                                <div align="center">
								<h3></h3>
                                <h3></h3>
                                <h3></h3>
                                <h3></h3>
                                </div>
							</article>

					</div>



				<!-- Footer -->
					<section id="footer">
						<ul class="icons">
							<li><a href="#" class="fa-rss"><span class="label">RSS</span></a></li>
							<li><a href="#" class="fa-envelope"><span class="label">Email</span></a></li>
						</ul>
                        <p class="copyright">&copy;&nbsp;&nbsp;Developed by yangyuan</p>
					</section>

			</div>

		<!-- Scripts -->

			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="assets/js/main.js"></script>

	</body>
</html>