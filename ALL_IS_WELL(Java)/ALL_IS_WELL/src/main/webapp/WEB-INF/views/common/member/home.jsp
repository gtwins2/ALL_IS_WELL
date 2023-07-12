<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
	*, body{
		margin: auto;
	}

	header{
		box-sizing: border-box;
	}
	
	#wrap{
		width: 1920px;
		height: 1500px;
		display: grid;
		grid-template-columns: 300px 1620px;
	}

</style>
</head>
<body>
	
	<header>
		<%@include file="/WEB-INF/views/common/member/header.jsp" %>
	</header>
	
	<main id="wrap">
		<%@ include file="/WEB-INF/views/common/member/side-bar.jsp" %>
	</main>

	<footer>
		<%@ include file="/WEB-INF/views/common/member/footer.jsp" %>
	</footer>
</body>
</html>