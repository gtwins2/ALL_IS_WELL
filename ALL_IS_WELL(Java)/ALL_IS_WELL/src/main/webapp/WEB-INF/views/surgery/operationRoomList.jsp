<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수술실 목록</title>
<style>
   
   #wrap{
      width: 1920px;
      height: 1500px;
      display: grid;
      grid-template-columns: 300px 1620px;
   }
   
    .title-area {
           
           margin-top: 10%;
           text-align: center;
           display : flex;
           flex-direction: row;
           justify-content: center;
       }

       #title {
            margin-right: 50px;
           font-size: 35px;
       }

       

       #sendMail:hover {
           background-color: #555;
           transition: 0.7s;
       }

       .search-area {
           display: flex;
           align-items: center;
       }

       

       .search-area input[type="text"] {
           padding: 5px;
           margin-right: 20px;
           width: 300px;
           height: 30px;
           border: 1px solid gray;
           border-radius: 10px;
       }

       

       .list-area {
           margin-top: 20px;
       }


       .category-area {
           display: flex;
           align-items: center;
           
       }

       .category-area label {
           margin-right: 5px;
       }

       .category-area select {
           padding: 5px;
           border-radius: 10px;
           border: 1px solid gray;
           height: 40px;
       }

       .category-icon {
           margin-right: 5px;
           color: #555;
       }

       .category-icon::before {
           font-family: "Font Awesome 5 Free";
           content: "\f0a5";
           font-weight: 900;
       }

       #search-icon {
           color: gray;
       }

       .select-area {
        width: 800px;
        height: 500px;
        margin: 0 auto;
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 40px;
    margin-top: 100px;
}

.box {
    text-align: center;
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    border: 1px solid #ccc;
    border-radius: 10px;
    padding: 20px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    background-color: #f9f9f9;
}


.box > div {
    margin-bottom: 20px;
    font-weight: bold;
}

.statusBtn {
    text-align: center;
    padding: 8px 16px;
    border-radius: 5px;
    border: none;
    background-color: #5A8CF2;
    color: #fff;
    font-weight: bold;
    cursor: pointer;
    width: 100%;
}



.statusBtn:hover {
    background-color: #555;
}

.number-area {
    display: flex;
    justify-content: center;
}

.number-area a {
    margin: 0 200px;
    font-size: 20px;
    color: black;
    text-decoration: none;

    transition: background-color 0.3s ease;
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
            <div id="title">수술실 조회</div>


            <form action="" class="search-area">
                <label for="search" class="category-area">
                    <select name="search" id="search">
                        <option value="writer">작성자</option>
                        <option value="title">제목</option>
                    </select>
                    

                </label>
                <input type="text" id="search-input">
               <a href="" id="search-icon"><i class="fa-solid fa-magnifying-glass"></i></a>
            </form>

        </div>
        <br>
        <br>
        <hr>

        <div class="select-area">

            <div class="box">
                <div>수술실 1</div>
                <div>담낭염</div>
                <div>홍길동</div>
                <div>박의사</div>
                <button class="statusBtn">사용중</button>
            </div>

            <div class="box">
                <div>수술실 2</div>
                
                <button class="statusBtn">사용 가능</button>
            </div>

            <div class="box">
                <div>수술실 1</div>
                <div>담낭염</div>
                <div>홍길동</div>
                <div>박의사</div>
                <button class="statusBtn">사용중</button>
            </div>

            <div class="box">
                <div>수술실 1</div>
                <div>담낭염</div>
                <div>홍길동</div>
                <div>박의사</div>
                <button class="statusBtn">사용중</button>
            </div>

            <div class="box">
                <div>수술실 1</div>
                <div>담낭염</div>
                <div>홍길동</div>
                <div>박의사</div>
                <button class="statusBtn">사용중</button>
            </div>

            <div class="box">
                <div>수술실 1</div>
                <div>담낭염</div>
                <div>홍길동</div>
                <div>박의사</div>
                <button class="statusBtn">사용중</button>
            </div>
        </div>

        <br>
        <br>
        <br>
        <br>

        <div class="number-area">
            <a href="">이전</a>
            <a href="">다음</a>
        </div>
        <br>
        <br>
   </main>

   <footer>
      <%@ include file="/WEB-INF/views/common/member/footer.jsp" %>
   </footer>
</body>
</html>
