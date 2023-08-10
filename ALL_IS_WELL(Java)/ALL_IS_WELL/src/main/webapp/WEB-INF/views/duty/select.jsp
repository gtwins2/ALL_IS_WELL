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

    
    
    .list-area th:first-child{
    	margin-left: 20px;
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
    
    tr:hover {
	  background-color: #f2f2f2;
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
         <div class="title-area">
                <span id="title">당직 리스트</span><button id="sendRequest" onclick="put();">지정하기</button>
            </div>
                
        	<!-- 일정 -->
        	<br>
        	<br>
		    <div id='div03'>
            <div id='calendar'></div>
         	</div>
            <form action="" class="search-area" method="get">
                   <label for="search" class="category-area"> <select
						id="search" name="searchType">
                            <option value="mname">당직자</option>
                            <option value="start">당직일</option>
                        </select>

                    </label> <input type="text" id="search-input" name="searchValue"> <a
						href="http://127.0.0.1:8888/app/duty/select?page=1"
						id="search-icon"><i class="fa-solid fa-magnifying-glass"></i></a>
					<input type="submit" value="검색">
                    
                </form>

            <div class="list-area">
                <table>
                    <th style="margin-left: 30px;">당직자번호</th>
                    <th>당직자이름</th>
                    <th>당직예정일</th>
                    
                    
                    <c:forEach items="${voList}" var="vo">
						<tr onclick="detail(${vo.no});">
                    		<input type="hidden" name=no" value="${vo.no}">
							<td>${vo.mno}</td>
							<td>${vo.mname}</td>
							<td>${vo.start}</td>
							
						</tr>
					</c:forEach>

                </table>
            

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
						<a class="pageBtn" class="pageBtn" onclick="pageMove('${i}');">${i}</a>
					</c:forEach>
				</c:if>
				<c:if test="${pv.currentPage < pv.maxPage }">
					<a class="pageBtn"
						onclick="pageMove('${endPage + 1 <= pv.maxPage ? endPage + 1 : pv.maxPage}');">›</a>
				</c:if>
			</div>
			</div>
            
            </div>

			 
                

    </main>

    <footer>
        <%@ include file="/WEB-INF/views/common/admin/footer.jsp" %>
    </footer>

    <script>
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
</body>

</html>