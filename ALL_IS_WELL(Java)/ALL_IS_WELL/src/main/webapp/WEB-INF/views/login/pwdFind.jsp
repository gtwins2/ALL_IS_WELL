<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<style>

body, *{
    height: 100%;
    width: 100%;
    margin: auto;
}

main{
    display: grid;
    grid-template-columns: 1fr 1fr;
    width: 100%;
    height: 100%;
    margin: 0;
}

#div01{
    display: grid;
    grid-template-rows: 1fr 1fr;
    background-color: #5A8CF2;

    
    color: #FFFFFF;
}

#div01-1{
    font-family: 'Inter';
    font-style: normal;
    font-weight: 700;
    font-size: 50px;
    margin-top: 250px;
    margin-left: 250px;
}

#div01-2{
    margin-left: 250px;
}


#div02{
    display: grid;
    grid-template-rows: 1fr 1fr;
    text-align: center;
}
#div02-3{
	width: 800px;
	height: 450px;
}
#div02-2{
    display: grid;
    grid-template-rows: 1fr 1fr 1fr 1fr;
}

#input{
    border: 0px;
    border-bottom:3px solid #5A8CF2;
    width: 80%;
    font-size: 20px;
    height: 80%;
}

#login{
    width: 80%;
    height: 80%;
    margin: auto;
    background-color: #5A8CF2;
    border: 0px;
    font-family: 'Inter';
    font-style: normal;
    font-weight: 700;
    font-size: 30px;
    color: #FFFFFF;
}

#div02-2 > div:last-child{
    width: 450px;
    text-align: right;
}

a{
    text-decoration-line: none;
    color: inherit;
    font-size: 15px;
}

#div02-1 > div{
    margin: auto;
    margin-top: 50px;
    width: 100%;
    height: 80%;

    border: 0px solid black;
    
}
#modal{
    position: absolute;
    top: 0px;
    left: 37%;
    width: 500px;
    height: 200px;
    display: none;
    grid-template-rows: 1fr 1fr 3fr;
    border: 1px solid black;
    background-color: #5A8CF2;
    
}


#modal > form{
	display: grid;
	grid-template-rows: 1fr 1fr ;
	background-color: #FFFFFF;
	height: 120px;
}

#modal > div:nth-child(1){
    background-color: #5A8CF2;
    font-family: 'Inter';
    font-style: normal;
    font-weight: 700;
    font-size:15px;
    color: #FFFFFF;
    display: flex;
    align-items: center;
}

#modal > div:nth-child(2){
    display: flex;
    align-items: center;
    font-family: 'Inter';
    font-style: normal;
    font-size: 15px;
    background-color: #FFFFFF;
}



#modalBtn{
    width: 200px;
    height: 50px;
	margin-left: 30px;
	background-color: #5A8CF2;
    border: 0px;
    font-family: 'Inter';
    font-style: normal;
    font-weight: 700;
    font-size: 20px;
    color: #FFFFFF;
}
#modalBtn2{
	position:absolute;
    width: 200px;
	height: 50px;
	top:140px;
	left: 260px;
	background-color: #5A8CF2;
    border: 0px;
    font-family: 'Inter';
    font-style: normal;
    font-weight: 700;
    font-size: 20px;
    color: #FFFFFF;
}

#modalInput{
    font-size: 20px;
    border: 1px solid black;
    width: 85%;
    margin-left: 30px;
    height: 80%;
    
}

#certifi{
	width: 50%;
	height: 50%;
	background-color: #5A8CF2;
    border: 0px;
    border-radius:20px;
    font-family: 'Inter';
    font-style: normal;
    font-weight: 700;
    font-size: 15px;
    color: #FFFFFF;
}

#div03{
display: grid;
grid-template-columns: 2fr 1fr ;
}

#div03 > input{
 border: 0px;
 border-bottom:3px solid #5A8CF2;
 height: 80%;
 width: 70%;
 } 
</style>
<body>
    
    <main>
        <div id="div01">
            <div id="div01-1">ALL IS WELL</div> 
            <div id="div01-2">Connect, Collaborate, and Manage <br> for Medical Innovation</div> 
        </div>
        <div id="div02">
            <div id="div02-3">
                <div><img src="/app/resources/static/img/logo/회원 로그인 로고.jpg" alt=""></div>
            </div>
            <div id="div02-2">
            	<form action="/app/member/send-one" method="post">
            		<div id="div03">
    					<input type="text" placeholder="핸드폰 번호" name="id" >        		
	                	<button id="certifi">인증번호 요청</button>
            		</div>
                </form>
                <div><input type="text" placeholder="아이디" name="id" id="input" class="input2"></div>
                <div><input type="password" placeholder=" 변경할 비밀번호" name="password" id="input" class="input"></div>
                
	                <button id="login">비밀번호 재설정</button>
                
                <div></div>
            </div>
            
        </div>
    </main>
     <div id="modal">
        <div>비밀번호 재설정</div>
        <div>&nbsp&nbsp&nbsp&nbsp&nbsp휴대전화로 전송된 인증번호를 입력하세요.</div>
        <form action="/app/member/certification" method="post">
        <input type="text" name="password" id="total" hidden>
        <input type="text" name="id" id="totalId" hidden>
        <input type="text" name="n" value="${n}" hidden>
        <div><input type="text" id="modalInput" name="number" ></div>
        <div>
            <input type="submit" id="modalBtn" value="확인">
        </div>
        </form>
            <button id="modalBtn2" onclick="cancel()">취소</button>

    </div>
</body>
</html>
<script>
    const login = document.querySelector('#login');
    const modal = document.querySelector('#modal');
    const body = document.querySelector('main');
    
    $(".input").change(function(){
		email();	
	});
    
    $(".input2").change(function(){
		email2();	
	});
	
	
	
    login.addEventListener('click', () => {
        modal.style.display = 'grid';
        body.style. opacity = 0.5;
      });
    
    function cancel() {
    	modal.style.display = 'none';
        body.style. opacity = 1;
	}
    
    

	function email() {
		const input = $(".input").val();
		
		if(input != "") {
			$("#total").val(input);
		}
	};
	
	function email2() {
		const input2 = $(".input2").val();
		
		if(input != "") {
			$("#totalId").val(input2);
		}
	};
</script>