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
            display: flex;
            flex-direction: row;
            justify-content: flex-start;
        }

        #title {
            margin-left: 350px;
            font-size: 35px;
        }

        #sendMail:hover {
            background-color: #555;
            transition: 0.7s;
        }

        .search-area {
            margin-left: 100px;
            display: flex;
            align-items: center;
        }

        .search-area input[type="text"] {
            padding: 5px;
            margin-right: 20px;
            width: 700px;
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
            width: 1200px;
            height: 1000px;
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
            font-size: 25px;
            margin-bottom: 20px;
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
            font-size: 20px;
            letter-spacing: 5px;
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

        /* Modal styles */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0, 0, 0, 0.4);
        }

        .modal-content {
    border-radius: 10px;
    background-color: #fefefe;
    margin: 15% auto;
    padding: 20px;
    border: 1px solid #888;
    width: 80%;
    max-width: 800px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
}

.close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
    cursor: pointer;
    transition: color 0.3s;
}

.close:hover,
.close:focus {
    color: #555;
    text-decoration: none;
}

.modal-search-area {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-bottom: 20px;
}

#modal-title {
    font-size: 25px;
    font-weight: bold;
    margin: 0;
}

.modal-search-area {
    margin-left: 30px;
    display: flex;
    align-items: center;
    margin: 0;
}

.modal-search-area select {
    padding: 5px;
    border-radius: 10px;
    border: 1px solid gray;
    height: 30px;
}

.modal-search-area input[type="text"] {
    padding: 5px;
    margin-left: 10px;
    width: 400px;
    height: 30px;
    border: 1px solid gray;
    border-radius: 10px;
}

#search-icon {
    color: gray;
    font-size: 20px;
    margin-left: 10px;
}

.result-area {
    display: flex;
    justify-content: space-between;
    margin-bottom: 10px;
    font-weight: bold;
}

.result-title {
    flex: 1;
    text-align: center;
}

.search-result {
    display: flex;
    align-items: center;
    justify-content: space-around;
    margin-top: 20px;
    margin-bottom: 30px;
    
}


.modal-btn {
    padding: 10px 20px;
    background-color: #5A8CF2;
    border: none;
    font-weight: bold;
    font-size: 20px;
    color: white;
    border-radius: 10px;
    cursor: pointer;
    transition: background-color 0.3s;
    margin-left: 10px;
}

#closeBtn {
    background-color: #aaa;
}

#modalBtn {
    padding: 5px 10px;
    background-color: #5A8CF2;
    border: none;
    font-weight: bold;
    font-size: 16px;
    color: white;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
    margin-left: 10px;
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
            <div id="title">입원실 조회</div>
            <form action="" class="search-area">
                <label for="search" class="category-area">
                    <select name="search" id="search">
                        <option value="writer">인원수</option>
                        <option value="title"></option>
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
                <div>101호</div>
                <div>1인실</div>
                <button class="statusBtn">(1/1)</button>
            </div>
            <div class="box">
                <div>102호</div>
                <div>4인실</div>
                <button class="statusBtn">(3/4)</button>
            </div>
            <div class="box">
                <div>101호</div>
                <div>1인실</div>
                <button class="statusBtn">(4/6)</button>
            </div>
            <div class="box">
                <div>101호</div>
                <div>1인실</div>
                <button class="statusBtn">(2/2)</button>
            </div>
            <div class="box">
                <div>101호</div>
                <div>1인실</div>
                <button class="statusBtn">(0/1)</button>
            </div>
            <div class="box">
                <div>101호</div>
                <div>1인실</div>
                <button class="statusBtn">(4/4)</button>
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
    <br>
    <br>

    <div id="modal" class="modal">
        <div class="modal-content">
          <span class="close">&times;</span>
          <div class="modal-search-area">
            <h2 id="modal-title">환자 검색</h2>
          
            <form action="" class="modal-search-area">
                <input type="text" id="search-input">
                <a href="" id="search-icon"><i class="fa-solid fa-magnifying-glass"></i></a>
            </form>
          </div>
         
          <br>
          <hr>
          
      
          <div class="search-result">
              <div>홍길동</div>
              <div>781213-1********</div>
                <button id="modalBtn">배치</button>
          </div>
      
          <div class="search-result">
            <div>홍길동</div>
            <div>781213-1********</div>
              <button id="modalBtn">배치</button>
        </div>
      
        
    </div>
   </main>

   <footer>
      <%@ include file="/WEB-INF/views/common/member/footer.jsp" %>
   </footer>
   
    <script>
        var modal = document.getElementById('modal');
        var statusBtns = document.getElementsByClassName('statusBtn');
        var closeBtn = document.getElementsByClassName('close')[0];

        function openModal() {
            modal.style.display = 'block';
        }

        function closeModal() {
            modal.style.display = 'none';
        }

        // Attach event listeners to the status buttons
        for (var i = 0; i < statusBtns.length; i++) {
            statusBtns[i].addEventListener('click', openModal);
        }

        closeBtn.addEventListener('click', closeModal);
    </script>
</body>
</html>