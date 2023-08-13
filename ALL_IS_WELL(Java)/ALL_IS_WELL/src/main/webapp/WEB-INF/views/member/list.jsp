<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원목록조회</title>
<script src="https://kit.fontawesome.com/794ac64f16.js"
	crossorigin="anonymous"></script>
<style>
#wrap {
	width: 1920px;
	display: grid;
	grid-template-columns: 150px 1770px;
}

main {
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
	background-color: #5A8CF2;
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
	height: 80%
}

.list-area th, .list-area td {
	padding: 20px;
	border-bottom: 1px solid #ddd;
	text-align: left;
}

.list-area th {
	font-size: 20px;
	font-weight: normal;
}

.list-area th:first-child, .list-area td:first-child {
	width: 80px;
}

.list-area th:last-child, .list-area td:last-child {
	width: 100px;
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

.list-area th:nth-child(4) {
	padding-left: 10%;
	width: 200px;
}

.list-area th:nth-child(5) {
	padding-left: 3%;
	width: 200px;
}

.list-area td:nth-child(3) {
	padding-left: 9.5%;
	width: 200px;
}

.list-area td:nth-child(2) {
	padding-left: 10%;
	width: 200px;
}

.list-area th:nth-child(3) {
	padding-left: 9.5%;
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
        cursor: pointer;
    }

    .currentPage{
        color: #5A8CF2 !important;
        pointer-events: none;
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

#content {
	display: grid;
	grid-template-columns: 300px 1620px;
}

.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}
.list-area th:nth-child(1)
	{
		background-color: #FF8686;
		border-top-left-radius: 15px;
	}
	.list-area th:nth-child(2)
	{
		background-color: #FF8686;
	}
	.list-area th:nth-child(3)
	{
		background-color: #FF8686;
	}
	.list-area th:nth-child(4)
	{
		background-color: #FF8686;
	}
	.list-area th:nth-child(5)
	{
		background-color: #FF8686;
		border-top-right-radius: 15px;
	}
/* Modal Content/Box */
.modal-content {
	background-color: #fefefe;
	margin: 15% auto; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	width: 80%; /* Could be more or less, depending on screen size */
}

