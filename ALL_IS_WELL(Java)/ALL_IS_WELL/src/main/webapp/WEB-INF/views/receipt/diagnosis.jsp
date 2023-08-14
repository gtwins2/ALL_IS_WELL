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
#wrap{
	width: 1920px;
	height: 750px;
	display: grid;
	grid-template-columns: 150px 1770px;
}


#div01{
position: absolute;
width: 250px;
height: 59px;
left: 450px;
top: 109px;
font-family: 'Inter';
font-style: normal;
font-weight: 400;
font-size: 30px;
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

#div02{
	position: absolute;
	left: 430px;
	top: 206px;
	background: #FFFFFF;
	box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
	border-radius: 20px;
 	width: 1200px;
	height: 550px;
	margin: auto;
	display: grid;
	grid-template-rows: 1fr 2fr;
	border: 1px solid #939393;
}

#div02 > div{
	display: grid;
	grid-template-columns: 1fr 8fr;
	text-align: center;
	line-height: 100px;
	font-size: 20px;
}

#div02 > div > div> input{
	border: 1px solid #B2B2B2;
	width: 80%;
	height: 80%;
	margin-top: 30px;
	
	font-size: 20px;
}

#div02 > div:nth-child(2) > div:nth-child(2) > input{height: 80%;}


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
	left: 1350px;
}

#div04{
	left: 1505px;
}

#div03:hover, #div04:hover{
    background-color: #555;
    transition: 0.7s;
	cursor: pointer;
}
</style>
</head>
<body>

	<header>
		<%@ include file="/WEB-INF/views/common/member/header.jsp" %>
	</header>
		
	<div id="content">
		<div id="wrap">
			<%@ include file="/WEB-INF/views/common/member/side-bar.jsp" %>
		</div>
		<main>
			<div id="div01">진료</div>
			<form action="${root}/receipt/diagnosis" method="post">
				<div id="div02">
					<input type="text" value="${vo.no}" name="rno" hidden>
					<input type="text" value="${vo.patientNo}" name="no" hidden>
					<div>
						<div>증상</div>
						<div><input type="text" value="${vo.symptom}"></div>
					</div>
					<div>
						<div>내용</div>
						<div><input type="text" name="medicalRecord" value="${vo.medicalRecord}"></div>
					</div>
				</div>
				
				<input type="submit" id="div03" value="작성"></input>
				<input type="submit" id="div04" value="뒤로가기"></input>
				
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
</script>