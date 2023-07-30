<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
        font-size: 20px;
    }

    #contain-top{
        display: grid;
        grid-template-columns: 1fr 1fr;
        margin-top: 150px;
    }

    #buttonDiv{
        text-align: right;
        margin-top: 50px;
        margin-right: 75px;
    }

    #approvalBtn{
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

    #approvalBtn:hover{
        background-color: #555;
        transition: 0.7s;
    }

    #inventory-div{
        margin-top: 100px;
        height: 600px;
    }

    #inventory-table{
        border-collapse: collapse;
        font-size: 20px;
        margin: auto;
        width: 90%;
        height: 70%;
    }

    #inventory-table th:first-child{
        width: 80px;
    }

    input[type=number]{
        height: 20px;
    }

    .add-btn {
        background-color: #C8C8C8;
        border: none;
        color: white;
        text-align: right;
        text-decoration: none;
        display: inline-block;
        font-size: 14px;
        margin: 0px 2px;
        cursor:pointer;
        border-radius: 4px;
        padding: 4px 8px;
    }

    .add-btn:hover{
        background-color: #909090;
        transition: 0.7ss;
    }

    .subtract-btn {
        background-color: #C8C8C8;
        border: none;
        color: white;
        text-align: right;
        text-decoration: none;
        display: inline-block;
        font-size: 14px;
        margin: 0px 2px;
        cursor:pointer;
        border-radius: 4px;
        padding: 4px 8px;
    }

    .subtract-btn:hover{
        background-color: #909090;
        transition: 0.7ss;
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
                <div id="title">재고신청서</div>
                <form id="inventory-form" method="post">
                    <div id="inventory-div">
                        <table border="1" id="inventory-table">
                            <tr>
                                <th>품목명</th>
                                <th>개수</th>
                            </tr>
                            <c:forEach items="${iList}" var="i">
                                <tr>
                                    <td style="text-align: center; position: relative;">
                                        <div class="item-data">
                                            ${i.itemName}
                                        </div>
                                    </td>
                                    <td style="text-align: left; padding-left: 10px;">
                                        <input type="number" name="inventoryCountArr[]" style="display: none;">
                                        <div class="add-btn" onclick="enableInput(this, '${i.categoryNo}')">+</div>
                                        <div class="subtract-btn" onclick="disableInput(this, '${i.categoryNo}')" style="display: none;">-</div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                        <div id="buttonDiv">
                            <button type="submit" id="approvalBtn">작성</button>
                        </div>
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

        let categoryNoArr = [];
        let numberTagArr = [];

        function enableInput(button, categoryNo) {
            const tdElement = button.parentElement;
            const inputElement = tdElement.querySelector('input[type="number"]');
            const subtractBtnElement = tdElement.querySelector('.subtract-btn');

            categoryNoArr.push(categoryNo);
            numberTagArr.push(inputElement);
            
            inputElement.style.display='inline-block';
            button.style.display = 'none';
            subtractBtnElement.style.display = 'inline-block';
        }

        function disableInput(button, categoryNo) {
            const tdElement = button.parentElement;
            const addButtonElement = tdElement.querySelector(".add-btn");
            const inputElement = tdElement.querySelector('input[type="number"]');

            categoryNoArr.pop(categoryNo);
            numberTagArr.pop(inputElement);

            inputElement.value = "";
            inputElement.style.display = 'none';
            button.style.display = "none";
            addButtonElement.style.display = "inline";
        }

        

        const listBtn = document.querySelector("#listBtn");

        listBtn.addEventListener("click", function(){
            window.location.href = "/app/approval/draftLlist";
        });

        $("#inventory-form").submit(function(e) {
            e.preventDefault();

            let countArr = [];
            for (const tag of numberTagArr) {
                countArr.push(tag.value);
            }

            $.ajax({
                type: "POST",
                url: "${root}/approval/writeInventory",
                data: {"categoryNoArr":categoryNoArr, "countArr":countArr},
                success: function(response) {
                console.log("Success:", response);
                    window.location.href = "/app/approval/draftList"
                },
                error: function() {
                console.error("Ajax 오류");
                }
            });
        });
    </script>

</body>
</html>