/* The Close Button */
.close {
	color: #aaaaaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

tr:hover {
	  background-color: #f2f2f2;
	}
</style>
</head>

<body>

	<header>
		<%@ include file="/WEB-INF/views/common/admin/header.jsp"%>
	</header>

	<main id="wrap">
		<header>
			<%@ include file="/WEB-INF/views/common/admin/side-bar.jsp"%>
		</header>

		<%-- <c:if test="${not empty message}">
			<script>
				alert("${message}");
			</script>
			</c:if> --%>

		<div class="main-area">
		<br>
		<br>
			<div class="title-area">
				<span id="title">직원 정보 조회</span>

				<form action="" class="search-area">
					<label for="search" class="category-area"> <select
						name="searchType" id="search">
							<option value="name">이름</option>
							<option value="departmentName">담당부서</option>
							<option value="positionName">직급</option>
							<option value="phoneNumber">전화번호</option>
							<option value="status">상태</option>

					</select>



					</label> <input type="text" id="search-input" name="searchValue"> <a href="" id="search-icon" onclick="this.closest('form').submit(); return false;"><i class="fa-solid fa-magnifying-glass"></i></a>
				</form>
					<div><button type="button" class="btnCalss" id="btn2" onclick="join();" style="width: 60px; height: 40px;">회원가입</button></div>


			</div>


			<div class="list-area">
				<table>
					<tr>
						<th style="text-align: center;">이름</th>
						<th style="text-align: center;">담당부서</th>
						<th style="text-align: center;">직급</th>
						<th style="text-align: center;">전화번호</th>
						<th style="text-align: center;">상태</th>
					</tr>
					<c:forEach items="${voList}" var="vo">
						<tr onclick="detail(${vo.no});">
							<td style="text-align: center;">${vo.name}</td>
							<td style="text-align: center;">${vo.departmentName}</td>
							<td style="text-align: center;">${vo.positionName}</td>
							<td style="text-align: center;">${vo.phoneNumber}</td>
							<td style="text-align: center;">${vo.status}</td>
						</tr>
					</c:forEach>
				</table>
			</div>

			  <div class="number-area">
                <c:if test="${pv.listCount > 10}">
                    <c:if test="${pv.currentPage > 1}">
                        <a href="list?page=1&searchType=${svo.getSearchType()}&searchValue=${svo.getSearchValue()}">&laquo;</a>
                        <a href="list?page=${pv.currentPage - 1}&searchType=${svo.getSearchType()}&searchValue=${svo.getSearchValue()}">&lt;</a>
                    </c:if>      
                    <c:set var="finalEndPage" value="${pv.endPage > pv.maxPage ? pv.maxPage : pv.endPage}" />
                    <c:forEach var="i" begin="${pv.startPage}" end="${finalEndPage}" step="1">
                        <c:choose>
                            <c:when test="${i == pv.currentPage}">
                                <a class="currentPage">${i}</a>
                            </c:when>
                            <c:otherwise>
                                <a href="list?page=${i}&searchType=${svo.getSearchType()}&searchValue=${svo.getSearchValue()}">${i}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <c:if test="${pv.maxPage > pv.currentPage}">
                        <a href="list?page=${pv.currentPage + 1}&searchType=${svo.getSearchType()}&searchValue=${svo.getSearchValue()}">&gt;</a>
                        <a href="list?page=${pv.maxPage}&searchType=${svo.getSearchType()}&searchValue=${svo.getSearchValue()}">&raquo;</a>
                    </c:if>
                </c:if>
            </div>


		</div>

		<div id="myModal" class="modal">
			<div class="modal-content">
				<span class="close">&times;</span>
				<p>
					이름 : ${vo.name} <br> 직급 : ${vo.departmentName} <br> 부서 :
					${vo.positionName} <br> 전화번호 : ${vo.phoneNumber} <br> 이메일
					: ${vo.email}
				</p>
			</div>
		</div>

	</main>
	
	<footer>
		<%@ include file="/WEB-INF/views/common/admin/footer.jsp"%>
	</footer>


	<script>

        <c:if test="${not empty message}">
		alert("${message}");
	</c:if> 

        const sideBar = document.querySelector("#side-bar")
        const subMenus = document.querySelectorAll(".sub-menu");
        const thirdSidebars = document.querySelectorAll(".third-sidebar");

        subMenus.forEach(subMenu => {
            subMenu.style.height = sideBar.offsetHeight + 'px';
        });

        thirdSidebars.forEach(thirdSidebar => {
            thirdSidebar.style.height = sideBar.offsetHeight + 'px';
        });

        const pageBtn = document.querySelectorAll('.pageBtn');

        for (let btn of pageBtn) {
            if (btn.innerHTML == '${pv.currentPage}') {
                btn.style.color = '#d9d9d9';
            }
        }

        function pageMove(pageNumber) {
            let url = new URL(window.location.href);
            url.searchParams.set('page', pageNumber);
            window.location.href = url.href;
        }
        const searchValueTag = document.querySelector("input[name=searchValue]");
		searchValueTag.value = '${paramMap.searchValue}';
		
		const searchTypeTagArr = document.querySelectorAll("select[name=searchType] > option");
		const x = '${paramMap.searchType}';
		if(x == 'title'){
			searchTypeTagArr[0].selected = true;			
		}else if(x == '${paramMap.enroll_date}'){
			searchTypeTagArr[1].selected = true;
		}
		
		
		
		function join(){
			location.href = "${root}/member/join"
		}
		
		
		
		
		function detail(no) {
            location.href = "${root}/member/detail/" + no
        };
    </script>
</body>

</html>