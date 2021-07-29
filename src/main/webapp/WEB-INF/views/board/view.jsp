<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Oswald&display=swap"
	rel="stylesheet" />
<script src="https://kit.fontawesome.com/4b9845fccc.js"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<title>Kimyunyeong Portfolio</title>
<meta charset="UTF-8" />
</head>
<body>

	<div class="title">게시판</div>

	<section class="gofish">
		<nav>
			<ul class="nav-bar">
				<li >게시글</li>
				<li class="no" value="${vo.no}">${vo.no} </li>
			</ul>
		</nav>

		<table class="hero">
			<tr class="context">
				<td >제목:${vo.title }</td>
			</tr>
		</table>
		<div class="som">
			<div class="contextbox">
				<p class="contentbox">내용: ${vo.content }
				<p>
			</div>
		</div>
		<div class="ctrl">
			<div class="ctrl-box">
				<div class="button" onclick="javascript:history.go(-1)">이전</div>
				<div class="button" id="edit" onclick="button()">수정</div>
			</div>

		</div>
		</section>
		
	
	<footer>
		<div class="commentBox">
		<input type="text" id="commentWr" value="글쓴이">
		<input type="text" id="commentLine" class="comment">
		</div>
		<div class="button3" id="commentGo" onclick="commentGo()">댓글달기</div>
		
		<div class ="commenthere">
		<div class="commentList">
		
		ss
		</div>
		</div>
	</footer>
	<style>
body {
	display: flex;
	flex-direction: column;
	font-family: "Oswald", sans-serif;
	/* 구글에서 폰트 가져옴 , 사용안할라면 푸터참조 */
	background-color: #e0e0e0;
}

.comment {
	width: 302px;
    height: 43px;
    margin: 0 12px 27px 0px;
    border: 0.2px solid darkgray;
}

.commentBox{
	display:flex;
	flex-direction: column;
	}

.commentList{
	border: 1px solid black;
    display: flex;
    width: 300px;
    height: 40px;
}

.button3 {
	border: 0;
    height: 10px;
    margin: -17px 0 20px 3px;
    padding: 8px 12px;
    font-size: 10px;
    background-color: #828282;
    width: 41px;
    border-radius: 18px;
    color: #ffffff;
	/* text-transform: uppercase; */
	/* text-align: center; */
}

.button3:hover {
	background: blue;
}

.som {
	display: flex;
	width: 100%;
	justify-content: center;
}

nav {
	width: 100%;
	height: 50px;
	display: flex;
	justify-content: center;
}

.title {
	font-size: 25px;
	font-style: inherit;
	/* align-items: center; */
	display: flex;
	justify-content: center;
	font-weight: 600;
}

.nav-bar {
	display: flex;
	justify-content: center;
	list-style-type: none;
	text-transform: uppercase;
	font-size: 12px;
	padding: 0;
}

.context {
	display: block;
	height: 30px;
	border: 1px solid lightgray;
	align-items: center;
	width: 400px;
	list-style-type: none;
	text-transform: uppercase;
	font-size: 12px;
	padding: 0;
}

.contextbox {
	display: flex;
	border: 1px solid lightgray;
	height: 200px;
	justify-content: center;
	width: 400px;
	list-style-type: none;
	text-transform: uppercase;
	font-size: 12px;
	padding: 0;
}

.context>td {
	width: 60px;
}

tr {
	margin-bottom: 5px;
}

li {
	margin: 13px 50px;
	border-bottom: 1px solid black;
}

ul {
	margin: 0 0 0 0;
}

section {
	width: 100%;
	/*height 있던자리 */
	/*background-image: repeating-linear-gradient(
        rgb(196, 32, 32),
        rgb(255, 255, 83)
      );*/
	background-color: white;
	display: flex;
	align-items: center;
	justify-content: center;
	flex-wrap: wrap;
}

.about-me {
	width: 300px;
	margin: 5px;
	display: flex;
	justify-content: space-evenly;
}

.info {
	max-width: 300px;
	margin: 30px;
}

#main {
	box-shadow: 2px 2px 5px grey;
}

.hero {
	width: 100%;
	/* height: 300px; */
	display: flex;
	justify-content: center;
	flex-wrap: wrap;
}

.ctrl {
	display: flex;
	justify-content: center;
	flex-direction: row;
}

