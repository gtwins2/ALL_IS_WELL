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
            div > textarea{
            	margin-left: 100px;
            }

			input{
			width: 55px;
			height: 30px;
			}
			
			#edit-area{
				font-size: large;
				height: 250px;
			}
			
			table {
		border-collapse: collapse;
	}
	
	td{
		border-right: 1px solid black;
		text-align: center;
	}
	th{
		border-right: 1px solid black;
		border-bottom: 1px solid black;
	}
	
	td:nth-last-child() {
		border-right: none;	
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
                    <span id="title">회원정보수정하기</span>

                </div>
                <br>
                <br>
                <br>
                <br>
                <br>

				<div class="list-area">
			<form action="${root}/edit/${vo.no}" method="post" >
					
					<table id="edit-area">
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
				      <th style="border-right: none;">서명 이미지</th>
				    </tr>
				  </thead>
				  
				      <tr>
				        <td><input type="text" name="no" value="${vo.no}" readonly="readonly"></td>
				        <td>
				        	<select name="departmentNo" style="height: 30px;">
				        		<option value="'1'">외과</option>
				        		<option value="2">내과</option>
				        		<option value="3">소아청소년과</option>
				        		<option value="4">피부과</option>
				        		<option value="5">안과</option>
				        		<option value="6">치과</option>
				        		<option value="7">정신과</option>
				        		<option value="8">물리치료과</option>
				        		<option value="9">산부인과</option>
				        		<option value="10">응급의학과</option>
				        	</select>
				        </td>
				        <td>
				        	<select name="positionNo" style="height: 30px;">
				        		<option value="'1'">교수</option>
				        		<option value="2">레지던트</option>
				        		<option value="3">펠로우</option>
				        		<option value="4">인턴</option>
				        		<option value="5">부장간호사</option>
				        		<option value="6">과장간호사</option>
				        		<option value="7">수간호사</option>
				        		<option value="8">주임간호사</option>
				        		<option value="9">간호사</option>
				        	</select>
				        </td>
				        <td><input type="text" name="name" value="${vo.name}"></td>
				        <td><input type="text" name="status" value="${vo.status}" readonly="readonly"></td>
				        <td><input type="text" name="enrollDate" value="${vo.enrollDate}" readonly="readonly" style="width: 71px"></td>
				        <td><input type="text" name="registrationNumber" value="${vo.registrationNumber}"style="width: 105px"></td>
				        <td><input type="text" name="email" value="${vo.email}" style="width: 115px"></td>
				        <td><input type="text" name="phoneNumber" value="${vo.phoneNumber}" style="width: 90px"></td>
				        <td><input type="text" name="officeNumber" value="${vo.officeNumber}" style="width: 75px"></td>
				        <td><input type="text" name="licenseNumber" value="${vo.licenseNumber}" style="width: 80px"></td>
				        <td><input type="text" name="yearSalary" ></td>
				        <td><img src="${vo.profile}" alt="프로필사진" /></td>
				        <td style="border-right: none;"><img src="${vo.sign}" alt="서명이미지" /></td>
				      </tr>
				</table>
                    
                    
                    
                </div>
					
					<button type="submit" id="sendRequest" onclick="sub();">수정완료</button>
					<button id="sendBack" type="button" onclick="backPage();">뒤로가기</button>
					
                </form>
                </div>
                <br>
                <br>
                <br>

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
            
            function sub(){
            	alert("회원 정보 수정 요청이 처리되었습니다.");
            }
            
            function backPage(){
            	location.href="${root}/member/list"
            }
            
        </script>
    </body>

    </html>