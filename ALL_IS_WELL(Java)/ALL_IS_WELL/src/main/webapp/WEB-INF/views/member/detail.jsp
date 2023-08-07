<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>디테일</title>
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
		        margin: auto;
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
                background-color: #FF8686;
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
                width: 20px;
            }

            .list-area th:last-child,
            .list-area td:last-child {
                width: 30px;
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
			
			.list-area th:nth-child(3) {
                padding-left: 9.5%;
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
            .list-area th:nth-child(6) {
                padding-left: 3%;
                width: 200px;                
            }
	 		.list-area th:nth-child(7) {
                width: 200px;                
                padding-left: 3%;
            }
            .list-area th:nth-child(8) {
                width: 200px;                
                padding-left: 3%;
            }


            .list-area td:nth-child(3) {
                padding-left: 9.5%;
                width: 200px;                
            }

            .list-area td:nth-child(2) {
                padding-left: 10%;
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
                    <span id="title">직원 상세 정보 조회</span>

                   


                </div>
                <br>
                <br>
                <br>
                <br>
                <br>

					
                <!-- <div class="list-area"> -->
                
                  <!-- Member 정보 출력을 위한 테이블 -->
				<table>
				  <thead>
				    <tr>
				      <th>사번</th>
				      <th>소속 부서</th>
				      <th>직급</th>
				      <th>이름</th>
				      <th>상태</th>
				      <th>입사일</th>
				      <th>주민등록번호</th>
				      <th>이메일</th>
				      <th>휴대폰번호</th>
				      <th>사무실번호</th>
				      <th>면허번호</th>
				      <th>연봉</th>
				      <th>프로필 사진</th>
				      <th>서명 이미지</th>
				      <th>삭제</th>
				    </tr>
				  </thead>
				  
				      <tr>
				        <td>${vo.no}</td>
				        <td>${vo.departmentName}</td>
				        <td>${vo.positionName}</td>
				        <td>${vo.name}</td>
				        <td>${vo.status}</td>
				        <td>${vo.enrollDate}</td>
				        <td>${vo.registrationNumber}</td>
				        <td>${vo.email}</td>
				        <td>${vo.phoneNumber}</td>
				        <td>${vo.officeNumber}</td>
				        <td>${vo.licenseNumber}</td>
				        <td>${vo.yearSalary}</td>
				        <td><img src="${vo.profile}" alt="프로필사진" /></td>
				        <td><img src="${vo.sign}" alt="서명이미지" /></td>
				        <td></td>
				      </tr>
				</table>
		        <button id="sendRequest" onclick="del(${vo.no});">삭제</button>
		        <button id="sendRequest" onclick="edit(${vo.no});">수정</button>
                </div>
                
                <br>
                <br>
                <br>


	</main>
        <footer>
            <%@ include file="/WEB-INF/views/common/admin/footer.jsp" %>
        </footer>

        <script>
        function del(no) {
            alert("해당 회원 삭제 요청이 완료되었습니다.");
            location.href = "${root}/member/delete/" + no;
        };
        
        function edit(no) {
            location.href = "${root}/member/edit/" + no;
        };
        
        const sideBar = document.querySelector("#side-bar")
        const subMenus = document.querySelectorAll(".sub-menu");
        const thirdSidebars = document.querySelectorAll(".third-sidebar");

        subMenus.forEach(subMenu => {
            subMenu.style.height = sideBar.offsetHeight + 'px';
        });

        thirdSidebars.forEach(thirdSidebar => {
            thirdSidebar.style.height = sideBar.offsetHeight + 'px';
        });

		//modal
		//회원 번호 넘겨받기
    	//const memberNo = document.getElementById('memberNoInput').value; 
		
        /* var modal = document.getElementById("myModal");
        var btns = document.querySelectorAll(".btnClass"); */
  
        /* for(i=0; i<13; i++){

            var span = document.getElementsByClassName("close")[0];

            btns[i].onclick = function () {
              modal.style.display = "block";
            }0

            span.onclick = function() {
            modal.style.display = "none";

            window.onclick = function(event) {
          if (event.target == modal) {
            modal.style.display = "none";
          }
        } */



		
    </script>
        </body>

    </html>
