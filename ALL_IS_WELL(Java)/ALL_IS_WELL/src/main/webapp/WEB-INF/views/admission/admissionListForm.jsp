<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입원 기록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/794ac64f16.js" crossorigin="anonymous"></script>
<style>
   
    #wrap{
			width: 1920px;
			height: 830px;
			display: grid;
			grid-template-columns: 150px 1770px;
		}
	   
	   .main-area {
	        width: 80%;
        	margin: auto;
            padding: 20px;
	    }
	   
		.title-area {
                text-align: center;
                display: flex;
                flex-direction: row;
                justify-content: center;
				margin-bottom: 50px;
				margin-top: 50px;
            }

		#title {
			font-size: 30px;
			margin-right: 430px;
			
		}

        
	    .search-area {
                display: flex;
                align-items: center;
            }



            .search-area input[type="text"] {
                padding: 5px;
                margin-right: 20px;
                width: 350px;
                height: 40px;
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
			  margin: 20px auto;
			  width: 80%;
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
			  padding: 12px 20px;
			  border-bottom: 1px solid #ddd;
			  text-align: left;
			}
			
			.list-area th {
			  font-size: 20px;
			 
			  text-align: center;
			  
			}
			
			.list-area td {
				font-size: 20px;
				text-align: center;
			}
			

			.list-area tr:hover:not(#top) {
			    background-color: #5A8CF2;
			    color: white;
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
       
	    .list-area th:first-child {
    border-top-left-radius: 20px;
}

.list-area th:last-child {
    border-top-right-radius: 20px;
}

       
		#top {
			background-color: #5A8CF2;
			color: white;
			font-weight: bold;
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
                <span id="title">입원 일정 목록</span>

				<form action="" class="search-area">
					<label for="search" class="category-area">
						<select name="searchType" id="search">
							<option value="name">환자명</option>

						</select>


					</label>
					<input type="text" id="search-input" name="searchValue">
					<a href="" id="search-icon""><i class="fa-solid fa-magnifying-glass"></i></a>
				</form>
           	</div>

           	

			   <div class="list-area">
				<table>
					<tr id="top">
						<th>환자명</th>
						<th>입원실</th>
						<th>입원일</th>
						<th>퇴원일</th>
						<th>퇴원 여부</th>
					</tr>
					
					<c:forEach items="${scheduleList}" var="schedule">
						<tr class="admission-row" data-admission-no="${schedule.admissionRecordNo}">
							
							<td>${schedule.patientName}</td>
							<td>${schedule.inpatientPosition}</td>
							<td>${schedule.admissionDate}</td>
							
							<c:if test="${not empty schedule.dischargeDate}">
								<td>${schedule.dischargeDate}</td>
							</c:if>
							
							<c:if test="${empty schedule.dischargeDate}">
								<td></td>
							</c:if>
							
							
							<c:if test="${empty schedule.dischargeDate}">
								<td>입원중</td>
							</c:if>
							
							<c:if test="${not empty schedule.dischargeDate}">
								<td>퇴원</td>
							</c:if>
							
						</tr>
					</c:forEach>
	
					
	
	
				</table>
			</div>
			
			<br>
			


			<div class="number-area">
                <c:if test="${pv.listCount > 10}">
                    <c:if test="${pv.currentPage > 1}">
                        <a href="admissionRecord?page=1&searchType=${svo.getSearchType()}&searchValue=${svo.getSearchValue()}">&laquo;</a>
                        <a href="admissionRecord?page=${pv.currentPage - 1}&searchType=${svo.getSearchType()}&searchValue=${svo.getSearchValue()}">&lt;</a>
                    </c:if>      
                    <c:set var="finalEndPage" value="${pv.endPage > pv.maxPage ? pv.maxPage : pv.endPage}" />
                    <c:forEach var="i" begin="${pv.startPage}" end="${finalEndPage}" step="1">
                        <c:choose>
                            <c:when test="${i == pv.currentPage}">
                                <a class="currentPage">${i}</a>
                            </c:when>
                            <c:otherwise>
                                <a href="admissionRecord?page=${i}&searchType=${svo.getSearchType()}&searchValue=${svo.getSearchValue()}">${i}</a>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <c:if test="${pv.maxPage > pv.currentPage}">
                        <a href="admissionRecord?page=${pv.currentPage + 1}&searchType=${svo.getSearchType()}&searchValue=${svo.getSearchValue()}">&gt;</a>
                        <a href="admissionRecord?page=${pv.maxPage}&searchType=${svo.getSearchType()}&searchValue=${svo.getSearchValue()}">&raquo;</a>
                    </c:if>
                </c:if>
            </div>
          	
          	

           	
           	
        </div>

		



        
		
    </main>

    



   <footer>
      <%@ include file="/WEB-INF/views/common/member/footer.jsp" %>
   </footer>
   



	
	<script type="text/javascript">

		//사이드바 조정
		const sideBar = document.querySelector("#side-bar")
	    const subMenus = document.querySelectorAll(".sub-menu");
	    const thirdSidebars = document.querySelectorAll(".third-sidebar");
	
	    subMenus.forEach(subMenu => {
	        subMenu.style.height = sideBar.offsetHeight + 'px';
	    });
	
	    thirdSidebars.forEach(thirdSidebar => {
	        thirdSidebar.style.height = sideBar.offsetHeight + 'px';
	    });
	    
	    //admissionRecordNo get으로 전달하기
	    $(document).ready(function() {
	        $('.admission-row').click(function() {
	            const admissionRecordNo = $(this).data('admission-no');
	            window.location.href = "/app/admission/admissionDetail?admissionRecordNo=" + admissionRecordNo;
	        });
	    });

	    
	    //페이징 처리
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
		   
		   
		   //검색 결과 유지
			const searchValueTag = document.querySelector("input[name=searchValue]");
			
			
			searchValueTag.value = '${paramMap.searchValue}';
			
			
			const searchTypeTagArr = document.querySelectorAll("select[name=searchType] > option");
			
			const x = '${paramMap.searchType}';
			
			if(x == 'name') {
				searchTypeTagArr[0].selected = true;
			} 
	</script>
  
</body>
</html>
