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
        height: 900px;
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

    #reasonDiv {
        margin: auto;
        margin-top: 40px;
        margin-bottom: 40px;
        width: 80%;
        height: 400px;

        border: 1px solid black;

        display: grid;
        grid-template-columns: 2fr 9fr;
        grid-template-rows: 1fr 9fr;
    }

    #reasonDiv div:not(:nth-child(2), :nth-child(4)) {
        box-sizing: border-box;
        display: flex;
        justify-content: center;
        align-items: center;
        text-align: center;
        font-size: 15px;
        font-weight: bold;
    }

    .top, .top-side {
        border-bottom: 1px solid black;
        height: 80px;
    }

    .top, .bottom {
        border-right: 1px solid black;
    }

    .top-side {
        display: flex;
    }
    
    .top-side div{
        margin-left: 20px;
    }

    .bottom-side{
        display: flex;
    }

    .bottom-side div{
        margin-left: 20px;
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
                <div id="title">휴가신청서</div>
                <div id="contain-top">
                    <div id="document-info">
                        <table border="1" id="info">
                            <tr>
                                <th>문서번호</th>
                                <td>${vvo.no}</td>
                            </tr>
                            <tr>
                                <th>작성일자</th>
                                <td><fmt:formatDate value="${vvo.createDate}" pattern="yyyy-MM-dd"/></td>
                            </tr>
                            <tr>
                                <th>소속부서</th>
                                <td>${vvo.departmentName}</td>
                            </tr>
                            <tr>
                                <th>작 성 자</th>
                                <td>${vvo.memberName}</td>
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
                                <td><img src="/app/resources/static/img/logo/${vvo.sign}" style="width: 100%; height: 100%;"></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr id="name">
                                <td>${vvo.createDate}</td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr id="date">
                                <td>${vvo.memberName}(${vvo.departmentName})</td>
                                <td></td>
                                <td></td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div id="reasonDiv">
                    <div class="top">휴가기간</div>
                    <div class="top-side">
                        <div>
                            <fmt:formatDate value="${vvo.startDate}" pattern="yyyy-MM-dd"/>
                              ~   
                            <fmt:formatDate value="${vvo.endDate}" pattern="yyyy-MM-dd"/>
                        </div>
                    </div>
                    <div class="bottom">사유</div>
                    <div class="bottom-side">
                        <div>
                            ${vvo.content}
                        </div>
                    </div>
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
            location.href = "${root}/approval/draftList";
        }
   </script>
</body>
</html>

