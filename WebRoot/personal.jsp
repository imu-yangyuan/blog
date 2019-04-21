<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib  uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
			<h1>
				<a href="index.action">寒江独钓</a>
			</h1>
			<nav class="links">
				<ul>
					<li><a href="personal.action?userId=${ userId }&articleType=技术美文">技术美文</a></li>
					<li><a href="personal.action?userId=${ userId }&articleType=心灵鸡汤">心灵鸡汤</a></li>
					<li><a href="personal.action?userId=${ userId }&articleType=心情杂记">心情杂记</a></li>
					<li><a href="personal.action?userId=${ userId }&articleType=旅行游记">旅行游记</a></li>
					<li><a href="${proPath}/about.jsp">关于</a></li>
				</ul>
			</nav>
			<nav class="main">
				<ul>
					<li class="search"><a class="fa-search" href="#search">Search</a>
						<form id="search" method="get" action="#">
							<input type="text" name="query" placeholder="Search" />
						</form></li>
					<li class="menu"><a class="fa-bars" href="#menu">Menu</a></li>
				</ul>
			</nav>
		</header>

		<!-- Menu -->
		<section id="menu">

			<!-- Search -->
			<section>
				<form class="search" method="get" action="#">
					<input type="text" name="query" placeholder="Search" /> <br>
					<h2>
						<button style="width: 285px;" class="btn-default" type="button"
							onclick="javascript:window.location.href='article/CreateMarkdown.action'">&nbsp;提笔写博客&nbsp;</button>
					</h2>
				</form>
			</section>
			<!-- Links -->
			<section>
				<ul class="links">
					<li><a href="#">
							<h2>技术美文</h2>
							<ul>
								<li><a href="#" class="author">
										<h2>苦海无涯，python是岸</h2>
								</a></li>
								<li><a href="#" class="author">
										<h2>苦海无涯，python是岸</h2>
								</a></li>
							</ul>
					</a></li>
					<li><a href="#">
							<h2>心灵鸡汤</h2>
							<ul>
								<li><a href="#" class="author">
										<h2>知道什么叫真正的努力吗</h2>
								</a></li>
								<li><a href="#" class="author">
										<h2>知道什么叫真正的努力吗</h2>
								</a></li>
							</ul>
					</a></li>
					<li><a href="#">
							<h2>心情杂记</h2>
							<ul>
								<li><a href="#" class="author">
										<h2>今儿高兴</h2>
								</a></li>
								<li><a href="#" class="author">
										<h2>今儿高兴</h2>
								</a></li>
							</ul>
					</a></li>
					<li><a href="#">
							<h2>旅行游记</h2>
							<ul>
								<li><a href="#" class="author">
										<h2>穷游鼓浪屿</h2>
								</a></li>
								<li><a href="#" class="author">
										<h2>穷游鼓浪屿</h2>
								</a></li>
							</ul>

					</a></li>

				</ul>
			</section>

			<!-- Actions -->
			<section>
				<ul class="actions vertical">
					<c:if test="${not empty user }">
						<a href="#" class="author"
							style="position: relative; right: 100px;"><span class="name">${ user.userName}</span><img
							src="${ user.userPhoto }" alt="" /></a>
						<li><a href="${proPath }/user/logout.action" class="button big fit">再见，登出</a></li>
					</c:if>

				</ul>
			</section>

		</section>

		<!-- Main -->

		<div id="main">
			<c:forEach items="${articles.rows}" var="article">
				<!-- Post -->
				<article class="post">
					<header>
						<div class="title">
							<h2>
								<a href="#"></a>
							</h2>
							<h2>${ article.title }</h2>
							<p>${ article.articleType }</p>
						</div>
						<div class="meta">
							<time class="published" datetime="2015-11-01"><fmt:formatDate value="${ article.addTime}" pattern="yyyy年MM月dd日" /></time>
							<a href="#" class="author"><span class="name">${ article.user.userName}</span><img
								src="${ article.user.userPhoto }" alt="" /></a>
						</div>
					</header>
					<span class="image featured"><img src="${article.imgUrl}"
						alt="" /></span>${fn:substring(article.content, 0, 140)} 
					<footer>
						<ul class="actions">
							<li><a href="article/detail.action?articleId=${article.articleId }"
								class="button big">查看博文</a></li>
							<c:if test="${article.userId eq user.userId }">
								<li><a href="article/markdownEdit.action?articleId=${ article.articleId}"
									class="button big">编辑博文</a></li>
							</c:if>
						</ul>
						<ul class="stats">
							<li><a href="javascript:add_like(${ article.articleId })"
								id="${ article.articleId }" class="icon fa-heart">${ article.likeNum}</a></li>
							<li><a href="#" class="icon fa-comment"><span
									id="sourceId::article_${ article.articleId }"
									class="cy_cmt_count"></span></a></li>
						</ul>
					</footer>
				</article>
			</c:forEach>
			<script id="cy_cmt_num"
				src="http://changyan.sohu.com/upload/plugins/plugins.list.count.js?clientId=cysAHuAOu"></script>

			<ul class="actions pagination">
				<c:choose>
					<c:when test="${last_page}">
						<li><a
							href="personal.action?pageNum=${ page-1 }&userId=${userId }&articleType=${ articleType }"
							class="button big previous">上一页</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="#" class="disabled button big previous">上一页</a></li>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${next_page }">
						<li><a
							href="personal.action?pageNum=${ page+1 }&userId=${userId }&articleType=${ articleType}"
							class="button big next">下一页</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="#" class="disabled button big next">下一页</a></li>
					</c:otherwise>
				</c:choose>


			</ul>

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
	<script>
		function add_like(id) {
			var article_like_object = document.getElementById(id);
			$.ajax({
				cache : true,
				type : "GET",
				url : '/like.action',
				data : 'article_id=' + id + '&time=' + new Date().getTime(),
				async : false,
				error : function(request) {
					alert("Connection error");
				},
				success : function(data) {
					var json = eval("(" + data + ")");
					if (json.result == 1) {
						article_like_object.innerHTML = json.like;
					} else {

					}
				}
			});
		}
	</script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>
	<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
	<script src="assets/js/main.js"></script>

</body>
</html>