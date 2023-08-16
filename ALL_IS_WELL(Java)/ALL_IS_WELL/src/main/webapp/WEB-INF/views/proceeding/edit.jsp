<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>회의록상세조회</title>
        <script src="https://kit.fontawesome.com/794ac64f16.js" crossorigin="anonymous"></script>
       <style>
            .main-area {
   				 width: 1200px;
    			height: 1100px;
    			left: 300px;
    			margin-top: 20px;
}

            .title-area {
            	margin-top: 50px;
                text-align: center;
                display: flex;
                flex-direction: row;
                justify-content: space-between;
            }

            #title {
                font-size: 35px;
                margin-left: 20%;
            }

            #sendRequest, #sendBack {
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

            #sendRequest:hover, #sendBack:hover {
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
            	margin-left: 20%;
                margin-top: 20px;
                width: 80%;
                height: 50%;

                background: #FFFFFF;
                border: 1px solid #C4C4C4;
                box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
                border-radius: 20px;
            }

            .list-area table {
                border-collapse: collapse;
                width: 100%;

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
                grid-template-columns: 300px 1220px;
            }
            
            #title-area , #content-area, #date-area {
            	font-size: 30px;
            }
            
            #content2{
				font-size: 30px;
				width: 1198px;
				height: 400px; 
            }
            
            #content-area2{
            	width: 919px;
            	height: 300px;
            	margin-top: -30px;
            	margin-left: 70px;
            	font-size: 30px;
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
    .list-area td , input{
    	font-size: 20px;
    }

    textarea{
        font-size: 20px;
        resize: none;
        border: none;
    }

        </style>
    </head>

    <body>
        <header>
            <%@ include file="/WEB-INF/views/common/member/header.jsp" %>
        </header>


        <div id="content">
            <div id="wrap">
                <%@ include file="/WEB-INF/views/common/member/side-bar.jsp" %>
            </div>


            <div class="main-area">
                <div class="title-area">
                    <span id="title">회의록수정하기</span>

                </div>
                <br>

				<div class="list-area">
			<form action="${root}/proceeding/edit/${vo.no}" method="post" >
                    <table>
					<tr>
                        <td style="width: 200px;">제목</td>
                        <td colspan="2"><input style="width: 800px; height:40px;" type="text" name="title" value="${vo.title}"></td>
                    </tr>
                    <input type="hidden" name="memberNo" value="${vo.memberNo}">
					<tr>
                        <td>작성자</td>
                        <td colspan="2"><input style="width: 800px; height:40px;" type="text" name="name" value="${vo.name}" readonly></td>
                    </tr>
					<tr>
                        <td>작성일</td>
                        <td colspan="2"><input style="width: 800px; height:40px;" type="text" name="enrollDate" value="${vo.enrollDate}" readonly></td>
                    </tr>
					<tr>
                        <td>수정일</td>
                        <td colspan="2"><input style="width: 800px; height:40px;" type="text" name="modifyDate" value="${vo.modifyDate}" readonly></td>
                    </tr>
					<tr>
                        <td>내용</td>
                        <td colspan="2"><textarea style="width: 800px; height:200px;" type="text" name="content">${vo.content}</textarea></td>
                    </tr>

                    </table>
                </div>
					
					
					
					<div id="buttonDiv">
					<button type="submit" id="sendRequest">수정완료</button>
					<button id="sendBack" onclick="backPage();">뒤로가기</button>
					</div>
                </form>
                </div>

            </div>

        </div>

        <footer>
            <%@ include file="/WEB-INF/views/common/member/footer.jsp" %>
        </footer>

        <script>
            function selectAll(selectAll) {
                const checkboxes = document.getElementsByName('choose');

                checkboxes.forEach((checkbox) => {
                    checkbox.checked = selectAll.checked;
                })
            }
            
            function del(no){
            	location.href = "${root}/proceeding/delete/" + no
            }
            const sideBar = document.querySelector("#side-bar")
            const subMenus = document.querySelectorAll(".sub-menu");
            const thirdSidebars = document.querySelectorAll(".third-sidebar");

            subMenus.forEach(subMenu => {
                subMenu.style.height = sideBar.offsetHeight + 'px';
            });

            thirdSidebars.forEach(thirdSidebar => {
                thirdSidebar.style.height = sideBar.offsetHeight + 'px';
            });
            
            function backPage(){
            	location.href = "${root}/proceeding/list";
            }
            
        </script>
    </body>

    </html>