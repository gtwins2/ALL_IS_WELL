 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>재고 수정</title>
        <script src="https://kit.fontawesome.com/794ac64f16.js" crossorigin="anonymous"></script>
        <style>
            .main-area {
   				 width: 1200px;
    			height: 1100px;
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
				height: 500px; 
            }
            
            #content-area2{
            	width: 700px;
            	height: 50px;
            	margin-top: -30px;
            	margin-left: 70px;
            }
            div > textarea{
            	margin-left: 100px;
            }
            
            label {
			  font-family: sans-serif;
			  font-size: 30px;
			  padding-right: 10px;
			}
			
			select {
		 	  margin-left: 95px;
			  font-size: 30px;
			  padding: 2px 5px;
			}
			
			#content-area2{
				margin-left: 155px;
			}
			
			#put2{
				margin-left: 40px;
				height: 40px;
			}

			#put{
				margin-left: 100px;
				height: 40px;
			}

        </style>
    </head>

    <body>
        <header>
            <%@ include file="/WEB-INF/views/common/admin/header.jsp" %>
        </header>




			<%-- <c:forEach items="${voList}" var="vo">
				<tr>
					<td></td>
					<td>${vo.itemName}</td>
					<td>${vo.count}</td>
					<td>${vo.approvalDate}</td>
				</tr>
			</c:forEach> --%>

	
	

	
        <main id="content">
            <div id="wrap">
                <%@ include file="/WEB-INF/views/common/admin/side-bar.jsp" %>
            </div>


            <div class="main-area">
                <div class="title-area">
                    <span id="title">재고 입고</span>

                </div>
                <br>
                <br>
                <br>
                <br>
                <br>
				<form action="${root}/inventory/insert" method="post">
					
				<div class="list-area">
                    <table>

					<br>
					<br>
					<input type="hidden" value=${loginMember.no} >
					
					<label for="item-select">종류</label>
						<select	name="categoryNo">
							<c:forEach items="${voList}" var="vo">
							<option value="${vo.categoryNo}">${vo.itemName}</option>
							</c:forEach>
						</select>
					
					
					
					<br>
					<br>
					<div id="title-area">개수 <input type="number" name="count" id="put"> </div>
					<br>
					<br>

                    </table>
                </div>
					
					<button id="sendRequest" type="submit" onclick="senrRequest();">작성하기</button>
					<button id="sendBack" onclick="backPage();">뒤로가기</button>
                
				</form>

                </div>
            </main>


        <footer>
            <%@ include file="/WEB-INF/views/common/admin/footer.jsp" %>
        </footer>

        <script>
            
            function backPage(){
            	location.href = '${root}/common/member/home';
            }

            function sendRequest(){
            	location.href = '${root}/inventory/list';
            }
            
            
        </script>
    </body>

    </html> 