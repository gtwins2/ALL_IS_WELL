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
    width: 99%;
    height: 99%;
    margin: auto;
}




#div01{
    display: grid;
    grid-template-rows: 1fr 1fr;
    background-color: #FF8686;

    
    color: #FFFFFF;
}

#div01-1{
    font-family: 'Inter';
    font-style: normal;
    font-weight: 700;
    font-size: 50px;
    margin-top: 250px;
    margin-left: 100px;
}

#div01-2{
    margin-left: 100px;
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
    border-bottom:3px solid #FF8686;
    width: 80%;
    font-size: 30px;
    height: 80%;
}


#login{
    width: 80%;
    height: 80%;
    margin: auto;
    background-color: #FF8686;
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
    width: 250px;
    height: 250px;
    border: 0px solid black;
}



</style>
<body>
    
    <main>
        <div id="div01">
            <div id="div01-1">ALL IS WELL</div> 
            <div id="div01-2">Connect, Collaborate, and Manage <br> for Medical Innovation</div> 
        </div>
        
        <div id="div02">
            <div id="div02-1">
                <div><img src="/app/resources/static/img/logo/관리자로고.jpg" alt="logo"></div>
            </div>
             <form action="/app/member/Alogin" method="POST" id="div02-2">
                <div><input type="text" placeholder="아이디를 입력하세요" name="adminId"></div>
                <div><input type="password" placeholder="비밀번호를 입력하세요" name="adminPwd"></div>
                <input type="submit" id="login" value="로그인">
                <div><a href="#">아이디 찾기</a>&nbsp;ㅣ&nbsp;<a href="#">비밀번호 찾기</a></div>
            </form>
            
        </div>

        
    </main>
</body>
</html>