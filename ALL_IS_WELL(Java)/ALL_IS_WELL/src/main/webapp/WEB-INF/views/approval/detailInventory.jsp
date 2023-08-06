<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    #wrap {
        width: 1920px;
        display: grid;
        grid-template-columns: 150px 1770px;
    }

    main {
        min-height: 100%;
    }

    .main-area {
        width: 80%;
        min-height: 100%;
        margin: auto;
    }

    #listBtnDiv {
        text-align: right;
        padding-right: 10%;
        padding-top: 40px;
        padding-bottom: 40px;
    }

    #listBtn {
        width: 60px;
        font-size: 15px;
        color: white;
        background-color: #5A8CF2;
        size: 10px;
        border: none;
        padding: 10px 15px;
        cursor: pointer;
        border-radius: 5px;
        font-weight: bold;
    }

    #listBtn:hover {
        background-color: #555;
        transition: 0.7s;
    }

    #vacation-application {
        width: 80%;
        border: 1px solid black;
        margin: auto;
        margin-bottom: 50px;
    }

    #title {
        padding-top: 50px;
        text-align: center;
        font-size: 20px;
    }

    #contain-top {
        display: grid;
        grid-template-columns: 1fr 1fr;
        margin-top: 50px;
    }

    #info {
        border-collapse: collapse;
        width: 250px;
        height: 150px;
        font-size: 15px;
        margin-left: 150px;
        text-align: center;
    }

    #approval {
        border-collapse: collapse;
        text-align: center;
        width: 550px;
        height: 250px;
    }

    #approval tr th:first-child{
        width: 40px;
    }

    #approval tr th {
        font-size: 15px;
    }

    #approval-title {
        width: 185px;
        height: 40px;
    }

    #stamp {
        border-bottom: none;
    }

    #stamp td {
        height: 140px;
    }

    #inventory-div{
        margin-top: 100px;
        margin-bottom: 50px;
    }

    #inventory-table{
        border-collapse: collapse;
        font-size: 15px;
        margin: auto;
        width: 90%;
    }

    #inventory-table th:first-child{
        width: 80px;
    }

    #inventory-table tr th:first-child, td:first-child{
        height: 30px;
        text-align: center;
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
        <div id="main-area">
            <div id="listBtnDiv">
                <button id="listBtn" onclick="back();">목록</button>
            </div>
            <div id="vacation-application">
                <div id="title">재고신청서</div>
                <div id="contain-top">
                    <div id="document-info">
                        <table border="1" id="info">
                            <tr>
                                <th>문서번호</th>
                                <td>${ivo.no}</td>
                            </tr>
                            <tr>
                                <th>작성일자</th>
                                <td>${ivo.createDate}</td>
                            </tr>
                            <tr>
                                <th>소속부서</th>
                                <td>${ivo.departmentName}</td>
                            </tr>
                            <tr>
                                <th>작 성 자</th>
                                <td>${ivo.memberName}</td>
                            </tr>
                        </table>
                    </div>
                    <div id="approval-column">
                        <table border="1" id="approval">
                            <tr>
                                <th rowspan="4">결재</th>
                                <th id="approval-title">담당</th>
                                <th id="approval-title">중간 결재자</th>
                                <th id="approval-title">최종 결재자</th>
                            </tr>
                            <tr id="stamp">
                                <td>${ivo.sign}</td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr id="name">
                                <td>${ivo.createDate}</td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr id="date">
                                <td>${ivo.memberName}(${ivo.departmentName})</td>
                                <td></td>
                                <td></td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div id="inventory-div">
                    <table border="1" id="inventory-table">
                        <tr>
                            <th>품목명</th>
                            <th>개수</th>
                        </tr>
                        <c:forEach items="${voList}" var="vo">
                            <tr>
                                <td>${vo.itemName}</td>
                                <td>${vo.count}</td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
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

        function back(){
            window.location.href = "${root}/approval/draftList";
        }
    </script>

</body>
</html>


