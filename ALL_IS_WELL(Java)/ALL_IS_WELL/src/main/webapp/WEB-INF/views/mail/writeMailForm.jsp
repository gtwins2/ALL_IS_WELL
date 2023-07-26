<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메일 작성하기</title>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

<style>
	   
	   #wrap{
				width: 1920px;
				height: 1500px;
				display: grid;
				grid-template-columns: 150px 1770px;
			}
		   
        .main-area {
            width: 90%;
            min-height: 80%;
            margin: 0 auto;
            margin-top: 50px;
            margin-left: 370px;
        }

        #writeMail {
            font-size: 30px;
        }

        #send {
            color: white;
            background-color: #5A8CF2;
            size: 5px;
            border: none;
            padding: 10px 10px;
            cursor: pointer;
            border-radius: 5px;
            font-weight: bold;

        }

        #send:hover {
            background-color: #555;

        }

        .receive-area {
            display: flex;
            flex-direction: row;
            align-items: center;
        }

        .receive-area div {
            margin-right: 10px;
        }

        .receive-area input[type="checkbox"] {
            margin-right: 5px;
        }

        .receive-area input[type="text"] {
            padding: 5px;
            border: 1px solid lightgray;
            border-radius: 3px;
            width: 800px;
            height: 30px;
            
        }

            #me {
                font-size: 10px;
            }

            .title-area {
                display: flex;
                flex-direction: row;
                align-items: center;
            }

            .title-area div {
            margin-right: 10px;
        }

        .title-area input[type="text"] {
            padding: 5px;
            border: 1px solid lightgray;
            border-radius: 3px;
            width: 800px;
            height: 30px;
            margin-left: 93px;
        }

        .title-area input[type="text"]:focus {
            outline: none;
            border-color: #5A8CF2;
            box-shadow: 0 0 3px #5A8CF2;
           
        }

        .receive-area input[type="text"]:focus {
            outline: none;
            border-color: #5A8CF2;
            box-shadow: 0 0 3px #5A8CF2;
           
           
        }


        .file-area {
            display: flex;
            align-items: center;
        }

        .file-area div {
            margin-right: 10px;
        }

        .file-area button {
            color: white;
            background-color: #5A8CF2;
            size: 5px;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
            
            font-weight: bold;
        }

        .file-area button:hover {
            background-color: #555;
        }

        #chooseFile {
            margin-right: 10px;
            margin-left: 58px;
        }

        #deleteAll {
            margin-right: 10px;
        }

       /*  .content-area {
            display: flex;
            align-items: center;
        }

        .content-area div {
            margin-bottom: 10px;
        }

        .content-area textarea {
            padding: 5px;
            border: 1px solid lightgray;
            border-radius: 3px;
            width: 50%;
            height: 10%;
            resize: none;
            margin-left: 100px;
            margin-top: 30px;
        }

        .content-area textarea:focus {
            outline: none;
            border-color: #5A8CF2;
            box-shadow: 0 0 3px #5A8CF2;
        } */
   
        .custom-hr {
        border: none;
        height: 1px;
        width: 940px;
        background-color: #DDD; /* Lighter color */
        margin: 0;
    }
</style>
</head>
<body>
   
   <header>
      <%@include file="/WEB-INF/views/common/member/header.jsp" %>
   </header>
   
   <main id="wrap">
     	<div>
   			<%@ include file="/WEB-INF/views/common/member/side-bar.jsp" %>
   		</div>
		
		
		
        <div class="main-area">
            <div id="writeMail">메일 쓰기</div>
            <br>
            <br>
            <br>
            <br>
            <input type="submit" id="send" value="보내기"></input>
            <br>
            <br>
            <hr class="custom-hr">
            <br>
            <br>
            <br>
            
            <form action="" method="post" enctype="multipart/form-data">
                <div class="receive-area">
                    <div>받는 사람</div>
                    <input type="checkbox">
                    <div id="me">나에게</div>
    
                    <input type="text" name="receivePerson">
                </div>
                <br>
                <br>
                <br>

                <div class="title-area">
                    <div>제목</div>
                    <input type="text" name="title">
                </div>
                <br>
                <br>
                <br>

                <div class="file-area">
                    <div>파일 첨부</div>
                    <button id="chooseFile">파일 선택</button>
                    <button id="deleteAll">모두 삭제</button>
                </div>
                <br>
                <br>
                <br>


                <div class="content-area">
                    <textarea id="summernote"></textarea>
                </div>
            </form>
            



            <br>
            <br>

        </div>
   </main>

   <footer>
      <%@ include file="/WEB-INF/views/common/member/footer.jsp" %>
   </footer>
   
   
   
   <script type="text/javascript">
		const sideBar = document.querySelector("#side-bar")
	    const subMenus = document.querySelectorAll(".sub-menu");
	    const thirdSidebars = document.querySelectorAll(".third-sidebar");
	
	    subMenus.forEach(subMenu => {
	        subMenu.style.height = sideBar.offsetHeight + 'px';
	    });
	
	    thirdSidebars.forEach(thirdSidebar => {
	        thirdSidebar.style.height = sideBar.offsetHeight + 'px';
	    });
	    
	   
	    
	    
	 
	    
	  
	    
	    
	</script>	  
	
	<script type="text/javascript">
		 //뒤로가기 버튼
	    function goBack() {
	    	window.history.back();
		 }
		 
		//썸머노트
	    $(document).ready(function() {
	    	//여기 아래 부분
	    	$('#summernote').summernote({
	    		  height: 800,
	    		  width: 950,
	    		  minHeight: null,             // 최소 높이
	    		  maxHeight: null,             // 최대 높이
	    		  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
	    		  lang: "ko-KR",					// 한글 설정
	    		  placeholder: '내용을 입력하세요'	//placeholder 설정
	              
	    	});
	    });
	   
		
	</script>  
</body>
</html>
