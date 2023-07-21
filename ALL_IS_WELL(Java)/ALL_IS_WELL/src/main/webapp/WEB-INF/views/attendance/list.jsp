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
        min-height: 100%;
    }

    .main-area {
        width: 70%;
        min-height: 80%;
        margin: auto;
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

    .title-area {
        width: 80%;
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
    }

    .title-area th {
        padding: 15px;
        border-bottom: 1px solid #ddd;
        text-align: center;
        font-size: 15px;
        font-weight: normal;
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
        width: 150px; /* 날짜 열의 너비 지정 */
    }

    .title-area th#writer,
    .list-area th#writer {
        width: 450px; /* 출근시간 열의 너비 지정 */
    }

    .title-area th#content,
    .list-area th#content {
        width: 450px; /* 퇴근시간 열의 너비 지정 */
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
                        <th id="date">07.18</th>
                        <th id="writer">출근 시간 : X</th>
                        <th id="content">퇴근 시간 : X</th>
                    </tr>
                </table>
            </div>
            <div class="list-area">
                <table>
                    <tr>
                        <th id="date">날짜</th>
                        <th id="writer">출근시간</th>
                        <th id="content">퇴근시간</th>
                    </tr>
                    <c:forEach items="${voList}" var="vo">
                        <tr>
                            <td hidden>${vo.memberNo}</td>
                            <td><fmt:formatDate value="${vo.presenceTime}" pattern="MM-dd"/></td>
                            <td><fmt:formatDate value="${vo.presenceTime}" pattern="yyyy-MM-dd HH:mm"/></td>
                            <td><fmt:formatDate value="${vo.leaveTime}" pattern="yyyy-MM-dd HH:mm"/></td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
            <c:set var="range" value="2" /> 
            <c:set var="startPage" value="${pv.currentPage - range > 0 ? pv.currentPage - range : 1}" />
            <c:set var="endPage" value="${startPage + 4 <= pv.maxPage ? startPage + 4 : pv.maxPage}" />
            <c:set var="startPage" value="${endPage - 4 > 0 ? endPage - 4 : 1}" />

            <div class="number-area">
                <c:if test="${pv.currentPage > 1 }">
                    <a class="pageBtn" onclick="pageMove('${startPage - 1 > 0 ? startPage - 1 : 1}');">‹</a>                </c:if>
                <c:if test="${pv.maxPage > 1 }"> 
                    <c:forEach begin="${startPage}" end="${endPage}" var="i">
                        <a class="pageBtn" class="pageBtn" onclick="pageMove('${i}');">${i}</a>
                    </c:forEach>
                </c:if>
                <c:if test="${pv.currentPage < pv.maxPage }">
                    <a class="pageBtn" onclick="pageMove('${endPage + 1 <= pv.maxPage ? endPage + 1 : pv.maxPage}');">›</a>
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