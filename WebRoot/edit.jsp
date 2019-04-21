<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="proPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html><html>
<head>
    <title>Web布拉格</title>
    <meta charset='UTF-8'>

    <script src='${proPath}/assets/js/prefixfree.min.js'></script>


    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">

    <!-- 可选的Bootstrap主题文件（一般不用引入） -->
   <!--  <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap-theme.min.css"> -->

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="${proPath}/assets/js/markdown.min.js"></script>
    <script>
        function doUpload() {
            var formData = new FormData($( "#uploadForm" )[0]);
             $.ajax({
                  url: '/upload_image.action' ,
                  type: 'POST',
                  data: formData,
                  async: false,
                  cache: false,
                  contentType: false,
                  processData: false,
                  success: function (returndata) {
                      var json = eval("(" + returndata + ")");
                      alert('图片上传成功');
                      document.getElementById("img_url").value = json.img_url;

                  },
                  error: function (returndata) {
                      alert('图片上传失败');
                  }
             });
    }
    </script>
    <style class="cp-pen-styles">
@import url(http://weloveiconfonts.com/api/?family=fontawesome);

/* fontawesome */
[class*="fontawesome-"]:before {
  font-family: 'FontAwesome', sanst-serif;
  font-size:21px;
  position: absolute;
  margin-top: 15px;
  margin-left: 24px;
}

body{
  margin:0px;
  font-family: Arial, Helvetica, sans-serif;
  background:#E5EBEF;
}

div .header{
  background: rgba(183, 223, 218, 0.8);
  width:100%;
  height:60px;
  position:fixed;
  z-index:1;
  padding-left:100px;
}

div .sidebar .circles{
  border-style:solid;
  border-color:white;
  border-radius:50%;
  border-width:5px;
  width:10px;
  height:10px;
  margin-top:30px;
  margin-left:15px;
  float:left;
  
  box-shadow: 16px 0px 0px -5px #2ebaae,
              16px 0px 0px 0px white,
              32px 0px 0px -5px #2ebaae,
              32px 0px 0px 0px white;
  
  position:relative;
}
div .sidebar .exitMenu input{
  display:none;
}

div .sidebar .exitMenu label{
  border-style:solid;
  border-color:white;
  border-radius:50%;
  border-width:5px;
  width:20px;
  height:20px;
  margin-left:-10px;
  float:left;
  
  position:absolute;
  bottom:35px;
}

div .sidebar .exitMenu input:checked ~ label{
  border-style:double;
}

div .sidebar .exitMenu input:checked ~ .finishButton{
  bottom:-100px;
}

div .sidebar label:not(:first-child):hover{
  opacity:.8;
  cursor:pointer;
}

div .header .path{
   margin-top:15px;
}

div .header .path p{
  color:rgba(255,255,255,.7);
  float:left;
}
div .header .path p:hover{
  color:rgba(255,255,255,1);
  cursor:pointer;
}

div .header .path p:not(:first-child):before{
  content: ">";
  margin:0px 50px;
	display:block-inline;
  color: #b7dfda;
  font-weight:bold;
}

div .header .logo{
  margin-top:10px;
  margin-right:180px;
  float:right;
  font-size:25px;
}

div .header .logo:after {
	content: "By Rikard Legge";
  color:#2A4C6F;
}


div .sidebar{
  background: #979797;
  width:80px;
  position:fixed;
  height:100%;
}

div .content{
  margin-left:80px;
  
  padding-top:110px;
  padding-left:80px;
  padding-right:80px;
}

.content h1{
  font-size:40px;
  color: rgba(150,150,150, 0.8);
  text-shadow: 0px 0px 6px #def, 0 0 0 #000, 0px 0px 6px #def;
  padding:5px;
  outline: none;
  transition:.2s;
}

h1:focus{
  background:white;
  border-radius:5px;
  box-shadow:inset 0px 0px 5px 0px grey;
  text-shadow: none;
  color:#444;
}
h1:hover{
  background:white;
  border-radius:5px;
  box-shadow:inset 0px 0px 5px 0px grey;
  text-shadow: none;
  color:#444;
}

::selection {
background-color:  #aaaaaa;
color: #ffffff;
}

.content #contentText{
  width:100%;
  border:none;
  min-height:200px;
  
  border-radius:10px;
  
  padding: 20px;
  outline: none; 
  resize: none;
  
  font-family: Arial, Helvetica, sans-serif;
  font-size:16px;
  
  line-height:180%;
  margin-bottom:30px;
  margin-top:30px;
  transition:.2s;
}

.content #contentText:focus{
  background:white;
  box-shadow: inset 0px 0px 4px -1px black;
}
.content #contentText:hover{
  background:white;
  box-shadow: inset 0px 0px 4px -1px black;
}

.textEditing{
  margin-left:8px;
}

.textEditing input{
  display:none;
}

.textEditing span{
  margin:0px;
  margin-left:-5px;
  cursor:pointer;
}

.textEditing #link{
  display:inline-block;
  position:absolute;
  margin-top:17px;
  width:0;
  transition:.4s;
  overflow:hide;
  border:none;
}

