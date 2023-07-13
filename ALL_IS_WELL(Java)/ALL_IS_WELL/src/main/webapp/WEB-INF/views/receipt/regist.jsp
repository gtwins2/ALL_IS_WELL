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
width: 167px;
height: 59px;
left: 450px;
top: 209px;
font-family: 'Inter';
font-style: normal;
font-weight: 400;
font-size: 40px;
line-height: 48px;
color: #000000;
}

#div02{
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
	grid-template-rows: 1fr 1fr 1fr 1fr 2fr;
}

#div02-1, #div02-2{
	text-align: center;
	line-height: 100px;
}

#div02-1{
	display: grid;
	grid-template-columns: 1fr 2fr 3fr;
}

#div02-2{
	display: grid;
	grid-template-columns: 1fr 5fr;
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
			<div id="div01">접수</div>
			<div id="div02">
				<div id="div02-1">
					<div>이름</div>
					<div></div>
					<div></div>
				</div>
				<div id="div02-1">
					<div>주민번호</div>
					<div></div>
					<div></div>
				</div>
				<div id="div02-1">
					<div>휴대전화</div>
					<div></div>
					<div></div>
				</div>
				<div id="div02-2">
					<div>이메일</div>
					<div></div>
				</div>
				<div id="div02-2">
					<div>특이사항</div>
					<div></div>
				</div>
			</div>
		</main>
	</div>

	<footer>
		<%@ include file="/WEB-INF/views/common/member/footer.jsp" %>
	</footer>

</body>
</html>