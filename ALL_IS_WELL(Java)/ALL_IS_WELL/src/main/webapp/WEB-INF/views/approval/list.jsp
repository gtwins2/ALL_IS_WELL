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
        min-height: 800px;
    }

    .main-area {
        width: 70%;
        min-height: 80%;
        margin: auto;
    }

    .title-area {
        display: flex;
        flex-direction: row;
        justify-content: space-between;
        margin: auto;
        margin-top: 40px;
        margin-bottom: 40px;
        width: 90%;
    }

    #title {
        font-size: 30px;
        margin: auto;
    }

    #writeBtn{
        text-align: right;
        margin-top: 20px;
        margin-right: 10px;
        margin: auto;
        display: flex;
    }

    #writeBtn form{
        flex-direction: column;
        margin-right: 10px;
        align-items: center;
        justify-content: center;
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
        display: inline-flex;
        position: relative;
    }

    #search {
        height: 40px;
        font-size: 20px;
    }

    .search-area input[type="text"] {
        padding: 5px;
        margin-right: 0; 
        padding-right: 30px;
        width: 600px;
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
        position: absolute; 
        right: 0;
        top: 10px; 
        display: flex; 
        align-items: center;
        padding: 0 10px; 
        cursor: pointer; 
        color: gray;
    }

    .fa-solid{
        font-size: 20px;
        color: black;
    }

    .list-area {
        margin: auto;
        width: 90%;
        background: #FFFFFF;
        border: 1px solid #C4C4C4;
        box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
        border-radius: 20px;
    }

    .list-area table {
        width: 100%;
        border-collapse: collapse;
    }

    .list-area th,
    .list-area td {
        padding-top: 20px;
        padding-bottom: 15px;
        border-bottom: 0.5px solid #C4C4C4;
        text-align: center;
    }

    .list-area th {
        font-size: 20px;
        font-weight: bold;
        background-color: #5A8CF2;
        color: white;
    }

    .list-area th:first-child{
        border-top-left-radius: 20px;
    }

    .list-area th:last-child{
        border-top-right-radius: 20px;
    }

    .list-area th:not(#status) {
        width: 28%;
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

    .currentPage{
        color: #5A8CF2 !important;
        pointer-events: none;
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

    #statusBtn{
        box-sizing: border-box;
        width: 60px;
        height: 30px;
        border-radius: 20px;
        background-color: #A7A7A7;
        color: white;
        border: none;
    }

    tbody tr:hover{
        background-color: #d9d9d9;
    }

</style>
</head>
<body>
	
	<header>
		<%@include file="/WEB-INF/views/common/member/header.jsp" %>
	</header>
	
	<main id="wrap">
        <div>
            <%@ include file="/WEB-INF/views/common/member/side-bar.jsp" %>
        </div>
        <div class="main-area">
            <div class="title-area">
                <span id="title">기안문서함</span>

                <form action="" class="search-area">
                    <label for="search" class="category-area">
                        <select name="searchType" id="search">
                            <option value="name" ${param.searchType == 'name' ? 'selected' : ''}>작성자</option>
                            <option value="approvalType" ${param.searchType == 'approvalType' ? 'selected' : ''}>문서종류</option>
                            <option value="status" ${param.searchType == 'status' ? 'selected' : ''}>상태</option>
                        </select>
                    </label>
                    <input type="text" id="search-input" name="searchValue">
                    <a href="" id="search-icon" onclick="this.closest('form').submit(); return false;"><i class="fa-solid fa-magnifying-glass"></i></a>
                </form>

                <div id="writeBtn">
                
                </div>
            </div>
            <div class="list-area">
                <table>
                    <thead>
                        <tr>
                            <th id="writer">작성자</th>
                            <th id="content">제목</th>
                            <th id="enrollDate">작성일</th>
                            <th id="status">상태</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${voList}" var="vo">
                            <c:if test="${vo.memberName ne loginMember.name}">
                                <tr onclick="detail();">
                                    <td id="approvalNo" hidden>${vo.no}</td>
                                    <td>${vo.memberName}(${vo.departmentName}-${vo.positionName})</td>
                                    <td id="approvalTitle">${vo.title}</td>
                                    <td><fmt:formatDate value="${vo.createDate}" pattern="yyyy-MM-dd"/></td>
                                    <td>
                                        <button id="statusBtn" class="statusBtn" disabled>${vo.status}</button>
                                    </td>
                                </tr>
                            </c:if>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <div class="number-area">
                <c:if test="${pv.listCount > 10}">
                    <c:if test="${pv.currentPage > 1}">
                        <a href="list?page=1&searchType=${vo.getSearchType()}&searchValue=${vo.getSearchValue()}">&laquo;</a>
                        <a href="list?page=${pv.currentPage - 1}&searchType=${vo.getSearchType()}&searchValue=${vo.getSearchValue()}">&lt;</a>
                    </c:if>      
                    <c:set var="finalEndPage" value="${pv.endPage > pv.maxPage ? pv.maxPage : pv.endPage}" />
                    <c:forEach var="i" begin="${pv.startPage}" end="${finalEndPage}" step="1">
                        <c:choose>
                            <c:when test="${i == pv.currentPage}">
                                <a class="currentPage">${i}</a>
                            </c:when>
                            <c:otherwise>
                                <a href="list?page=${i}&searchType=${vo.getSearchType()}&searchValue=${vo.getSearchValue()}">${i}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <c:if test="${pv.maxPage > pv.currentPage}">
                        <a href="list?page=${pv.currentPage + 1}&searchType=${vo.getSearchType()}&searchValue=${vo.getSearchValue()}">&gt;</a>
                        <a href="list?page=${pv.maxPage}&searchType=${vo.getSearchType()}&searchValue=${vo.getSearchValue()}">&raquo;</a>
                    </c:if>
                </c:if>
            </div>
        </div>
	</main>

	<footer>
		<%@ include file="/WEB-INF/views/common/member/footer.jsp" %>
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
    
        document.addEventListener("DOMContentLoaded", function () {
            const statusBtns = document.querySelectorAll(".statusBtn");

            statusBtns.forEach(function (statusBtn) {
                const status = statusBtn.textContent;
                if (status === "A") {
                    statusBtn.innerHTML = "승인";
                    statusBtn.style.backgroundColor = "#119F30";
                } else if (status === "R" || status === "O") {
                    statusBtn.innerHTML = "반려";
                    statusBtn.style.backgroundColor = "#EC3C3C";
                } else if (status === "W") {
                    statusBtn.innerHTML = "대기";
                    statusBtn.style.backgroundColor = "#A7A7A7";
                } else if (status === "F") {
                    statusBtn.innerHTML = "1차 승인";
                    statusBtn.style.backgroundColor = "#DECD37";
                }
            });
        });

        function detail() {
            const no = event.target.parentElement.querySelector("#approvalNo").innerText;
            const title = event.target.parentElement.querySelector("#approvalTitle").innerText;
            if(title === "출장문서"){
                location.href = "${root}/approval/trip?no=" + no;
            } else if(title === "휴가문서"){
                location.href = "${root}/approval/vacation?no=" + no;
            } else if(title === "재고신청문서"){
                location.href = "${root}/approval/inventory?no=" + no;
            }
        };
    </script>
</body>
</html>