.textEditing input:first-child + label span:after {
  border-top-left-radius: 7px;
  border-bottom-left-radius: 7px;
}

.textEditing input:nth-last-child(2) + label span:after {
  border-top-right-radius: 7px;
  border-bottom-right-radius: 7px;
}

.textEditing span:after {
	content: "";
	display:inline-block;

	width: 65px;
	height: 50px;
  
  border-color:#B8C3CB;
  border-width:1px;
  border-style:solid;
	background-color:#F2F6F8;
}

.textEditing #linkLable span:after{
  background:#29343A;
  transition:.4s;
  width:0px;
}

.textEditing input:checked + label span:after {
    background-color:#29343A;
  color:#fff;
}

.textEditing input:checked + label span {
  color:#fff;
}

.textEditing #attachment:checked ~ #linkLable span:after {
  width:320px;
}

.textEditing #attachment:checked ~ #link {
  width:300px;
}

.textEditing span:hover:after {
    background-color:white;
}

div .finishButton {
  padding-top:20px;
  padding-bottom:20px;
  width:calc(100% - 80px);
  margin-left:80px;
  position:fixed;
  bottom:0;
  background:#E5EBEF;
  transition:.3s ease;
  
  box-shadow: 0px 0px 0px #fff, 0px 0px 5px #888;
}

.finishButton a{
    background-color: #999;
    border-radius: 7px;
    border-width:1px;
    border-color:#eee;
    border-style:solid;
  
    color: #4f4f4f;
    display: inline-block;
    margin-right: 20px;
    padding: 15px 0px;
    width:130px;
    text-align:center;
    text-decoration: none;
    vertical-align: middle;
}

.finishButton a:hover{
   box-shadow:inset 0px 0px 3px #979797;
}

#publish{
    background-color: #cac9c8;
    margin-left:80px;
}
#save{
    background-color: #b7dfda;
    margin-left:10px;
}
#delete{
    background-color: #fcbfa9;
    position:absolute;
    right:50px;
}

input{
   outline: none;

}


	.author {
		display: -moz-flex;
		display: -webkit-flex;
		display: -ms-flex;
		display: flex;
		-moz-flex-direction: row;
		-webkit-flex-direction: row;
		-ms-flex-direction: row;
		flex-direction: row;
		-moz-align-items: center;
		-webkit-align-items: center;
		-ms-align-items: center;
		align-items: center;
		-moz-justify-content: -moz-flex-end;
		-webkit-justify-content: -webkit-flex-end;
		-ms-justify-content: -ms-flex-end;
		justify-content: flex-end;
		border-bottom: 0;
		font-family: "Raleway", Helvetica, sans-serif;
		font-size: 1.0em;
		font-weight: 400;
		letter-spacing: 0.25em;
		text-transform: uppercase;
		white-space: nowrap;
	}

		.author .name {
			-moz-transition: border-bottom-color 0.2s ease;
			-webkit-transition: border-bottom-color 0.2s ease;
			-ms-transition: border-bottom-color 0.2s ease;
			transition: border-bottom-color 0.2s ease;
			border-bottom: dotted 1px rgba(160, 160, 160, 0.65);
			display: block;
			margin: 0 1.5em 0 0;
		}

		.author img {
			border-radius: 50%;
			display: block;
			width: 4em;
		}

		.author:hover .name {
			border-bottom-color: transparent;
		}

    </style></head><body>
