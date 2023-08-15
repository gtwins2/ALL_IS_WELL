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
	background: #FF8686;
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

#file{
	width: 115px;
	height: 53px;
	background: #FF8686;
	border-radius: 25px;
	border: 0px;
	font-family: 'Inter';
	font-style: normal;
	font-weight: 700;
	font-size: 20px;
	line-height: 24px;
	color: #FFFFFF;
}

#div01 > div:nth-child(1) > div > input{
	width:80%;
	font-size: 25px;
}

#div01 > div:nth-child(2) >  div:nth-child(2) {
	text-align: left;
	margin-left: 120px;
}

textarea{
	width:80%;
	height: 400px;
	font-size: 25px;
}
</style>
</head>
<body>

	<header>
		<%@ include file="/WEB-INF/views/common/admin/header.jsp" %>
	</header>
		
	<div id="content">
		<nav>
			<%@ include file="/WEB-INF/views/common/admin/side-bar.jsp" %>
		</nav>
		<main>
			<form action="${root}/board/inquiryReplyUpdate" method="post">

				<input type="submit" id="sendMail" value="작성하기">
				<hr>
				<div id="div01">
					<div>
						<div>댓글내용</div>
						<div> <input type="text" name="content" id="" value="${content }"></div>
						<div><input type="text" name="no" value="${no}" id="" hidden> </div>
						<div> <input type="text" name="noticeNo" id="" value="${noticeNo}" hidden></div>
					</div>
				</div>
			</form>

		</main>
	</div>

	<footer>
		<%@ include file="/WEB-INF/views/common/admin/footer.jsp" %>
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
</script>