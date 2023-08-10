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
	height: 750px;
	display: grid;
	grid-template-columns: 150px 1770px;
}

#div01{
    position: absolute;
	width: 263px;
	height: 48px;
	left: 367px;
	top: 125px;
	font-family: 'Inter';
	font-style: normal;
	font-weight: 400;
	font-size: 40px;
	line-height: 48px;
	color: #000000;
}

hr{
    position: absolute;
	width: 1770px;
	height: 0px;
	left: 150px;
	top: 200px;
	border: 1px solid #D1CECE;
}

#div02{
    position: absolute;
    width: 1302px;
    height: 550px;
    left: 406px;
    top: 220px;
    background: #FFFFFF;
    box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
    border-radius: 50px;
    display: grid;
    grid-template-columns: 1fr 2fr 1.5fr;
}

#div02 > div{
    line-height: 55px;
    text-align: center;
}

#div02 > div > input{
    width: 400px;
    border: 1px solid #B2B2B2;
}

#div02 > div:nth-child(3){
    display: grid;
    grid-template-rows: 3fr 1fr;
}

#div02-1{
    margin: auto;
    width: 300px;
    height: 300px;
    background-color: lightgray;
    border-radius: 50px;
}

#div02-2{
    width: 300px;
    height: 45px;
    background: #5A8CF2;
    border-radius: 5px;
    font-family: 'Inter';
    font-style: normal;
    font-weight: 700;
    font-size: 20px;
    line-height: 24px;
    color: #FFFFFF;
    line-height: 45px;
}

#div03{
position: absolute;
width: 92px;
height: 53.07px;
left: 1450px;
top: 780px;
background: #5A8CF2;
border-radius: 5px;
border: 0px;
font-family: 'Inter';
    font-style: normal;
    font-weight: 700;
    font-size: 15px;
    color: #FFFFFF;
}

#div04{
position: absolute;
width: 92px;
height: 53.07px;
left: 1609px;
top: 780px;
background: #5A8CF2;
border-radius: 5px;
border: 0px;
font-family: 'Inter';
    font-style: normal;
    font-weight: 700;
    font-size: 15px;
    color: #FFFFFF;
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
		
		    <div id="div01">개인정보 수정</div>
		    <hr>
		    <form action="/app/memberInfoUpdate" method="post">
		    
		    <div id="div02">
		        <div>
		            <br> 이름<br> 주민번호<br>  전화번호<br>  
		            사무실 번호<br>  이메일<br>  아이디<br>
		            비밀번호<br>  비밀번호 확인
		        </div>
		        <div>
		        	<input type="text" value="${loginMember.no}" name="no" hidden>
		            <br> <input type="text" value="${loginMember.name}" name="name"><br> 
		            <input type="text" value="${loginMember.registrationNumber}" name="registrationNumber"><br> 
		            <input type="text" value="${loginMember.phoneNumber}" name="phoneNumber"><br> 
		            <input type="text" value="${loginMember.officeNumber}" name="officeNumber"><br> 
		            <input type="text" value="${loginMember.email}" name="email"><br> 
		            <input type="text" value="${loginMember.id}" name="id"><br> 
		            <input type="password" id="password" value="${loginMember.password}" name="password"><br> 
		            <input type="password" id="password2" value="${loginMember.password}" name="password2"><br> 
		            
		        </div>
		        
		        <div>
		            <img id="div02-1" alt="${loginMember.profile}" src="/app/resources/static/profile/${loginMember.profile}">
		            <input type="file" id="div02-2" name="profile" width="200px">
		        </div>
		    </div>
		
		    <input type="submit" id="div03" value="수정">
		    <button id="div04">뒤로가기</button>
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
	
	const password = document.querySelctor('#password');
	const password2 = document.querySelctor('#password2');
	
	$("#password").change(function(){
		email();	
	});
	
	$("#password2").change(function(){
		email();	
	});

	function email() {
		
		if(password != password2) {
			$("#totalemail").val(email+middle+address);
		}
	};
</script>