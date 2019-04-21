<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!%String path = request.getContextPath(); %>
<c:set var="proPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
	<head>
		<title>寒江独钓</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="${proPath}/assets/css/main.css" />

		<!--[if lte IE 9]><link rel="stylesheet" href="${proPath}/assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="${proPath}/assets/css/ie8.css" /><![endif]-->
	</head>

	<body>
	<div id="gadgetSWF" style="padding:10px"><embed type="application/x-shockwave-flash" src="http://cdn.abowman.com/widgets/fish/fish.swf" width="100%" height="200" id="flashID" name="flashID" bgcolor="#F0F7FF" quality="high" scale="noscale" salign="tl" flashvars="up_backgroundColor=F0F7FF" wmode="opaque" allowscriptaccess="always"></div>
	<script type="text/javascript" color="0,0,255" opacity='0.7' zIndex="-2" count="150" src="canvas.js"></script>
<div class="container">
			<div id="particles-js">
		<!-- Wrapper -->
		<div id="wrapper">

			<!-- Header -->
			<header id="header">
				<h1><a href="index.action">寒江独钓</a></h1>
				<nav class="links">
					<ul>
						<li>
							<a href="${proPath}/index.action?type=技术美文">技术美文</a>
						</li>
						<li>
							<a href="${proPath}/index.action?type=心灵鸡汤">心灵鸡汤</a>
						</li>
						<li>
							<a href="${proPath}/index.action?type=心情杂记">心情杂记</a>
						</li>
						<li>
							<a href="${proPath}/index.action?type=旅行游记">旅行游记</a>
						</li>
						<li>
							<a href="${proPath}/about.jsp">关于</a>
						</li>
						<li>
							<a href="${proPath}/photo.html">照片墙</a>
						</li>
					</ul>
				</nav>
				<nav class="main">
					<ul>
						<li class="search">
							<a class="fa-search" href="#search">搜索</a>
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
					</form>
				</section>

				<!-- Links -->
				<section>
					<ul class="links">
						<li>
							<a href="${proPath}/index.action?type=技术美文">
								<h3>技术美文</h3>
								<p>分享你的技术大招</p>
							</a>
						</li>
						<li>
							<a href="${proPath}/index.action?type=心灵鸡汤">
								<h3>心灵鸡汤</h3>
								<p>干了这碗鸡汤，让心灵即刻出发</p>
							</a>
						</li>
						<li>
							<a href="${proPath}/index.action?type=心情杂记">
								<h3>心情杂记</h3>
								<p>记录每天的酸甜苦辣咸</p>
							</a>
						</li>
						<li>
							<a href="i${proPath}/ndex.action?type=旅行游记">
								<h3>旅行游记</h3>
								<p>世界那么大，记录你的旅行</p>
							</a>
						</li>
					</ul>
				</section>

				<!-- Actions -->
				<section>
					<ul class="actions vertical">
						<c:choose>
							<c:when test="${not empty user }">
								<a href="${proPath}/personal.action" class="author" style="position: relative; right: 100px;"><span class="name">${user.userName }</span><img src="${ user.userPhoto}" alt="" /></a>
								<li>
									<a href="${proPath}/user/logout.action" class="button big fit">再见，登出</a>
								</li>
							</c:when>
							<c:otherwise>
								<li>
									<a href="login.jsp" class="button big fit">你好，登录</a>
								</li>
							</c:otherwise>
						</c:choose>
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
							<h2><a href="article/detail.action?articleId=${article.articleId}">${ article.title}</a></h2>
							<p>${article.articleType}</p>
						</div>
						<div class="meta">
							<time class="published" datetime="2015-11-01"><fmt:formatDate value="${ article.addTime}" pattern="yyyy年MM月dd日" /></time>
							<a href="personal.action?userId=${article.userId}" class="author"><span class="name">${ article.user.userName }</span><img src="${ article.user.userPhoto }" alt="" /></a>
						</div>
					</header>
					<a href="#" class="image featured"><img src="${article.imgUrl}" alt="" /></a>
					${fn:substring(article.content, 0, 140)}
					<footer>
						<ul class="actions">
							<li>
								<a href="article/detail.action?articleId=${ article.articleId }" class="button big">查看博文</a>
							</li>
							<c:if test="${article.userId eq user.userId}">
								<li>
									<a href="article/markdownEdit.action?articleId=${ article.articleId }&userId=${user.userId}" class="button big">编辑博文</a>
								</li>
							</c:if>
						</ul>
						<ul class="stats">
							<li>
								<a href="javascript:void(0)" id="${ article.articleId }" onclick="add_like('${ article.articleId }',this)" class="icon fa-heart">${ article.likeNum }</a>
							</li>
							<li>
								<a href="article/detail.action?articleId=${ article.articleId }" class="icon fa-comment"><span id="sourceId::article_${ article.articleId }" class="cy_cmt_count"></span></a>
							</li>
						</ul>
					</footer>
				</article>
				</c:forEach>
				<script id="cy_cmt_num" src="http://changyan.sohu.com/upload/plugins/plugins.list.count.js?clientId=cysAHuAOu"></script>

				<ul class="actions pagination">
					<c:choose>
						<c:when test="${last_page}">
							<li>
								<a href="index.action?page=${ page-1 }&type=${ type }" class="button big previous">上一页</a>
							</li>
						</c:when>
						<c:otherwise>
							<li>
								<a href="#" class="disabled button big previous">上一页</a>
							</li>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${next_page }">
							<li>
								<a href="index.action?page=${ page+1 }&type=${type}" class="button big next">下一页</a>
							</li>
						</c:when>
						<c:otherwise>
							<li>
								<a href="#" class="disabled button big next">下一页</a>
							</li>
						</c:otherwise>
					</c:choose>
				</ul>

			</div>

			<!-- Sidebar -->
			<section id="sidebar">

				<!-- Intro -->
				<section id="intro">
					<a href="#" class="logo"><img src="images/logo.jpg" alt="" /></a>
					<header>
						<h2>寒江独钓</h2>
						<p>写出你的有情调的web技术博客</p>
						<c:choose>
						<c:when test="${not empty user}">
						<h2><button class="btn-default" type="button" onclick="javascript:window.location.href='article/CreateMarkdown.action'">&nbsp;提笔写博客&nbsp;</button></h2> </c:when><c:otherwise>
						<h2><button class="btn-default" type="button" onclick="javascript:window.location.href='login.jsp'">&nbsp;提笔写博客&nbsp;</button></h2> </c:otherwise></c:choose>
						<embed width="240" height="180" align="middle" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" allowscriptaccess="always" name="honehoneclock" bgcolor="#ffffff" quality="high" src="http://oc6tkx0t5.bkt.clouddn.com/clock.swf" wmode="transparent">

						<button type="button" onclick="javascript:window.location.href='index.action'">
                                  <h2> 本站访问量:<span  style="color: #2ebaae">${ accessTime }</span></h2>
                                </button>
					</header>
				</section>

				

				<!-- Posts List -->

				<!-- About -->
				<section class="blurb">
					<h2>Web 布拉格</h2>
					<p>一个充满情调的私人博客，分享你的技术，做优雅的程序员！</p>
					<ul class="actions">
						<li>
							<a href="about.jsp" class="button">关于&nbsp;&nbsp;&nbsp;&nbsp;了解更多</a>
						</li>
					</ul>
				</section>

				<!-- Footer -->
				<section id="footer">
					<ul class="icons">
						<li>
							<a href="#" class="fa-rss"><span class="label">RSS</span></a>
						</li>
						<li>
							<a href="#" class="fa-envelope"><span class="label">Email</span></a>
						</li>
					</ul>
					<!-- <p style="color: #2ebaae">联系我</p>
					<p style="color: #2ebaae">Mail:&nbsp;yangyuan AT imudges.com</p> -->
					<!-- <a href="http://webscan.360.cn/index/checkwebsite/url/www.webprague.com"><img border="0" src="http://img.webscan.360.cn/status/pai/hash/7cb88094324ea98122197327aa356dce" /></a>
					 --><!-- <p>©2016-2017 Web布拉格 / -->
						<!-- <a href="http://www.miitbeian.gov.cn" target="_blank">蒙ICP备15004419号-2</a> / </p> -->
					<!-- <p>Developed by yangyuan</p> -->
				</section>
			</section>

		</div>
	</div>
		</div>
		<!-- Scripts -->
		<script src="assets/js/jquery.min.js"></script>

		<script>
			function add_like(id) {
			//alert(id);
				var article_like_object = document.getElementById(id);
				$.ajax({
					cache: true,
					type: "GET",
					url: '${proPath}/article/like.action',
					data: 'articleId=' + id + '&time=' + new Date().getTime(),
					async: false,
					error: function(request) {
						alert("Connection error");
					},
					success: function(data) {
						//var json = eval("(" + data + ")");
						//alert(data);
						json=data;
						if(json.result == 1) {
							article_like_object.innerHTML = json.like;
						} else {

						}
					}
				});
			}
		</script>

		<script src="${proPath}/assets/js/skel.min.js"></script>
		<script src="${proPath}/assets/js/util.js"></script>
		<!--[if lte IE 8]><script src="${proPath}/assets/js/ie/respond.min.js"></script><![endif]-->
		<script src="${proPath}/assets/js/main.js"></script>
		<script src="${proPath}/js/loginjs/particles.js"></script>
		<script src="${proPath}/js/loginjs/app.js"></script>

	</body>

</html>