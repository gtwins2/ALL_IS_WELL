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
	
	#content{
		width: 1920px;
		height: 1600px;
		display: grid;
		grid-template-columns: 300px 1620px;
		border-bottom: 1px ;
	}
</style>
</head>
<body>
		<%@ include file="/WEB-INF/views/common/header.jsp" %>
		
		<!-- 내용영역 -->
	<div id="content">
		<%@ include file="/WEB-INF/views/common/side-bar.jsp" %>
			
	</div>

		<%@ include file="/WEB-INF/views/common/footer.jsp" %>	
	
	

</body>
</html>