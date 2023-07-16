<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
#div01{    
    position: absolute;
    width: 434px;
    height: 680px;
    left: 337px;
    top: 213px;
    background: #FFFFFF;
    box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
    border-radius: 50px;
}

hr{
	position: absolute;
	width: 434px;
	height: 0.67px;
	left: 337px;
	top: 529.44px;
	
	background: #000000;
}
h2{
	position: absolute;
	width: 311px;
	height: 242px;
	left: 399px;
	top: 578px;
	font-family: 'Inter';
	font-style: normal;
	font-weight: 400;
	font-size: 32px;
	line-height: 39px;
	text-align: center;
	color: #000000;
}

#div02{    
    position: absolute;
    width: 414px;
    height: 117px;
    left: 347px;
    top: 997px;
    background: #5A8CF2;
    box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
    border-radius: 20px;
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
height: 961px;
left: 829px;
top: 204px;

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
    left: 827px;
    top: 760px;  
}

#div03-2, #div03-4, #div03-6, #div03-8{
    position: absolute;
    background: #5A8CF2;
    font-family: 'Inter';
    font-style: normal;
    font-weight: 700;
    font-size: 35px;
    color: #FFFFFF;
    text-align: center;
}

#div03-2{
    width: 54px;
    height: 54px;
    left: 850px;
    top: 790px;
}

#div03-3{
    left: 827px;
    top: 860px; 
}

#div03-4{
    width: 54px;
    height: 54px;
    left: 850px;
    top: 890px;
}

#div03-5{
    left: 827px;
    top: 960px;  
}

#div03-6{
    width: 54px;
    height: 54px;
    left: 850px;
    top: 990px;
}

#div03-7{
    left: 827px;
    top: 1060px;  
}
#div03-8{
    width: 54px;
    height: 54px;
    left: 850px;
    top: 1090px;
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
height: 300px;
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
    top: 190px;
}

#div04-1{
    top: 265px;
}

#right{
    margin-right: 100px;
}

#div04 > div{
    display: grid;
    grid-template-columns: 270px 240px;
    line-height: 40px;
}
#div04 > div > div, #div05 > div > div, #div06 > div > div{
    text-align: center;
}

#div05{
    top: 500px;
}
#div05 > div{
    display: grid;
    grid-template-columns: 1fr 1fr 1fr;
    line-height: 40px;
}
#div05-1{
    top: 575px;
}
#div06{
    top: 810px;
}
#div06 > div{
    display: grid;
    grid-template-columns: 1fr 1fr 1fr;
    line-height: 40px;
}
#div06-1{
    top: 885px;
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
			<h2>흉부외과 전문의<br><br>  이순신 <br><br> 면허</h2>
			<hr>
			
		    <!-- 출근 -->
			<div id="div02"></div>
		    <h2 id="div02-1">출근</h2>
		
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
		        <div>
		            <div>5월 급여지급 지연 안내</div>
		            <div>2023-06-07</div>
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
		        <br><br>
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
		        <br><br>
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