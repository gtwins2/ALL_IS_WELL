<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입원실 목록</title>
<script src="https://kit.fontawesome.com/794ac64f16.js" crossorigin="anonymous"></script>
<style>
   		#wrap{
			width: 1920px;
			height: 750px;
			display: grid;
			grid-template-columns: 150px 1770px;
		}
   		


        .main-area {
            display: flex;
            flex-direction: column; 
            align-items: center; 

           
        }

        .head-area {
            margin-top: 50px;
            text-align: center;
            display: flex;
            flex-direction: row;
            justify-content: center;
            font-size: 30px;
            font-weight: normal;
            width: 80%;

        }

		#title {
			margin-right: 230px;
		}

        .search-area {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-left: 40px;
        }

        .search-area label {
            font-size: 18px;
            font-weight: bold;
        }

        .search-area select {
            padding: 5px;
            border-radius: 10px;
            border: 1px solid gray;
            height: 30px;
        }

        .search-area input[type="text"] {
           padding: 5px;
           margin-right: 20px;
           width: 400px;
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

       #search-icon {
           color: gray;
       }

       

        .search-area > #search-icon {
            display: inline-block;
            padding: 5px 10px;
            background : none;
            border: none;
            color: #555;
            text-decoration: none;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .search-area a:hover {
            background-color: #555;
        }

      
        .select-area {
            width: 55%;
           height: 80%;
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            margin-top: 30px;
        }

        

        .box {
            text-align: center;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            border: 1px solid #ccc;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            background-color: #f9f9f9;
             min-width: 200px;
    		min-height: 200px; 
        }



        .box > div {
            margin-bottom: 20px;
            font-weight: bold;
        }

        .statusBtn {
            padding: 8px 16px;
            border-radius: 5px;
            border: none;
            background-color: #5A8CF2;
            color: #fff;
            font-weight: bold;
            cursor: pointer;
            width: 100%;
            text-align: center;
      		letter-spacing: 11px;
      		font-size: 18px;
        }



        .statusBtn:hover {
            background-color: #555;
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

    .number-area a:hover {
        color: #5A8CF2;
        cursor: pointer;
    }

    .currentPage{
        color: #5A8CF2 !important;
        pointer-events: none;
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
            <div class="head-area">
                <div class="title-area">
                    <div id="title">입원실 조회</div>
                </div>    
    
    
                    <form action="" class="search-area">
                        <label for="searchType" class="category-area">
                            <select name="searchType" id="search">
                                <option value="maxCapacity">인원수</option>
                                
                            </select>
                            
        
                        </label>
                        <input type="text" id="search-input" name="searchValue">
                       <button id="search-icon" ><i class="fa-solid fa-magnifying-glass"></i></button>
                    </form>

            </div>

			
    
        
		
			
            <br>
            <br>
            <hr>

	      	<div class="select-area">
			    <c:forEach items="${roomList}" var="room">
			        <c:set var="activated" value="${room.numberOfPatients < room.maxCapacity}" />
			        <div class="box">
			            <input type="hidden" name="no" id="roomNo" value="${room.no}">
			            <div>${room.inpatientPosition}</div>
			            <div>${room.maxCapacity}인실</div>
			            <button class="statusBtn ${activated ? 'activated' : ''}">
			                (${room.numberOfPatients}/${room.maxCapacity})
			            </button>
			        </div>
			    </c:forEach>
			</div>
           

          	
            <div class="number-area">
                <c:if test="${pv.listCount > 10}">
                    <c:if test="${pv.currentPage > 1}">
                        <a href="roomList?page=1&searchType=${svo.getSearchType()}&searchValue=${svo.getSearchValue()}">&laquo;</a>
                        <a href="roomList?page=${pv.currentPage - 1}&searchType=${svo.getSearchType()}&searchValue=${svo.getSearchValue()}">&lt;</a>
                    </c:if>      
                    <c:set var="finalEndPage" value="${pv.endPage > pv.maxPage ? pv.maxPage : pv.endPage}" />
                    <c:forEach var="i" begin="${pv.startPage}" end="${finalEndPage}" step="1">
                        <c:choose>
                            <c:when test="${i == pv.currentPage}">
                                <a class="currentPage">${i}</a>
                            </c:when>
                            <c:otherwise>
                                <a href="roomList?page=${i}&searchType=${svo.getSearchType()}&searchValue=${svo.getSearchValue()}">${i}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <c:if test="${pv.maxPage > pv.currentPage}">
                        <a href="roomList?page=${pv.currentPage + 1}&searchType=${svo.getSearchType()}&searchValue=${svo.getSearchValue()}">&gt;</a>
                        <a href="roomList?page=${pv.maxPage}&searchType=${svo.getSearchType()}&searchValue=${svo.getSearchValue()}">&raquo;</a>
                    </c:if>
                </c:if>
            </div>
          	

        	<br>
        	<br>
		</div>
            
   </main>

   <footer>
      <%@ include file="/WEB-INF/views/common/member/footer.jsp" %>
   </footer>

   <script>
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
   
   
   <script type="text/javascript">
	    const sideBar = document.querySelector("#side-bar")
	    const subMenus = document.querySelectorAll(".sub-menu");
	    const thirdSidebars = document.querySelectorAll(".third-sidebar");
	
	    subMenus.forEach(subMenu => {
	        subMenu.style.height = sideBar.offsetHeight + 'px';
	    });
	
	    thirdSidebars.forEach(thirdSidebar => {
	        thirdSidebar.style.height = sideBar.offsetHeight + 'px';
	    });
	    
	    
	    
	    //수용인원이 더 적을 때만 버튼 활성화
		 const statusBtns = document.querySelectorAll('.statusBtn');
	    statusBtns.forEach(statusBtn => {
	        statusBtn.addEventListener('click', function () {
	            if (this.classList.contains('activated')) {
	                const roomNo = this.parentElement.querySelector('#roomNo').value;
	
	                const url = '/app/admission/registerPatient?no='+roomNo;
	
	                window.location.href = url;
	            }
	        });
	    });
	    
	    //검색 결과 유지
		const searchValueTag = document.querySelector("input[name=searchValue]");
		
		
		searchValueTag.value = '${paramMap.searchValue}';
		
		
		const searchTypeTagArr = document.querySelectorAll("select[name=searchType] > option");
		
		const x = '${paramMap.searchType}';
		
		if(x == 'maxCapacity') {
			searchTypeTagArr[0].selected = true;
		} 
	    
	</script>

   
</body>
</html>
