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
           #content{
    width: 1920px;
    height: 750px;
    display: grid;
    grid-template-columns: 150px 1770px;
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
                padding: 13px;
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
        margin-top: -30px;
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


           
            

#div01{
    font-family: 'Inter';
    font-style: normal;
    font-weight: 700;
    font-size: 20px;
    line-height: 30px;
    color: #FFFFFF;
    background: #5A8CF2;
    border: 0px;
}

#div01:hover{
	background-color: #555;
	transition: 0.7s;
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
                    <span id="title">공지사항</span>

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

                    <div></div>
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

                <c:set var="range" value="2" /> 
                <c:set var="startPage" value="${pv.currentPage - range > 0 ? pv.currentPage - range : 1}" />
                <c:set var="endPage" value="${startPage + 4 <= pv.maxPage ? startPage + 4 : pv.maxPage}" />
                <c:set var="startPage" value="${endPage - 4 > 0 ? endPage - 4 : 1}" />
    
                <div class="number-area">
                    <c:if test="${pv.currentPage > 1 }">
                        <a class="pageBtn" onclick="pageMove('${startPage - 1 > 0 ? startPage - 1 : 1}');">‹</a>                </c:if>
                    <c:if test="${pv.maxPage > 1 }"> 
                        <c:forEach begin="${startPage}" end="${endPage}" var="i">
                            <a class="pageBtn" class="pageBtn" onclick="pageMove('${i}');">${i}</a>
                        </c:forEach>
                    </c:if>
                    <c:if test="${pv.currentPage < pv.maxPage }">
                        <a class="pageBtn" onclick="pageMove('${endPage + 1 <= pv.maxPage ? endPage + 1 : pv.maxPage}');">›</a>
                    </c:if>
                    
                </div>
            </div>

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
	
	//환자정보가기
    const tbody = document.querySelector('tbody');
	tbody.addEventListener('click', (event)=>{
		//글번호 가져와서
		const no = event.target.parentNode.children[0].innerText;
		const title = event.target.parentNode.children[1].innerText;

		//요청보내기
		location.href='${root}/Mboard/noticeDetail?no=' + no + "&title=" + title;


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
    
    
    
</script>