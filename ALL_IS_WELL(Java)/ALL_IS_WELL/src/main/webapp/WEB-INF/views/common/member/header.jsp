<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    * {
        margin: auto;
    }

    #header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        width: 1920px;
        height: 158px;
        padding: 0 20px;
    }

    #header-left {
        display: flex;
    }

    #header-right {
        display: flex;
        align-items: center;
    }

    #header img {
        margin-right: 20px;
    }

    #header img[alt="로고"] {
        width: 300px;
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
        <div id="header-left">
            <img src="${root}/static/img/logo/logo2.png" alt="로고">
        </div>
        <div id="header-right">
            <img alt="메신저" src="#">
            <img alt="메일" src="#">
            <div id="profile">
                <img alt="프로필 사진" src="#">
                <span>
                    <a href="#">마이페이지</a> | <a href="#">로그아웃</a>
                </span>
            </div>
        </div>
    </div>
</body>
</html>
