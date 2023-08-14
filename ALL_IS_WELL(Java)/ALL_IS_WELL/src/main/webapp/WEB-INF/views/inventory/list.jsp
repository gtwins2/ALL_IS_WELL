<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>재고조회</title>
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
				font-size: 20px;
                background: #FFFFFF;
                border: 1px solid #C4C4C4;
                box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
                border-radius: 20px;
            }

            .list-area table {
                border-collapse: collapse;
                width: 100%;
  				margin: auto;
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

			.list-area th:nth-child(1)
	{
		background-color: #FF8686;
		border-top-left-radius: 15px;
		color: white;
	}
	.list-area th:nth-child(2)
	{
		background-color: #FF8686;
		color: white;
		border-top-right-radius: 15px;
	}
	.list-area th:nth-child(3)
	{
		background-color: #FF8686;
		color: white;
		
	}
	
	
	
	.modal {
        display: none; /* Hidden by default */
        position: fixed; /* Stay in place */
        z-index: 1; /* Sit on top */
        left: 700px;
        top: 200px;
        width: 800px; /* Full width */
        height: 500px; /* Full height */
        overflow: hidden;
        /* background-color: rgb(0,0,0);
        background-color: rgba(0,0,0,0.4); /* 
      }

        /* Modal Content/Box */
        .modal-content {
        background-color: #fefefe;
        margin: 15% auto; /* 15% from the top and centered */
        margin-left: 100px;
        padding: 20px;
        border: 1px solid #888;
        width: 500px; /* Could be more or less, depending on screen size */
        height: 300px;
        text-align: justify;
        line-height: 1.6;
      }

      .close {
        color: #aaaaaa;
        float: right;
        font-size: 40px;
        font-weight: bold;
      }

      .close:hover,
      .close:focus {
        color: #000;
        text-decoration: none;
        cursor: pointer;
      }
      .rightgo{
      	margin-left: 340px;
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
            <br>
            <br>
                <div class="title-area">
                    <span id="title" style="font-size: 40px;">재고조회</span>

                    <form action="" class="search-area">
                        <label for="search" class="category-area">
                            <select id="search" name="searchType">
                                <option value="ITEM_NAME">종류</option>
                                <option value="INVENTORY_COUNT">개수</option>
                                
                            </select>

					

                        </label>
                        <input type="text" id="search-input" name="searchValue"> <a href="" id="search-icon" onclick="this.closest('form').submit(); return false;"><i class="fa-solid fa-magnifying-glass"></i></a>
                    </form>
                   <div>
	                   <button id="sendRequest" onclick="sendRequest();">입고조회</button>
	                   <button type="button" class="btnClass" id="sendRequest" onclick="showmodal();">
        재고수정
    </button>
					</div>

                </div>
                <br>
					
                        
                <div class="list-area">
                    <table>
                    <tr>
                        <th>종류</th>
                        <th>개수</th>
                    </tr>

                        <c:forEach items="${voList}" var="vo">
						<tr>
							<td>${vo.itemName}</td>
							<td>${vo.inventoryCount}</td>
						</tr>
					</c:forEach>

                    </table>
                </div>
                <br>
                <br>
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
		
		<div id="myModal" class="modal">
            <div class="modal-content">
              <span class="close">&times;</span>
              <form action="${root}/inventory/insert" method="post">
                <div class="list-area" style="margin-top: 50px;">
                    <table>
					<input type="hidden" value=${loginMember.no} >
					<br>
					<label for="item-select" >종류</label>
						<select	name="categoryNo" style="width: 128px; margin-left: 20px; font-size: 20px;">
							<c:forEach items="${voList}" var="vo">
							<option value="${vo.categoryNo}">${vo.itemName}</option>
							</c:forEach>
						</select>
					<br>
					<hr>
					<div>개수 <input type="number" name="count" id="put" style="width: 128px; margin-left: 12px; font-size: 20px"> </div>
					<br>
                    </table>
                </div>
                <br>
                <div class="rightgo">
					<button id="sendRequest" type="submit" onclick="senrRequest3();">작성하기</button>
                </div>
				</form>

                </div>
            </div>
        </div>
		
	</main>

        <footer>
            <%@ include file="/WEB-INF/views/common/admin/footer.jsp" %>
        </footer>

        <script>
        
        var modal = document.getElementById("myModal"); // 모달 요소
        var buttons = document.querySelectorAll(".btnClass"); // 모든 버튼 요소들

        // 각 버튼 요소에 대하여
        buttons.forEach(function(btn) {
            // 클릭 이벤트 핸들러 등록
            btn.addEventListener("click", function() {
                // 버튼의 data 속성으로부터 정보를 가져옴
                var name = this.getAttribute("data-name");
                var position = this.getAttribute("data-position");
                var department = this.getAttribute("data-department");
                var phone = this.getAttribute("data-phone");
                var email = this.getAttribute("data-email");

                // 모달 내부의 요소에 정보를 설정
                var mnameElem = modal.querySelector("#mname");
                var positionElem = modal.querySelector("#position");
                var departmentElem = modal.querySelector("#department");
                var phoneElem = modal.querySelector("#phone");
                var emailElem = modal.querySelector("#email");
                mnameElem.innerText = name;
                positionElem.innerText = position;
                departmentElem.innerText = department;
                phoneElem.innerText = phone;
                emailElem.innerText = email;

                // 모달 요소를 표시
                modal.style.display = "block";
            });
        });

        // 모달 닫기 버튼 클릭 이벤트 핸들러 등록
        var closeBtn = modal.querySelector(".close");
        closeBtn.addEventListener("click", function() {
            modal.style.display = "none"; // 모달 숨기기
        });
            function sendRequest(){
           		location.href="${root}/inventory/storeList";
           	}
            function sendRequest2(){
           		location.href="${root}/inventory/insert";
           	}
            function sendRequest3(){
            	location.href = '${root}/inventory/list';
            }
            function showmodal(){
            	modal.style.display = "block";
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