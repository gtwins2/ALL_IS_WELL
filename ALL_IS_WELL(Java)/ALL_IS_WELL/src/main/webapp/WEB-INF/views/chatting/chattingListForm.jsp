<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅 목록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/794ac64f16.js" crossorigin="anonymous"></script>
    <style>
        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }

        body {
            box-sizing: border-box;
        }
        

        .main-wrap {
            box-sizing: border-box;
            width: 450px;
            height: 600px;
            background-color: white;
           
            position: relative; /* Added position relative */
        }

        .search-area {
            margin-top: 20px;
            margin-left: 80px;
            position: relative;
            width: 350px;
             
        }

        #search {
            width: 80%;
            height: 40px;
            border: none;
            background-color: lightgray;
            border-radius: 5px;
            padding-left: 35px;
        }

        #icon {
            position: absolute;
            width: 25px;
            top: 10px;
            left: 10px;
            color: gray;
        }

        .detail-area {
            display: flex;
            align-items: center;
            padding: 13px;
            /* border-bottom: 1px solid lightgray; */
        }

        .profile-image {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            margin-right: 10px;
        }

        .details {
            display: flex;
            flex-direction: column;
            justify-content: center;
            flex: 1;
        }

        #status {
            width: 50px;
            height: 15px;
            background-color: #5A8CF2;
            color: white;
            border-radius: 10px;
            font-size: 11px;
            font-weight: normal;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 5px;
            text-transform: uppercase;
            margin-bottom: 5px;
        }

        #name {
            font-weight: normal;
            font-size: 15px;
        }

        #date {
            font-size: 10px;
        }

        #plus {
            width: 50px;
            height: 50px;
            position: absolute;
            bottom: 20px;
            right: 20px;
            border: none;
            border-radius: 50px;
            background: #5A8CF2;
            font-size: 24px;
            color: white;
            padding: 12px;
            font-weight: bold;
            box-shadow: 0px 5px 15px gray;
            cursor: pointer;
            position: fixed;
        }

      


		#plus:hover {
		    background-color: #555;
		}

		.detail-area {
			cursor: pointer;
		}
    
    </style>
</head>
<body>
	<div class="main-wrap">
        <form action="/app/chatting/chattingList" method="GET">
            <div class="search-area">
                <i class="fa-solid fa-magnifying-glass" id="icon"></i>
                <input id="search" type="search" name="searchValue">
            </div>
        </form>
        
        <br>
        <hr>
    
        <div class="list-area">
        	<c:forEach items="${chatList}" var="list">
			    <div class="detail-area">
			        <input type="hidden" name="chattingRoomNo" value="${list.chattingRoomNo}" id="chattingRoomNo">
			
			        <c:choose>
			            <c:when test="${currentUserNo eq list.receiverNo}">
			                <img src="/app/resources/static/profile/${list.senderProfile}" alt="" class="profile-image">
			            </c:when>
			            <c:otherwise>
			                <img src="/app/resources/static/profile/${list.receiverProfile}" alt="" class="profile-image">
			            </c:otherwise>
			        </c:choose>
			
			        <div class="details">
			            <c:choose>
			                <c:when test="${currentUserNo eq list.receiverNo}">
			                	<c:if test="${list.senderAttendanceStatus eq 'O'}">
			                		 <div id="status">출근</div>
			                	</c:if>
			                	
			                	<c:if test="${list.senderAttendanceStatus eq 'X' or empty list.senderAttendanceStatus}">
			                		 <div id="status">출근 전</div>
			                	</c:if>
			                    <div id="name">${list.senderName}(${list.senderDepartmentName} ${list.senderPositionName})</div>
			                </c:when>
			                <c:otherwise>
			                	<c:if test="${list.receiverAttendanceStatus eq 'O'}">
			                		 <div id="status">출근</div>
			                	</c:if>
			                	
			                	<c:if test="${list.receiverAttendanceStatus eq 'X' or empty list.receiverAttendanceStatus}">
			                		 <div id="status">출근 전</div>
			                	</c:if>
			                    <div id="name">${list.receiverName}(${list.receiverDepartmentName} ${list.receiverPositionName})</div>
			                </c:otherwise>
			            </c:choose>
			        </div>
			    </div>
			</c:forEach>

            
        </div>

        

        <button id="plus"><i class="fa-solid fa-plus" style="color: #ffffff;"></i></button>
    </div>
    
    <script type="text/javascript">
    	
    	
    const detailAreas = document.querySelectorAll(".detail-area");

    detailAreas.forEach((detailArea) => {
      detailArea.addEventListener("click", function () {
        const chattingRoomNo = this.querySelector("#chattingRoomNo").value;
        console.log(chattingRoomNo);
        
        
        
        location.href = "/app/chatting/chattingDetail?chattingRoomNo=" + chattingRoomNo;
        
      });
    });
    	
    
  

    
    	const plusButton = document.querySelector("#plus");
    	plusButton.addEventListener("click", function(){
    		location.href = "/app/chatting/chattingResult";
    	});
    </script>
</body>
</html>