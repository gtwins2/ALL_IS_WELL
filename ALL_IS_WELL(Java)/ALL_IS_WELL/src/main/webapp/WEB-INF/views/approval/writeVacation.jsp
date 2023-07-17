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
      height: 1500px;
      display: grid;
      grid-template-columns: 300px 1620px;
   }

   .main-area {
        width: 1200px;
        height: 85%;
        margin: auto;
        margin-top: 100px;
    }

    #listBtnDiv{
        text-align: right;
        padding-right: 10%;
        padding-top: 50px;
        padding-bottom: 50px;
    }

    #listBtn{
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

    #listBtn:hover{
        background-color: #555;
        transition: 0.7s;
    }

    #vacation-application{
        width: 80%;
        height: 77%;
        border: 1px solid black;
        margin: auto;
    }

    #title{
        padding-top: 50px;
        text-align: center;
        font-size: 36px;
    }

    #contain-top{
        display: grid;
        grid-template-columns: 1fr 1fr;
        margin-top: 150px;
    }

    #info{
        border-collapse: collapse;
        width: 300px;
        height: 200px;
        font-size: 20px;
        margin-left: 100px;
        text-align: center;
    }

    #approval{
        border-collapse: collapse;
        text-align: center;
        width: 600px;
        height: 300px;
    }

    #approval tr th{
        font-size: 25px;
    }

    #approval-title{
        width: 185px;
        height: 40px;
    }

    #stamp{
        border-bottom: none;
    }

    #stamp td{
        height: 180px;
    }

    #reasonDiv{
        margin: auto;
        margin-top: 50px;
        width: 1000px;
        height: 500px;

        border: 1px solid black;

        display: grid;
        grid-template-columns: 2fr 9fr;
        grid-template-rows: 1fr 9fr;
    }

    #reasonDiv div:not(:nth-child(2), :nth-child(4)){
        box-sizing: border-box;
        display: flex;
        justify-content: center;
        align-items: center;
        text-align: center;
        font-size: 25px;
        font-weight: bold;
    }

    .top, .top-side{
        border-bottom: 1px solid black;
    }

    .top, .bottom{
        border-right: 1px solid black;
    }

    #buttonDiv{
        text-align: right;
        margin-right: 180px;
        margin-top: 80px;
    }

    #approvalBtn{
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

    #approvalBtn:hover{
        background-color: #555;
        transition: 0.7s;
    }

    #refuseBtn{
        width: 100px;
        font-size: 20px;
        color: black;
        background-color: #C8C8C8;
        size: 10px;
        border: none;
        padding: 10px 15px;
        cursor: pointer;
        border-radius: 5px;
        font-weight: bold;
    }

    #refuseBtn:hover{
        background-color: black;
        color: white;
        transition: 0.7s;
    }

    .jw-modal {
        display: none;
        position: fixed;
        z-index: 1;
        padding-top: 100px;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgba(0, 0, 0, 0.4);
    }

    .modal-content {
        background-color: #fefefe;
        margin: auto;
        padding: 20px;
        border: 1px solid #888;
        width: 50%;
        display: flex;
        flex-direction: column;
    }

    #modalContent {
        width: 100%;
        height: 400px;
        border: 1px solid #ccc;
        padding: 8px;
        margin-bottom: 20px;
    }

    .button-container {
        display: flex;
        justify-content: flex-end;
    }

    #submitBtn{
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
        margin-right: 10px;
    }

    #submitBtn:hover{
        background-color: #555;
        transition: 0.7s;
    }

    #cancelBtn{
        width: 100px;
        font-size: 20px;
        color: black;
        background-color: #C8C8C8;
        size: 10px;
        border: none;
        padding: 10px 15px;
        cursor: pointer;
        border-radius: 5px;
        font-weight: bold;
    }

    #cancelBtn:hover{
        background-color: black;
        color: white;
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
                <button id="listBtn">목록</button>
            </div>
            <div id="vacation-application">
                <div id="title">휴가신청서</div>
                <div id="contain-top">
                    <div id="document-info">
                        <table border="1" id="info">
                            <tr>
                                <th>문서번호</th>
                                <td>150</td>
                            </tr>
                            <tr>
                                <th>작성일자</th>
                                <td>2023-07-05(월)</td>
                            </tr>
                            <tr>
                                <th>소속부서</th>
                                <td>임상병리학과</td>
                            </tr>
                            <tr>
                                <th>작 성 자</th>
                                <td>김간호</td>
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
                                <td ></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr id="name">
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr id="date">
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div id="reasonDiv">
                    <div class="top">휴가기간</div>
                    <div class="top-side">
                        <input type="date" style="font-size: 25px; margin-left: 10px; margin-top: 5px;" id="start-date">
                        ~~
                        <input type="date" style="font-size: 25px;" id="end-date">
                    </div>
                    <div class="bottom">사유</div>
                    <div class="bottom-side">
                        <textarea style="width: 98%; height: 98%; font-size: 25px; resize: none; border: none; text-align: left;"></textarea>
                    </div>
                </div>
            </div>
            <div id="buttonDiv">
                <button id="approvalBtn">작성</button>
            </div>
        </div>
    </main>
    <footer>
        <%@ include file="/WEB-INF/views/common/member/footer.jsp" %>
    </footer>

    <script>
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

        const listBtn = document.querySelector("#listBtn");

        listBtn.addEventListener("click", function(){
            window.location.href = "/app/approval/draft_list";
        });

    </script>

</body>
</html>

