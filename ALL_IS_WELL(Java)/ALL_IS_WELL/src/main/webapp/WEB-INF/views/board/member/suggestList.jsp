<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>공지사항</title>
        <script src="https://kit.fontawesome.com/794ac64f16.js" crossorigin="anonymous"></script>
        <style>
            .main-area {
   				 width: 1200px;
    			height: 600px;
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

            #sendMail {
                font-size: 20px;
                color: white;
                background-color:  #5A8CF2;
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
                width: 300px;
                text-align: center;
            }

            .list-area th:last-child,
            .list-area td:last-child {
                width: 300px;
                text-align: center;
            }

            

            .list-area th:nth-child(2) {
                padding-left: 20%;
            }

            .list-area td:nth-child(2) {
                padding-left: 10%;
            }
			
			
.list-area td:nth-child(3) {
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

     

         

            #content{
                display: grid;
                grid-template-columns: 300px 1620px;
            }

        </style>
    </head>

    <body>
        <header>
            <%@ include file="/WEB-INF/views/common/member/header.jsp" %>
        </header>


        <div id="content">
            <div id="wrap">
                <%@ include file="/WEB-INF/views/common/member/side-bar.jsp" %>
            </div>


            <div class="main-area">
                <div class="title-area">
                    <span id="title">건의사항</span>

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

                    <button id="sendMail">작성하기</button>
                </div>
                <br>

                <div class="list-area">
                    <table>
                        <thead>
                        <th>번호</th>
                        <th>제목</th>
                        <th>작성일</th>
                        </thead>
						<tbody>
                        <c:forEach items="${voList}" var="vo">
                            

                                <tr>
                                    <td>${vo.no}</td>
                                    <td>${vo.title}</td>
                                    <td>${vo.enrollDate}</td>
                                </tr>
                                
						</c:forEach>
						</tbody>




                    </table>
                </div>
                <br>
                <br>
                <br>

                <div class="number-area">
                <c:if test="${pv.currentPage > 1}">
                    <a href="noticeList?page=1">&laquo;</a>
                    <a href="noticeList?page=${pv.currentPage - 1}">&lt;</a>
                </c:if>      
                <c:set var="finalEndPage" value="${pv.endPage > pv.maxPage ? pv.maxPage : pv.endPage}" />
                <c:forEach var="i" begin="${pv.startPage}" end="${finalEndPage}" step="1">
                    <c:choose>
                        <c:when test="${i == pv.currentPage}">
                            <a class="currentPage">${i}</a>
                        </c:when>
                        <c:otherwise>
                            <a href="noticeList?page=${i}">${i}</a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                <c:if test="${pv.maxPage > pv.currentPage}">
                    <a href="noticeList?page=${pv.currentPage + 1}">&gt;</a>
                    <a href="noticeList?page=${pv.maxPage}">&raquo;</a>
                </c:if>
            </div>
            </div>

        </div>

        <footer>
            <%@ include file="/WEB-INF/views/common/member/footer.jsp" %>
        </footer>

       
    </body>

    </html>