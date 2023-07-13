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
#content{
	width: 1920px;
	height: 1200px;
	display: grid;
	grid-template-columns: 300px 1620px;
	border-bottom: 1px ;
}
#div01{
    position: absolute;
    width: 1500px;
    height: 650px;
    left: 350px;
    top: 242px;
    background: #FDFDFD;
    box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
    border-radius: 50px;
    display: grid;
    grid-template-rows: repeat(11, 1fr);
}

#div01 > div{
    display: grid;
    grid-template-columns: 1fr 1fr;
    text-align: center;
    line-height: 55px;
    padding: 0px;
}
</style>
<body>
	<header>
		<%@ include file="/WEB-INF/views/common/member/header.jsp" %>
	</header>
		
	<div id="content">
		<nav>
			<%@ include file="/WEB-INF/views/common/member/side-bar.jsp" %>
		</nav>
		<main>
		 <div id="div01">
		        <div>
		            <div>환자명</div>
		            <div>등록일</div>
		        </div>
		        <div>
		            <div>송준섭</div>
		            <div>2023-07-11</div>
		        </div>
		        <div>
		            <div>송준섭</div>
		            <div>2023-07-11</div>
		        </div>
		        <div>
		            <div>송준섭</div>
		            <div>2023-07-11</div>
		        </div>
		        <div>
		            <div>송준섭</div>
		            <div>2023-07-11<</div>
		        </div>
		        <div>
		            <div>송준섭</div>
		            <div>2023-07-11</div>
		        </div>
		        <div>
		            <div>송준섭</div>
		            <div>2023-07-11</div>
		        </div>
		        <div>
		            <div>송준섭</div>
		            <div>2023-07-11</div>
		        </div>
		        <div>
		            <div>송준섭</div>
		            <div>2023-07-11</div>
		        </div>
		        <div>
		            <div>송준섭</div>
		            <div>2023-07-11</div>
		        </div>
		        <div>
		            <div>송준섭</div>
		            <div>2023-07-11</div>
		        </div>
		    </div>
		</main>
	</div>

	<footer>
		<%@ include file="/WEB-INF/views/common/member/footer.jsp" %>
	</footer>
   
</body>
</html>