<div class="main"> 
  <div class="header">
    <div class="path">
      <a href="${proPath}/personal.action" class="author" ><span class="name">${ user.userName }</span><img src="${ user.userPhoto }" alt="" /></a>
      <a href="#" style="position: relative; bottom: 70px; color: #29343A"><h3>提笔写博客</h3></a>
    </div>
  </div>
  <div class="sidebar">
    <div class="circles"></div>
    <div class="exitMenu">
      <input type="checkbox" id="exitMenuCheckbox"/> 
      <label for="exitMenuCheckbox"></label>
      <div class="finishButton">
        <a href="javascript:publish();" id="publish">发布</a>
        <a href="javascript:void(0);" id="save">保存草稿</a>
        <a href="javascript:void(0);" id="delete">删除草稿</a>
      </div>
    </div>
  </div>
  <div class="content" >
    <h1 contenteditable="true" id="blog_title">博文题目</h1>
    <div class="textEditing">
      
      <input type="checkbox" id="bold"><label for="bold"><span class="fontawesome-bold"></span></label></input>
      <input type="checkbox" id="italic"><label for="italic"><span class="fontawesome-italic"></span></label></input>
      <input type="checkbox" id="underline"><label for="underline"><span class="fontawesome-underline"></span></label></input>
      <input type="radio" name="textStyle" id="left" ><label for="left"><span class="fontawesome-align-left"></span></label></input><input type="radio" name="textStyle" id="center"><label for="center"><span class="fontawesome-align-center"></span></label></input>
      <input type="radio" name="textStyle" id="right"><label for="right"><span class="fontawesome-align-right"></span></label></input>
      <input type="radio" name="textStyle" id="justify"><label for="justify"><span class="fontawesome-align-justify"></span></label></input>
      <form id="uploadForm">
          <input type="file" id="image"  name="file" onchange="doUpload();"/><label for="image"><span class="fontawesome-picture"></span></label></input>
      </form>
      <input type="checkbox" id="attachment"><label for="attachment"><span class="fontawesome-link"></span></label></input>
      <input type="" id="link"><label for="link" id="linkLable"><span id=""></span></label></input>
      <input type="checkbox" id="code"><label for="code"><span class="fontawesome-quote-right"></span></label></input>
    </div>
   <div>
      <div class="dropdown">
          <button class="btn btn-lg btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
           博客栏目
            <span class="caret"></span>
          </button>
          <ul class="dropdown-menu" aria-labelledby="dropdownMenu1"  >
            <li><a href="javascript:setType('技术美文')">技术美文</a></li>
            <li><a href="javascript:setType('心灵鸡汤')">心灵鸡汤</a></li>
            <li><a href="javascript:setType('心情杂记')">心情杂记</a></li>
            <li><a href="javascript:setType('旅行游记')">旅行游记</a></li>
            <li><a href="javascript:setType('至美一拍')">至美一拍</a></li>
          </ul>
        </div>

          </div>
        </div>



        <div class="content"  style="width:700px; position: absolute;">
        <div>
          <p id="contentText" contenteditable="true">写下你的博客吧！</p>
            <input type="hidden" id="img_url">
            <input type="hidden" id="type">
          </div>
        </div>


    <div class="content"  style="width: 700px; position: absolute;left: 600px;" >
        <div>
         <%--  <p id="mk_contentText" contenteditable="true" >写下你的博客吧！</p> --%>
            <div id="mk_contentText"></div>
          </div>
        </div>
    </div>







<script>




$( "#contentText" ).keyup(function() {
    $( "#exitMenuCheckbox" ).prop('checked', true);
    var input_context_text = document.getElementById('contentText').innerText;
    document.getElementById('mk_contentText').innerHTML = markdown.toHTML(input_context_text);
});

$( "#mk_contentText" ).keyup(function() {
    $( "#exitMenuCheckbox" ).prop('checked', true);
});

$( "#bold" ).change(function() {
  if($('#bold').prop('checked')){
    $("#contentText").css("font-weight","bold");
  }else{
    $("#contentText").css("font-weight","normal");
  }
});

$( "#italic" ).change(function() {
  if($('#italic').prop('checked')){
    $("#contentText").css("font-style","italic");
  }else{
    $("#contentText").css("font-style","normal");
  }
});

$( "#underline" ).change(function() {
  if($('#underline').prop('checked')){
    $("#contentText").css("text-decoration","underline");
  }else{
    $("#contentText").css("text-decoration","none");
  }
});

$( "#left" ).click(function() {
  $("#contentText").css("text-align","left");
});
$( "#center" ).click(function() {
  $("#contentText").css("text-align","center");
});
$( "#right" ).click(function() {
  $("#contentText").css("text-align","right");
});
$( "#justify" ).click(function() {
  $("#contentText").css("text-align","justify");
});

$(document).on('scroll', function() {
   $( "#exitMenuCheckbox" ).prop('checked', true);
});

$( "#publish" ).mouseup(function() {
  $("#articleHeaderName").text($("h1").text());
});

$( "#save" ).mouseup(function() {
  $("#articleHeaderName").text($("h1").text()+" (Draft)");
});

$( "#delete" ).mouseup(function() {
  $("#articleHeaderName").text("Create New Article");
  $("h1").text("Simple blog editor - A great way of learning");
  $("#contentText").text("Clered");
});

function setType(type) {
    document.getElementById("dropdownMenu1").innerText = type;
    document.getElementById("type").value = type;
}

function publish() {

    var type = document.getElementById("type").value;

    var title = $("#blog_title")[0].innerHTML;
    var content = $("#contentText")[0].innerHTML
    var img_url = document.getElementById("img_url").value;
    if (!img_url){
        alert('你需要上传一张图片');
        return;
    }
    if (!type){
        alert('你需要为文章选择一个类型');
        return;
    }
    //alert($("#contentText")[0].innerHTML);
    $.ajax({
        cache: true,
        type: "POST",
        url:'/publish_article.html',
        data:'title=' + title + '&content=' + content + '&img_url=' + img_url + '&type=' + type,
        async: false,
        error: function(request) {
            alert("Connection error");
        },
        success: function(data) {
            document.getElementById("img_url").value = '';
            document.getElementById("type").value = '';
            var json = eval("(" + data + ")");
            if (json.result == 1){
                alert('上传成功');
                location.href='personal.html';
            }else{
                if(json.result == 2){
                    alert('上传成功');
                    location.href='index.html';
                }else{
                    alert('上传失败');
                }

            }
            //$("#commonLayout_appcreshi").parent().html(data);
        }
    });

}
</script>



</body></html>