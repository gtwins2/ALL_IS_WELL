<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅방 상세조회</title>
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
            border: 1px solid black;
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
		    font-size: 18px;
		}
		
		#title-status {
		    margin-top: 10px;
		    width: 80px;
		    height: 30px;
		    background-color: #5A8CF2;
		    border-radius: 15px;
		    color: white;
		    font-weight: bold;
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    font-size: 14px;
		    text-transform: uppercase;
		    letter-spacing: 1px;
		    box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
		}
		#list-icon {
		    font-size: 24px;
		}
		
		#list-icon i {
		    margin-right: 10px;
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
		    width: 550px;
		    height: 90%;
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

    </style>
</head>
<body>
	<div class="main-wrap">
        <div class="title-area">
            <img src="" alt="프로필 사진" id="title-profile">
            <div class="title-name-area">
                <div id="title-name">조의사(성형외과 레지던트)</div>
                <div id="title-status">출근중</div>
            </div>
            <div id="list-icon">
                <i class="fa-solid fa-ufo"></i>
                <i class="fas fa-bars" style="color: #000000;"></i>
            </div>
        </div>
        
        <div class="content-area">
            <div class="chat-me">
                <div class="profile-Image"><img src="" alt=""></div>
                <div class="content">
                    <div class="name">박의사</div>
                    <div class="textbox">안녕하세요. 반갑습니다.
                         저는 박의사라고 합니다 ㅎㅎ</div>
                    <div class="date">2023-05-18 15:30</div>  
                </div>
                <div class="mark-read">1</div>
            </div>
    
            <div class="chat-opponent">
                <div class="content">
                    <div class="textbox">안녕하세요. 반가워요~ 저는 지세연이라고 합니다!!</div>
                    <div class="date">2023-05-18 15:30</div> 
                </div>
                <div class="mark-read">1</div>
            </div>

            <div class="chat-me">
                <div class="profile-Image"><img src="" alt=""></div>
                <div class="content">
                    <div class="name">박의사</div>
                    <div class="textbox">안녕하세요. 반갑습니다.
                         저는 박의사라고 합니다 ㅎㅎ</div>
                    <div class="date">2023-05-18 15:30</div>  
                </div>
                <div class="mark-read">1</div>
            </div>

            <div class="chat-opponent">
                <div class="content">
                    <div class="textbox">안녕하세요. 반가워요~ 저는 지세연이라고 합니다!!</div>
                    <div class="date">2023-05-18 15:30</div> 
                </div>
                <div class="mark-read">1</div>
            </div>

            <div class="chat-me">
                <div class="profile-Image"><img src="" alt=""></div>
                <div class="content">
                    <div class="name">{name}</div>
                    <div class="textbox">{msg}</div>
                    <div class="date">{time}</div>  
                </div>
                <div class="mark-read">1</div>
            </div>

            <div class="chat-opponent">
                <div class="content">
                    <div class="textbox">안녕하세요. 반가워요~ 저는 지세연이라고 합니다!!</div>
                    <div class="date">2023-05-18 15:30</div> 
                </div>
                <div class="mark-read">1</div>
            </div>
        </div>

        <div class="chat-area">
            <form action="" method="post">
                <div class="send-area">
                    <input type="text" name="chat" id="chat-box">
                    <button id="send"><i class="fas fa-paper-plane"></i></button>
                </div>
            </form>
            
        

        </div>
    </div>
    
    
    
    <script type="text/javascript">
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
		
		//웹소켓 메시지 받았을때
	/* 	ws.onmessage = funcMessage; */
		
		
		//웹소켓 오픈되었을때 실행되는 함수
		function funcOpen() {
			console.log("소켓 연결됨");
		}
		
		//웹소켓 닫았을때 실행되는 함수
		function funcClose() {
			console.log("소켓 닫힘");
		}
		
		//웹소켓 에러가 날 때 실행되는 함수
		function funcError() {
			console.log("소켓 에러남");
		}
		
		
		//웹소켓 메시지 받았을때 실행되는 함수
		
		
	
		
		//버튼 클릭시 웹소켓 메시지 보내기
		function f01() {
			const userMsg = document.querySelector("#msg").value;
			
			ws.send(userMsg);
		}
		
		/* function updateChatMessage(name, msg, time) {
			<div class="chat-me">
            <div class="profile-Image"><img src="" alt=""></div>
            <div class="content">
                <div class="name">{name}</div>
                <div class="textbox">{msg}</div>
                <div class="date">{time}</div>  
            </div>
            <div class="mark-read">1</div>
        </div>
		} */
	</script>
</body>
</html>