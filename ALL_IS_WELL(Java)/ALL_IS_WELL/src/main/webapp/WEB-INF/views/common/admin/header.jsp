<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<style>
    * {
        margin: auto;
    }

    #header {
        display: grid;
        grid-template-columns: 150px 1550px 220px;
        align-items: center;
        width: 1920px;
        height: 100px;
        border-bottom: 0.5px solid darkgray;
    }

   

    #header img {
        margin-right: 20px;
    }

    #header img[alt="로고"] {
        width: 150px;
        height: 100px;
    }

    #header span a {
        margin-right: 15px;
    }

    #profile {
        display: flex;
        flex-direction: column;
        align-items: center;
        margin-right: 20px;
    }

    #profile img {
        width: 40px;
        height: 40px;
        border-radius: 50%;
        margin-bottom: 5px;
    }
    
   
	
   
</style>
</head>
<body>
    <div id="header">
        <a href="${root}/Amain">
            <div id="header-left">
                <img src="/app/resources/static/img/logo/adminlogo.png" alt="로고">
            </div>
        </a>
        
        <div id="header-center">

        </div>
        <div id="header-right">
            
            <div id="profile">
                <img alt="프로필 사진" src="#">
                <span>
                    <a href="#">로그아웃</a>
                </span>
            </div>
        </div>
    </div>
</body>
</html>
