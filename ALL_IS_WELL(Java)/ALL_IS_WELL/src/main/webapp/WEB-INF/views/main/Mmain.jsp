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
    width: 334px;
    height: 480px;
    left: 200px;
    top: 113px;
    background: #FFFFFF;
    box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
    border-radius: 50px;
}

hr{
	position: absolute;
	width: 334px;
	height: 0.67px;
	left: 200px;
	top: 350px;
	
	background: #000000;
}
h2{
	position: absolute;
	width: 311px;
	height: 242px;
	left: 220px;
	top: 378px;
	font-family: 'Inter';
	font-style: normal;
	font-weight: 400;
	font-size: 20px;
	line-height: 39px;
	text-align: center;
	color: #000000;
}

#div02{    
    position: absolute;
    width: 200px;
    height: 75px;
    left: 270px;
    top: 650px;
    background: #5A8CF2;
    box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
    border-radius: 20px;
	display: block;
	font-family: 'Inter';
	font-style: normal;
	font-weight: 700;
	font-size: 30px;
	line-height: 48px;
	color: #FFFFFF;
}

#div02-1{
position: absolute;
width: 93px;
height: 52px;
left: 515px;
top: 1000px;
font-family: 'Inter';
font-style: normal;
font-weight: 700;
font-size: 40px;
line-height: 48px;
color: #FFFFFF;
}
#div03{
position: absolute;
width: 426px;
height: 661px;
left: 720px;
top: 113px;

background: #FDFDFD;
box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
border-radius: 50px;
}
#div03-1, #div03-3,#div03-5, #div03-7{
    position: absolute;
    width: 428px;
    height: 0px;
    border: 1px solid #9D9A9A;
}
#div03-1{
    left: 720px;
    top: 460px;  
}

#div03-2, #div03-4, #div03-6, #div03-8{
    position: absolute;
    background: #5A8CF2;
    font-family: 'Inter';
    font-style: normal;
    font-weight: 700;
    font-size: 20px;
    color: #FFFFFF;
    text-align: center;
}

#div03-2{
    width: 30px;
    height: 30px;
    left: 725px;
    top: 470px;
}

#div03-3{
    left: 720px;
    top: 510px; 
}

#div03-4{
     width: 30px;
    height: 30px;
    left: 725px;
    top: 520px;
}

#div03-5{
    left: 720px;
    top: 560px;  
}

#div03-6{
     width: 30px;
    height: 30px;
    left: 725px;
    top: 570px;
}

#div03-7{
    left: 720px;
    top: 610px;  
}
#div03-8{
     width: 30px;
    height: 30px;
    left: 725px;
    top: 620px;
}

#div04-1, #div05-1, #div06-1{
position: absolute;
width: 516.23px;
height: 47px;
left: 1317px;
background: #5A8CF2;
/* 제목 | 등록일 */
font-family: 'Inter';
font-style: normal;
font-size: 18px;
line-height: 36px;
color: #FFFFFF;
}

#div04, #div05, #div06{
position: absolute;
width: 515.26px;
height: 240px;
left: 1317px;
background: #FFFFFF;
box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
border-radius: 50px;
font-family: 'Inter';
font-style: normal;
font-weight: 400;
font-size: 15px;
line-height: 18px;
color: #000000;
}

#div04{
    top: 113px;
}

#div04-1{
    top: 170px;
}

#right{
    margin-right: 100px;
}

#div04 > div{
    display: grid;
    grid-template-columns: 270px 240px;
    line-height: 50px;
}
#div04 > div > div, #div05 > div > div, #div06 > div > div{
    text-align: center;
}

#div05{
    top: 365px;
}
#div05 > div{
    display: grid;
    grid-template-columns: 1fr 1fr 1fr;
    line-height: 40px;
}
#div05-1{
    top: 430px;
}
#div06{
    top: 610px;
}
#div06 > div{
    display: grid;
    grid-template-columns: 1fr 1fr 1fr;
    line-height: 40px;
}
#div06-1{
    top: 670px;
}

