<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>재고입고조회</title>
        <script src="https://kit.fontawesome.com/794ac64f16.js" crossorigin="anonymous"></script>
        <style>
	        #wrap {
				width: 1920px;
				display: grid;
				grid-template-columns: 150px 1770px;
			}
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
                font-size: 30px;
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
                height: 40px;
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
				font-size: 25px;
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
                padding-left: 10%;                
                width: 150px;
            }

            .list-area th:nth-child(2) {
                padding-left: 10%;
                width: 150px;
            }

            .list-area th:nth-child(4) {
                padding-left: 10%;
                width: 150px;
            }

            .list-area td:nth-child(3) {
                padding-left: 10.5%;
                width: 150px;                
            }

            .list-area td:nth-child(2) {
                padding-left: 10.5%;
                width: 150px;                
            }

            .list-area td:nth-child(4) {
                padding-left: 10%;
                width: 150px;                
            }
			
			
.list-area td:nth-child(4) {
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
                <%@ include file="/WEB-INF/views/common/admin/side-bar.jsp" %>


            <div class="main-area">
            <br>
            <br>
                <div class="title-area">
                    <span id="title" style="font-size: 40px;">재고결재문서조회</span>

                    <form action="" class="search-area">
                        <label for="search" class="category-area">
                            <select id="search" name="searchType">
                                <option value="ITEM_NAME">종류</option>
                                <option value="INVENTORY_COUNT">개수</option>
                                <option value="APPROVAL_DATE">입고일자</option>
                            </select>

					

                        </label>
                        <input type="text" id="search-input" name="searchValue"> <a href="" id="search-icon" onclick="this.closest('form').submit(); return false;"><i class="fa-solid fa-magnifying-glass"></i></a>
                    </form>
                   


                </div>
                <br>
                <br>
                <br>
                <br>
                <br>

                <div class="list-area">
                    <table>
                        <th></th>
                        <th>종류</th>
                        <th>개수</th>
                        <th>입고일자</th>

                        <c:forEach items="${voList}" var="vo">
						<tr>
							<td></td>
							<td>${vo.itemName}</td>
							<td>${vo.count}</td>
							<td>${vo.approvalDate}</td>
						</tr>
					</c:forEach>

                    </table>
                </div>
                <c:set var="range" value="5" />
			<c:set var="startPage"
				value="${pv.currentPage - range > 0 ? pv.currentPage - range : 1}" />
			<c:set var="endPage"
				value="${startPage + 4 <= pv.maxPage ? startPage + 4 : pv.maxPage}" />
			<c:set var="startPage" value="${endPage - 4 > 0 ? endPage - 4 : 1}" />

			<div class="number-area">
				<c:if test="${pv.currentPage > 1 }">
					<a class="pageBtn"
						onclick="pageMove('${startPage - 1 > 0 ? startPage - 1 : 1}');">‹</a>
				</c:if>
				<c:if test="${pv.maxPage > 1 }">
					<c:forEach begin="${startPage}" end="${endPage}" var="i">
						<a class="pageBtn" onclick="pageMove('${i}');">${i}</a>
					</c:forEach>
				</c:if>
				<c:if test="${pv.currentPage < pv.maxPage }">
					<a class="pageBtn"
						onclick="pageMove('${endPage + 1 <= pv.maxPage ? endPage + 1 : pv.maxPage}');">›</a>
				</c:if>
			</div>
		</div>
	</main>

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
            
            function sendRequest(){
           		location.href="${root}/inventory/insert";
           	}
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