<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅방</title>
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
            width: 600px;
            height: 800px;
            background-color: white;
            /*border: 1px solid black;*/
        }

        .title-area {
		    height: 80px;
		    width: 100%;
		    display: flex;
		    justify-content: space-between;
		    align-items: center;
		    padding: 20px;
		    box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
		}
		
		#title-profile {
		    width: 60px;
		    height: 60px;
		    border-radius: 50%;
		    background-color: white;
		    object-fit: cover;
		    box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
		}
		
		.title-name-area {
		    display: flex;
		    flex-direction: column;
		    margin-left: 0px;
		    margin-right: 180px;
		}
		
		#title-name {
		    font-weight: bold;
		    font-size: 15px;
		}
		
		#title-status {
		    margin-top: 10px;
		    width: 60px;
		    height: 20px;
		    background-color: #5A8CF2;
		    border-radius: 15px;
		    color: white;
		    font-weight: bold;
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    font-size: 11px;
		    text-transform: uppercase;
		    letter-spacing: 1px;
		    box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
		}
		#list-icon {
		    font-size: 18px;
		}
		
		#list-icon i {
		    margin-right: 15px;
		}
		
		
		.content-area {
		    padding: 20px;
		    overflow: auto;
		    width: 100%;
		    height: 80%;
		}
		
		.chat-me {
		    display: flex;
		    align-items: flex-start;
		    margin-bottom: 20px;
		}
		
		.profile-Image {
		    position: relative;
		    overflow: hidden;
		    width: 50px;
		    height: 50px;
		    border-radius: 50%;
		    background-color: #eee;
		}
		
		.profile-Image img {
		    width: 100%;
		    height: 100%;
		    object-fit: cover;
		}
		
		.content {
		   display: flex;
		    flex-direction: column;
		    margin-left: 10px;
		    
		    padding: 10px;
		}
		
		
		
		.chat-me .textbox {
		    width: 100%;
		    height: 100%;
		    background-color: #E0E0E0;
		    border-radius: 5px;
		    color: black;
		    padding: 10px 10px;
		}
		
		
		.date {
		    font-size: 12px;
		    color: gray;
		}
		
		.mark-read {
		    font-size: 5px;
		    margin-top: 45px;
		}
		
		.chat-opponent {
		    display: flex;
		    flex-direction: row-reverse;
		    margin-bottom: 20px;
		}
		
		.name {
		    font-size: 11px;
		
		}
		
		.chat-opponent  .textbox {
		    background-color: #5A8CF2;
		    border-radius: 5px;
		    height: 100%;
		    width: 100%;
		    color: white;
		    padding: 10px 10px;
		
		}
		
		.chat-area {
		    margin: 0 auto;
		    border-top: 1px solid lightgray;
		}
		
		.send-area {
		    display: flex;
		    align-items: center;
		    padding: 10px;
		    background-color: #F4F4F4;
		    border-top: 1px solid lightgray;
		    height: 75px;
		}
		
		.send-area input {
		    padding: 8px;
		    border: none;
		    border-radius: 20px;
		    background-color: white;
		    font-size: 14px;
		    border: 1px solid black;
		    width: 500px;
		    height: 80%;
		}
		
		#send {
		    margin-left: 10px;
		    background-color: #5A8CF2; 
		    border: none;
		    width: 50px; 
		    height: 50px; 
		    border-radius: 50%; 
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    cursor: pointer;
		    box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.2);
		    color: white;
		}
		
		#send i {
		    font-size: 20px;
		}
		
		#menu {
		  position: absolute;
		  background-color: white;
		  border: 1px solid #ccc;
		  padding: 10px;
		  border-radius: 5px;
		  transform: translateY(calc(-900%));
		  transition: all 0.3s ease;
		  right: 0;
		  z-index: 1000;
		}
		
		#menu.hidden {
		  transform: translateY(0%);
		  opacity: 0;
		  pointer-events: none;
		}
		
		ul {
		  list-style-type: none;
		  margin: 0;
		  padding: 0;
		}
		
		li {
		  margin-bottom: 10px;
		}
		
		a {
		  text-decoration: none;
		  color: #333;
		  font-size: 16px;
		}	

    </style>