#div07{
	position: absolute;
    width: 200px;
    height: 75px;
    left: 270px;
    top: 750px;
    background: #5A8CF2;
    box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
    border-radius: 20px;
	display: block;
	font-family: 'Inter';
	font-style: normal;
	font-weight: 700;
	font-size: 30px;
	line-height: 48px;
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
			<!-- 프로필 -->
		    <div id="div01"></div>
			<h2>흉부외과 전문의<br><br>  ${loginMember.name} <br><br> ${loginMember.licenseNumber}</h2>
			<hr>
			<input type="text" value="${loginMember.no}" name="no" hidden>
		    <!-- 출근 -->
		    
		    <form action="/app/attend?no=${loginMember.no}" method="post" onclick="attend();">
				<input type="submit" id="div02" value="출근" ></input>
		    </form>
		    
		    <form action="/app/leave?no=${loginMember.no}" method="post">
				<button type="submit" id="div07" value="퇴근"></button>
		    </form>
		
		    <!-- 일정 -->
		    <div id="div03"></div>
		    <hr id="div03-1">
		    <div id="div03-2">8</div>
		    <hr id="div03-3">
		    <div id="div03-4">11</div>
		    <hr id="div03-5">
		    <div id="div03-6">19</div>
		    <hr id="div03-7">
		    <div id="div03-8">23</div>
		
		    <!-- 공지사항 -->
		    <div id="div04">
		        <br>
		        <div>
		            <div id="right"><h3>공지사항</h3></div>
		            <div><h3>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<a>더보기></a></h3></div>
		        </div>
		        <br><br>
		        <div>
		            <div>원내식당 가격 인상 안내</div>
		            <div>2023-06-22</div>
		        </div>
		        <div>
		            <div>신규 바이러스 주의사항</div>
		            <div>2023-06-15</div>
		        </div>
		        <div>
		            <div>체육대회 안내</div>
		            <div>2023-06-08</div>
		        </div>
		        
		    </div>
		    <!-- 공지사항 틀 -->
		    <div id="div04-1">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp제목&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 등록일</div>
		    
		    <!-- 결제현황 -->
		    <div id="div05">
		        <br>
		        <div>
		            <div><h3>결제현황</h3></div>
		            <div></div>
		            <div><h3>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<a>더보기></a></h3></div>
		        </div>
		        <br>
		        <div>
		            <div>휴가</div>
		            <div>2023-06-22</div>
		            <div>휴가 신청</div>
		        </div>
		        <div>
		            <div>휴가</div>
		            <div>2023-06-15</div>
		            <div>휴가 신청</div>
		        </div>
		        <div>
		            <div>재고 신청</div>
		            <div>2023-06-08</div>
		            <div>재고 신청</div>
		        </div>
		        <div>
		            <div>출장 신청 </div>
		            <div>2023-06-07</div>
		            <div>5월 급여 잔여</div>
		        </div>
		    </div>
		    <div id="div05-1">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp구분&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp | &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp등록일&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp |&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp문서명&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</div>
		
		    <!-- 근태 -->
		    <div id="div06">
		        <br>
		        <div>
		            <div><h3>결제현황</h3></div>
		            <div></div>
		            <div><h3>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<a>더보기></a></h3></div>
		        </div>
		        <br>
		        <div>
		            <div>휴가</div>
		            <div>2023-06-22</div>
		            <div>휴가 신청</div>
		        </div>
		        <div>
		            <div>휴가</div>
		            <div>2023-06-15</div>
		            <div>휴가 신청</div>
		        </div>
		        <div>
		            <div>재고 신청</div>
		            <div>2023-06-08</div>
		            <div>재고 신청</div>
		        </div>
		        <div>
		            <div>출장 신청 </div>
		            <div>2023-06-07</div>
		            <div>5월 급여 잔여</div>
		        </div>
		    </div>
		    <div id="div06-1">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp구분&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp | &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp등록일&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp |&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp문서명&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</div>

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
	
	const btn01 = document.querySelector('#div02');
	function attend(){
		  
		btn01.style.display = 'none';
		 
	}


	
</script>