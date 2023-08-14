<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.kh.app.main.controller.Calendar"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="UTF-8">
         <!-- 화면 해상도에 따라 글자 크기 대응(모바일 대응) -->
         <meta name="viewport"
            content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
         <!-- jquery CDN -->
         <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
         <!-- fullcalendar CDN -->
         <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
         <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
         <!-- fullcalendar 언어 CDN -->
         <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>


</head>
<style>
/* body 스타일 */
            html,
            body {
               font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
               font-size: 14px;
            }
            .fc-sticky{
               color: white;
            }
            
            /* 캘린더 위의 해더 스타일(날짜가 있는 부분) */
            .fc-header-toolbar {
               padding-top: 1em;
               padding-left: 1em;
               padding-right: 1em;
            }

            /* 일요일 날짜 빨간색 */
            .fc-day-sun a {
            color: red;
            text-decoration: none;
            }

            /* 토요일 날짜 파란색 */
            .fc-day-sat a {
            color: blue;
            text-decoration: none;
            }


#content{
		width: 1920px;
		height: 850px;
		display: grid;
		grid-template-columns: 150px 1770px;
	}
#div01{    
    position: absolute;
    width: 334px;
    height: 480px;
    left: 300px;
    top: 150px;
    background: #FFFFFF;
    box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
    border-radius: 50px;
}

#div01-1{
	position: absolute;
    width: 334px;
    height: 240px;
	left: 300px;
    top: 150px;
}

hr{
	position: absolute;
	width: 334px;
	height: 0.67px;
	left: 300px;
	top: 350px;
	
	background: #000000;
}
#h2{
	position: absolute;
	width: 311px;
	height: 242px;
	left: 310px;
	top: 420px;
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
    width: 320px;
    height: 75px;
    left: 300px;
    top: 740px;
    background: #5A8CF2;
    border: 1px solid lightgray;
    border-radius: 20px;
	display: block;
	font-family: 'Inter';
	font-style: normal;
	font-weight: 700;
	font-size: 30px;
	line-height: 48px;
	color: #FFFFFF;
	border: 0px;
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
width: 500px;
height: 730px;
left: 720px;
top: 140px;

background: #FDFDFD;
border: 1px solid lightgray;
border-radius: 50px;
}
 #div03-3,#div03-5, #div03-7{
    position: absolute;
    width: 428px;
    height: 0px;
    border: 1px solid #9D9A9A;
}
#div03-1{
	height:300px;
	
}

#div03-1 > div{
	display: grid;
	grid-template-columns: 1fr 5fr;
	border-top: 1px solid #9D9A9A;
	height: 75px;
	align-items: center;
	
}

#div03-1 > div > div:nth-child(1){
	margin: auto;
	display:flex;
	background: #5A8CF2;
	width: 50px;
	height: 50px;
	align-items: center;
	justify-content:center;
	font-family: 'Inter';
	font-style: normal;
	font-weight: 400;
	font-size: 20px;
	font-weight: bold;
	color: #FFFFFF;
}

#div03-2, #div03-4, #div03-6, #div03-8{
    position: absolute;
    background: #5A8CF2;
    font-family: 'Inter';
    font-style: normal;
    font-weight: 1000;
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
border: 1px solid lightgray;
border-radius: 30px;
font-family: 'Inter';
font-style: normal;
font-weight: 400;
font-size: 15px;
line-height: 15px;
color: #000000;
}

#div04{
    top: 140px;
}

#div04-1{
    top: 200px;
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
    top: 410px;
}
#div05 > div{
    display: grid;
    grid-template-columns: 1fr 1fr 1fr;
    line-height: 40px;

}
#div05-1{
    top: 470px;
}
#div06{
    top: 680px;
}
#div06 > div{
    display: grid;
    grid-template-columns: 1fr 1fr 1fr;
    line-height: 40px;
}
#div06-1{
    top: 750px;
}

