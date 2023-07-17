<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   
   #wrap{
      width: 1920px;
      height: 1500px;
      display: grid;
      grid-template-columns: 300px 1620px;
   }
   
     .main-area {
            width: 1000px;
            height: 800px;
            margin: auto;
            margin-top: 10%;
            
        }

        #writeMail {
            font-size: 35px;
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

    #line {
       
        width: calc(100vw - 20px);
        margin: 0;
        position: absolute;
        left: 0;
        
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
    margin-left: 97px;
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

.content-area {
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
    width: 805px;
    height: 500px;
    resize: none;
    margin-left: 100px;
    margin-top: 30px;
}

.content-area textarea:focus {
    outline: none;
    border-color: #5A8CF2;
    box-shadow: 0 0 3px #5A8CF2;
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
            <div id="writeMail">메일 쓰기</div>
            <br>
            <br>
            <br>
            <br>
            <input type="submit" id="send" value="보내기"></input>
            <br>
            <br>

            <hr id="line">
            <br>
            <br>
            <br>
            <form action="">
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
                    <div>내용</div>
                    <textarea name="content" id="contentBox" cols="100" rows="100"></textarea>
                </div>
            </form>



            <br>
            <br>

        </div>
   </main>

   <footer>
      <%@ include file="/WEB-INF/views/common/member/footer.jsp" %>
   </footer>
</body>
</html>
