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

    .title-area {
        text-align: center;
        display: flex;
        flex-direction: row;
        justify-content: space-between;
        margin-top: 40px;
        margin-bottom: 40px;
    }

    #title {
        font-size: 20px;
    }

    #writeBtn{
        text-align: right;
        margin-top: 20px;
        margin-right: 10px;
        display: flex;
    }

    #writeBtn form{
        flex-direction: column;
        margin-right: 10px;
        align-items: center;
        justify-content: center;
    }

    #writeApproval {
        font-size: 15px;
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
        width: 600px;
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

    .list-area {
        background: #FFFFFF;
        border: 1px solid #C4C4C4;
        box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
        border-radius: 20px;
    }

    .list-area table {
        border-collapse: collapse;
        width: 100%;
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

    #writer{
        width: 20%;
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

    #statusBtn{
        box-sizing: border-box;
        width: 60px;
        height: 30px;
        border-radius: 20px;
        background-color: #A7A7A7;
        color: white;
    }
    
    #list-area table tbody tr:hover{
        background-color: #F0F0F0;
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
                        <select name="search" id="search">
                            <option value="writer">문서종류</option>
                            <option value="title">제목</option>
                        </select>
                    </label>
                    <input type="text" id="search-input">
                    <a href="" id="search-icon"><i class="fa-solid fa-magnifying-glass"></i></a>
                </form>

                <div id="writeBtn">
                    <form action="/app/approval/writeVacation" method="get" >
                        <button id="writeApproval" type="submit">휴가작성</button>
                    </form>
                    <form action="/app/approval/writeTrip" method="get">
                        <button id="writeApproval" type="submit">출장작성</button>
                    </form>
                    <c:if test="${loginMember.positionType eq 'N'}">
                        <form action="/app/approval/writeInventory" method="get">
                            <button id="writeApproval" type="submit">재고신청</button>
                        </form>
                    </c:if>
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
                            <tr onclick="detail();">
                                <td id="approvalNo" >${vo.no}</td>
                                <td>${vo.memberName}</td>
                                <td id="approvalTitle">${vo.title}</td>
                                <td><fmt:formatDate value="${vo.createDate}" pattern="yyyy-MM-dd"/></td>
                                <td>
                                    <button id="statusBtn" class="statusBtn" disabled>${vo.status}</button>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>

            <c:set var="range" value="2" /> 
            <c:set var="startPage" value="${pv.currentPage - range > 0 ? pv.currentPage - range : 1}" />
            <c:set var="endPage" value="${startPage + 4 <= pv.maxPage ? startPage + 4 : pv.maxPage}" />
            <c:set var="startPage" value="${endPage - 4 > 0 ? endPage - 4 : 1}" />

            <div class="number-area">
                <c:if test="${pv.currentPage > 1 }">
                    <a class="pageBtn" onclick="pageMove('${startPage - 1 > 0 ? startPage - 1 : 1}');">‹</a>
                </c:if>
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

        function detail() {
            const no = event.target.parentElement.querySelector("#approvalNo").innerText;
            const title = event.target.parentElement.querySelector("#approvalTitle").innerText;
            const status = event.target.parentElement.querySelector(".statusBtn").innerText;

            if(status ==="대기"){
                if (title === "출장문서") {
                    location.href = "${root}/approval/detailTrip?no=" + no;
                } else if (title === "휴가문서") {
                    location.href = "${root}/approval/detailVacation?no=" + no;
                } else if (title === "재고신청문서") {
                    location.href = "${root}/approval/detailInventory?no=" + no;
                }
            }
            else if(status === "1차 승인" || status === "반려"){
                if (title === "출장문서") {
                    location.href = "${root}/approval/trip?no=" + no;
                } else if (title === "휴가문서") {
                    location.href = "${root}/approval/vacation?no=" + no;
                } else if (title === "재고신청문서") {
                    location.href = "${root}/approval/inventory?no=" + no;
                }
            }
            else if(status === "A" || status === "O"){
                if (title === "출장문서") {
                    location.href = "${root}/approval/admin/trip?no=" + no;
                } else if (title === "휴가문서") {
                    location.href = "${root}/approval/admin/vacation?no=" + no;
                } else if (title === "재고신청문서") {
                    location.href = "${root}/approval/admin/inventory?no=" + no;
                } 
            }
        };
    
        document.addEventListener("DOMContentLoaded", function () {
            const statusBtns = document.querySelectorAll(".statusBtn");

            statusBtns.forEach(function (statusBtn) {
                const status = statusBtn.textContent;
                if (status === "A") {
                    statusBtn.innerHTML = "승인";
                    statusBtn.style.backgroundColor = "#119F30";
                } else if (status === "R") {
                    statusBtn.innerHTML = "반려";
                    statusBtn.style.backgroundColor = "#EC3C3C";
                } else if (status === "O") {
                    statusBtn.innerHTML = " 반려 ";
                    statusBtn.style.backgroundColor = "#EC3C3C";
                }
                 else if (status === "W") {
                    statusBtn.innerHTML = "대기";
                    statusBtn.style.backgroundColor = "#A7A7A7";
                } else if (status === "F") {
                    statusBtn.innerHTML = "1차 승인";
                    statusBtn.style.backgroundColor = "#DECD37";
                }
            });
        });
    </script>
</body>
</html>