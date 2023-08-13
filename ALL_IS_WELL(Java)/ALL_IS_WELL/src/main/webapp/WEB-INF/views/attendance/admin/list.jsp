<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
	#wrap{
		width: 1920px;
		display: grid;
		grid-template-columns: 150px 1770px;
	}

    main{
        min-height: 900px;
    }

    .main-area {
        width: 70%;
        min-height: 80%;
        margin: auto;
    }

    #title{
        font-size: 30px;
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
        font-size: 20px;
    }

    .search-area input[type="text"] {
        padding: 5px;
        margin-right: 20px;
        width: 500px;
        height: 40px;
        border: 1px solid gray;
        border-radius: 10px;
        font-size: 20px;
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
        display: inline-flex;
        position: relative;
    }

    #search {
        height: 40px;
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
        display: flex; 
        align-items: center;
        padding: 0 10px; 
        cursor: pointer; 
        color: gray;
    }

    .list-area {
        margin: auto;
        width: 80%;
        background: #FFFFFF;
        border: 1px solid #C4C4C4;
        box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
        border-radius: 20px;
        padding: 20px;
    }

    .list-area table {
        width: 100%;
        border-collapse: collapse;
    }

    .list-area th,
    .list-area td {
        padding-top: 15px;
        padding-bottom: 15px;
        border-bottom: 0.5px solid #C4C4C4;
        text-align: center;
    }

    .list-area th {
        font-size: 15px;
        font-weight: normal;
    }


    .number-area {
        text-align: center;
        margin-top: 20px;
        margin-bottom: 20px;
    }

    .number-area a {
        display: inline-block;
        text-decoration: none;
        border: none;
        color: inherit;
        font-size: 15px;
        margin: 10px 15px;
        color: black;
    }

    .number-area a:hover {
        color: #5A8CF2;
        cursor: pointer;
    }

    #previous {
        color: #5A8CF2;
    }

    #after {
        color: #5A8CF2;
    }

    .list-area th#enter-time,
    .list-area td#enter-time,
    .list-area th#out-time,
    .list-area td#out-time {
        width: 350px;
    }

    .fa-solid{
        font-size: 20px;
        color: black;
    }

    .currentPage{
        color: #5A8CF2 !important;
        pointer-events: none;
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
                        <select name="searchType" id="search">
                            <option value="name" ${param.searchType == 'name' ? 'selected' : ''}>이름</option>
                            <option value="position" ${param.searchType == 'position' ? 'selected' : ''}>직급</option>
                            <option value="department" ${param.searchType == 'department' ? 'selected' : ''}>부서</option>
                        </select>
                    </label>
                    <input type="text" id="search-input" name="searchValue" value="${vo.searchValue}">
                    <a href="" id="search-icon" onclick="this.closest('form').submit(); return false;"><i class="fa-solid fa-magnifying-glass"></i></a>
                </form>
                <DIV></DIV>
            </div>
            <div class="list-area">
                <table>
                    <tr>
                        <th>직원 이름</th>
                        <th>출근 시간</th>
                        <th>퇴근 시간</th>
                        <th>퇴근 여부</th>
                    </tr>
                	<c:forEach items="${voList}" var="vo">
						<tr>
                            <th hidden id="attendanceNo">${vo.no}</th>
	                        <th id="member">${vo.memberName}(${vo.departmentName}-${vo.positionName})</th>
	                        <th id="enter-time"><fmt:formatDate value="${vo.presenceTime}" pattern="yyyy-MM-dd HH:mm:ss"/></th>
	                        <th id="out-time"><fmt:formatDate value="${vo.leaveTime}" pattern="yyyy-MM-dd HH:mm:ss"/></th>
	                        <th id="status">${vo.status}</th>
	                    </tr>                	
                	</c:forEach>
                </table>
            </div>
            <div class="number-area">
                <c:if test="${pv.listCount > 10}">
                    <c:if test="${pv.currentPage > 1}">
                        <a href="list?page=1&searchType=${svo.getSearchType()}&searchValue=${svo.getSearchValue()}">&laquo;</a>
                        <a href="list?page=${pv.currentPage - 1}&searchType=${svo.getSearchType()}&searchValue=${svo.getSearchValue()}">&lt;</a>
                    </c:if>      
                    <c:set var="finalEndPage" value="${pv.endPage > pv.maxPage ? pv.maxPage : pv.endPage}" />
                    <c:forEach var="i" begin="${pv.startPage}" end="${finalEndPage}" step="1">
                        <c:choose>
                            <c:when test="${i == pv.currentPage}">
                                <a class="currentPage">${i}</a>
                            </c:when>
                            <c:otherwise>
                                <a href="list?page=${i}&searchType=${svo.getSearchType()}&searchValue=${svo.getSearchValue()}">${i}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <c:if test="${pv.maxPage > pv.currentPage}">
                        <a href="list?page=${pv.currentPage + 1}&searchType=${svo.getSearchType()}&searchValue=${svo.getSearchValue()}">&gt;</a>
                        <a href="list?page=${pv.maxPage}&searchType=${svo.getSearchType()}&searchValue=${svo.getSearchValue()}">&raquo;</a>
                    </c:if>
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
    </script>
</body>
</html>