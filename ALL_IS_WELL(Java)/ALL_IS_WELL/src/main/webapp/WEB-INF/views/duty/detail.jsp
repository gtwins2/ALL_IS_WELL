<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>당직상세조회</title>
        <script src="https://kit.fontawesome.com/794ac64f16.js" crossorigin="anonymous"></script>
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
		        margin-left: 100px;
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

            #sendRequest, #sendBack {
                font-size: 20px;
                color: white;
                background-color: #FF8686;
                size: 10px;
                border: none;
                padding: 10px 15px;
                cursor: pointer;
                border-radius: 5px;
                font-weight: bold;
            }

            #sendRequest:hover, #sendBack:hover {
                background-color: #555;
                transition: 0.7s;
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


        /*     .list-area td input[type="checkbox"] {
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
            } */

            #content{
                display: grid;
                grid-template-columns: 300px 1620px;
            }

			input{
			border: none;
			}
			input:hover{
			background-color: lightgray;
			}
        </style>
    </head>

    <body>
        <header>
            <%@ include file="/WEB-INF/views/common/admin/header.jsp" %>
        </header>


            <main id="wrap">
            <header>
                <%@ include file="/WEB-INF/views/common/admin/side-bar.jsp" %>
            </header>


            <div class="main-area">
               <div class="title-area">
                    <span id="title">당직상세조회</span>
                </div>
                <br>

            <div class="list-area">
            <form action="${root}/duty/edit/${vo.no}" method="post" >
                    <table>
                    <tr>
                       <th>당직번호</th>
                       <th>당직자번호</th>
                       <th>당직자이름</th>
                       <th>당직예정일</th>
                    </tr>
                    <tr>
                  <input type="hidden" value=${loginMember.no}>
                  <td><input type="text" id="title-area" name="no" value="${vo.no}" readonly></td>
                  <td><input type="text" id="title-area" name="mno" value="${vo.mno}"></td>
                  <td><input type="text" id="title-area" name="mname" value="${vo.mname}"></td>
                  <td><input type="text" id="title-area" name="dutyDay" value="${vo.start}"></td>
               </tr>
                    </table>
                </div>
               
               <button  onclick="edit();" type="submit" id="sendRequest">수정하기</button>
               <button id="sendBack" type="button" onclick="backPage();">뒤로가기</button>
               
                
                </form>
                </div>
                </main>

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
            
            function del(no){
            	location.href = "${root}/duty/delete/" + no
            }
            
            function edit(){
            	alert("당직 수정 요청이 완료되었습니다.");
            }
            
        </script>
    </body>

    </html>