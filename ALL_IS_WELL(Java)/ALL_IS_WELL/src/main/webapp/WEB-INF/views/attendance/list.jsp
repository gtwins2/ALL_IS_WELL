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
        width: 1200px;
        height: 80%;
        margin: auto;
        margin-top: 100px;
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

    #writeApproval {
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

    .title-area {
        margin-top: 100px;
        margin-bottom: 50px;
        background: #FFFFFF;
        border: 1px solid #C4C4C4;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.25);
        border-radius: 20px;

    }

    .title-area table {
        width: 100%;
        display: table;
        font-size: 20px;
    }

    .title-area th {
        padding: 10px;
        border-bottom: 1px solid #ddd;
        text-align: center;
    }

    .list-area th,
    .list-area td {
        padding: 20px;
        border-bottom: 1px solid #ddd;
        text-align: center;
    }

    .list-area th {
        font-size: 20px;
        font-weight: normal;
    }

    #writer{
        width: 600px;
    }

    #content {
        width: 600px;
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
                <table>
                    <tr>
                        <th>07.16</th>
                        <th>출근 시간 : 2023-07-02 00:00:00</th>
                        <th>퇴근 시간 : 2023-07-02 00:00:00</th>
                        <th>O</th>
                    </tr>
                </table>
            </div>
            <div class="list-area">
                <table>
                    <tr>
                        <th id="writer">출근시간</th>
                        <th id="content">퇴근시간</th>
                    </tr>
                    <tr>
                        <td>2023-07-02 00:00:00</td>
                        <td>2023-07-02 00:00:00</td>
                    </tr>
                    <tr>
                        <td>2023-07-02 00:00:00</td>
                        <td>2023-07-02 00:00:00</td>
                    </tr>
                    <tr>
                        <td>2023-07-02 00:00:00</td>
                        <td>2023-07-02 00:00:00</td>
                    </tr>
                    <tr>
                        <td>2023-07-02 00:00:00</td>
                        <td>2023-07-02 00:00:00</td>
                    </tr>
                    <tr>
                        <td>2023-07-02 00:00:00</td>
                        <td>2023-07-02 00:00:00</td>
                    </tr>
                    <tr>
                        <td>2023-07-02 00:00:00</td>
                        <td>2023-07-02 00:00:00</td>
                    </tr>
                    <tr>
                        <td>2023-07-02 00:00:00</td>
                        <td>2023-07-02 00:00:00</td>
                    </tr>
                    <tr>
                        <td>2023-07-02 00:00:00</td>
                        <td>2023-07-02 00:00:00</td>
                    </tr>
                </table>
            </div>
            <br>
            <br>
            <br>

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

    </script>
</body>
</html>