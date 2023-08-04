<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

#div01-1{
	position: absolute;
    width: 334px;
    height: 240px;
	left: 200px;
    top: 113px;
}

hr{
	position: absolute;
	width: 334px;
	height: 0.67px;
	left: 200px;
	top: 350px;
	
	background: #000000;
}
#h2{
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
width: 500px;
height: 730px;
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
		    <div id="div01-1"><img src="${root}/resources/static/img/logo/logo2.png" alt="" width="100%" height="100%"></div>
			<h2 id="h2">흉부외과 전문의<br><br>  ${loginMember.name} <br><br> ${loginMember.licenseNumber}</h2>
			
			<input type="text" value="${loginMember.no}" name="no" hidden>
		    <!-- 출근 -->
		    
		    <form action="/app/attend?no=${loginMember.no}" method="post" onclick="attend();">
				<input type="submit" id="div02" value="출근" ></input>
		    </form>
		    
		    <form action="/app/leave?no=${loginMember.no}" method="post">
				<input type="submit" id="div07" value="퇴근">
		    </form>
		
		    <!-- 일정 -->
		    <!-- calendar 태그 -->
         <div id='div03'>
            <div id='calendar'></div>
         </div>

		    <script>
            
            function getRandomColor() {
               var letters = '0123456789ABCDEF';
               var color = '#';
               for (var i = 0; i < 6; i++) {
                  color += letters[Math.floor(Math.random() * 16)];
                  if(color == '#ffffff'){
                     return color;
                  }
               }
               return color;
            }

            var randomColor = getRandomColor(); // 랜덤 색상 생성

            (function () {
               $(function () {
                  // calendar element 취득
                  var calendarEl = $('#calendar')[0];
                  // full-calendar 생성하기
                  var calendar = new FullCalendar.Calendar(calendarEl, {
                     height: '700px', // calendar 높이 설정
                     expandRows: true, // 화면에 맞게 높이 재설정
                     slotMinTime: '08:00', // Day 캘린더에서 시작 시간
                     slotMaxTime: '20:00', // Day 캘린더에서 종료 시간
                     // 해더에 표시할 툴바
                     headerToolbar: {
                        left: 'prev,next today',
                        center: 'title',
                        right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
                     },
                     initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
                     // initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
                     navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
                     editable: true, // 수정 가능?
                     selectable: true, // 달력 일자 드래그 설정가능
                     nowIndicator: true, // 현재 시간 마크
                     dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
                     locale: 'ko', // 한국어 설정
                     
                     eventAdd: function (obj) { // 이벤트 추가(드래그))
                        const params = [];
                        params.push("write")
                        params.push(obj.event.title);
                        params.push(obj.event.start);
                        params.push(obj.event.end);

                        $.ajax({
                           url: '/semi/teamCalendar',
                           type: 'post',
                           data: {
                              params: JSON.stringify(params)
                           },
                           error: function () {
                              alert("error");
                           }
                        });
                     },
                     eventChange: function (obj) { // 이벤트 수정(이벤트 드래그)
                        const params = [];
                        params.push("modify")
                        params.push(obj.event.title);
                        params.push(obj.event.start);
                        params.push(obj.event.end);

                        $.ajax({
                           url: '/semi/teamCalendar',
                           type: 'post',
                           data: {
                              params: JSON.stringify(params)
                           },
                           error: function () {
                              alert("error");
                           }
                        });
                     },
                     eventClick: function (obj) { // 이벤트 삭제 (이벤트 클릭)
                        var result = confirm('이 일정을 삭제하시겠습니까?');

                        if (result == true) {
                           const params = [];
                           params.push("delete")
                           params.push(obj.event.title);
                           params.push(obj.event.start);
                           params.push(obj.event.end);

                           $.ajax({
                              url: '/semi/teamCalendar',
                              type: 'post',
                              data: {
                                 params: JSON.stringify(params)
                              },
                              success: function() {
                                 location.reload();
                              },
                              error: function () {
                                 alert("error");
                              }
                           });
                        }
                     },

                     
                     select: function (arg) { // 드래그 or 클릭으로 이벤트 생성
                        var title = prompt('일정을 입력해주세요');
                        if (title) {
                           calendar.addEvent({
                              title: title,
                              start: arg.start,
                              end: arg.end,
                              allDay: arg.allDay,
                              backgroundColor: randomColor // 배경색 지정
                           });
                        }
                        calendar.unselect()
                     },
                     // 이벤트 
                     events: [
                        <c:forEach items="${voList}" var="vo">
                           {
                           title: '${vo.meetingContent}',
                           start: '${vo.startDate}',
                           end: '${vo.endDate}',
                           backgroundColor: getRandomColor()
                           },
                        </c:forEach>
                     ]
                  });



                  // 캘린더 랜더링
                  calendar.render();
               });
            })();
         </script>
		    
		
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