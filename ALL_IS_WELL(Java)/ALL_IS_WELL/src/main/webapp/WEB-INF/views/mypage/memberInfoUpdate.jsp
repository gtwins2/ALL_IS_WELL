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

#div02{
    position: absolute;
    width: 1302px;
    height: 550px;
    left: 406px;
    top: 298px;
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
    background-color: #f00000;
    border-radius: 50px;
}

#div02-2{
    width: 122px;
    height: 45px;
    background: #5A8CF2;
    border-radius: 5px;
    margin-left: 160px;
    text-align: center;
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
top: 870px;
background: #5A8CF2;
border-radius: 5px;
}

#div04{
position: absolute;
width: 92px;
height: 53.07px;
left: 1609px;
top: 870px;
background: #5A8CF2;
border-radius: 5px;
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
		    <div id="div02">
		        <div>
		            <br> 이름<br> 주민번호<br>  전화번호<br>  
		            사무실 번호<br>  이메일<br>  아이디<br>
		            비밀번호<br>  비밀번호 확인
		        </div>
		        <div>
		            <br> <input type="text"><br> 
		            <input type="text"><br> 
		            <input type="text"><br> 
		            <input type="text"><br> 
		            <input type="text"><br> 
		            <input type="text"><br> 
		            <input type="password"><br> 
		            <input type="password"><br> 
		        </div>
		        <div>
		            <div id="div02-1">qwe</div>
		            <div id="div02-2">파일찾기</div>
		        </div>
		    </div>
		
		    <div id="div03">수정</div>
		    <div id="div04">뒤로가기</div>
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