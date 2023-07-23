<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수술 일정 상세</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
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
	            justify-content: space-between;
	        }

        #title {
            font-size: 28px;
            margin-top: 10px;
            margin-left: 140px;
        }


        .register-area {
               margin: auto;
        width: 80%;
        height: 800px;
        	height: 50%;
            margin: 0 auto;
            margin-top: 20px;
            background: #FFFFFF;
            border: 1px solid #C4C4C4;
            box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
            border-radius: 20px;
             padding: 30px;
        }

        #registerForm {
       
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
            padding: 30px;
            row-gap: 50px;
        }

        .area {
            display: flex;
            flex-direction: row;
            align-items: center;
            margin-bottom: 20px;
        }

        .area span {
            width: 20%;
            margin-right: 10px;
            font-size: 15px;
        }

        .area input[type="text"],
        .area textarea,
        .area input[type="datetime-local"] {
        	flex: 1;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            transition: border-color 0.3s;
        }

        .area input[type="text"]:focus,
        .area textarea:focus,
        .area input[type="datetime-local"]:focus {
            outline: none;
            border-color: #5A8CF2;
        }

        .area input[type="button"] {
            font-size: 16px;
            color: white;
            background-color: #5A8CF2;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .area input[type="button"]:hover {
            background-color: #555;
        }

        .area textarea {
            resize: none;
            height: 100%;
        }

        #people {
            width: 50%;
            height: 100%;
        }

        .btn-area {
            margin: 0 auto;
            display: flex;
            justify-content: flex-end;
            align-items: center;
            margin-right: 140px;
            margin-top: 30px;
        }

        #addBtn {
        	
            padding: 10px 20px;
            background-color: #5A8CF2;
            border: none;
            font-weight: bold;
            font-size: 15px;
            color: white;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        #addBtn:hover {
            background-color: #555;
        }

        #backBtn {
            padding: 10px 20px;
            background-color: #5A8CF2;
            border: none;
            font-weight: bold;
            font-size: 15px;
            color: white;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
            margin-left: 20px;
        }

        #backBtn:hover {
            background-color: #555;
        }

        .modal {
            
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.4);
		}

			.modal-content {
			    border-radius: 10px;
			  background-color: #fefefe;
			  margin: 15% auto;
			  padding: 20px;
			  border: 1px solid #888;
			  width: 80%;
			  max-width: 1000px;
			
			}
			
			.close {
			  color: #aaa;
			  float: right;
			  font-size: 28px;
			  font-weight: bold;
			  cursor: pointer;
			}
			
			.close:hover,
			.close:focus {
			  color: black;
			  text-decoration: none;
			  cursor: pointer;
			}

		#modal-title {
		    text-align: center;
		    font-size: 25px;
		    font-weight: bold;
		}

        .search-area {
                    text-align: center;
                    display: flex;
                    justify-content: center;
                    align-items: center;
                }

        

        .search-area input[type="text"] {
            padding: 5px;
            margin-right: 20px;
            width: 500px;
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
        
        

        .search-result {
		  display: flex;
		  justify-content: space-between;
		  align-items: center;
		  padding: 5px;

		}

		.search-result div {
		  flex: 1;
		  text-align: center;
		}

		.search-result input[type="checkbox"] {
		  transform: scale(1.5);
		}

		.result-title {
		  font-weight: bold;
		  font-size: 20px;
		 
		  padding: 5px;
		}
		
		.search-result-deco {
			font-weight: normal;
			font-size: 15px;
			padding: 10px;
			
		}
		
		.result-area {
		  display: flex;
		  justify-content: center;
		  justify-content: space-around;
		  padding-bottom: 10px;
		 
		}
		
		.modal-btn-area {
		    display: flex;
		    justify-content: end;
		
		}
		
		.modal-btn {
		    padding: 10px 20px;
		            background-color: #5A8CF2;
		            border: none;
		            font-weight: bold;
		            font-size: 20px;
		            color: white;
		            border-radius: 5px;
		            cursor: pointer;
		            transition: background-color 0.3s;
		            margin-left: 30px;
		}
		
		
	    #closeBtn {
	        background-color: #aaa;
	    }
	    
	    #searchBtn {
	    	padding: 10px 20px;
            background-color: #5A8CF2;
            border: none;
            font-weight: bold;
            font-size: 15px;
            color: white;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
           
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
                <div id="title">수술 일정 상세</div>
           	</div>

           	<div class="register-area">
                <form action="/app/operation/operationDetail" id="registerForm" method="POST">
                    <div class="area">
                        <span>수술명</span>
                        <input type="text" name="operationName" value="${schedule.operationName}" readonly>
                    </div>
                    
                    <div class="area">
                        <span>환자이름</span>
                        <input type="text" name="patientName" value="${schedule.patientName}" readonly>
                    </div>
                
                    <div class="area">   
                        <span>시작시간</span>
                        <input type="datetime-local" name="startDate" value="${schedule.startDate}" readonly>
                    </div>

                    <div class="area">
                        <span>종료시간</span>
                        <c:if test="${empty schedule.endDate}">
						    <input type="datetime-local" name="endDate">
						</c:if>
						<c:if test="${not empty schedule.endDate}">
						    <input type="datetime-local" value="${schedule.endDate}" readonly>
						    <%-- <input type="hidden" name="endDate" value="${schedule.endDate}"> --%>
						</c:if>
                   
                    </div>

                    <div class="area">
                        <span>수술내용</span>
                        <textarea id="" cols="30" rows="10" name="operationRecord" readonly>${schedule.operationRecord}</textarea>
                    </div>

                    <div class="area">
                        <span>참여인원</span>
                        <textarea name="people" id="people" style="overflow: auto; resize: none;" readonly>${voData }</textarea>
                        <textarea name="participantNumbers" id="participantNumbers" style="display: none;" readonly></textarea>
                         <input type="hidden" name="operatingRoomNo" value="${schedule.operatingRoomNo}" />
                         <input type="hidden" name="operationNo" value="${schedule.operationNo}" />
                        
                    </div>

                
                </form>
            </div>    
           
           	
           	<div class="btn-area">
            	<input type="submit" value="수정" id="addBtn">
            	<button id="backBtn" onclick="goBack();">뒤로가기</button>
        	</div>
           	
           	
           	
        </div>
        
		
    </main>

    

</div>


   <footer>
      <%@ include file="/WEB-INF/views/common/member/footer.jsp" %>
   </footer>
   
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
	   
	
	
	   
	   function submitForm() {
	        document.getElementById('registerForm').submit();
	    }

	    //뒤로가기 버튼
	    function goBack() {
	        window.history.back();
	    }

	    //제출하기
	    const submitBtn = document.getElementById('addBtn');
	    submitBtn.addEventListener('click', function(event) {
	        event.preventDefault();
	        submitForm(); 
	        alert("수정 완료");
	    });
   </script>
   
 
	
	
</body>
</html>
