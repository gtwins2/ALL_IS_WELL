<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
        padding-top: 20px;
        padding-bottom: 20px;
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

    #info th{
        width: 100px;
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
        width: 75%;
    }

    #inventory-table th:first-child{
        width: 80px;
    }

    #inventory-table tr th:first-child, td:first-child{
        height: 30px;
        text-align: center;
    }

    #buttonDiv{
        text-align: right;
        margin-right: 180px;
        margin-bottom: 50px;
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

    #modalContent, #approvalModalContent {
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

    #submitBtn, #approvalSubmitBtn{
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

    #submitBtn:hover, #approvalSubmitBtn:hover{
        background-color: #555;
        transition: 0.7s;
    }

    #cancelBtn, #approvalCancelBtn{
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

    #cancelBtn:hover, #approvalCancelBtn:hover{
        background-color: black;
        color: white;
        transition: 0.7s;
    }
    
    .rejected {
      font-size: 1.5em; 
      font-weight: bold; 
      color: red;
    }

    .approved {
        font-size: 1.5em; 
        font-weight: bold;
        color: blue;
    }

    .rejected {
        font-size: 1.5em; 
        font-weight: bold;
        color: red;
    }

</style>
</head>
<body>
   
   <header>
      <%@include file="/WEB-INF/views/common/admin/header.jsp" %>
   </header>
   
   <main id="wrap">
        <div>
            <%@ include file="/WEB-INF/views/common/admin/side-bar.jsp" %>
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
                                <td>${avo.no}</td>
                            </tr>
                            <tr>
                                <th>작성일자</th>
                                <td>${avo.createDate}</td>
                            </tr>
                            <tr>
                                <th>소속부서</th>
                                <td>${avo.departmentName}</td>
                            </tr>
                            <tr>
                                <th>작 성 자</th>
                                <td>${avo.memberName}</td>
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
                                <td>${avo.sign}</td>
                                <td>
                                    ${avo.approverSign}
                                </td>
                                <td class="${avo.status == 'A' ? 'approved' : (avo.status == 'O' ? 'rejected' : '')}">
                                    <c:if test="${avo.status == 'A'}">
                                        승 인
                                    </c:if>
                                    <c:if test="${avo.status == 'O'}">
                                        <span class="rejected">반 려</span>
                                        <br>
                                        <br>
                                        <span id="reason">
                                            ${avo.reason}
                                        </span>
                                    </c:if>
                                </td>
                            </tr>
                            <tr id="name">
                                <td><fmt:formatDate value="${avo.createDate}" pattern="yyyy-MM-dd HH시" /></td>
                                <td><fmt:formatDate value="${avo.approvalDate}" pattern="yyyy-MM-dd HH시" /></td>
                                <td><fmt:formatDate value="${avo.completeDate}" pattern="yyyy-MM-dd HH시" /></td>
                            </tr>
                            <tr id="date">
                                <td>${avo.memberName}(${avo.departmentName})</td>
                                <td>${avo.approverName}(${avo.approverDepartmentName})</td>
                                <td>
                                    <c:if test="${avo.status == 'A' || avo.status == 'O'}">
                                        송세경
                                    </c:if>
                                </td>
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
            <c:if test="${avo.status == 'F'}">
                <div id="buttonDiv">
                    <button id="approvalBtn">승인</button>
                    <button id="refuseBtn">반려</button>
                </div>
            </c:if>
            <div id="myModal" class="jw-modal">
                <div class="modal-content">
                    <div style="font-size: 35px; font-weight: bold;">반려</div>
                    <div contenteditable="true" id="modalContent"></div>
                    <div class="button-container">
                        <button id="submitBtn">작성</button>
                        <button id="cancelBtn">취소</button>
                    </div>
                </div>
            </div>
            <div id="approvalMyModal" class="jw-modal">
                <div class="modal-content">
                    <div style="font-size: 35px; font-weight: bold;">승인</div>
                    <div contenteditable="true" id="approvalModalContent"></div>
                    <div class="button-container">
                        <button id="approvalSubmitBtn">작성</button>
                        <button id="approvalCancelBtn">취소</button>
                    </div>
                </div>
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

        function back(){
            location.href = "${root}/approval/admin/list";
        }

        // 버튼과 모달 요소 선택하기
        const approvalBtn = document.getElementById("approvalBtn");
        const refuseBtn = document.getElementById("refuseBtn");
        const myModal = document.getElementById("myModal");
        const submitBtn = document.getElementById("submitBtn");
        const cancelBtn = document.getElementById("cancelBtn");
        const approvalSubmitBtn = document.getElementById("approvalSubmitBtn");
        const approvalCancelBtn = document.getElementById("approvalCancelBtn");

        // 버튼 클릭 시 모달 열기
        refuseBtn.addEventListener("click", () => {
            myModal.style.display = "block";
        });

        // 취소 버튼 클릭 시 모달 닫기
        cancelBtn.addEventListener("click", () => {
            myModal.style.display = "none";
        });

        // 모달 바깥쪽 클릭 시 모달 닫기
        window.onclick = (event) => {
            if (event.target === myModal) {
                myModal.style.display = "none";
            }
        };

        //반려 시 작동
        document.querySelector("#submitBtn").addEventListener('click', function(){
            let documentNo = document.querySelector("#info tr:nth-child(1) td").innerText;
            let modalContent = document.getElementById("modalContent").innerText;

            $.ajax({
                type : 'post',
                url : '${root}/approval/admin/refuse',
                data : {
                    no : documentNo,
                    reason : modalContent
                },
                success : function(){
                    console.log(documentNo)
                    console.log(modalContent)
                    location.href = "/app/approval/admin/list";
                },
                error : function(error){
                    console.log("error", error);
                }
            })
        });

        //승인 시 작동
        document.querySelector("#approvalBtn").addEventListener('click', function (){
            let documentNo = document.querySelector("#info tr:nth-child(1) td").innerText;

            $.ajax({
                type : 'post',
                url : '${root}/approval/admin/approval',
                data : {
                    no : documentNo,
                },
                success : function(){
                    console.log(documentNo)
                    location.href = "/app/approval/admin/list";
                },
                error : function(error){
                    console.log("error", error);
                }
            })
        })

    </script>

</body>
</html>


