<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   
   #wrap{
      width: 1920px;
      height: 1500px;
      display: grid;
      grid-template-columns: 300px 1620px;
   }
   
   .main-area {
            width: 1000px;
            height: 800px;
            margin: auto;

        }

        .title-area {
           
            margin-top: 20%;
            text-align: center;
            display : flex;
            flex-direction: row;
            justify-content: space-between;
        }

        #title {
            font-size: 35px;
        }

        #sendMail {
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

        #sendMail:hover {
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
            padding-left: 20%;
        }

        .list-area td:nth-child(3) {
            padding-left: 10%;
        }


        .number-area {
    text-align: center;
}

.number-area a {
    display: inline-block;
    margin: 5px;
    padding: 8px 12px;
    text-decoration: none;
    border:none;
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
   

</style>
</head>
<body>
   
   <header>
      <%@include file="/WEB-INF/views/common/member/header.jsp" %>
   </header>
   
   <main id="wrap">
      <%@ include file="/WEB-INF/views/common/member/side-bar.jsp" %>
	
		<div class="main-area">
            <div class="title-area">
                <span id="title">보낸 메일함</span>
    
                <form action="" class="search-area">
                    <label for="search" class="category-area">
                        <select name="search" id="search">
                            <option value="writer">작성자</option>
                            <option value="title">제목</option>
                        </select>
                        

                    </label>
                    <input type="text" id="search-input">
                   <a href="" id="search-icon"><i class="fa-solid fa-magnifying-glass"></i></a>
                </form>
               
                <button id="sendMail">메일 보내기</button>
            </div>
            <br>
            <br>
            <br>
            <br>
            <br>
            <span id="delete-button">삭제</span>

            <div class="list-area">
                <table>
                    <th><input type="checkbox" name="choose" value="selectAll" onclick="selectAll(this)"></th>
                    <th>발신자</th>
                    <th>제목</th>
                    <th>작성일</th>

                    <tr>
                        <td><input type="checkbox" name="choose"></td>
                        <td>홍길동</td>
                        <td>안녕하세요. 6월 신고내역서입니다.</td>
                        <td>2023-06-13</td>
                    </tr>

                    <tr>
                        <td><input type="checkbox" name="choose"></td>
                        <td>홍길동</td>
                        <td>안녕하세요. 6월 신고내역서입니다.</td>
                        <td>2023-06-13</td>
                    </tr>

                    <tr>
                        <td><input type="checkbox" name="choose"></td>
                        <td>홍길동</td>
                        <td>안녕하세요. 6월 신고내역서입니다.</td>
                        <td>2023-06-13</td>
                    </tr>

                    <tr>
                        <td><input type="checkbox" name="choose"></td>
                        <td>홍길동</td>
                        <td>안녕하세요. 6월 신고내역서입니다.</td>
                        <td>2023-06-13</td>
                    </tr>

                    <tr>
                        <td><input type="checkbox" name="choose"></td>
                        <td>홍길동</td>
                        <td>안녕하세요. 6월 신고내역서입니다.</td>
                        <td>2023-06-13</td>
                    </tr>

                    <tr>
                        <td><input type="checkbox" name="choose"></td>
                        <td>홍길동</td>
                        <td>안녕하세요. 6월 신고내역서입니다.</td>
                        <td>2023-06-13</td>
                    </tr>

                    <tr>
                        <td><input type="checkbox" name="choose"></td>
                        <td>홍길동</td>
                        <td>안녕하세요. 6월 신고내역서입니다.</td>
                        <td>2023-06-13</td>
                    </tr>

                    <tr>
                        <td><input type="checkbox" name="choose"></td>
                        <td>홍길동</td>
                        <td>안녕하세요. 6월 신고내역서입니다.</td>
                        <td>2023-06-13</td>
                    </tr>

                    <tr>
                        <td><input type="checkbox" name="choose"></td>
                        <td>홍길동</td>
                        <td>안녕하세요. 6월 신고내역서입니다.</td>
                        <td>2023-06-13</td>
                    </tr>

                    <tr>
                        <td><input type="checkbox" name="choose"></td>
                        <td>홍길동</td>
                        <td>안녕하세요. 6월 신고내역서입니다.</td>
                        <td>2023-06-13</td>
                    </tr>


                    

                </table>
            </div>
            <br>
            <br>
            <br>
            
            <div class="number-area">
                <a id="previous" href=""> < </a>
                <a href=""> 1 </a>
                <a href=""> 2 </a>
                <a href=""> 3 </a>
                <a href=""> 4 </a>
                <a href=""> 5 </a>
                <a id="after" href=""> > </a>
            </div>
        </div>
	
   </main>

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
    </script>
</body>
</html>

