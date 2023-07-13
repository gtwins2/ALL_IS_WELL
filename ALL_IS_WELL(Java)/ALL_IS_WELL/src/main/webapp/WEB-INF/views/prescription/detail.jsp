<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

*, body{
	margin: auto;
}

#content{
	width: 1920px;
	height: 1200px;
	display: grid;
	grid-template-columns: 300px 1620px;
	border-bottom: 1px ;
}

#div01{
	position: absolute;
	left: 439px;
	top: 306px;
	background: #FFFFFF;
	box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
	border-radius: 50px;
 	width: 1200px;
	height: 600px;
	margin: auto;
	display: grid;
	grid-template-columns: 1fr 3fr;
}

#div01 > div{text-align: center;}

#div01 > div > input{
	width: 80%;
	border: 1px solid #B2B2B2;
}

#input{height: 300px;}

#div02{
	position: absolute;
	width: 299px;
	height: 48px;
	left: 412px;
	top: 161px;
	font-family: 'Inter';
	font-style: normal;
	font-weight: 400;
	font-size: 40px;
	line-height: 48px;
	color: #000000;
}

hr{
position: absolute;
width: 1594.69px;
height: 0px;
left: 305.65px;
top: 258.2px;
border: 1px solid #D1CECE;
}

#div03{
	position: absolute;
	width: 127.61px;
	height: 47.83px;
	left: 1455px;
	top: 950px;
	background: #5A8CF2;
	border-radius: 5px;
	font-family: 'Inter';
	font-style: normal;
	font-weight: 700;
	font-size: 20px;
	line-height: 24px;
	text-align: center;
	color: #FFFFFF;
	line-height: 50px;
}
</style>
</head>
<body>

	<header>
		<%@ include file="/WEB-INF/views/common/member/header.jsp" %>
	</header>
		
	<div id="content">
		<nav>
			<%@ include file="/WEB-INF/views/common/member/side-bar.jsp" %>
		</nav>
		<main>
			<div id="div01">
				<div id="div01-1">환자명<br><br>투약물<br><br>투약일수<br><br>
					1회 투약량<br><br>용법<br><br>처방전내용</div>
				<div id="div01-1">
					<input type="text"><br><br>
					<input type="text"><br><br>
					<input type="text"><br><br>
					<input type="text"><br><br>
					<input type="text"><br><br>
					<input type="text" id="input">
				</div>
			</div>

			<div id="div02">처방전 상세조회</div>
			<hr>

			<div id="div03">뒤로가기</div>
		</main>
	</div>

	<footer>
		<%@ include file="/WEB-INF/views/common/member/footer.jsp" %>
	</footer>

</body>
</html>