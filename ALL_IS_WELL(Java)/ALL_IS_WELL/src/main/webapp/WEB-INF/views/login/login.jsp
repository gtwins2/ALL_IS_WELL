<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

#div02-2{
    display: grid;
    grid-template-rows: 1fr 1fr 1fr 0.5fr;
}

input{
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

form > div:nth-child(4) {
   margin-right: 100px;
}

img{
    margin: auto;
    width: 80%;
    height: 80%;
}

</style>
<body>
    
    <main>
        <div id="div01">
            <div id="div01-1">ALL IS WELL</div> 
            <div id="div01-2">Connect, Collaborate, and Manage <br> for Medical Innovation</div> 
        </div>
        
        <div id="div02">
            <img src="/app/resources/static/img/logo/회원 로그인 로고.jpg" alt="logo">
            <form action="/app/member/login" method="POST" id="div02-2">
                <div><input type="text" placeholder="아이디를 입력하세요" name="id"></div>
                <div><input type="password" placeholder="비밀번호를 입력하세요" name="password"></div>
                <input type="submit" id="login" value="로그인" function="error();">
                <div><a href="/app/member/idFind">아이디 찾기</a>&nbsp;ㅣ&nbsp;<a href="/app/member/pwdFind">비밀번호 찾기</a></div>
            </form>
            
        </div>

        
    </main>
</body>
</html>
<script>
    function error(){
        
    }

</script>