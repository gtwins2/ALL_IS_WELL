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
        min-height: 90%;
        margin: auto;
        position: relative;
    }

    #listBtnDiv {
        text-align: right;
        padding-right: 10%;
        padding-top: 40px;
        padding-bottom: 40px;
    }

    #listBtn {
        width: 80px;
        font-size: 20px;
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
        height: 82%;
        border: 1px solid black;
        margin: auto;
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
        margin-left: 100px;
        text-align: center;
        display: none;
    }

    #info th{
        width: 100px;
    }

    #approval {
        border-collapse: collapse;
        text-align: center;
        width: 550px;
        height: 250px;
        display: none;
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
        height: 130px;
    }

    #date, #name{
        height: 30px
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
        font-size: 20px;
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
        align-items: center;
    }

    #start-date, #end-date {
        font-size: 25px;
        margin-left: 10px;
    }
    
    #buttonDiv{
        text-align: right; 
        margin-bottom: 50px;
        margin-right: 150px;
    }

    #approvalBtn {
        width: 100px;
        font-size: 20px;
        color: white;
        background-color: #5A8CF2;
        size: 10px;
        border: none;
        padding: 10px 15px;
        cursor: pointer;
        border-radius: 5px;
        font-weight: bold;
    }

    #approvalBtn:hover {
        background-color: #555;
        transition: 0.7s;
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
                <div id="title">출장신청서</div>
                <div id="contain-top">
                    <div id="document-info">
                        <table border="1" id="info">
                            <tr>
                                <th>문서번호</th>
                                <td></td>
                            </tr>
                            <tr>
                                <th>소속부서</th>
                                <td></td>
                            </tr>
                            <tr>
                                <th>작 성 자</th>
                                <td></td>
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
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr id="date">
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr id="name">
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                        </table>
                    </div>
                </div>
                <form action="${root}/approval/writeTripData" method="post">
                    <div id="reasonDiv">
                        <div class="top">출장기간</div>
                        <div class="top-side">
                            <input type="date" style="font-size: 25px; margin-left: 10px; margin-top: 5px;" id="start-date" name="startDate">
                            ~~
                            <input type="date" style="font-size: 25px;" id="end-date" name="endDate">
                        </div>
                        <div class="bottom">사유</div>
                        <div class="bottom-side">
                            <textarea style="width: 98%; height: 98%; font-size: 25px; resize: none; border: none; text-align: left;" name="content"></textarea>
                        </div>
                    </div>
                    <div id="buttonDiv">
                        <button id="approvalBtn" type="submit">작성</button>
                    </div>
                </form>
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

        const startDate = document.querySelector("#start-date");
        const endDate = document.querySelector("#end-date");
        const approvalBtn = document.querySelector("#approvalBtn");

        // 오늘 날짜로 min 속성 설정
        const currentDate = new Date().toISOString().substr(0, 10);
        startDate.min = currentDate;

        // start-date 값 변경시 end-date의 min 속성 갱신
        startDate.addEventListener("change", function() {
            endDate.min = startDate.value;
        });

        approvalBtn.addEventListener("click", function() {
            validateDates();
        });

        function back(){
            window.location.href = "${root}/approval/draftList";
        }

    </script>

</body>
</html>


