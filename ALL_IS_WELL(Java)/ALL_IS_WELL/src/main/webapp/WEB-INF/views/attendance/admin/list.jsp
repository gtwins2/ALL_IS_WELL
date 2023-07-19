<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
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
        margin: auto;
        width: 80%;
        text-align: center;
        display: flex;
        flex-direction: row;
        justify-content: space-between;
        margin-top: 40px;
        margin-bottom: 40px;
    }

    #writeApproval {
        font-size: 20px;
        color: white;
        background-color: #5A8CF2;
        size: 10px;
        border: none;
        padding: 5px 8px;
        cursor: pointer;
        border-radius: 5px;
        font-weight: bold;
    }

    #writeApproval:hover {
        background-color: #555;
        transition: 0.7s;
    }

    .search-area {
        display: flex;
        align-items: center;
    }

    #search{
        height: 50px;
    }

    .search-area input[type="text"] {
        padding: 5px;
        margin-right: 20px;
        width: 800px;
        height: 50px;
        border: 1px solid gray;
        border-radius: 10px;
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

    #title {
        font-size: 20px;
    }

    #writeApproval {
        font-size: 15px;
        color: white;
        background-color: #5A8CF2;
        size: 10px;
        border: none;
        cursor: pointer;
        border-radius: 5px;
        font-weight: bold;
    }

    #writeApproval:hover {
        background-color: #555;
        transition: 0.7s;
    }

    .search-area {
        display: flex;
        align-items: center;
    }

    #search{
        height: 40px;
    }

    .search-area input[type="text"] {
        padding: 5px;
        margin-right: 20px;
        width: 600px;
        height: 40px;
        border: 1px solid gray;
        border-radius: 10px;
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

    .list-area {
        margin: auto;
        width: 80%;
        background: #FFFFFF;
        border: 1px solid #C4C4C4;
        box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
        border-radius: 20px;

    }

    .list-area th,
    .list-area td {
        padding: 15px;
        border-bottom: 1px solid #ddd;
        text-align: center;
    }

    .list-area th {
        font-size: 15px;
        font-weight: normal;
    }

    #member{
        width: 150px;
    }

    #enter-time{
        width: 600px;
    }

    #out-time {
        width: 600px;
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
    }

</style>
</head>
<body>
	
	<header>
		<%@include file="/WEB-INF/views/common/admin/header.jsp" %>
	</header>
	
	<main id="wrap">
            <%@ include file="/WEB-INF/views/common/admin/side-bar.jsp" %>
        <div class="main-area">
            <div class="title-area">
                <span id="title">직원근태목록</span>
                <form action="" class="search-area" method="get">
                    <label for="search" class="category-area">
                        <select name="search" id="search">
                            <option value="name">이름</option>
                        </select>
                    </label>
                    <input type="text" id="search-input" name="searchValue">
                    <a href="" id="search-icon"><i class="fa-solid fa-magnifying-glass"></i></a>
                </form>

                <button id="writeApproval">검색하기</button>
            </div>
            <div class="list-area">
                <table>
                	<c:forEach items="${voList}" var="vo">
						<tr>
                            <th hidden id="attendanceNo">${vo.no}</th>
	                        <th id="member">${vo.memberName}</th>
	                        <th id="enter-time">${vo.presenceTime}</th>
	                        <th id="out-time">${vo.leaveTime}</th>
	                        <th id="status">${vo.status}</th>
	                    </tr>                	
                	</c:forEach>
                </table>
            </div>
            <div class="number-area">
                <c:if test="${pv.currentPage > 1 }">
                    <a onclick="pageMove('${pv.startPage}');"><</a>
                </c:if>
                <c:forEach begin="${pv.startPage}" end="${pv.endPage}" var="i">
					<a class="pageBtn" onclick="pageMove('${i}');">${i}</a>
				</c:forEach>
                <c:if test="${pv.currentPage < pv.maxPage }">
                    <a onclick="pageMove('${pv.endPage}');">></a>
                </c:if>
            </div>
        </div>            
	</main>

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

        function pageMove(i) {
            location.href = "${root}/attendance/admin/list=" + i;
        }

        for (let btn of pageBtn) {
            if (btn.innerHTML == '${pageVo.currentPage}') {
                btn.style.backgroundColor = '#4998D1';
                btn.style.color = 'white';
            }
        }

    </script>
</body>
</html>