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
	grid-template-columns: 150px 1770px;
}

#sendMail{
	position: absolute;
	width: 115px;
	height: 53px;
	left: 367px;
	top: 125px;
	background: #5A8CF2;
	border-radius: 25px;
	border: 0px;
	font-family: 'Inter';
	font-style: normal;
	font-weight: 700;
	font-size: 20px;
	line-height: 24px;
	color: #FFFFFF;
}

#sendMail:hover, #file:hover {
	background-color: #555;
	transition: 0.7s;
}

hr{
	position: absolute;
	width: 1770px;
	height: 0px;
	left: 150px;
	top: 200px;
	border: 1px solid #D1CECE;
}

#div01{
	position: absolute;
	width: 1617px;
	height: 700px;
	left: 303px;
	top: 240px;
	display: grid;
	grid-template-rows: 1fr 1fr 3fr;
	
	font-family: 'Inter';
	font-style: normal;
	font-weight: 400;
	font-size: 25px;
}

#div01 > div{

	text-align: center;
	display: grid;
	grid-template-columns: 1fr 3fr;
}



#div01 > div:nth-child(1) > div > input{
	width:80%;
	font-size: 25px;
}



textarea{
	width:80%;
	height: 250px;
	font-size: 25px;
	resize: none;
	border: 1px solid gray;
	font-family: 'Inter';
	font-style: normal;
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
			<form action="${root}/Mboard/inquiryWrite" method="post">

				<input type="submit" id="sendMail" value="작성하기">
				<hr>
				<input type="text" name="memberNo" value="${loginMember.no}" hidden>
				<div id="div01">
					<div>
						<div>제목</div>
						<div> <input type="text" name="title" id=""></div>
					</div>
					<div>
						<div>내용</div>
						<div><textarea name="content" id="" cols="30" rows="10"></textarea></div>
					</div>
				</div>
			</form>

		</main>
	</div>

	<footer>
		<%@ include file="/WEB-INF/views/common/member/footer.jsp" %>
	</footer>

</body>
</html>