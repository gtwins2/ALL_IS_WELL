<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<c:set var="root" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    * {
        margin: auto;
    }

    #header {
        display: grid;
        grid-template-columns: 150px 1370px 400px;
        align-items: center;
        width: 1920px;
        height: 100px;
        border-bottom: 0.5px solid darkgray;
    }

    #header-right {
        text-align: right;
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

    #header-right{
        display: grid;
        grid-template-columns: 1fr 1fr 3fr;
    }

    #header-right div{
        margin: auto;
    }

    .fas.fa-comments, .fas.fa-envelope {
        font-size: 40px;
        color: #878787;
    }
</style>
</head>
<body>
    
    <div id="header">
        <a href="${root}/Mmain">
            <div id="header-left">
                <img src="/app/resources/static/img/logo/logo2.png" alt="로고" onclick="">
            </div>
        </a>
        <div id="header-center">

        </div>
        <div id="header-right">
            <div id="messenger">
                
            </div>
            <div id="mail">
                <i class="fas fa-comments"></i>
            </div>
            <div id="profile">
                <img alt="프로필 사진" src="/app/resources/static/profile/${loginMember.profile}">
                <span>
                    <a href="${root}/mypageMember">마이페이지</a> | <a href="${root}/member/logout">로그아웃</a>
                </span>
            </div>
        </div>
    </div>
    
    
    
    <script>
		document.addEventListener('DOMContentLoaded', function() {
		    var messengerIcon = document.querySelector('#mail i');
		    if (messengerIcon) {
		      messengerIcon.addEventListener('click', function() {
		    	  const width = 600;
		    	   const height = 800;
		    	   const left = (screen.width / 2) - (width / 2);
		    	   const top = 0;
		    	  
		    	  
		    	  
		        window.open('/app/chatting/chattingList', 'chattingList', 'width=' + width + ', height=' + height + ', left=' + left + ', top=' + top);
		      });
		    }
		});
		</script>
</body>
</html>
