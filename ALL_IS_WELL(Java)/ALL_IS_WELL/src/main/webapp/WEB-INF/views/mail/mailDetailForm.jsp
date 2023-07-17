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
   
   .title-area #title {
    margin-top: 8%;
    margin-left: 250px;
    font-size: 30px;
    font-weight: bold;
    margin-bottom: 10px;
}

.title-area #send,
.title-area #receive {
    font-size: 16px;
    margin-bottom: 5px;
    margin-left: 250px;
}

.title-area #date {
    font-size: 14px;
    margin-bottom: 10px;
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
}

.title-area #list:hover {
    background-color: #555;
}

#date {
    margin-left: 250px;
}

        .main-area {
            width: 1000px;
            height: 800px;
            margin: auto;
            margin-top: 5%;
            
        }


 
   

</style>
</head>
<body>
   
   <header>
      <%@include file="/WEB-INF/views/common/member/header.jsp" %>
   </header>
   
   <main id="wrap">
      <%@ include file="/WEB-INF/views/common/member/side-bar.jsp" %>
	
	
		<div class="title-area">
            <div id="title">5월 세미나 참가 의사</div>
                <br>
                <br>
                <br>
                <div id="send">보낸 사람     지세연</div>
                <div id="receive">받는 사람     이순신</div>

                <br>
                <br>
                <br>

                <div class="date-area">
                    <div id="date">2023-06-29 12:35:42</div>
                    <button id="list">목록</button> 
                </div>

                <hr id="line">

        </div>
        <div class="main-area">

            <br>
            <br>
            <br>

            <div class="text-area">
                안녕하세요!교수님..
                저는 디캠프 소식을 알려드리려 합니다~
                Why do we use it?
                It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).


                Where does it come from?
                Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.

                The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.

                Where can I get some?
                There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn't anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.
            </div>

        </div>
   </main>

   <footer>
      <%@ include file="/WEB-INF/views/common/member/footer.jsp" %>
   </footer>
</body>
</html>
