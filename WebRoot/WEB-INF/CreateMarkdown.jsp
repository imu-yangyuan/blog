<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="proPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="zh">
    <head>
        <meta charset="utf-8" />
        <title>Web布拉格</title>
        <link rel="stylesheet" href="${proPath}/edit.md/css/style.css" />
        <link rel="stylesheet" href="${proPath}/edit.md/css/editormd.css" />
        <link rel="shortcut icon" href="https://pandao.github.io/editor.md/favicon.ico" type="image/x-icon" />
        <link href="http://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
    <!-- 可选的Bootstrap主题文件（一般不用引入） -->
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
        <style>



            /*.editormd-preview-theme-dark {
                color: #777;
                background:#2C2827;
            }

            .editormd-preview-theme-dark .editormd-toc-menu > .markdown-toc {
                background:#fff;
                border:none;
            }

            .editormd-preview-theme-dark .editormd-toc-menu > .markdown-toc h1{
                border-color:#ddd;
            }

            .editormd-preview-theme-dark .markdown-body h1,
            .editormd-preview-theme-dark .markdown-body h2,
            .editormd-preview-theme-dark .markdown-body hr {
                border-color: #222;
            }

            .editormd-preview-theme-dark .editormd-preview-container  blockquote {
                color: #555;
                border-color: #333;
                background: #222;
                padding: 0.5em;
            }

            .editormd-preview-theme-dark .editormd-preview-container abbr {
                background:#ff9900;
                color: #fff;
                padding: 1px 3px;
                border-radius: 3px;
            }

            .editormd-preview-theme-dark .editormd-preview-container code {
                background: #5A9600;
                color: #fff;
                border: none;
                padding: 1px 3px;
                border-radius: 3px;
            }

            .editormd-preview-theme-dark .editormd-preview-container table {
                border: none;
            }

            .editormd-preview-theme-dark .editormd-preview-container .fa-emoji {
                color: #B4BF42;
            }

            .editormd-preview-theme-dark .editormd-preview-container .katex {
                color: #FEC93F;
            }

            .editormd-preview-theme-dark [class*=editormd-logo] {
                color: #2196F3;
            }

            .editormd-preview-theme-dark .sequence-diagram text {
                fill: #fff;
            }

            .editormd-preview-theme-dark .sequence-diagram rect,
            .editormd-preview-theme-dark .sequence-diagram path {
                color:#fff;
                fill : #64D1CB;
                stroke : #64D1CB;
            }

            .editormd-preview-theme-dark .flowchart rect,
            .editormd-preview-theme-dark .flowchart path {
                stroke : #A6C6FF;
            }

            .editormd-preview-theme-dark .flowchart rect {
                fill: #A6C6FF;
            }

            .editormd-preview-theme-dark .flowchart text {
                fill: #5879B4;
            }*/
        </style>
    </head>
    <body>
        <div id="layout">
            <header>
                <h1 style="font-size:50px" contenteditable="true" id="blog_title">博文题目</h1>
                <!-- Single button -->
                <br>
                <form id="uploadForm" >
                    <input class="btn btn-lg btn-primary" name="editormd-image-file" type="file" value="上传图片" onchange="do_upload()"/>
                </form>
              <div>
              <div class="dropdown">
                  <br>
                  <button class="btn btn-default btn-lg dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                   博客栏目
                    <span class="caret"></span>
                  </button>
                  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1" id="dropdownMenu1">
                    <li><a href="javascript:set_article_type('技术美文')">技术美文</a></li>
                    <li><a href="javascript:set_article_type('心灵鸡汤')">心灵鸡汤</a></li>
                    <li><a href="javascript:set_article_type('心情杂记')">心情杂记</a></li>
                    <li><a href="javascript:set_article_type('旅行游记')">旅行游记</a></li>
                    <li><a href="javascript:set_article_type('至美一拍')">至美一拍</a></li>
                  </ul>
                </div>

          </div>
                <input type="hidden" id="imgUrl">
                <input type="hidden" id="type">
            </header>
            <div id="test-editormd"></div>
        </div>
        <br>
        <button type="button" class="btn btn-lg btn-primary"  onclick="submit_blog()">发表博客</button>
        <br><br><br>
        <script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>



        <script src="http://cdn.bootcss.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
        <script src="${proPath}/edit.md/js/jquery.min.js"></script>
        <script src="${proPath}/edit.md/js/editormd.js"></script>

        <c:if test="${not empty article.articleType} }"> 
        <script>
        document.getElementById("type").value = '${ article.articleType}';
        document.getElementById("imgUrl").value = '${ article.imgUrl}';
        </script>
        </c:if>

        <script type="text/javascript">
            var testEditor;

            $(function() {

                $.get('${proPath}/edit.md/test.md', function(md){
                    testEditor = editormd("test-editormd", {
                        width: "90%",
                        height: 740,
                        path : '${proPath}/edit.md/lib/',
                        theme : "dark",
                        previewTheme : "dark",
                        editorTheme : "pastel-on-dark",
                        markdown : md,
                        codeFold : true,
                        //syncScrolling : false,
                        saveHTMLToTextarea : true,    // 保存 HTML 到 Textarea
                        searchReplace : true,
                        //watch : false,                // 关闭实时预览
                        htmlDecode : "style,script,iframe|on*",            // 开启 HTML 标签解析，为了安全性，默认不开启
                        //toolbar  : false,             //关闭工具栏
                        //previewCodeHighlight : false, // 关闭预览 HTML 的代码块高亮，默认开启
                        emoji : true,
                        taskList : true,
                        tocm            : true,         // Using [TOCM]
                        tex : true,                   // 开启科学公式TeX语言支持，默认关闭
                        flowChart : true,             // 开启流程图支持，默认关闭
                        sequenceDiagram : true,       // 开启时序/序列图支持，默认关闭,
                        //dialogLockScreen : false,   // 设置弹出层对话框不锁屏，全局通用，默认为true
                        //dialogShowMask : false,     // 设置弹出层对话框显示透明遮罩层，全局通用，默认为true
                        //dialogDraggable : false,    // 设置弹出层对话框不可拖动，全局通用，默认为true
                        //dialogMaskOpacity : 0.4,    // 设置透明遮罩层的透明度，全局通用，默认值为0.1
                        //dialogMaskBgColor : "#000", // 设置透明遮罩层的背景颜色，全局通用，默认为#fff
                        imageUpload : true,
                        imageFormats : ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
                        imageUploadURL : "${proPath}/article/markdown_upload_image.action",
                        onload : function() {
                            console.log('onload', this);
                            //this.fullscreen();
                            //this.unwatch();
                            //this.watch().fullscreen();

                            //this.setMarkdown("#PHP");
                            //this.width("100%");
                            //this.height(480);
                            //this.resize("100%", 640);
                        }
                    });
                });
            });
            //提交博客
            function submit_blog() {
                //alert(testEditor.getMarkdown());       // 获取 Markdown 源码
                //alert(testEditor.getHTML());           // 获取 Textarea 保存的 HTML 源码
                //alert(testEditor.getPreviewedHTML());  // 获取预览窗口里的 HTML，在开启 watch 且没有开启 saveHTMLToTextarea 时使用
                var type = document.getElementById("type").value;

                var title = $("#blog_title")[0].innerHTML;
                //var content = $("#contentText")[0].innerHTML;
                var imgUrl = document.getElementById("imgUrl").value;

                if (!type){
                    alert('你需要为文章选择一个类型');
                    return;
                }
               	// alert('title=' + title + '&content=' + testEditor.getHTML() + '&imgUrl=' + imgUrl + '&type=' + type + '&markdown=' + testEditor.getMarkdown());
                //alert($("#contentText")[0].innerHTML);

                $.ajax({                
                    cache: true,
                    type: "POST",
                    url:'${proPath}/article/insert.action',
                    data: 'articleId=${article.articleId}&title='+ title + '&content=' + testEditor.getHTML().replace(/&/g,'###***').replace(/;/g,'***###') + '&imgUrl=' + imgUrl + '&articleType=' + type + '&markdown=' + testEditor.getMarkdown().replace(/&/g,'###***').replace(/;/g,'***###'),
                    async: false,
                    error: function(request) {
                        alert("Connection error");
                    },
                    success: function(data) {
                        document.getElementById("imgUrl").value = '';
                        document.getElementById("type").value = '';
                        var json = data;
                        if (json.result == 1){
                            alert('上传成功');
                            location.href='${proPath}/personal.action';
                        }else{
                            if(json.result == 2){
                                alert('上传成功');
                                location.href='${proPath}/index.action';
                            }else{
                                alert('上传失败');
                            }

                        }
                        //$("#commonLayout_appcreshi").parent().html(data);
                    }
                });
            }

            //改变文章属性
            function set_article_type(type) {
                document.getElementById("dropdownMenu1").innerText = type;
                document.getElementById("type").value = type;
            }

            //上传主题图片
            function do_upload() {
                var formData = new FormData($("#uploadForm")[0]);
                $.ajax({
                    url: '${proPath}/article/markdown_upload_image.action',
                    type: 'POST',
                    data: formData,
                    async: false,
                    cache: false,
                    contentType: false,
                    processData: false,
                    success: function (returndata) {
                    //alert(returndata);
                        alert('图片上传成功');
                        document.getElementById("imgUrl").value = returndata.url;
                    },
                    error: function (returndata) {
                        alert('图片上传失败');
                    }
                });
            }

            //上传图片

            function publish() {



            }

        </script>
    </body>
</html>