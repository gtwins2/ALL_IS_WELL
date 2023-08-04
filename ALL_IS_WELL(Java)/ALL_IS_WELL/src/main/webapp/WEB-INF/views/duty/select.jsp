	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>당직 지정</title>
<script src="https://kit.fontawesome.com/794ac64f16.js" crossorigin="anonymous"></script>
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

    #wrap{
        width: 1920px;
        display: grid;
        grid-template-columns: 150px 1770px;
    }

    main{
        min-height: 100%;
    }

    .main-area {
        width: 70%;
        min-height: 80%;
        margin: auto;
    }

    .title-area {
        text-align: center;
        display: flex;
        flex-direction: row;
        justify-content: space-between;
    }

    #title {
        font-size: 35px;
    }

    #sendRequest {
        font-size: 20px;
        color: white;
        background-color: #FF8686;
        size: 10px;
        border: none;
        padding: 10px 15px;
        cursor: pointer;
        border-radius: 5px;
        font-weight: bold;
    }

    #sendRequest:hover {
        background-color: #555;
        transition: 0.7s;
    }

    .search-area {
        display: flex;
        align-items: center;
    }



    .search-area input[type="text"] {
        padding: 5px;
        margin-right: 20px;
        width: 300px;
        height: 30px;
        border: 1px solid gray;
        border-radius: 10px;
    }



    .list-area {
        margin-top: 20px;
    }


    .category-area {
        display: flex;
        align-items: center;

    }

    .category-area label {
        margin-right: 5px;
    }

    .category-area select {
        padding: 5px;
        border-radius: 10px;
        border: 1px solid gray;
        height: 40px;
    }

    .category-icon {
        margin-right: 5px;
        color: #555;
    }

    .category-icon::before {
        font-family: "Font Awesome 5 Free";
        content: "\f0a5";
        font-weight: 900;
    }

    #search-icon {
        color: gray;
    }

    #delete-button {
        color: #5A8CF2;
        font-weight: bold;
        font-size: 15px;
        margin-left: 2%;
    }

    .list-area {
        margin-top: 20px;

        background: #FFFFFF;
        border: 1px solid #C4C4C4;
        box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
        border-radius: 20px;
    }

    .list-area table {
        border-collapse: collapse;
        width: 100%;


        width: 100%;

    }

    .list-area th,
    .list-area td {
        padding: 20px;
        border-bottom: 1px solid #ddd;
        text-align: left;
    }

    .list-area th {
        font-size: 20px;
        font-weight: normal;

    }

    .list-area th:first-child,
    .list-area td:first-child {
        width: 30px;
    }

    .list-area th:last-child,
    .list-area td:last-child {
        width: 100px;
    }

    .list-area td input[type="checkbox"] {
        margin: 0;
        padding: 0;
    }

    .list-area th:nth-child(3) {
        padding-left: 10%;                
        width: 150px;
    }

    .list-area th:nth-child(2) {
        padding-left: 10%;
        width: 150px;
    }

    .list-area th:nth-child(4) {
        padding-left: 9.5%;
        width: 150px;
    }
    
    .list-area th:nth-child(5) {
        padding-left: 2%;
        width: 150px;
    }

    .list-area td:nth-child(3) {
        padding-left: 10.5%;
        width: 150px;                
    }

    .list-area td:nth-child(2) {
        padding-left: 9.5%;
        width: 150px;                
    }

    .list-area td:nth-child(4) {
        padding-left: 10%;
        width: 150px;                
    }
    
    
    .list-area td:nth-child(4) {
        white-space: nowrap;
        text-overflow: ellipsis;
        overflow: hidden;
    }

    .number-area {
        text-align: center;
    }

    .number-area a {
        display: inline-block;
        margin: 5px;
        padding: 8px 12px;
        text-decoration: none;
        border: none;
        color: inherit;
        font-size: 20px;
    }

    #previous {
        color: #5A8CF2;
    }

    #after {
        color: #5A8CF2;
    }

    .number-area a:hover {
        color: #5A8CF2;
    }

    .list-area th input[type="checkbox"] {
        appearance: none;
        width: 20px;
        height: 20px;
        border: 2px solid #C4C4C4;
        border-radius: 3px;
        outline: none;
        vertical-align: middle;
        position: relative;
        top: 2px;
        cursor: pointer;
    }

    .list-area td input[type="checkbox"] {
        appearance: none;
        width: 20px;
        height: 20px;
        border: 2px solid #C4C4C4;
        border-radius: 3px;
        outline: none;
        vertical-align: middle;
        position: relative;
        top: 2px;
        cursor: pointer;
    }

    .list-area td input[type="checkbox"]:checked {
        background-color: lightgray;
        border-color: lightgray;
    }

    .list-area th input[type="checkbox"]:checked {
        background-color: lightgray;
        border-color: lightgray;
    }

    #content{
        display: grid;
        grid-template-columns: 300px 1620px;
    }

    </style>
</head>

