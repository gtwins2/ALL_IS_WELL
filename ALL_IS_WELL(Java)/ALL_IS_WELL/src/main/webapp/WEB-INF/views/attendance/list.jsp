<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        min-height: 900px;
    }

    .main-area {
        width: 70%;
        min-height: 80%;
        margin: auto;
    }

    .title-area {
        width: 100%;
        margin: auto;
        margin-top: 40px;
        margin-bottom: 40px;
        background: #FFFFFF;
        border: 1px solid #C4C4C4;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.25);
        border-radius: 20px;

    }

    .title-area table {
        width: 100%;
        font-size: 15px;
        border-collapse: collapse;
    }

    .title-area th {
        padding: 15px;
        border-bottom: 1px solid #ddd;
        text-align: center;
        font-size: 20px;
        font-weight: normal;
    }

    .title-area {
        margin-top: 20px;
        width: 80%;
        margin: auto;
    }

    .title-area table {
        width: 100%;
        border-collapse: collapse;
    }

    .title-area th,
    .title-area td {
        padding: 20px;
        text-align: center;
        font-size: 20px;
    }

    .title-area th {
        font-weight: bold;
        background-color: #5A8CF2;
        color: white;
    }

    .title-area th:first-child{
        border-top-left-radius: 20px;
    }

    .title-area th:last-child{
        border-top-right-radius: 20px;
    }

    .list-area {
        width: 80%;
        margin: auto;
        margin-top: 20px;
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
        padding: 20px;
        border-bottom: 1px solid #ddd;
        text-align: center;
        font-size: 20px;
    }

    .list-area th {
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

    .title-area th#date,
    .list-area th#date {
        width: 350px; 
    }

    .title-area th#writer,
    .list-area th#writer {
        width: 310px; 
    }

    .title-area th#content,
    .list-area th#content {
        width: 310px; 
    }

    .title-area tr th{
        padding-right: 10px;
    }

    .title-area tr td{
        padding-left: 40px;
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
                <table>
                    <tr>
                        <th id="date">날짜</th>
                        <th id="writer">출근 시간</th>
                        <th id="content">퇴근 시간</th>
                    </tr>
                    <tr>
                        <td id="date"><fmt:formatDate value="${fvo.presenceTime}" pattern="yyyy-MM-dd"/></td>
                        <td id="writer"><fmt:formatDate value="${fvo.presenceTime}" pattern="HH:mm:ss"/></td>
                        <c:if test="${fvo.leaveTime != null}">
                            <td id="content"><fmt:formatDate value="${fvo.leaveTime}" pattern="HH:mm:ss"/></td>
                        </c:if>
                        <c:if test="${fvo.leaveTime == null}">
                            <td id="content">X</td>
                        </c:if>
                    </tr>
                </table>
            </div>
            <div class="list-area">
                <table>
                    <c:forEach items="${voList}" var="vo">
                        <tr>
                            <td hidden>${vo.memberNo}</td>
                            <td id="date"><fmt:formatDate value="${vo.presenceTime}" pattern="yyyy-MM-dd"/></td>
                            <td id="writer"><fmt:formatDate value="${vo.presenceTime}" pattern="HH:mm:ss"/></td>
                            <td id="content"><fmt:formatDate value="${vo.leaveTime}" pattern="HH:mm:ss"/></td>
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
    </script>
</body>
</html>