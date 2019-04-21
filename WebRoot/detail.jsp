<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="proPath" value="${pageContext.request.contextPath}" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib  uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>${ article.title }</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="${proPath}/static/assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="${proPath}/assets/css/main.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="${proPath}/assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="${proPath}/assets/css/ie8.css" /><![endif]-->
        <link rel="stylesheet" href="${proPath}/edit.md/css/editormd.preview.css" />
	</head>
	<body class="single">
		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Header -->
					<header id="header">
						<h1><a href="${proPath}/index.action">寒江独钓</a></h1>
						<nav class="links">
							<ul>
								<li><a href="${proPath}/index.action?type=技术美文">技术美文</a></li>
								<li><a href="${proPath}/index.action?type=心灵鸡汤">心灵鸡汤</a></li>
								<li><a href="${proPath}/index.action?type=心情杂记">心情杂记</a></li>
								<li><a href="${proPath}/index.action?type=旅行游记">旅行游记</a></li>
								<li><a href="#">关于</a></li>
							</ul>
						</nav>
						<nav class="main">
							<ul>
								
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
                                    <h2><button style="width: 285px;" class="btn-default" type="button" onclick="javascript:window.location.href='${proPath}/article/CreateMarkdown.action'">&nbsp;提笔写博客&nbsp;</button></h2>
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
                                                        <h2>苦海无涯，python是岸</h2>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="#" class="author">
                                                        <h2>苦海无涯，python是岸</h2>
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
                                                        <h2>穷游鼓浪屿</h2>
                                                    </a>
                                                </li>
                                                <li>
                                                    <a href="#" class="author">
                                                        <h2>穷游鼓浪屿</h2>
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
                                        <a href="#" class="author" style="position: relative; right: 100px;"><span class="name">${ user.userName }</span><img src="${ user.userPhoto}" alt="" /></a>
                                        <li><a href="${proPath}/user/logout.action" class="button big fit">再见，登出</a></li>
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
										<h2><a href="#">${ article.title}</a></h2>
										<p>${ article.articleType }</p>
									</div>
									<div class="meta">
										<time class="published" datetime="2015-11-01"><fmt:formatDate value="${ article.addTime}" pattern="yyyy年MM月dd日" /></time>
										<a href="personal.action?userId=${article.userId}" class="author" ><span class="name">${ article.user.userName }</span><img src="${ article.user.userPhoto }" alt="" /></a>
									</div>
								</header>
								<span class="image featured"><img src="${ article.imgUrl }" alt="" /></span>
								<div id="test-editormd-view">
                                    <textarea style="display:none;" name="test-editormd-markdown-doc">###Hello world!</textarea>
                                </div>
								<footer>
									<ul class="stats">
										<li><a href="javascript:add_like(${ article.articleId })" id="${ article.articleId }" class="icon fa-heart">${ article.likeNum }</a></li>
										<li><a href="#" class="icon fa-comment"><span id = "sourceId::article_${ article.articleId}" class = "cy_cmt_count" ></span></a></li>
									</ul>
								</footer>
							</article>
                            <script id="cy_cmt_num" src="http://changyan.sohu.com/upload/plugins/plugins.list.count.js?clientId=cysAHuAOu" ></script>
