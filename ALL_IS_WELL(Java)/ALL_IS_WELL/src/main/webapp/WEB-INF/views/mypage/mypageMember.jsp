<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
#content{
	width: 1920px;
	height: 800px;
	display: grid;
	grid-template-columns: 150px 1770px;
}

#div01{
	position: absolute;
	width: 600px;
	height: 600px;
	left: 350px;
	top: 220px;
	background: #FFFFFF;
	border: 1px solid lightgray;
	border-radius: 30px;

}

#div01-1{
	position: absolute;
	width: 200px;
	height: 200px;
	left: 380px;
	top: 250px;
	background: url(1674030642.jpg);
	border-radius: 100px;
	border: 1px solid black;
}
#hr02{
	position: absolute;
	width: 600px;
	height: 0.65px;
	left: 350px;
	top: 480px;
	background: #000000;
}
#div01-2{
	position: absolute;
	width: 479px;
	height: 288px;
	left: 450px;
	top: 500px;
	font-family: 'Inter';
	font-style: normal;

	font-size: 20px;
	line-height: 40px;
	color: #000000;
}
#div01-2{
	display: grid;
	grid-template-columns: 1fr 1fr;	
}



#div02{
	position: absolute;
	width: 600px;
	height: 80px;
	left: 350px;
	top: 780px;
	background: #5A8CF2;

	border-radius: 0 0 30px 30px;
	text-align: center;
}

#div02 > h2{
	font-family: 'Inter';
	font-style: normal;
	font-weight: 700;
	font-size: 20px;
	line-height: 80px;
	color: #FFFFFF;
}

#div03{
	position: absolute;
	width: 263px;
	height: 48px;
	left: 367px;
	top: 125px;
	font-family: 'Inter';
	font-style: normal;
	font-weight: 400;
	font-size: 30px;
	line-height: 48px;
	color: #000000;
}

#hr01{
	position: absolute;
	width: 1770px;
	height: 0px;
	left: 150px;
	top: 200px;
	border: 1px solid #D1CECE;
}

#div04{
	position: absolute;
	width: 257px;
	height: 85px;
	left: 1400px;
	top: 210px;
	font-family: 'Inter';
	font-style: normal;
	font-weight: 400;
	font-size: 20px;
	line-height: 48px;
	color: #000000;
}

#div04-1{
	position: absolute;
	width: 500.91px;
	height: 250.16px;
	left: 1202px;
	top: 280.84px;
	background: #FFFFFF;
	border: 1px solid lightgray;
	border-radius: 20px;
	
}

#div04-2{
	position: absolute;
	width: 500px;
	height: 50px;
	left: 1202px;
	top: 480px;
	background: #5A8CF2;
	
	border-radius: 0 0 10px 10px;
	font-family: 'Inter';
	font-style: normal;
	font-weight: 700;
	font-size: 20px;
	color: #FFFFFF;
	text-align: center;
	border: 0px;
}

#div04-2 > h2{
	text-align: center;
	font-family: 'Inter';
	font-style: normal;
	font-weight: 700;
	font-size: 40px;
	line-height: 48px;
	color: #FFFFFF;
}

#div04-3{
	position: absolute;
	left: 1350px;
	top: 550px;
}

#div05{
	position: absolute;
	width: 500px;
	height: 90px;
	left: 1202px;
	top: 733px;
	background: #FFFFFF;
	border: 1px solid lightgray;
	border-radius: 10px;
}

#div05 > div{
	width: 487px;
	height: 53px;
	font-family: 'Inter';
	font-weight: normal;

	font-size: 20px;
	line-height: 80px;
	color: #000000;
	text-align: center;
	word-spacing: 40px;
} 
</style>
<body>

<header>
		<%@ include file="/WEB-INF/views/common/member/header.jsp" %>
	</header>
		
	<div id="content">
		<nav>
			<%@ include file="/WEB-INF/views/common/member/side-bar.jsp" %>
		</nav>
		<main>
			 <div id="div03">MY PAGE</div>
			
			
			 <!-- 개인정보 -->
			 <div id="div01"></div>
			 <img alt="프로필" src="${root}/resources/static/profile/${loginMember.profile}"id="div01-1" width="100%" height="100%">
			 <hr id="hr02">
			 <div id="div01-2">
			 	<div>부서<br>직급<br>이름<br>면허번호<br>전화번호<br>이메일<br>연봉</div>
			 	<div>${loginMember.dname}<br>${loginMember.pname}<br>${loginMember.name}<br>${loginMember.registrationNumber}<br>${loginMember.phoneNumber}<br>${loginMember.email}<br>${loginMember.yearSalary}</div>
			 </div>
			 <div id="div01-3"></div>
			
			 <btn id="div02" onclick="next();"><h2>개인정보수정</h2></btn>
			
			 <!-- 서명 -->
			 <div id="div04">서명 수정</div>
			 <img id="div04-1" alt="" src="/app/resources/static/sign/${loginMember.sign}">
			 <form action="${root}/sign" method="post">
			 <input type="text" value="${loginMember.no}" name="no" hidden>
			 <input type="file" id="div04-3" name="sign">
			 <input type="submit" id="div04-2" value="저장하기">
			 </form>
			 
			 <!-- 잔여휴가 -->
			 <div id="div05">
				<div><span>잔여휴가수 | ${loginMember.vacation}일</span></div>
			 </div>
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
	
	function next(){
		location.href="/app/memberInfoUpdate";
	}
	
</script>