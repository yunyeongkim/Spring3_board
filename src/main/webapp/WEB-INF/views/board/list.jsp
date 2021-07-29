<%@page import="com.yun.board.vo.PagingVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:useBean id="board" class="com.yun.board.vo.BoardVO">
	<jsp:setProperty name="board" property="*" />
</jsp:useBean>
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

<script type="text/javascript">

	
	$(function() {

		// 글 리스트 중에 한줄을 클릭하면 게시판 글보기로 이동시키는 이벤트 처리
		$(".context").click(function() {
			// 글번호 찾기 - 클릭한 것(this=tr) 안에 글번호 클래스 객체(td) 안에 글자(text)
			var no = $(this).find(".no").text();
			// 글보기로 이동 - 글번호를 붙여서
			location = "view.do?no=" + no;
		});

		$(".button2").click(function() {
			var html3="";
			html3 ="<div class='write'>";
			html3+="<input type='text' id='title' value='titles' placeholder='제목'> ";
			html3+=" <input type='text' id='content' value='content' placeholder='내용'> ";
			html3+=" <input type='text' id='writer' value='writer' placeholder='글쓴이'>";
			html3+=" <div class='button' onclick='writeBoard()'>go </div>";
			html3+="</div>";
			$(".gofish").append(html3);
		});
	});
	
	function writeBoard(){
		var datas= new Object();
		datas.title =$("#title").val();
		datas.content=$("#content").val();
		datas.writer =$("#writer").val();
		
		var jsonData=JSON.stringify(datas);
		console.log(datas);
		
		$.ajax({
			type:"post",
			url: "write.do",
			dataType:'json',
			data : datas,
			success : function(data){
				console.log("성공");
			}    
			
		});
		
		
		
	}
</script>
</head>
<body>

	<div class="title">게시판</div>

	<section>
		<nav>
			<ul class="nav-bar">
				<li>NO</li>
				<li>TITLE</li>
				<li>WRITER</li>
				<li>DATE</li>
				<li>HIT</li>
			</ul>
		</nav>

		<table class="hero">

			<c:if test="${empty list }">
				<!-- 데이터가 없는 경우 처리 -->
				<tr>
					<td colspan="5" class="text-center">데이터가 존재하지 않습니다.</td>
				</tr>
			</c:if>

			<c:forEach items="${list }" var="vo">
				<tr class="context">
					<td class="no">${vo.no }</td>
					<td>${vo.title }</td>
					<td>${vo.writer }</td>
					<!-- 날짜형을 특별한 형식에 맞춰서 출력 : JSTL - fmt : JAVA-SimpleDateFormat -->
					<td><fmt:formatDate value="${vo.date }" pattern="yyyy.MM.dd" />
					</td>
					<td>${vo.hit }</td>
				</tr>
			</c:forEach>

			<a href=""></a>
		</table>
		<c:if test="${empty paging }">
			<!-- 데이터가 없는 경우 처리 -->
			<tr>
				<td colspan="5" class="text-center">데이터가 존재하지 않습니다.</td>
			</tr>
		</c:if>

		<footer>
			<div class="ctrl">
				<div class="ctrl-box">
					<div class="button">이전</div>
					<tr>
						<c:forEach var="i" begin="${paging.startPage }"
							end="${paging.lastPage }">
							<td><a
								href="/board/?nowPage=${i}&cntPerPage=${paging.cntPerPage}">
								[<c:out value="${i}" />]
							</a></td>
						</c:forEach>
					</tr>

					<div class="button">다음</div>
				</div>

			</div>

		</footer>
		<section>
			<div class="button2">글쓰기</div>
		</section>

		<section class="gofish"></section>
		<style>
body {
	display: flex;
	flex-direction: column;
	font-family: "Oswald", sans-serif;
	/* 구글에서 폰트 가져옴 , 사용안할라면 푸터참조 */
	background-color: #e0e0e0;
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
	width: 400px;
	display: flex;
	justify-content: space-between;
	list-style-type: none;
	text-transform: uppercase;
	font-size: 12px;
	padding: 0;
}

.context>td {
	margin: 0 -22px 0 0;
}

tr {
	margin-bottom: 5px;
	background-image: linear-gradient(to right, rgb(232 232 232),
		rgb(255, 255, 255));
}

tr:hover {
	background-image: linear-gradient(to right, rgb(232 232 232),
		rgb(255, 255, 0));
}

li {
	margin: 13px 37px;
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

.gofish {
	
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
	height: 20px;
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

.button2 {
	position: absolute;
	height: 20px;
	border: 0;
	padding: 10px 20px;
	font-size: 10px;
	background-color: #000000;
	width: 39px;
	border-radius: 20px;
	color: #ffffff;
	text-transform: uppercase;
	text-align: center;
	margin: -196px -587px 123px 0px;
}

.button2:hover {
	color: black;
	background-color: white;
	border: 1px solid black;
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
	justify-content: center;
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
</html>
