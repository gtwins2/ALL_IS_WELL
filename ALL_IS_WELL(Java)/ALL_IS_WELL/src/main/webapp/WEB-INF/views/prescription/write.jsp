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
	height: 750px;
	display: grid;
	grid-template-columns: 150px 1770px;
}

#div01{
	position: absolute;
	left: 439px;
	top: 306px;
	background: #FFFFFF;
	box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
	border-radius: 50px;
 	width: 1200px;
	height: 400px;
	margin: auto;
	display: grid;
	grid-template-columns: 1fr 3fr;
}

#div01 > div{text-align: center;line-height:40px;}

#div01 > div > input{

	width: 80%;
	border: 1px solid #B2B2B2;
}

#input{height: 300px;}

#div02{
	position: absolute;
	width: 299px;
	height: 48px;
	left: 350px;
top: 109px;
	font-family: 'Inter';
	font-style: normal;
	font-weight: 400;
	font-size: 40px;
	line-height: 48px;
	color: #000000;
}

hr{
position: absolute;
width: 1620px;
	height: 0px;
	left: 150px;
	top: 168px;
border: 1px solid #D1CECE;
}

#div03, #div04{
	position: absolute;
	width: 127.61px;
	height: 47.83px;
	left: 1455px;
	top: 780px;
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
	border: 0px;
}

#div03{
	left: 1300px;
}

#div04{
	left: 1455px;
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
			<form action="${root}/prescription/write" method="post">
				<div id="div01">
					<div id="div01-1">환자명<br><br>투약물<br><br>투약일수<br><br>
						1회 투약량<br><br>용법
					</div>
					<div id="div01-1">
						<input type="text" value="${vo.no}" name="patientNo" hidden>
						<input type="text" value="${vo.name}" name="name"><br><br>
						<input type="text" name="medicine"><br><br>
						<input type="text" name="totalDay"><br><br>
						<input type="text" name="dose"><br><br>
						<input type="text" name="usage"><br><br>
					</div>
				</div>
				<div id="div02">처방전 작성</div>
				<hr>
	
				<input type="submit" id="div03" value="작성">
				<div id="div04" onclick="back()">뒤로가기</div>
			</form>
		</main>
	</div>

	<footer>
		<%@ include file="/WEB-INF/views/common/member/footer.jsp" %>
	</footer>

</body>
</html>
<script>

	const sideBar = document.querySelector("#side-bar")
	const subMenus = document.querySelectorAll(".sub-menu");
	const thirdSidebars = document.querySelectorAll(".third-sidebar");

	subMenus.forEach(subMenu => {
		subMenu.style.height = sideBar.offsetHeight + 'px';
	});

	thirdSidebars.forEach(thirdSidebar => {
		thirdSidebar.style.height = sideBar.offsetHeight + 'px';
	});
	
	function back() {
		window.history.back();
  	}
</script>