</head>
<body>
	<div class="main-wrap">
        <div class="title-area">
             <img src="/app/resources/static/profile/${receiver.profile}" alt="" id="title-profile">
            <div class="title-name-area">
                <div id="title-name">${receiver.name}(${receiver.departmentName} ${receiver.positionName})</div>
               	<c:if test="${receiver.attendanceStatus eq 'O'}">
                		 <div id="title-status">출근</div>
                	</c:if>
                	
                	<c:if test="${receiver.attendanceStatus eq 'X' or empty receiver.attendanceStatus}">
                		 <div id="title-status">출근 전</div>
                	</c:if>
            </div>
            <div id="list-icon">
                <i class="fa-solid fa-ufo"></i>
                <i class="fas fa-bars" style="color: #000000;"></i>
            </div>
        </div>
        
        <div class="content-area">
            
        </div>

        <div class="chat-area">
            <form action="">
            	<div class="send-area">
                <input type="text" name="chat" id="chat-box">
                <button id="send"><i class="fas fa-paper-plane"></i></button>
            </div>
            </form>
        </div>
    </div>
    
    
     
    <div id="menu" class="hidden">
	  <ul>
	    <li><a id="quitChattingBtn">나가기</a></li>
	    <li><a href="/app/chatting/chattingList">목록으로</a></li>
	  </ul>
	</div>


    <script type="text/javascript">
    	let chattingRoomNo = "${roomVo.chattingRoomNo}";
    	
    
    
		const resultDiv = document.querySelector("#result");
		
		//웹소켓 만들기
		//()안에 연결할 경로 지정하기
		//http:// 는 비연결형 통신방식이기 때문에 이 경로를 사용하면 안됨
		//그래서 웹소켓 프로토콜을 사용해야 한다.
		//그래서 앞에 ws:를 다는 것이다.
		let ws = new WebSocket("ws://127.0.0.1:8888/app/chatting");
		
		//웹소켓이 오픈되었을때 
		ws.onopen = funcOpen;
		
		//웹소켓 연결이 끝났을때
		ws.onclose = funcClose;
		
		//웹소켓 에러가 날때
		ws.onerror = funcError;
		
		const contentArea = document.querySelector(".content-area");
		
		 const messageInput = document.querySelector("#chat-box");
		    const sendButton = document.querySelector("#send");

		    sendButton.addEventListener("click", function (event) {
		    	const messengerContent = messageInput.value;
				  

				 

				  $.ajax({
				    url: "/app/chatting/saveMessage",
				    type: "POST",
				    data: JSON.stringify({ 
				        messengerContent: messengerContent,
				        chattingRoomNo: chattingRoomNo
				      }),
				      contentType: "application/json",
				      dataType: "text",
				      success: function(response) {
		                  console.log("메시지 잘 전달됨 :", response);
		              },
				    error: function(xhr, status, error) {
				    	console.error("메시지 저장 실패 - Status:", status, "Error:", error, "Response Text:", xhr.responseText);
				    }
				  });

		    	
		        


		        ws.send(messengerContent);
		        
		        
		        event.preventDefault();

		     	messageInput.value = "";
		    });


		    let messageDiv;

		    // 서버에서 메시지를 수신할 경우 실행되는 코드
		    ws.onmessage = function(event) {
		        const message = JSON.parse(event.data);

		        
		        const senderNo = message.no;
		        console.log(senderNo);
		        const currentUserNo = ${sessionScope.loginMember.no};
		        console.log(currentUserNo);
		        const senderName = message.name;
		        console.log(senderName);
		        const messageContent = message.msg;
		        console.log(messageContent);
		        const timeStamp = message.time;
		        console.log(timeStamp);
		        const senderProfilePicture = message.profile;


		        
		        //로그인한 사람이 보냈을 경우
		        if (currentUserNo == senderNo) {
		        	messageDiv = document.createElement("div");
		        	
		            messageDiv.classList.add("chat-opponent");
		            
		            const contentDiv = document.createElement("div");
		            contentDiv.classList.add("content");

		            const textboxDiv = document.createElement("div");
		            textboxDiv.classList.add("textbox");
		            textboxDiv.textContent = messageContent;

		            const dateDiv = document.createElement("div");
		            dateDiv.classList.add("date");
		            dateDiv.textContent = timeStamp;

		            contentDiv.appendChild(textboxDiv);
		            contentDiv.appendChild(dateDiv);

		          
		            messageDiv.appendChild(contentDiv);


		            contentArea.appendChild(messageDiv);
		        } else {
					const messageDiv = document.createElement("div");
		        	
		            messageDiv.classList.add("chat-me");
		            
		           
		            const profilePictureDiv = document.createElement("div");
		            profilePictureDiv.classList.add("profile-picture");
		            const profilePictureImg = document.createElement("img");
		            profilePictureImg.setAttribute("src", senderProfilePicture);
		            profilePictureImg.setAttribute("alt", senderName);
		            profilePictureDiv.appendChild(profilePictureImg);

		            const contentDiv = document.createElement("div");
		            contentDiv.classList.add("content");

		            const senderNameDiv = document.createElement("div");
		            senderNameDiv.classList.add("sender-name");
		            senderNameDiv.textContent = senderName;

		            const textboxDiv = document.createElement("div");
		            textboxDiv.classList.add("textbox");
		            textboxDiv.textContent = messageContent;

		            const dateDiv = document.createElement("div");
		            dateDiv.classList.add("date");
		            dateDiv.textContent = timeStamp;

		            contentDiv.appendChild(senderNameDiv);
		            contentDiv.appendChild(textboxDiv);
		            contentDiv.appendChild(dateDiv);

		            messageDiv.appendChild(profilePictureDiv);
		            messageDiv.appendChild(contentDiv);

		            contentArea.appendChild(messageDiv);
		        }

		       
		    };
		
		//웹소켓 오픈되었을때 실행되는 함수
		function funcOpen() {
			console.log("소켓 연결 성공!");
		}
		
		//웹소켓 닫았을때 실행되는 함수
		function funcClose() {
			console.log("소켓 닫힘");
		}
		
		//웹소켓 에러가 날 때 실행되는 함수
		function funcError() {
			console.log("소켓 에러남");
		}
		
		
		
		
		//모달
		function toggleMenu() {
		  const menu = document.querySelector("#menu");
		  menu.classList.toggle("hidden");
		}
		
		document.querySelector("#list-icon").addEventListener("click", function () {
		  toggleMenu();
		});
		
	</script>
</body>
</html>