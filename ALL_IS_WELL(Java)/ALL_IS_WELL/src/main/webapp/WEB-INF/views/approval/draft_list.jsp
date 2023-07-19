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
        margin-top: 40px;
        margin-bottom: 40px;
    }

    #title {
        font-size: 20px;
    }

    #writeApproval {
        font-size: 20px;
        color: white;
        background-color: #5A8CF2;
        size: 10px;
        border: none;
        padding: 5px 8px;
        cursor: pointer;
        border-radius: 5px;
        font-weight: bold;
    }

    #writeApproval:hover {
        background-color: #555;
        transition: 0.7s;
    }

    .search-area {
        display: flex;
        align-items: center;
    }

    #search{
        height: 50px;
    }

    .search-area input[type="text"] {
        padding: 5px;
        margin-right: 20px;
        width: 600px;
        height: 50px;
        border: 1px solid gray;
        border-radius: 10px;
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

    .list-area {
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
        padding: 15px;
        border-bottom: 1px solid #ddd;
        text-align: center;
    }

    .list-area th {
        font-size: 15px;
        font-weight: normal;
    }

    #writer{
        width: 20%;
    }


    .number-area {
        text-align: center;
        margin-top: 20px;
        margin-bottom: 20px;
    }

    .number-area a {
        display: inline-block;
        margin: 5px;
        padding: 8px 12px;
        text-decoration: none;
        border: none;
        color: inherit;
        font-size: 15px;
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

    #statusBtn{
        box-sizing: border-box;
        width: 50px;
        height: 30px;
        border-radius: 20px;
        background-color: #A7A7A7;
        color: white;
    }

</style>
</head>
<body>
	
	<header>
		<%@include file="/WEB-INF/views/common/member/header.jsp" %>
	</header>
	
	<main id="wrap">
        <div>
            <%@ include file="/WEB-INF/views/common/member/side-bar.jsp" %>
        </div>
        <div class="main-area">
            <div class="title-area">
                <span id="title">기안문서함</span>

                <form action="" class="search-area">
                    <label for="search" class="category-area">
                        <select name="search" id="search">
                            <option value="writer">문서종류</option>
                            <option value="title">제목</option>
                        </select>
                    </label>
                    <input type="text" id="search-input">
                    <a href="" id="search-icon"><i class="fa-solid fa-magnifying-glass"></i></a>
                </form>

                <button id="writeApproval">문서 작성하기</button>
            </div>
            <div class="list-area">
                <table>
                    <tr>
                        <th id="writer">작성자</th>
                        <th id="content">제목</th>
                        <th id="enrollDate">작성일</th>
                        <th id="status">상태</th>
                    </tr>
                    <tr>
                        <td>홍길동</td>
                        <td>출장신청서</td>
                        <td>2023-06-13</td>
                        <td>
                            <button id="statusBtn" disabled>대기</button>
                        </td>
                    </tr>
                    <tr>
                        <td>홍길동</td>
                        <td>출장신청서</td>
                        <td>2023-06-13</td>
                        <td>
                            <button id="statusBtn" disabled>대기</button>
                        </td>
                    </tr>
                    <tr>
                        <td>홍길동</td>
                        <td>출장신청서</td>
                        <td>2023-06-13</td>
                        <td>
                            <button id="statusBtn" disabled>대기</button>
                        </td>
                    </tr>
                    <tr>
                        <td>홍길동</td>
                        <td>출장신청서</td>
                        <td>2023-06-13</td>
                        <td>
                            <button id="statusBtn" disabled>대기</button>
                        </td>
                    </tr>
                    <tr>
                        <td>홍길동</td>
                        <td>출장신청서</td>
                        <td>2023-06-13</td>
                        <td>
                            <button id="statusBtn" disabled>대기</button>
                        </td>
                    </tr>
                    <tr>
                        <td>홍길동</td>
                        <td>출장신청서</td>
                        <td>2023-06-13</td>
                        <td>
                            <button id="statusBtn" disabled>대기</button>
                        </td>
                    </tr>
                    <tr>
                        <td>홍길동</td>
                        <td>출장신청서</td>
                        <td>2023-06-13</td>
                        <td>
                            <button id="statusBtn" disabled>대기</button>
                        </td>
                    </tr>
                    <tr>
                        <td>홍길동</td>
                        <td>출장신청서</td>
                        <td>2023-06-13</td>
                        <td>
                            <button id="statusBtn" disabled>대기</button>
                        </td>
                    </tr>
                    <tr>
                        <td>홍길동</td>
                        <td>출장신청서</td>
                        <td>2023-06-13</td>
                        <td>
                            <button id="statusBtn" disabled>대기</button>
                        </td>
                    </tr>
                    <tr>
                        <td>홍길동</td>
                        <td>출장신청서</td>
                        <td>2023-06-13</td>
                        <td>
                            <button id="statusBtn" disabled>대기</button>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="number-area">
                <a id="previous" href=""><</a>
                <a href=""> 1 </a>
                <a href=""> 2 </a>
                <a href=""> 3 </a>
                <a href=""> 4 </a>
                <a href=""> 5 </a>
                <a id="after" href="">></a>
            </div>
        </div>
	</main>

	<footer>
		<%@ include file="/WEB-INF/views/common/member/footer.jsp" %>
	</footer>
    <script>

        const sideBar = document.querySelector("#side-bar")
        const subMenus = document.querySelectorAll(".sub-menu");
        const thirdSidebars = document.querySelectorAll(".third-sidebar");

        subMenus.forEach(subMenu => {
            subMenu.style.height = sideBar.offsetHeight + 'px';
        });

        thirdSidebars.forEach(thirdSidebar => {
            thirdSidebar.style.height = sideBar.offsetHeight + 'px';
        });

    </script>
</body>
</html>