.ctrl-box {
	display: flex;
	margin: 30px;
	width: 500px;
	justify-content: space-evenly;
}

.hero-info {
	margin: 30px;
	max-width: 300px;
}

.hero-image {
	width: 300px;
	height: 300px;
	margin: 30px;
}

.styled-break {
	width: 30px;
	height: 5px;
	background-color: #a17df4;
	border-radius: 2.5px;
	margin: 30px 0 30px 0;
}

.avatar {
	width: 150px;
	border-radius: 100%;
}

#name {
	font-size: 45px;
}

.test {
	width: 30px;
	height: 30px;
	background-color: red;
	margin: 5px;
}

.button {
	border: 0;
	padding: 10px 20px;
	font-size: 10px;
	background-color: #ef866c;
	width: 20px;
	border-radius: 20px;
	color: #ffffff;
	text-transform: uppercase;
	text-align: center;
}

.button:hover {
	background-color: #ef744b;
}

.button:active {
	box-shadow: inset -2px -2px 3px rgba(255, 255, 255, 0.6);
	/* inset통해서 많은 쉐도우를 넣을수있음 요 */
}

form {
	margin: 0 0 40px 0;
}

.input-section {
	margin: 20px 0;
	display: flex;
}

.input-group {
	display: flex;
	flex-direction: column;
	margin: 0 5px 0 0;
}

footer {
	    font-family: Arial, Helvetica, sans-serif;
    display: flex;
    flex-direction: column;
    width: 300px;
    /* justify-content: flex-end; */
    margin: 0 auto;
}

.far {
	margin: 3px;
}

a {
	text-decoration: none;
	color: black;
	/* 밑줄 없앰  */
}

a:hover {
	color: red;
}

a:active {
	color: purple;
}
</style>
</body>
<script type="text/javascript">

	commentGet();
	
	function commentGet(){
		console.log("댓글가져옵니다")
		var datas= new Object();
		datas.no= $(".no").val();
		console.log(datas);
		
		var getComment = JSON.stringify(datas);
		var dataComment;
		$.ajax({
			type:"GET",
			url: "getComment.do",
			dataType:'json',
			async: false,
			data : datas,
			success : function(data){
				dataComment = $(data);
				console.log(dataComment[0].writer+" check");
				console.log(dataComment[1].writer+" check");
			}    
			,error : function onError(error){
				console.log("error");
			}
		});
		
		console.log(dataComment)
		
		var commentBox = $(".commenthere");
		var stmt ="";
		for( var i=0; i<dataComment.length ; i++){
			stmt+="<div class='commentList'>"
			stmt+= "<p> "+ dataComment[i].writer+" </p>";
			stmt+="<p>"+ dataComment[i].comment+" </p>";
			stmt+="</div>"
		}
		console.log("checkin"+stmt);
		commentBox.html(stmt);
		
		
		
	}
	
	
	function commentGo(){
		var datas = new Object();
		datas.no = $(".no").val();
		datas.writer = $("#commentWr").val();
		datas.comments = $("#commentLine").val();
		console.log(datas);
		
		var jsonData = JSON.stringify(datas);
		
		$.ajax({
			type:"post",
			url: "writeCo.do",
			dataType:'json',
			data : datas,
			success : function(data){
				console.log("성공");
			}    
			
			
			
		});
		commentGet();
		
	}
	
	
	


	
	var html1 = "";
	var html2 = "";
	var buttonedit = "";

	function button() {
		$(".context").remove();
		$(".contentbox").remove();
		$("#edit").remove();
		html1 = "  <tr class='context'>";
		html1 += "<td><input id='title' type='textarea' placeholder='제목'></td>";
		html1 += "</tr>";
		console.log(html1);
		html2 = "<input id='content' type='textarea' placeholder='내용''>"

		buttonedit = "<div class='button' onclick='modify(${vo.no })'>완료</div>"
		$(".hero").append(html1);
		$(".contextbox").append(html2);
		$(".ctrl-box").append(buttonedit);
	}

	function modify(no) {
		var datas = new Object();
		datas.title = $("#title").val();
		datas.content = $("#content").val();
		datas.num = no;
		console.log(datas);

		var jsonData = JSON.stringify(datas);
		$.ajax({
			type : "post",
			url : "update.do",
			data : datas,
			success : function(data) {
				console.log("성공")
			}
		})

	}
</script>
</html>
