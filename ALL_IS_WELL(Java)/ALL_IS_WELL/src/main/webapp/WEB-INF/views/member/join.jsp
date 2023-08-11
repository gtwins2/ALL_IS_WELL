<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <script src="https://kit.fontawesome.com/794ac64f16.js" crossorigin="anonymous"></script>
    <style>
    body {
        font-family: 'Noto Sans KR', sans-serif;
    }

    .main-area {
        width: 1200px;
        margin: auto;
        margin-top: 20px;
    }

    .title-area {
        text-align: center;
        display: flex;
        flex-direction: row;
        justify-content: space-between;
    }

    #title {
        font-size: 35px;
        font-weight: bold;
        color: #333;
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
        background: #FFFFFF;
        border: 1px solid #C4C4C4;
        box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
        border-radius: 20px;
        padding: 15px;
        margin-bottom: 40px;
    }

    #content {
        display: grid;
        grid-template-columns: 150px auto;
    }

    input {
        width: 95%;
        height: 30px;
        padding: 5px 8px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 14px;
        line-height: 1.5;
        color: #333;
    }

    select {
        width: 50%;
        height: 36px;
        padding: 5px 8px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 14px;
        line-height: 1.5;
        color: #333;
        text-align: center;
    }

    #edit-area {
        font-size: large;
        height: 200px;
    }

    table {
        border-collapse: collapse;
        width: 100%;
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
            <div class="title-area">
                <span id="title">회원가입</span>
            </div>
    
    
            <div class="list-area">
                <form action="${root}/member/join" method="post" onsubmit="return checkValue();">
                    <table>
                        <tr>
                            <td>소속 부서</td>
                            <td>직종</td>
                            <td>직급</td>
                        </tr>
                        <tr>
                            <td>
                                <select name="departmentNo">
                                    <option value="1">외과</option>
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
                                <select name="positionType" onchange="showSelectedPosition(this);">
                                    <option value="D" selected>의사</option>
                                    <option value="N">간호사</option>
                                </select>
                            </td>
                            <td>
                                <select name="positionNoDoctor">
                                    <option value="1">교수</option>
                                    <option value="2">레지던트</option>
                                    <option value="3">펠로우</option>
                                    <option value="4">인턴</option>
                                </select>
                                <select name="positionNoNurse">
                                    <option value="5">부장간호사</option>
                                    <option value="6">과장간호사</option>
                                    <option value="7">수간호사</option>
                                    <option value="8">주임간호사</option>
                                    <option value="9">간호사</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>아이디</td>
                            <td colspan="2"><input type="text" name="id"></td>
                        </tr>
                        <tr>
                            <td>패스워드</td>
                            <td colspan="2"><input type="password" name="password"></td>
                        </tr>
                        <tr>
                            <td>이름</td>
                            <td colspan="2"><input type="text" name="name"></td>
                        </tr>
                        <tr>
                            <td>주민등록번호</td>
                            <td colspan="2"><input type="text" name="registrationNumber"></td>
                        </tr>
                        <tr>
                            <td>이메일</td>
                            <td colspan="2"><input type="email" name="email"></td>
                        </tr>
                        <tr>
                            <td>휴대폰번호</td>
                            <td colspan="2"><input type="text" name="phoneNumber"></td>
                        </tr>
                        <tr>
                            <td>사무실번호</td>
                            <td colspan="2"><input type="text" name="officeNumber"></td>
                        </tr>
                        <tr>
                            <td>면허번호</td>
                            <td colspan="2"><input type="text" name="licenseNumber"></td>
                        </tr>
                        <tr>
                            <td>연봉</td>
                            <td colspan="2">
                                <input type="text" name="yearSalary">
                            </td>
                        </tr>
                    </table>
    
                </div>

                    <div id="buttonDiv">
                        <button type="submit" id="sendRequest">회원가입</button>
                        <button id="sendBack" type="button" onclick="backPage();">뒤로가기</button>
                    </div>
                </form>

    
        </div>
    
    </div>

    <footer>
        <%@ include file="/WEB-INF/views/common/admin/footer.jsp" %>
    </footer>

    <script>

        function checkValue(){
            const idInput = document.querySelector("input[name=id]").value;
            const pwdInput = document.querySelector("input[name=password]").value;
            const nameInput = document.querySelector("input[name=name]").value;
            const yearSalaryInput = document.querySelector("input[name=yearSalary]").value;

            let checkValue = [];

            if(!idInput.trim()){
                checkValue.push("아이디");
            }
            if(!pwdInput.trim()){
                checkValue.push("비밀번호");
            }
            if(!nameInput.trim()){
                checkValue.push("이름");
            }
            if(!yearSalaryInput.trim()){
                checkValue.push("연봉");
            }

            if(checkValue.length > 0){
                alert(checkValue + " 의 값이 비어있습니다.");
                return false;
            }
            else{
                return true;
            }
        }

        function showSelectedPosition(select) {
            const doctorPositions = document.querySelector("select[name=positionNoDoctor]");
            const nursePositions = document.querySelector("select[name=positionNoNurse]");

            if (select.value === "D") {
                doctorPositions.style.display = "inline";
                nursePositions.style.display = "none";
            } else if (select.value === "N") {
                doctorPositions.style.display = "none";
                nursePositions.style.display = "inline";
            }
        }

        document.addEventListener("DOMContentLoaded", () => {
            const initialPosition = document.querySelector("select[name=positionType]");
            showSelectedPosition(initialPosition);
        });
        
    </script>
</body>

</html>