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
	height: 2000px;
	display: grid;
	grid-template-columns: 300px 1620px;
	border-bottom: 1px ;
}

#sendMail{
	position: absolute;
	width: 115px;
	height: 53px;
	left: 367px;
	top: 200px;
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

#sendMail:hover, #file:hover, #list:hover, #write:hover {
	background-color: #555;
	transition: 0.7s;
}

hr{
	position: absolute;
	width: 1617px;
	height: 0px;
	left: 303px;
	top: 300px;
	border: 1px solid #D1CECE;
}

#div01{
	position: absolute;
	width: 1617px;
	height: 900px;
	left: 303px;
	top: 340px;
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

#div01 > div:nth-child(1) > div > input{
	width:80%;
	font-size: 25px;
	border: 0px;
}

#div01 > div:nth-child(2) >  div:nth-child(2) {
	text-align: left;
	margin-left: 120px;
}

#textarea1{
	width:80%;
	height: 400px;
	font-size: 25px;
	resize: none;
	border: 0px;
	font-family: 'Inter';
	font-style: normal;
}

#list{
	position: absolute;
	width: 115px;
	height: 53px;
	left: 1748px;
	top: 1280px;
	background: #5A8CF2;
	border-radius: 25px;
	font-family: 'Inter';
	font-style: normal;
	font-weight: 700;
	font-size: 20px;
	line-height: 24px;
	text-align: center;
	color: #FFFFFF;
	border: 0px;
}

#write{
	width: 115px;
	height: 53px;
	background: #5A8CF2;
	border-radius: 25px;
	font-family: 'Inter';
	font-style: normal;
	font-weight: 700;
	font-size: 20px;
	line-height: 24px;
	text-align: center;
	color: #FFFFFF;
	border: 0px;
	margin-left: 60px;
}

#div02{
	position: absolute;
	top: 1480px;
	box-sizing: border-box;
	position: absolute;
	width: 1420px;
	height: 136px;
	background: #FFFFFF;
	margin-left: 200px;
	display: grid;
	grid-template-columns: 5fr 1fr;
}

#div02 > div:nth-child(2){
	line-height: 130px;
}

#div03{
	position: absolute;
	width: 1516px;
	height: 173px;
	left: 347px;
	top: 1500px;
	background: #D9D9D9;
	border-radius: 50px;
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
			<form action="">

				<button id="sendMail">수정하기</button>
				<hr>
				<div id="div01">
					<div>
						<div>제목</div>
						<div> <input type="text" name="" id="" value="안녕하세요" readonly></div>
					</div>
					<div>
						<div>파일첨부</div>
						<div><button id="file"> 첨부파일</button></div>
					</div>
					<div>
						<div>내용</div>
						<div><textarea name="" id="textarea1" cols="30" rows="10" readonly>안녕</textarea></div>
					</div>
				</div>
			</form>

			<button id="list">목록</button>

			<div id="div03">

			</div>

		</main>
	</div>

	<footer>
		<%@ include file="/WEB-INF/views/common/member/footer.jsp" %>
	</footer>

</body>
</html>