<%--
{#                            <!--高速版-->#}
{#                            <div id="SOHUCS" sid="article_${ article.id }"></div>#}
{#                            <script charset="utf-8" type="text/javascript" src="http://changyan.sohu.com/upload/changyan.js" ></script>#}
{#                            <script type="text/javascript">#}
{#                            window.changyan.api.config({#}
{#                            appid: 'cysAHuAOu',#}
{#                            conf: 'prod_a1f8ba9ce089c9a5f77eff9414f4ef2e'#}
{#                            });#}
{#                            </script>--%>

                            <!--PC和WAP自适应版-->
                            <div id="SOHUCS" sid="article_${article.articleId}" ></div>
                            <script type="text/javascript">
                            (function(){
                            var appid = 'cysAHuAOu';
                            var conf = 'prod_a1f8ba9ce089c9a5f77eff9414f4ef2e';
                            var width = window.innerWidth || document.documentElement.clientWidth;
                            if (width < 960) {
                            window.document.write('<script id="changyan_mobile_js" charset="utf-8" type="text/javascript" src="http://changyan.sohu.com/upload/mobile/wap-js/changyan_mobile.js?client_id=' + appid + '&conf=' + conf + '"><\/script>'); } else { var loadJs=function(d,a){var c=document.getElementsByTagName("head")[0]||document.head||document.documentElement;var b=document.createElement("script");b.setAttribute("type","text/javascript");b.setAttribute("charset","UTF-8");b.setAttribute("src",d);if(typeof a==="function"){if(window.attachEvent){b.onreadystatechange=function(){var e=b.readyState;if(e==="loaded"||e==="complete"){b.onreadystatechange=null;a()}}}else{b.onload=a}}c.appendChild(b)};loadJs("http://changyan.sohu.com/upload/changyan.js",function(){window.changyan.api.config({appid:appid,conf:conf})}); } })(); </script>
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
        <script src="${proPath}/edit.md/js/jquery.min.js"></script>
        <script src="${proPath}/edit.md/lib/marked.min.js"></script>
        <script src="${proPath}/edit.md/lib/prettify.min.js"></script>

        <script src="${proPath}/edit.md/lib/raphael.min.js"></script>
        <script src="${proPath}/edit.md/lib/underscore.min.js"></script>
        <script src="${proPath}/edit.md/lib/sequence-diagram.min.js"></script>
        <script src="${proPath}/edit.md/lib/flowchart.min.js"></script>
        <script src="${proPath}/edit.md/lib/jquery.flowchart.min.js"></script>

        <script src="${proPath}/edit.md/js/editormd.js"></script>
        <script type="text/javascript">
            $(function() {
                var testEditormdView, testEditormdView2;
                $.get("articleMd.action?articleId=${ article.articleId }", function(markdown) {

				    testEditormdView = editormd.markdownToHTML("test-editormd-view", {
                        markdown        : markdown ,//+ "\r\n" + $("#append-test").text(),
                        //htmlDecode      : true,       // 开启 HTML 标签解析，为了安全性，默认不开启
                        htmlDecode      : "style,script,iframe",  // you can filter tags decode
                        //toc             : false,
                        tocm            : true,    // Using [TOCM]
                        //tocContainer    : "#custom-toc-container", // 自定义 ToC 容器层
                        //gfm             : false,
                        //tocDropdown     : true,
                        // markdownSourceCode : true, // 是否保留 Markdown 源码，即是否删除保存源码的 Textarea 标签
                        emoji           : true,
                        taskList        : true,
                        tex             : true,  // 默认不解析
                        flowChart       : true,  // 默认不解析
                        sequenceDiagram : true,  // 默认不解析
                    });

                    //console.log("返回一个 jQuery 实例 =>", testEditormdView);

                    // 获取Markdown源码
                    //console.log(testEditormdView.getMarkdown());

                    //alert(testEditormdView.getMarkdown());
                });

                testEditormdView2 = editormd.markdownToHTML("test-editormd-view2", {
                    htmlDecode      : "style,script,iframe",  // you can filter tags decode
                    emoji           : true,
                    taskList        : true,
                    tex             : true,  // 默认不解析
                    flowChart       : true,  // 默认不解析
                    sequenceDiagram : true,  // 默认不解析
                });
            });
        </script>
        <script>
            function add_like(id) {
                var article_like_object = document.getElementById(id);
                 $.ajax({
                    cache: true,
                    type: "GET",
                    url:'like.action',
                    data:'articleId='+id + '&time=' + new Date().getTime(),
                    async: false,
                    error: function(request) {
                        alert("Connection error");
                    },
                    success: function(data) {
                        var json = eval("(" + data + ")");
                        if (json.result == 1){
                            article_like_object.innerHTML = json.like;
                        }else{

                        }
                    }
                });
            }
        </script>

			<script src="${proPath}/assets/js/skel.min.js"></script>
			<script src="${proPath}/assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="${proPath}/assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="${proPath}/assets/js/main.js"></script>

	</body>
</html>