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
            <br>
		<br>
                <div class="title-area">
                    <span id="title">회원정보수정하기</span>

                </div>
                <br>
                <br>

				<div class="list-area">
			<form action="${root}/edit/${vo.no}" method="post" >
					
					<table id="edit-area">
					
					<tr>
                        <td style="width: 300px;">사번</td>
                        <td colspan="2"><input style="width: 1000px; height:40px; font-size: 20px;" type="text" name="memberNo" value="${vo.no}" readonly></td>
                    </tr>
					<tr>
                        <td>소속 부서</td>
                        <td colspan="2">
                        	<select name="departmentNo" style="width: 1000px; height:40px; font-size: 20px;">
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
                    </tr>
					<tr>
                        <td>직급</td>
                        <td colspan="2">
                        	<select name="positionNo" style="width: 1000px; height:40px; font-size: 20px;" type="text">
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
                    </tr>
					<tr>
                        <td>이름</td>
                        <td colspan="2"><input style="width: 1000px; height:40px; font-size: 20px;" type="text" name="name" value="${vo.name}"></td>
                    </tr>
					<tr>
                        <td>상태</td>
                        <td colspan="2"><input style="width: 1000px; height:40px; font-size: 20px;" type="text" name="status" value="${vo.status}"></td>
                    </tr>
					<tr>
                        <td>입사일</td>
                        <td colspan="2"><input style="width: 1000px; height:40px; font-size: 20px;" type="text" name="enrollDate" value="${vo.enrollDate}"></td>
                    </tr>
					<tr>
                        <td>주민등록번호</td>
                        <td colspan="2"><input style="width: 1000px; height:40px; font-size: 20px;" type="text" name="registrationNumber" value="${vo.registrationNumber}"></td>
                    </tr>
					<tr>
                        <td>이메일</td>
                        <td colspan="2"><input style="width: 1000px; height:40px; font-size: 20px;" type="text" name="email" value="${vo.email}" readonly></td>
                    </tr>
					<tr>
                        <td>휴대폰번호</td>
                        <td colspan="2"><input style="width: 1000px; height:40px; font-size: 20px;" type="text" name="phoneNumber" value="${vo.phoneNumber}"></td>
                    </tr>
					<tr>
                        <td>사무실번호</td>
                        <td colspan="2"><input style="width: 1000px; height:40px; font-size: 20px;" type="text" name="officeNumber" value="${vo.officeNumber}"></td>
                    </tr>
					<tr>
                        <td>면허번호</td>
                        <td colspan="2"><input style="width: 1000px; height:40px; font-size: 20px;" type="text" name="licenseNumber" value="${vo.licenseNumber}"></td>
                    </tr>
					<tr>
                        <td>연봉</td>
                        <td colspan="2"><input style="width: 1000px; height:40px; font-size: 20px;" type="text" name="yearSalary" value="${vo.yearSalary}"></td>
                    </tr>
					<tr>
                        <td>프로필 사진</td>
                        <td colspan="2"><input style="width: 1000px; height:40px; font-size: 20px;" type="text" name="profile" value="${vo.profile}"></td>
                    </tr>
					<tr>
                        <td>서명 이미지</td>
                        <td colspan="2"><input style="width: 1000px; height:40px; font-size: 20px;" type="text" name="sign" value="${vo.sign}"></td>
                    </tr>

                  
                    </table>
					
					
                </div>
					
					<div id="buttonDiv">
					<button id="sendRequest" onclick="del(${vo.no});">삭제하기</button>
					<button id="sendRequest" onclick="edit(${vo.no});">수정하기</button>
					<button id="sendRequest"  type="button" onclick="backPage();">뒤로가기</button>
					</div>
                </form>
                </div>

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