#div07{
	position: absolute;
    width: 200px;
    height: 75px;
    left: 370px;
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
	border: 0px;
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
		    <div id="div01-1"><img src="${root}/resources/static/profile/${loginMember.profile}" alt="${loginMember.profile }" width="100%" height="100%"></div>
			<h2 id="h2">${loginMember.dname} ${loginMember.pname }<br><br>  ${loginMember.name} <br><br> ${loginMember.licenseNumber}</h2>
			
			<input type="text" value="${loginMember.no}" name="no" hidden>
		    <!-- 출근 -->
		    
		    <c:if test="${check == null}">
		    <form action="/app/attend?no=${loginMember.no}" method="post" onclick="attend();">
				<input type="submit" id="div02" value="출근" ></input>
		    </form>
		    </c:if>
		    <c:if test="${check != null }">
		    <form action="/app/leave?no=${loginMember.no}" method="post">
				<input type="submit" id="div07" value="퇴근">
		    </form>
		    </c:if>
		
		    <!-- 일정 -->
		    <!-- calendar 태그 -->
         <div id='div03'>
            <div id='calendar'></div>
            <div id="div03-1">
            	<c:forEach items="${operation}" var="vo">
            	<div>
            		<div>
            		<fmt:parseDate value="${vo.startDate}" var="startDate" pattern="yyyy-MM-dd HH:mm:ss" />
            		<fmt:formatDate pattern="dd" value="${startDate}"/>
            		</div>
            		<div>${vo.operationName }</div>
            	</div>
            	</c:forEach>
            </div>
         </div>

		    <script>
            
		    document.addEventListener('DOMContentLoaded', function() {
		    	var calendarEl = document.getElementById('calendar');
		    	var calendar = new FullCalendar.Calendar(calendarEl, {
		    		initialView : 'dayGridMonth',
		    		locale : 'ko', // 한국어 설정
		    		headerToolbar : {
		            	start : "prev next",
		                center : "title",
		                end : 'dayGridMonth,dayGridWeek,dayGridDay'
		                },
		        displayEventTime : false,
		    	selectable : true,
		    	droppable : true,
		    	editable : true,
		    	events : [ 
		        	    <%List<Calendar> calendarList = (List<Calendar>) request.getAttribute("calendarList");%>
		                <%if (calendarList != null) {%>
		                <%for (Calendar vo : calendarList) {%>
		                {
		                	title : '<%=vo.getOperationName()%>',
		                    start : '<%=vo.getStartDate()%>',
		                    end : '<%=vo.getEndDate()%>',
		                    color : '#' + Math.round(Math.random() * 0xffffff).toString(16)
		                 },
		    	<%}
		    }%>
		    				]
		    				
		    			});
		    			calendar.render();
		    		});
         </script>
		    
		
		    <!-- 공지사항 -->
		    <div id="div04">
		        <br>
		        <div>
		            <div id="right"><h3>공지사항</h3></div>
		            <div><h3>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<a>더보기></a></h3></div>
		        </div>
		        <br><br>
		        <c:forEach items="${voList}" var="vo">
			        <div>
			            <div>${vo.content}</div>
			            <div>
			            <fmt:parseDate value=" ${vo.enrollDate}" var="startDate" pattern="yyyy-MM-dd HH:mm:ss" />
	            		<fmt:formatDate pattern="MM-dd" value="${startDate}"/>
			            </div>
			        </div>
		        
		        </c:forEach>
		        
		    </div>
		    <!-- 공지사항 틀 -->
		    <div id="div04-1">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp제목&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 등록일</div>

		    <!-- 결제현황 -->
		    <div id="div05">
		        <br>
		        <div>
		            <div><h3>결재현황</h3></div>
		            <div></div>
		            <div><h3>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<a>더보기></a></h3></div>
		        </div>
		        <br>
		        <c:forEach items="${voList2}" var="vo">
		        <div>
		            <div>${vo.memberName }</div>
		            <div>${vo.title }</div>
		            <div>
            		<fmt:formatDate pattern="MM-dd" value="${vo.createDate}" type="date"/>
            		</div>
		        </div>
		        </c:forEach>
		        
		    </div>
		    <div id="div05-1">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp작성자&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp | &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp제목&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp |&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp등록일&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</div>
		 
		    <!-- 근태 -->
		    <div id="div06">
		        <br>
		        <div>
		            <div><h3>근태현황</h3></div>
		            <div></div>
		            <div><h3>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<a>더보기></a></h3></div>
		        </div>
		        <br>
		        <c:forEach items="${voList3}" var="vo">
		        <div>
		            <div><fmt:formatDate value="${vo.presenceTime}" pattern="yyyy-MM-dd"/></div>
		            <div><fmt:formatDate value="${vo.presenceTime}" pattern="HH시  mm분"/></div>
		            <div><fmt:formatDate value="${vo.leaveTime}" pattern="HH시  mm분"/></div>
		        </div>
		        </c:forEach>
		        
		    </div>
		    <div id="div06-1">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp날짜&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp | &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp출근시간&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp |&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp퇴근시간</div>

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