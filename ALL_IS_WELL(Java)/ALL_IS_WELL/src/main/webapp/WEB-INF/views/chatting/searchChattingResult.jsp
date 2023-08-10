<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅 추가하기</title>
<script src="https://kit.fontawesome.com/794ac64f16.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
            margin-top: 30px;
            margin-left: 100px;
            position: relative;
            width: 450px;
             
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

        #conversationButton {
            width: 60px;
            height: 30px;
            bottom: 20px;
            border: none;
            border-radius: 10px;
            background: #5A8CF2;
            font-size: 13px;
            color: white;
            /* padding: 15px 15px; */
            font-weight: bold;
           
            cursor: pointer;
        }

      


		#conversationButton:hover {
		    background-color: #555;
		}
		
		hr {
		  border-style: solid;
		  border-color: #d3d3d3;
		  border-width: 1px 0 0;
		  margin: 20px 0;
		}

    
    </style>
</head>
<body>
	<div class="main-wrap">
        <form action="/app/chatting/searchMember" method="GET">
            <div class="search-area">
                <i class="fa-solid fa-magnifying-glass" id="icon"></i>
                <input id="search" type="search" placeholder="이름 검색" name="searchValue">
            </div>
        </form>
        
        <br>
        <hr>
    
        <div class="list-area">
        	<c:forEach items="${chatList}" var="list">
        		<div class="detail-area">
                <img src="/app/resources/static/profile/${list.receiverProfile}" alt="" class="profile-image">
                <div class="details">
                	<c:if test="${list.receiverAttendanceStatus eq 'O'}">
                		 <div id="status">출근</div>
                	</c:if>
                	
                	<c:if test="${list.receiverAttendanceStatus eq 'X' or empty list.receiverAttendanceStatus}">
                		 <div id="status">출근 전</div>
                	</c:if>
                   
                    <div id="name">${list.receiverName}(${list.receiverDepartmentName} ${list.receiverPositionName})</div>
                    
                    <button id="conversationButton">대화하기</button>
                </div>
                
            </div>
        	</c:forEach>
            

            
        </div>       
    </div>
    
    <script type="text/javascript">
	    $(document).ready(function () {
	        // 검색 입력창의 입력 이벤트 처리
	        $("#search").on("input", function () {
	            var searchInput = $(this).val();
	
	            // 서버에 문자열 쿼리를 전송
	            $.ajax({
	                url: "/app/chatting/searchMember", // 검색 결과를 반환하는 라우트 변경
	                type: "GET",
	                data: { searchInput: searchInput },
	                success: function (data) {
	                    // 응답 처리, 대화 목록을 업데이트하거나 필터링
	                    updateConversationList(data);
	                },
	                error: function (error) {
	                    console.error("Error :", error);
	                },
	            });
	        });
	    });

	    function updateConversationList(searchResults) {
	        var listArea = $(".list-area");

	        listArea.empty(); // 현재 목록 지우기

	        // 응답 데이터를 기반으로 목록 업데이트 (UPDATED)
	        $.each(searchResults, function (index, result) {
	            console.log(result.name);
	            console.log(result.departmentName);
	            console.log(result.attendanceStatus);

	            // 요소 생성
	            var detailArea = $('<div>').addClass('detail-area');
	            var profileImage = $('<img>').addClass('profile-image').attr('src', '/app/resources/static/profile/' + result.profile);
	            var details = $('<div>').addClass('details');
	            var statusElement = result.attendanceStatus === "O" ? $('<div>').attr('id', 'status').text('출근') : $('<div>').attr('id', 'status').text('출근 전');
	            var nameElement = $('<div>').attr('id', 'name').text(result.name + '(' + result.departmentName + ' ' + result.positionName + ')');
	            var conversationButton = $('<button>').attr('id', 'conversationButton').addClass('conversation-btn').attr('data-no', result.no).text('대화하기');
	            
	            // 요소 조립
	            details.append(statusElement).append(nameElement);
	            detailArea.append(profileImage).append(details).append(conversationButton);
	            listArea.append(detailArea);
	        });

	        // 대화하기 버튼에 이벤트 리스너 추가
	        $(".conversation-btn").on("click", function () {
	            var no = $(this).data("no");
	            location.href = "/app/chatting/createNewChatRoom?receiverNo=" + no;
	        });
	    }


    </script>
   
</body>
</html>