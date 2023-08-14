<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

		body {
            margin: 0;
        }

		#content{
			width: 1920px;
			height: 700px;
			display: grid;
			grid-template-columns: 150px 1770px;
		}

        .container {
            background-color: #ffffff;
            border-radius: 20px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
            padding: 40px;
			margin: auto;
			width: 70%;
			border: 0.5px solid #939393;
        }

        .header {
            font-size: 30px;
			font-weight: normal;
            margin-bottom: 20px;
			margin-top: 40px;
			margin-left: 280px;
        }

        .label {
            font-size: 20px;
            width: 100px;
            display: inline-block;
            margin-bottom: 10px;
			text-align: right;
        }

        input[type="text"] {
            width: 80%;
            font-size: 18px;
            height: 30px;
            border: 1px solid #ccc;
            border-radius: 4px;
            padding: 5px;
        }

        input[type="text"]:disabled {
            background-color: #eee;
        }

        .input-group {
            margin-bottom: 40px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .back-button {
            font-size: 18px;
            font-weight: 700;
            padding: 10px;
            border-radius: 5px;
            border: none;
            color: #ffffff;
            background-color: #5A8CF2;
            cursor: pointer;
            text-align: center;
            display: inline-block;
            transition: background-color 0.7s ease;
            text-decoration: none;
			
        }

        .back-button:hover {
            background-color: #555;
        }

		#buttonDiv{
			text-align: right;
			margin-right: 280px;
			margin-top: 40px;
		}

</style>
</head>
<body>

	<header>
		<%@ include file="/WEB-INF/views/common/member/header.jsp" %>
	</header>
		
	<div id="content">
		<nav>
			<%@ include file="/WEB-INF/views/common/member/side-bar.jsp" %>
		</nav>
		<main>
			<div class="header">처방전 상세조회</div>
			<div class="container">
				<div class="input-group">
					<label class="label" for="patientName">환자명</label>
					<input type="text" id="patientName" value="${vo.name}" readonly disabled>
				</div>
				<div class="input-group">
					<label class="label" for="medicine">투약물</label>
					<input type="text" id="medicine" value="${vo.medicine}" readonly disabled>
				</div>
				<div class="input-group">
					<label class="label" for="totalDays">투약일수</label>
					<input type="text" id="totalDays" value="${vo.totalDay}" readonly disabled>
				</div>
				<div class="input-group">
					<label class="label" for="dose">1회 투약량</label>
					<input type="text" id="dose" value="${vo.dose}" readonly disabled>
				</div>
				<div class="input-group">
					<label class="label" for="usage">용법</label>
					<input type="text" id="usage" value="${vo.usage}" readonly disabled>
				</div>
			</div>
			<div id="buttonDiv">
				<a class="back-button" onclick="back()" href="#">뒤로가기</a>
			</div>
		</main>
	</div>

	<footer>
		<%@ include file="/WEB-INF/views/common/member/footer.jsp" %>
	</footer>

</body>
</html>
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
	
	function back() {
  		location.href = "/app/prescription/list";	
  	}
</script>