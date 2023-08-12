<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>당직조회 및 수정</title>
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
                 margin-left: 230px;
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
                margin-left: 230px;
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

            #content{
                display: grid;
                grid-template-columns: 300px 1620px;
            }
            
            		tr:nth-child(even) {
        background-color: #f2f2f2;
    }

    td {
        text-align: center;
        padding: 8px;
    }

    th {
        border-right: 0.5px solid #d9d9d9;
        border-bottom: 1px solid black;
        padding: 8px;
        font-weight: bold;
        text-align: center;
        background-color: #F5F5F5;
    }
   
    td > input {
    	border: none;
    }

    #buttonDiv {
        margin-top: 40px;
        margin-bottom: 40px;
        text-align: right;
    }
    .list-area{
    	width: 1000px;
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
                    <span id="title">당직조회 및 수정</span>
                </div>
                <br>

            <div class="list-area">
            <form action="${root}/duty/edit/${vo.no}" method="post" >
                    <table>
					<tr>
                        <td style="width: 250px;">당직번호</td>
                        <td colspan="2"><input style="width: 800px; height:40px;" type="text" name="no" value="${vo.no}" readonly></td>
                    </tr>
					<tr>
                        <td>당직자번호</td>
                        <td colspan="2"><input style="width: 800px; height:40px;" type="text" name="mno" value="${vo.mno}"></td>
                    </tr>
					<tr>
                        <td>당직자이름</td>
                        <td colspan="2"><input style="width: 800px; height:40px;" type="text" name="mname" value="${vo.mname}"></td>
                    </tr>
					<tr>
                        <td>당직예정일</td>
                        <td colspan="2"><input style="width: 800px; height:40px;" type="text" name="dutyDay" value="${vo.start}"></td>
                    </tr>

                    </table>
                </div>
					
					<div id="buttonDiv">
					<button id="sendRequest" onclick="del(${vo.no});">삭제하기</button>
					<button id="sendRequest" onclick="edit(${vo.no});">수정하기</button>
					<button id="sendBack" onclick="backPage();">뒤로가기</button>
					</div>
                
                </form>
                </div>
                </main>

        <footer>
            <%@ include file="/WEB-INF/views/common/admin/footer.jsp" %>
        </footer>

        <script>
            
            function edit(){
            	alert("당직 수정 요청이 완료되었습니다.");
            	location.href = "${root}/duty/select"
            }
            
            function backPage(){
            	location.href = "${root}/duty/select"
            }
            
        </script>
    </body>

    </html>