<body>
    <header>
        <%@ include file="/WEB-INF/views/common/admin/header.jsp" %>
    </header>


    <div id="content">
        <div id="wrap">
            <%@ include file="/WEB-INF/views/common/admin/side-bar.jsp" %>
        </div>


        <div class="main-area">
            <div class="title-area">
                <span id="title">당직 리스트</span>


                <form action="" class="search-area">
                    <label for="search" class="category-area">
                        <select name="search" id="search">
                            <option value="title">부서</option>
                            <option value="date">직급</option>
                        </select>

                    </label>
                    <input type="text" id="search-input">
                    <a href="" id="search-icon"><i class="fa-solid fa-magnifying-glass"></i></a>
                    
                </form>

            </div>
            <br>
            <br>
            <br>
            <br>
            <br>
			 <!-- calendar 태그 -->
         <div id='calendar-container'>
            <div id='calendar'></div>
         </div>
			 
                <button id="sendRequest" onclick="put();">지정하기</button>
            <div class="list-area">
                <table>
                    <th>당직자번호</th>
                    <th>당직자이름</th>
                    <th>당직예정일</th>
                    
                    
                    <c:forEach items="${voList}" var="vo">
						<tr>
							<td>${vo.mno}</td>
							<td>${vo.mname}</td>
							<td>${vo.start}</td>
							
						</tr>
					</c:forEach>

                    <!-- <tr>
                        <td><input type="checkbox" name="choose"></td>
                        <td>송섭섭</td>
                        <td>외과</td>
                        <td>과장</td>
                        <td>01012345678</td>
                    </tr>

                    <tr>
                        <td><input type="checkbox" name="choose"></td>
                        <td>송섭섭</td>
                        <td>외과</td>
                        <td>과장</td>
                        <td>01012345678</td>
                    </tr>

                    <tr>
                        <td><input type="checkbox" name="choose"></td>
                        <td>송섭섭</td>
                        <td>외과</td>
                        <td>과장</td>
                        <td>01012345678</td>
                    </tr>

                    <tr>
                        <td><input type="checkbox" name="choose"></td>
                        <td>송섭섭</td>
                        <td>외과</td>
                        <td>과장</td>
                        <td>01012345678</td>
                    </tr>

                    <tr>
                        <td><input type="checkbox" name="choose"></td>
                        <td>송섭섭</td>
                        <td>외과</td>
                        <td>과장</td>
                        <td>01012345678</td>
                    </tr>

                    <tr>
                        <td><input type="checkbox" name="choose"></td>
                        <td>송섭섭</td>
                        <td>외과</td>
                        <td>과장</td>
                        <td>01012345678</td>
                    </tr>

                    <tr>
                        <td><input type="checkbox" name="choose"></td>
                        <td>송섭섭</td>
                        <td>외과</td>
                        <td>과장</td>
                        <td>01012345678</td>
                    </tr>

                    <tr>
                        <td><input type="checkbox" name="choose"></td>
                        <td>송섭섭</td>
                        <td>외과</td>
                        <td>과장</td>
                        <td>01012345678</td>
                    </tr>

                    <tr>
                        <td><input type="checkbox" name="choose"></td>
                        <td>송섭섭</td>
                        <td>외과</td>
                        <td>과장</td>
                        <td>01012345678</td>
                    </tr>

                    <tr>
                        <td><input type="checkbox" name="choose"></td>
                        <td>송섭섭</td>
                        <td>외과</td>
                        <td>과장</td>
                        <td>01012345678</td>
                    </tr> -->




                </table>
            </div>
            <br>
            <br>
            <br>

            <c:set var="range" value="5" />
			<c:set var="startPage"
				value="${pv.currentPage - range > 0 ? pv.currentPage - range : 1}" />
			<c:set var="endPage"
				value="${startPage + 4 <= pv.maxPage ? startPage + 4 : pv.maxPage}" />
			<c:set var="startPage" value="${endPage - 4 > 0 ? endPage - 4 : 1}" />

			<div class="number-area">
				<c:if test="${pv.currentPage > 1 }">
					<a class="pageBtn"
						onclick="pageMove('${startPage - 1 > 0 ? startPage - 1 : 1}');">‹</a>
				</c:if>
				<c:if test="${pv.maxPage > 1 }">
					<c:forEach begin="${startPage}" end="${endPage}" var="i">
						<a class="pageBtn" onclick="pageMove('${i}');">${i}</a>
					</c:forEach>
				</c:if>
				<c:if test="${pv.currentPage < pv.maxPage }">
					<a class="pageBtn"
						onclick="pageMove('${endPage + 1 <= pv.maxPage ? endPage + 1 : pv.maxPage}');">›</a>
				</c:if>
			</div>
        </div>

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

        function selectAll(selectAll) {
            const checkboxes = document.getElementsByName('choose');

            checkboxes.forEach((checkbox) => {
                checkbox.checked = selectAll.checked;
            })
        }
        
        function put(){
        	location.href="${root}/duty/put";
        }

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
                     var title = prompt('당직 직원 번호를 입력해주세요');
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
</body>

</html>