<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <c:set var="root" value="${pageContext.request.contextPath}"></c:set>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="${root}/static/css/header.css">
<script defer src="${root}/static/js/header.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body bottommargin="0">
    
    <div id="wrap">
        <!-- 헤더영역 -->
       	<div id="realLogo">
            <a href="${root}/home">
                <img width="280px" height="150px" src="${root}/static/img/logo2.PNG" alt="홈로고">
        <div id="logoCategory">
            <a href="${root}/static/img/logo.png">회원가입</a>
            <a>|</a>
            <a href="">로그인</a>
            <a>|</a>
            <a href="">아이콘</a>
            <a>|</a>
            <a href="">아이콘</a>
        </div>
            </a>
        </div>
            
        
          
        
        
         <!-- 왼쪽사이드바 -->
        <div id="side-bar">
            <div id="side" style="background-color: #5A8CF2">
                <div id="side-content">
                     <div class="topbar" style="position: absolute; top:0;">
                         <div class="left_sub_menu">
                             <div class="sub_menu">
                             <br>
                             <br>
                             <br>
                             <br>
                             <br>
                             <br>
                                 <h2 id="SIDEBAR" data-hover="HOME" class="SMN_effect-23-2">HOME</h2>
                                 <ul class="big_menu">
                                     <li>행정업무 <i class="arrow fas fa-angle-right"></i></li>
                                     <ul class="small_menu">
                                         <li><a href="${root}/admin/reportlist">재고</a></li>
                                         <li><a href="${root}/admin/reportSearch">회의록</a></li>
                                         <li><a href="#">당직</a></li>
                                     </ul>
                                 </ul>
                                 <ul class="big_menu">
                                     <li>의료업무 <i class="arrow fas fa-angle-right"></i></li>
                                     <ul class="small_menu">
                                         <li><a href="#">수술</a></li>
                                         <li><a href="#">진료</a></li>
                                         <li><a href="#">입원</a></li>
                                     </ul>
                                 </ul>
                                  <ul class="big_menu">
                                     <li>게시판 <i class="arrow fas fa-angle-right"></i></li>
                                     <ul class="small_menu">
                                         <li><a href="#">건의</a></li>
                                         <li><a href="#">문의</a></li>
                                         <li><a href="#">공지</a></li>
                                     </ul>
                                 </ul>
                                  <ul class="big_menu">
                                     <li>메일 <i class="arrow fas fa-angle-right"></i></li>
                                     <ul class="small_menu">
                                         <li><a href="#">메일쓰기</a></li>
                                         <li><a href="#">받은 메일함</a></li>
                                         <li><a href="#">보낸 메일함</a></li>
                                         <li><a href="#">휴지통</a></li>
                                     </ul>
                                 </ul>
                                  <ul class="big_menu">
                                     <li>결재 <i class="arrow fas fa-angle-right"></i></li>
                                     <ul class="small_menu">
                                         <li><a href="#">결재하기</a></li>
                                         <li><a href="#">결재목록</a></li>
                                     </ul>
                                 </ul>
                             </div>
                         </div>
                         <div class="overlay"></div>
                     </div>
                </div>
            </div>
        </div>
        </div>

        


</body>
</html>