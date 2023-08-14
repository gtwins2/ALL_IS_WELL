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
	height: 1000px;
	display: grid;
	grid-template-columns: 150px 1770px;
}

#sendMail{
	position: absolute;
	width: 115px;
	height: 53px;
	left: 367px;
	top: 125px;
	background: #FF8686;
	border-radius: 25px;
	border: 0px;
	font-family: 'Inter';
	font-style: normal;
	font-weight: 700;
	font-size: 20px;
	line-height: 24px;
	color: #FFFFFF;
}

#sendMail:hover, #file:hover {
	background-color: #555;
	transition: 0.7s;
}

hr{
	position: absolute;
	width: 1770px;
	height: 0px;
	left: 150px;
	top: 200px;
	border: 1px solid #D1CECE;
}

#div01{
	position: absolute;
	width: 1617px;
	height: 700px;
	left: 303px;
	top: 240px;
	display: grid;
	grid-template-rows: 1fr 1fr 3fr;
	
	font-family: 'Inter';
	font-weight: normal;
	font-size: 20px;
}

#div01 > div{
	text-align: center;
	display: grid;
	grid-template-columns: 1fr 3fr;
}

#file-upload-button{
	width: 115px;
	height: 53px;
	background: #FF8686;
	border-radius: 25px;
	border: 0px;
	font-family: 'Inter';
	font-style: normal;
	font-weight: 700;
	font-size: 20px;
	line-height: 24px;
	color: #FFFFFF;
}

#div01 > div:nth-child(1) > div > input{
	border: 0px;
	width:80%;
	font-size: 25px;
}

#div01 > div:nth-child(2) >  div:nth-child(2) {
	text-align: left;
	margin-left: 120px;
}

#div01-1{
	position: absolute;
	width: 1770px;
	height: 0px;
	left: 150px;
	top: 950px;
	border: 1px solid #D1CECE;
}

#textarea{
	width:80%;
	height: 250px;
	font-size: 25px;
	resize: none;
	border: 0px;
	font-family: 'Inter';
	font-style: normal;
}

#list{
	position: absolute;
	width: 115px;
	height: 53px;
	left: 1748px;
	top: 880px;
	background: #FF8686;
	border-radius: 25px;
	font-family: 'Inter';
	font-style: normal;
	font-weight: 700;
	font-size: 20px;
	line-height: 24px;
	text-align: center;
	color: #FFFFFF;
	border: 0px;
}

#div02{
	position: absolute;
	top: 980px;
	box-sizing: border-box;
	position: absolute;
	width: 1600px;
	height: 136px;
	background: #FFFFFF;
	margin-left: 200px;
	display: grid;
	grid-template-columns: 5fr 1fr;
}

#div02 > div:nth-child(4){
	line-height: 130px;
}

#textarea2{
	width: 100%;
	height: 136px;
	font-size: 25px;
	resize: none;
}

#div03{
position: absolute;
width: 1516px;

left: 347px;
top: 1150px;
background: #D9D9D9;
border-radius: 50px;

}

#div03-1{
	display: grid;
	grid-template-columns: 1fr 10fr 1fr;
	margin-left: 60px;
}

#write{
	width: 115px;
	height: 53px;
	background: #FF8686;
	border-radius: 25px;
	font-family: 'Inter';
	font-style: normal;
	font-weight: 700;
	font-size: 20px;
	line-height: 24px;
	text-align: center;
	color: #FFFFFF;
	border: 0px;
	margin-left: 60px;
}
#delete, #reply{
	background-color:gray; 
	width: 50px;
	height: 30px;
	background: #FF8686;
	border-radius: 25px;
	font-family: 'Inter';
	font-style: normal;
	font-weight: 700;
	font-size: 15px;
	line-height: 24px;
	text-align: center;
	color: #FFFFFF;
	border: 0px;
}

td{
	font-family: 'Inter';
	font-style: normal;
	font-weight: 700;
	font-size: 20px;
}

tr {height:50px;}


