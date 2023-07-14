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

#div02-1 > div:nth-child(2) >input{
	border: 1px solid #B2B2B2;
	width: 80%;
}

#div02-2{
	display: grid;
	grid-template-columns: 1fr 5fr;
}

#div02-3 > input{
	border: 1px solid #B2B2B2;
	width: 100px;
}
#div02-2 > div:nth-child(2){
	text-align: left;
	margin-left: 40px;
}
#div02-2 > div > input{
	border: 1px solid #B2B2B2;
	width: 320px;
}
#div02-2 > div > textarea{
	border: 1px solid #B2B2B2;
	width: 80%;
	resize: none;
}

#div03, #div04{
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
		<div id="wrap">
			<%@ include file="/WEB-INF/views/common/member/side-bar.jsp" %>
		</div>
		<main>
			<div id="div01">접수</div>
			<form action="" method="post">
				
				<div id="div02">
					<div id="div02-1">
						<div>이름</div>
						<div><input type="text"></div>
						<div id="div02-3">남<input type="checkbox" name="" id="">여<input type="checkbox"></div>
					</div>
					<div id="div02-1">
						<div>주민번호</div>
						<div><input type="text"></div>
						<div></div>
					</div>
					<div id="div02-1">
						<div>휴대전화</div>
						<div><input type="text"></div>
						<div></div>
					</div>
					<div id="div02-2">
						<div>이메일</div>
						<div>
							<input type="text">@
							<label for="search" class="category-area">
								<select name="search" id="search">
									<option value="naver">naver.com</option>
									<option value="gmail">gmail.com</option>
									<option value="nate">nate.com</option>
								</select>
							</label>	 
						</div>
					</div>
					<div id="div02-2">
						<div>특이사항</div>
						<div><textarea name="" id="" cols="30" rows="10"></textarea></div>
					</div>
				</div>
				
				<input type="submit" id="div03" value="수정"></input>
				<input type="submit" id="div04" value="뒤로가기"></input>
			</form>
		</main>
	</div>

	<footer>
		<%@ include file="/WEB-INF/views/common/member/footer.jsp" %>
	</footer>

</body>
</html>