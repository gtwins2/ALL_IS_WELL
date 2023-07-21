<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수술 일정 목록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/794ac64f16.js" crossorigin="anonymous"></script>
<style>
   
	   #wrap{
			width: 1920px;
			height: 750px;
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
            }

		#title {
			font-size: 30px;
			margin-right: 30px;
			
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
			  font-weight: normal;
			  text-align: center; /* Align header text to center */
			}
			
			.list-area th:first-child,
			.list-area td:first-child {
			  width: 20%; /* Adjust width of the first column */
			}
			
			.list-area th:last-child,
			.list-area td:last-child {
			  width: 20%; /* Adjust width of the last column */
			}
			
			/* Align text in td elements to center and middle */
			.list-area td {
			  vertical-align: middle;
			}
			
			/* Add left padding to the third column for better alignment */
			.list-area td:nth-child(3) {
			  padding-left: 10%;
			}
			
			.list-area td:nth-child(1) {
				padding-left: 10%;
			}
			
			/* Add right padding to the fourth column for better alignment */
			.list-area td:nth-child(4) {
			  padding-right: 10%;
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
                <span id="title">수술 일정 목록</span>

				<form action="" class="search-area">
					<label for="search" class="category-area">
						<select name="search" id="search">
							<option value="writer">수술명</option>
							<option value="title">환자명</option>
						</select>


					</label>
					<input type="text" id="search-input">
					<a href="" id="search-icon"><i class="fa-solid fa-magnifying-glass"></i></a>
				</form>
           	</div>

           	

			   <div class="list-area">
				<table>
					<th>수술명</th>
					<th>환자명</th>
					<th>실시일</th>
					<th>종료일</th>
	
					<tr>
						<td>간암수술</td>
						<td>홍길동</td>
						<td>2023-06-12</td>
						<td>2023-06-13</td>
					</tr>
	
					<tr>
						<td>간암수술</td>
						<td>홍길동</td>
						<td>2023-06-12</td>
						<td>2023-06-13</td>
					</tr>
	
					<tr>
						<td>간암수술</td>
						<td>홍길동</td>
						<td>2023-06-12</td>
						<td>2023-06-13</td>
					</tr>
	
					<tr>
						<td>간암수술</td>
						<td>홍길동</td>
						<td>2023-06-12</td>
						<td>2023-06-13</td>
					</tr>
	
					<tr>
						<td>간암수술</td>
						<td>홍길동</td>
						<td>2023-06-12</td>
						<td>2023-06-13</td>
					</tr>
	
					<tr>
						<td>간암수술</td>
						<td>홍길동</td>
						<td>2023-06-12</td>
						<td>2023-06-13</td>
					</tr>
	
					<tr>
						<td>간암수술</td>
						<td>홍길동</td>
						<td>2023-06-12</td>
						<td>2023-06-13</td>
					</tr>
	
					<tr>
						<td>간암수술</td>
						<td>홍길동</td>
						<td>2023-06-12</td>
						<td>2023-06-13</td>
					</tr>
	
					<tr>
						<td>간암수술</td>
						<td>홍길동</td>
						<td>2023-06-12</td>
						<td>2023-06-13</td>
					</tr>
	
					<tr>
						<td>간암수술</td>
						<td>홍길동</td>
						<td>2023-06-12</td>
						<td>2023-06-13</td>
					</tr>
	
	
	
	
				</table>
			</div>


			c:set var="range" value="2" /> 
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
	    
	    
	    
	   
	</script>
	
	
</body>
</html>
