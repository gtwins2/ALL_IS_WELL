<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/summernote/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote/dist/summernote-lite.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


<style>
   
   #wrap{
			width: 1920px;
			height: 1200px;
			display: grid;
			grid-template-columns: 150px 1770px;
		}
	   
	   .main-area {
	        width: 70%;
	        height: 100%;
        	margin: auto;
            padding: 20px;
           
	    }
	   
   
   .title-area #title {
   
   
    font-size: 30px;
    font-weight: bold;
    margin-bottom: 10px;
}

.title-area #send,
.title-area #receive {
    font-size: 16px;
    margin-bottom: 5px;
   
}

.date-area #date {
    font-size: 14px;
    /* margin-bottom: 5px; */
}

.date-area {
    display: flex;
    justify-content: space-between;
}
.title-area #list {
    color: white;
    background-color: #5A8CF2;
    border: none;
    padding: 5px 10px;
    cursor: pointer;
    font-weight: bold;
    border-radius: 5px;
    margin-bottom: 10px;
}

.title-area #list:hover {
    background-color: #555;
}



.file-info {
    display: inline-block;
    margin-right: 10px;
  }

  .file-download {
    display: inline-block;
  }
       
#fileDownload {
	margin-left: 50px;
	text-decoration: none;
	color: #5A8CF2;
	font-weight: bold;
}


.content-area #mailContent {
    text-align: center;
}
 
   

</style>
</head>
<body>
   
   <header>
      <%@include file="/WEB-INF/views/common/member/header.jsp" %>
   </header>
   
   <main id="wrap">
      <%@ include file="/WEB-INF/views/common/member/side-bar.jsp" %>
	
		<div class="main-area">
			<div class="title-area">
            <div id="title">${vo.mailTitle}</div>
                <br>
                <br>
                <br>
                <div id="send">보낸 사람     ${vo.senderName}(${vo.senderMail})</div>
                <div id="receive">받는 사람     ${vo.receiverName}(${vo.receiverMail})</div>

                <br>
                <br>
                <br>

                <div class="date-area">
                    <div id="date">${vo.mailEnrollDate}</div>
                    <button id="list">목록</button> 
                </div>

                <hr id="line">

        </div>
        <div class="content-area">
			<br>
			<br>
			
			<c:choose>
			  <c:when test="${not empty vo.attachName}">
			    <span class="file-info">첨부된 파일: ${vo.attachName}</span>
			    <span class="file-download">
			      <a href="<c:url value='/mail/downloadFile?fileName=${vo.attachName}'/>" id="fileDownload">
			        파일 다운로드
			      </a>
			    </span>
			  </c:when>
			  <c:otherwise>
			    <p>첨부 파일이 없습니다.</p>
			  </c:otherwise>
			</c:choose>
			
			
            <br>
            <br>
            <br>
             <br>
            <br>
            <br>

            <div id="mailContent">
              ${vo.mailContent}
            </div>

        </div>
		
		</div>
		
   </main>

   <footer>
      <%@ include file="/WEB-INF/views/common/member/footer.jsp" %>
   </footer>
   
   <script type="text/javascript">

   $(document).ready(function() {
     // 썸머노트 초기화
     $('#mailContent').summernote({
       toolbar: false,  // 툴바를 사용할 수 없도록 설정
       airMode: false,  // 인라인 편집 모드 비활성화
     });

     // mailContent 값으로 썸머노트 본문을 설정합니다.
     const mailContent = $('#mailContent').html();
     $('#mailContent').summernote('code', mailContent);

     // 읽기 전용으로 설정
     $('#mailContent').summernote('disable');
   });
   </script>

   <script>
		const listBtn = document.querySelector('#list');
		
		listBtn.addEventListener("click", function(){
			history.back();
		});
   </script>
</body>
</html>