#replyInput{
	border: 0px;
	background-color:lightgray; 
	outline: none;
}

#updateForm{
display: grid;
grid-template-columns: 9fr 2fr 1fr;

}
</style>
</head>
<body>

	<header>
		<%@ include file="/WEB-INF/views/common/admin/header.jsp" %>
	</header>
		
	<div id="content">
		<nav>
			<%@ include file="/WEB-INF/views/common/admin/side-bar.jsp" %>
		</nav>
		<main>
			<c:if test="${loginMember.no == vo.memberNo }">
					<button id="sendMail" onclick="update();">수정하기</button>
				</c:if>
				<div id="div01">
					<div>
						<div>제목</div>
						<div> <input type="text" name="" id="" value="${vo.title}" readonly></div>
					</div>
					
					<div>
						<div>내용</div>
						<div><textarea name="" id="textarea" cols="30" rows="10" readonly>${vo.content}</textarea></div>
					</div>
				</div>

			<button id="list" onclick="back()">목록</button>
			<hr id="div01-1">
			<form action="${root}/board/inquiryDetail" method="post">
				<div id="div02">
					<input type="text" value="${vo.no}" name="inquiryNo" hidden> 
					<input type="text" value="${loginMember.no}" name="writerNo" hidden>				
					<div><textarea name="content" id="textarea2" cols="30" rows="10"></textarea></div>
					<div><button id="write">작성</button></div>
				</div>
			</form>
			<div id="div03">
                            
	                 <div id="div03-1">
	                 	<table width="1400px">
						<c:forEach items="${voList2}" var="vo2">
		                 	<tr>
		                 		 <td hidden>${vo2.no} </td>
		                    	 <td width="1000px">${vo2.content} </td>
		                     	 <td hidden>${vo2.inquiryNo} </td>
		                     	 <td width="200px">${vo2.enrollDate}</td>
		                     	 <td><input type="text" value="${vo.no}" name="inquiryNo" hidden></td>
		                     	 <td><input type="text" value="${vo2.no}" name='no' hidden></td>
		                     	 <c:if test="true">
			                     <td width="50px"><input type="button" value="수정" id="reply" ></td>
		                     <form action="${root}/board/inquiryReplyDelete" method="post">
		                     	 <input type="text" value="${vo.no}" name="inquiryNo" hidden>
		                     	 <input type="text" value="${vo2.no}" name='no' hidden>
			                     <td><input type="submit" value="삭제" id="delete"></td>
		                     </form>
		                     	 </c:if>
		                     </tr>
						</c:forEach>
	                 	</table>
	                 </div>
	                 
                                
			</div>

		</main>
	</div>

	<footer>
		<%@ include file="/WEB-INF/views/common/admin/footer.jsp" %>
	</footer>

</body>
</html>
<script>

	const sideBar = document.querySelector("#side-bar")
	const subMenus = document.querySelectorAll(".sub-menu");
	const thirdSidebars = document.querySelectorAll(".third-sidebar");

	subMenus.forEach(subMenu => {
		subMenu.style.height = sideBar.offsetHeight + 'px';
	});

	thirdSidebars.forEach(thirdSidebar => {
		thirdSidebar.style.height = sideBar.offsetHeight + 'px';
	});
	
	const tr = document.querySelectorAll('tr');
	const reply = document.querySelectorAll('#reply');
    for(var i = 0; i < reply.length; i++){
    	reply[i].addEventListener('click', (event)=>{
            const no = event.target.parentNode.parentNode.children[0].innerText;
            const content = event.target.parentNode.parentNode.children[1].innerText;
            const noticeNo = event.target.parentNode.parentNode.children[2].innerText;
            location.href='/app/board/inquiryReplyUpdate?no=' + no +"&content=" + content +"&noticeNo=" +noticeNo ;
            console.log(event.target.parentNode.parentNode.children[0]);
        
      
        });
    }
    
    function back() {
    	location.href="${root}/board/inquiryList";
		
	}
</script>