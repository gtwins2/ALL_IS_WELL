<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>회원목록조회</title>
        <script src="https://kit.fontawesome.com/794ac64f16.js" crossorigin="anonymous"></script>
        <style>
            .main-area {
   				 width: 1200px;
    			height: 600px;
    			margin: auto;
    			margin-top: 20px; /* Add this line */
            }

            .title-area {
                text-align: center;
                display: flex;
                flex-direction: row;
                justify-content: space-between;
            }

            #title {
                font-size: 35px;
            }

            #sendRequest {
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

            #sendRequest:hover {
                background-color: #555;
                transition: 0.7s;
            }

            .search-area {
                display: flex;
                align-items: center;
            }



            .search-area input[type="text"] {
                padding: 5px;
                margin-right: 20px;
                width: 300px;
                height: 30px;
                border: 1px solid gray;
                border-radius: 10px;
            }



            .list-area {
                margin-top: 20px;
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

            #delete-button {
                color: #5A8CF2;
                font-weight: bold;
                font-size: 15px;
                margin-left: 2%;
            }

            .list-area {
                margin-top: 20px;

                background: #FFFFFF;
                border: 1px solid #C4C4C4;
                box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
                border-radius: 20px;
            }

            .list-area table {
                border-collapse: collapse;
                width: 100%;


                width: 100%;

            }

            .list-area th,
            .list-area td {
                padding: 20px;
                border-bottom: 1px solid #ddd;
                text-align: left;
            }

            .list-area th {
                font-size: 20px;
                font-weight: normal;

            }

            .list-area th:first-child,
            .list-area td:first-child {
                width: 30px;
            }

            .list-area th:last-child,
            .list-area td:last-child {
                width: 100px;
            }

            .list-area td input[type="checkbox"] {
                margin: 0;
                padding: 0;
            }

            .list-area th:nth-child(3) {
                padding-left: 10%;                
                width: 200px;                
            }
            
            #btn2 {
                padding-left: 10%;
                font-size: 10px;
                color: white;
                background-color: #FF8686;
                width: 70px;
                height: 30px;
                border: none;
                padding: 5px 5px;
                cursor: pointer;
                border-radius: 5px;
                font-weight: bold;
            }

            .list-area th:nth-child(2) {
                padding-left: 10%;
                width: 200px;                
            }

            .list-area th:nth-child(4) {
                padding-left: 10%;
                width: 200px;                
            }
            
            .list-area th:nth-child(5) {
                padding-left: 3%;
                width: 200px;                
            }

            .list-area td:nth-child(3) {
                padding-left: 9.5%;
                width: 200px;                
            }

            .list-area td:nth-child(2) {
                padding-left: 10%;
                width: 200px;                
            }
            
            .list-area th:nth-child(3) {
                padding-left: 9.5%;
                width: 200px;                
            }

            .list-area td:nth-child(4) {
                padding-left: 10%;
                width: 200px;                
            }
            
            .list-area td:nth-child(6) {
                width: 200px;                
                padding-left: 3%;
            }
            
            .list-area td:nth-child(3) {
                padding-left: 10%;
                width: 200px;                
            }
			
			
			.list-area td:nth-child(4) {
                padding-left: 10.5%;
                white-space: nowrap;
			    text-overflow: ellipsis;
			    overflow: hidden;
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

            #previous {
                color: #5A8CF2;
            }

            #after {
                color: #5A8CF2;
            }

            .number-area a:hover {
                color: #5A8CF2;
            }

            .list-area th input[type="checkbox"] {
                appearance: none;
                width: 20px;
                height: 20px;
                border: 2px solid #C4C4C4;
                border-radius: 3px;
                outline: none;
                vertical-align: middle;
                position: relative;
                top: 2px;
                cursor: pointer;
            }

            .list-area td input[type="checkbox"] {
                appearance: none;
                width: 20px;
                height: 20px;
                border: 2px solid #C4C4C4;
                border-radius: 3px;
                outline: none;
                vertical-align: middle;
                position: relative;
                top: 2px;
                cursor: pointer;
            }

            .list-area td input[type="checkbox"]:checked {
                background-color: lightgray;
                border-color: lightgray;
            }

            .list-area th input[type="checkbox"]:checked {
                background-color: lightgray;
                border-color: lightgray;
            }

            #content{
                display: grid;
                grid-template-columns: 300px 1620px;
            }

            .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
            }

            /* Modal Content/Box */
            .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 80%; /* Could be more or less, depending on screen size */
            }

            /* The Close Button */
            .close {
                color: #aaaaaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
                }

            .close:hover,
            .close:focus {
                color: #000;
                text-decoration: none;
                cursor: pointer;
            }

        </style>
    </head>

    <body>
        <header>
            <%@ include file="/WEB-INF/views/common/admin/header.jsp" %>
        </header>


        <div id="content">
            <div id="wrap">
                <%@ include file="/WEB-INF/views/common/admin/side-bar.jsp" %>
            </div>


            <div class="main-area">
                <div class="title-area">
                    <span id="title">직원 정보 조회</span>

                    <form action="" class="search-area">
                        <label for="search" class="category-area">
                            <select name="search" id="search">
                                <option value="title">이름</option>
                                <option value="department">담당부서</option>
                                <option value="position">직급</option>
                                <option value="phoneNumber">전화번호</option>
                                
                            </select>

					

                        </label>
                        <input type="text" id="search-input">
                        <a href="" id="search-icon"><i class="fa-solid fa-magnifying-glass"></i></a>
                        
                    </form>
                   


                </div>
                <br>
                <br>
                <br>
                <br>
                <br>

					
                <div class="list-area">
                    <table>
                        <th><button type="button" class="btnClass" id="btn2">조회</button></th>
                        <th>이름</th>
                        <th>담당부서</th>
                        <th>직급</th>
                        <th>전화번호</th>
                        <th>상태</th>
                        

                        <tr>
                            <th><button type="button" class="btnClass" id="btn2">조회</button></th>
                            <td>심의사</td>
                            <td>흉부외과</td>
                            <td>교수</td>
                            <td>010-0000-0000</td>
                            <td>O</td>
                        </tr>

                        <tr>
                            <th><button type="button" class="btnClass" id="btn2">조회</button></th>                            <td>곽의사</td>
                            <td>신경외과</td>
                            <td>교수</td>
                            <td>010-0000-0000</td>
                            <td>O</td>
                        </tr>

                        <tr>
                            <th><button type="button" class="btnClass" id="btn2">조회</button></th>                            <td>송의사</td>
                            <td>내과</td>
                            <td>교수</td>
                            <td>010-0000-0000</td>
                            <td>O</td>
                        </tr>

                        <tr>
                            <th><button type="button" class="btnClass" id="btn2">조회</button></th>                            <td>이간호</td>
                            <td>산부인과</td>
                            <td>수간호</td>
                            <td>010-0000-0000</td>
                            <td>O</td>
                        </tr>

                        <tr>
                            <th><button type="button" class="btnClass" id="btn2">조회</button></th>                            <td>박간호</td>
                            <td>외과</td>
                            <td>주임</td>
                            <td>010-0000-0000</td>
                            <td>O</td>
                        </tr>

                        <tr>
                            <th><button type="button" class="btnClass" id="btn2">조회</button></th>                            <td>오의사</td>
                            <td>안과</td>
                            <td>펠로우</td>
                            <td>010-0000-0000</td>
                            <td>O</td>
                        </tr>

                        <tr>
                            <th><button type="button" class="btnClass" id="btn2">조회</button></th>                            <td>공의사</td>
                            <td>피부과</td>
                            <td>펠로우</td>
                            <td>010-0000-0000</td>
                            <td>O</td>
                        </tr>

                        <tr>
                            <th><button type="button" class="btnClass" id="btn2">조회</button></th>                            <td>박간호</td>
                            <td>성형외과</td>
                            <td>인턴</td>
                            <td>010-0000-0000</td>
                            <td>O</td>
                        </tr>

                        <tr>
                            <th><button type="button" class="btnClass" id="btn2">조회</button></th>                            <td>심의사</td>
                            <td>흉부외과</td>
                            <td>교수</td>
                            <td>010-0000-0000</td>
                            <td>O</td>
                        </tr>

                        <tr>
                            <th><button type="button" class="btnClass" id="btn2">조회</button></th>                            <td>심의사</td>
                            <td>흉부외과</td>
                            <td>교수</td>
                            <td>010-0000-0000</td>
                            <td>O</td>
                        </tr>




                    </table>
                </div>
                <br>
                <br>
                <br>

                <div class="number-area">
                    <a id="previous" href="">
                        < </a>
                            <a href=""> 1 </a>
                            <a href=""> 2 </a>
                            <a href=""> 3 </a>
                            <a href=""> 4 </a>
                            <a href=""> 5 </a>
                            <a id="after" href=""> > </a>
                </div>
            </div>

            


        </div>

        <div id="myModal" class="modal">
            <div class="modal-content">
              <span class="close">&times;</span>
              <p>
                이름 : 송준섭
                <br>
                직급 : 과장
                <br>
                부서 : 외과
                <br>
                전화번호 : 0100101010
                <br>
                이메일 : asdfa@naver.com
              </p>
            </div>
        </div>

        <footer>
            <%@ include file="/WEB-INF/views/common/admin/footer.jsp" %>
        </footer>

        <script>
            function selectAll(selectAll) {
                const checkboxes = document.getElementsByName('choose');

                checkboxes.forEach((checkbox) => {
                    checkbox.checked = selectAll.checked;
                })
            }

        // Get the modal
        var modal = document.getElementById("myModal");
  
        // Get the button that opens the modal
        // var btn = document.querySelector("#btn2");
        var btns = document.querySelectorAll(".btnClass");
  
  
        // Get the <span> element that closes the modal
        
  
        // When the user clicks on the button, open the modal
        for(i=0; i<13; i++){

            var span = document.getElementsByClassName("close")[0];

            btns[i].onclick = function () {
              modal.style.display = "block";
            }

            span.onclick = function() {
            modal.style.display = "none";

            window.onclick = function(event) {
          if (event.target == modal) {
            modal.style.display = "none";
          }
        }

        }


        }
        </script>
    </body>

    </html>