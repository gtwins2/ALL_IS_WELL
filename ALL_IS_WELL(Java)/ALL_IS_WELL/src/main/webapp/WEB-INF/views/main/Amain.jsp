<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="com.kh.app.main.controller.Calendar"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script type="text/javascript">
    google.load("visualization", "1", {packages:["corechart"]});
    google.setOnLoadCallback(drawChart);
    function drawChart() 
    {
        var data = google.visualization.arrayToDataTable(
            [["GENDER","Rating"],["M",${pv.listCount}],["W",${pv.currentPage}]]
        );
        var options = {
            title: "환자 성비"
        };
        var chart = new google.visualization.PieChart(document.getElementById("employee_piechart"));
        chart.draw(data, options);
    }
</script>
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
		height: 800px;
		display: grid;
		grid-template-columns: 150px 1770px;
	}


#div01{    
    position: absolute;
    width: 450px;
    height: 599px;
    left: 340px;
    top: 178px;
    background: #FFFFFF;
    box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
    border-radius: 50px;

}

#div01-1{
    position: absolute;
    width: 192px;
    height: 19px;
    left: 357px;
    top: 197px;
    font-family: 'Inter';
    font-style: normal;
    font-weight: 400;
    font-size: 25px;
    line-height: 30px;
    text-align: center;
    color: #000000;
}

#hr1,#hr2{
    position: absolute;
    width: 450px;
    height: 1px;
    left: 340px;
    top: 243px;
    background: #D9D9D9;
}
#hr2{
    top: 518px;
}
#h2{
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
    width: 460px;
    height: 388px;
    left: 340px;
    top: 780px;
    background: #FFFFFF;
    box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
    border-radius: 50px;
    line-height: 40px;
}

#div02 > div{
    display: grid;
    grid-template-columns: 300px 160px;
    line-height: 40px;
}

#div02-1{
    position: absolute;
    width: 460px;
    height: 47px;
    left: 340px;
    top: 878px;
    background: #FF8686;
    font-family: 'Inter';
    font-style: normal;
    font-size: 18px;
    line-height: 36px;
    color: #FFFFFF;
}
#div03{
position: absolute;
width: 600px;
height: 700px;
left: 600px;
top: 180px;

background: #FDFDFD;
border: 1px solid lightgray;
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
    background: #FF8686;
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
background: #FF8686;
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
border-radius: 50px;
font-family: 'Inter';
font-style: normal;
font-weight: 400;
font-size: 15px;
line-height: 18px;
color: #000000;
}

#div04{
    top: 120px;
}

#div04-1{
    top: 175px;
}

#right{
    margin-right: 100px;
}

#div04 > div{
    display: grid;
    grid-template-columns: 270px 240px;
    line-height: 38px;
}
#div02 > div > div, #div04 > div > div, #div05 > div > div, #div06 > div > div{
    text-align: center;
}

#div05{
    top: 372px;
}
#div05 > div{
    display: grid;
    grid-template-columns: 1fr 1fr 1fr;
    line-height: 47px;
}
#div05-1{
    top: 440px;
}
#div06{
    top: 620px;
}
#div06 > div{
    display: grid;
    grid-template-columns: 270px 240px;
    line-height: 47px;
}
#div06-1{
    top: 690px;
}

</style>
<body>

	<header>
		<%@ include file="/WEB-INF/views/common/admin/header.jsp" %>
	</header>
		
	<div id="content">
		<nav>
			<%@ include file="/WEB-INF/views/common/admin/side-bar.jsp" %>
		</nav>
		<main>
			<!-- <div id="div01"></div> -->
			<div id="employee_piechart" style="width: 500px; height: 500px;"></div>
			<div id="chart_div" style="width:400px; margin-left: 30px;"></div>

<script type="text/javascript">

google.charts.load('current', {packages: ['corechart', 'bar']});

google.charts.setOnLoadCallback(drawBasic);

 

function drawBasic() {

var data = new google.visualization.DataTable();

data.addColumn('string', '요일');

data.addColumn('number');

 

data.addRows([

['10년생', ${eleven}],

['00년생', ${ten}],

['90년생', ${nine}],

['80년생', ${eight}],

['70년생', ${seven}],

['60년생', ${six}],

['50년생',${five}],



]);

 

var options = {

title: '환자 나이대 현황',

};

 

var chart = new google.visualization.ColumnChart(

document.getElementById('chart_div'));

 

chart.draw(data, options);

}

</script>
            <!--재고 등록 이력-->
            <!-- <div id="div02">
		        <br>
		        <div>
		            <div id="right"><h3>공지사항</h3></div>
		            <div><h3>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<a>더보기></a></h3></div>
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
		    </div> -->
		    <!-- 재고이력 틀 -->
		    <!-- <div id="div02-1">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp제목&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 등록일</div>
 -->

		    <!-- 일정 -->
		    <div id='div03'>
            <div id='calendar'></div>
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
		    	selectable : true,
		    	droppable : true,
		    	editable : true,
		    	events : [ 
		        	    <%List<Calendar> calendarList = (List<Calendar>) request.getAttribute("calendarList");%>
		                <%if (calendarList != null) {%>
		                <%for (Calendar vo : calendarList) {%>
		                {
		                	title : '<%=vo.getName()%>',
		                    start : '<%=vo.getDutyDay()%>',
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
		        </div>
		        <br><br>
		        <c:forEach items="${voList}" var="vo">
			        <div>
			            <div style="margin-top: 10px;">${vo.title}</div>
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
		        </div>
		        <br><br>
		        <c:forEach items="${voList2}" var="vo">
		        <div>
		            <div>${vo.memberName}</div>
		            <div>${vo.title}</div>
		            <div>
            		<fmt:formatDate pattern="MM-dd" value="${vo.createDate}" type="date"/>
            		</div>
		        </div>
		        </c:forEach>
		    </div>
		    <div id="div05-1">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp구분&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp | &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp등록일&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp |&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp문서명&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</div>
		 
		    <!-- 근태 -->
		    <div id="div06">
		        <br>
		       <div>
		            <div id="right"><h3>재고현황</h3></div>
		        </div>
		        <br><br>
		        <c:forEach items="${voList3}" var="vo">
		        <div>
		            <div>${vo.itemName}</div>
		            <div>${vo.inventoryCount }</div>
		        </div>
		        </c:forEach>
		    </div>
		    <div id="div06-1">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp종류&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp|&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 개수</div>

		</main>
	</div>

	<footer>
		<%@ include file="/WEB-INF/views/common/admin/footer.jsp" %>
	</footer>

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
    
</body>
</html>