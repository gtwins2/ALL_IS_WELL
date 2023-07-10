<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<c:set var="root" value="${pageContext.request.contextPath}"></c:set>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<style>

	*{
		margin: auto;
	}

	#header{
		width: 1920px;
		height: 158px;
		margin: auto;
		display: grid;
		grid-template-columns: 300px 1620px;
	}

</style>
</head>
<body>

	<div id="header">
		<img src="${root}/static/img/logo/logo2.png" width="300px" height="158px">
		<!-- 여기는 로그인 시 로그인 화면 보이게 -->
		<div></div>
	</div>


</body>
</html>