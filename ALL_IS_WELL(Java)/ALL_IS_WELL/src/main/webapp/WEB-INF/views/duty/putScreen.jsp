<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="com.kh.app.main.controller.Calendar"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>당직 지정</title>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
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
        height: 800px;
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
        font-size: 30px;
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
        height: 40px;
        border: 1px solid gray;
        border-radius: 10px;
    }



    .list-area {
        margin-top: 20px;
        width: 50%;
        height: 40%;
        margin-left: 750px;
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
        margin-bottom: 40px;
    }

    .number-area {
        text-align: center;
        margin-top: 20px;
        margin-bottom: 20px;
    }

    .number-area a {
        display: inline-block;
        margin: 5px;
        padding: 8px 12px;
        text-decoration: none;
        border: none;
        color: inherit;
        font-size: 15px;
    }


#previous {
	color: #5A8CF2;
}

#after {
	color: #5A8CF2;
}

    .number-area a:hover {
        color: #5A8CF2;
        cursor: pointer;
    }

    .currentPage{
        color: #5A8CF2 !important;
        pointer-events: none;
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
    
    .list-area td, .list-area th{
    	text-align: center;
    	border-bottom: 1px solid gray;
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
    #div03{
        display: inline;
        position: absolute;
        width: 30%;
        height: 50%;
    }
    
    
	.list-area {
        margin-top: 20px;
        width: 50%;
        height: 40%;
        margin-left: 750px;
    }
    .list-area th{
    	width: 200px;
    }
    </style>
    
</head>

<body>
    <header>
        <%@ include file="/WEB-INF/views/common/admin/header.jsp" %>
    </header>


        <main id="wrap">
            <header>
            <%@ include file="/WEB-INF/views/common/admin/side-bar.jsp" %>
            </header>


        <div class="main-area">
        <br>
		<br>
         <div class="title-area">
         <br>
         <br>
                <span id="title">당직 지정</span>
                <div>
            </div>
            </div>
            <br>
            <br>
      <div id="leftside">
        	<!-- 일정 -->
            
            <div id='div03'>
            <div id='calendar'></div>
            </div>
            <div>
            </div>    
                
            
     </div>
     
     
<form action="${root}/duty/put" method="post">
    <div class="list-area">
        <table>
            <tr>
                <th style="font-size: 20px;">당직 인원</th>
                <td>
                    <label for="item-select"></label>
                    <select style="border: none; border-radius: 5px; font-size: 30px" name="mno">
                        <c:forEach items="${voList}" var="vo">
                            <option name="mno" value="${vo.no}">${vo.name}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            <tr>
                <th style="font-size: 20px;">당직 날짜</th>
                <td>
                    <input type="text" name="start" id="dateInput" placeholder="yyyyMMdd형식으로 입력" style="border: none; border-radius: 5px; font-size: 30px;">
                    <br>
                </td>
            </tr>
        </table>
        <div style="margin-left: 370px;">
            <button id="sendRequest" type="submit" onclick="sendRequest();">지정하기</button>
            <button id="sendRequest" type="button" onclick="backPage();">뒤로가기</button>
        </div>
    </div>
</form>
            
            <div class="number-area">
                <c:if test="${pv.listCount > 10}">
                    <c:if test="${pv.currentPage > 1}">
                        <a href="select?page=1&searchType=${svo.getSearchType()}&searchValue=${svo.getSearchValue()}">&laquo;</a>
                        <a href="select?page=${pv.currentPage - 1}&searchType=${svo.getSearchType()}&searchValue=${svo.getSearchValue()}">&lt;</a>
                    </c:if>      
                    <c:set var="finalEndPage" value="${pv.endPage > pv.maxPage ? pv.maxPage : pv.endPage}" />
                    <c:forEach var="i" begin="${pv.startPage}" end="${finalEndPage}" step="1">
                        <c:choose>
                            <c:when test="${i == pv.currentPage}">
                                <a class="currentPage">${i}</a>
                            </c:when>
                            <c:otherwise>
                                <a href="select?page=${i}&searchType=${svo.getSearchType()}&searchValue=${svo.getSearchValue()}">${i}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <c:if test="${pv.maxPage > pv.currentPage}">
                        <a href="select?page=${pv.currentPage + 1}&searchType=${svo.getSearchType()}&searchValue=${svo.getSearchValue()}">&gt;</a>
                        <a href="select?page=${pv.maxPage}&searchType=${svo.getSearchType()}&searchValue=${svo.getSearchValue()}">&raquo;</a>
                    </c:if>
                </c:if>
            </div>
			</div>
            
            </div>
			 
                

    </main>

    <footer>
        <%@ include file="/WEB-INF/views/common/admin/footer.jsp" %>
    </footer>

    <script>
    function sendRequest(){
    	alert("당직 지정 요청이 완료되었습니다.");
    	sendReq2();
    }
    
    function sendReq2(){
    	location.href = 'redirect:/${root}/duty/put';
    }
    function backPage(){
    	location.href = '${root}/duty/select';
    }
    function detail(no){
   	 location.href = "${root}/duty/detail/" + no
    }
    const sideBar = document.querySelector("#side-bar")
    const subMenus = document.querySelectorAll(".sub-menu");
    const thirdSidebars = document.querySelectorAll(".third-sidebar");

    subMenus.forEach(subMenu => {
        subMenu.style.height = sideBar.offsetHeight + 'px';
    });

    thirdSidebars.forEach(thirdSidebar => {
        thirdSidebar.style.height = sideBar.offsetHeight + 'px';
    });

    function showTab() {
        const div03 = document.querySelector('#div03');
        div03.style.display = "none";
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
                displayEventTime: false, // 이벤트 시간 안보이게
                dayMaxEvents: false, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
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

         const pageBtn = document.querySelectorAll('.pageBtn');

         for (let btn of pageBtn) {
             if (btn.innerHTML == '${pv.currentPage}') {
                 btn.style.color = '#d9d9d9';
             }
         }

         function pageMove(pageNumber) {
             let url = new URL(window.location.href);
             url.searchParams.set('page', pageNumber);
             window.location.href = url.href;
         }
         const searchValueTag = document.querySelector("input[name=searchValue]");
 		searchValueTag.value = '${paramMap.searchValue}';
 		
 		const searchTypeTagArr = document.querySelectorAll("select[name=searchType] > option");
 		const x = '${paramMap.searchType}';
 		if(x == 'title'){
 			searchTypeTagArr[0].selected = true;			
 		}else if(x == '${paramMap.enroll_date}'){
 			searchTypeTagArr[1].selected = true;
 		}
         
         

    </script>
</body>

</html>