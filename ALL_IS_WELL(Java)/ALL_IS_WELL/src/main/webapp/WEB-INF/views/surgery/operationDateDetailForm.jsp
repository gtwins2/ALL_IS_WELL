<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수술 일정 등록</title>
<style>
   
   #wrap{
      width: 1920px;
      height: 1500px;
      display: grid;
      grid-template-columns: 300px 1620px;
   }
   
   .title-area {
            display: flex;
            justify-content: space-between;
        }

        #title {
            font-size: 35px;
            margin-top: 20px;
            margin-left: 50px;
        }

        #date {
            font-size: 15px;
            margin-top: 50px;
            margin-right: 50px;
        }

        .register-area {
            margin: 0 auto;
            width: 1500px;
            height: 1000px;
            margin-top: 20px;
            background: #FFFFFF;
            border: 1px solid #C4C4C4;
            box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
            border-radius: 20px;
        }

        #registerForm {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
            padding: 30px;
            row-gap: 50px;
        }

        .area {
            display: flex;
            flex-direction: row;
            align-items: center;
            margin-bottom: 20px;
        }

        .area span {
            width: 130px;
            margin-right: 10px;
            font-size: 20px;
        }

        .area input[type="text"],
        .area textarea,
        .area input[type="datetime-local"] {
            flex: 1;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 16px;
            transition: border-color 0.3s;
        }

        .area input[type="text"]:focus,
        .area textarea:focus,
        .area input[type="datetime-local"]:focus {
            outline: none;
            border-color: #5A8CF2;
        }

        .area input[type="button"] {
            font-size: 16px;
            color: white;
            background-color: #5A8CF2;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .area input[type="button"]:hover {
            background-color: #555;
        }

        .area textarea {
            resize: none;
            height: 600px;
        }

        #people {
            width: 550px;
            height: 600px;
        }

        .btn-area {
            margin: 0 auto;
            display: flex;
            justify-content: flex-end;
            align-items: center;
            margin-right: 200px;
        }

        #addBtn {
            padding: 10px 20px;
            background-color: #5A8CF2;
            border: none;
            font-weight: bold;
            font-size: 20px;
            color: white;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        #addBtn:hover {
            background-color: #555;
        }

        #backBtn {
            padding: 10px 20px;
            background-color: #5A8CF2;
            border: none;
            font-weight: bold;
            font-size: 20px;
            color: white;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
            margin-left: 30px;
        }

        #backBtn:hover {
            background-color: #555;
        }

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
  max-width: 1000px;

}

.close {
  color: #aaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
  cursor: pointer;
}

.close:hover,
.close:focus {
  color: black;
  text-decoration: none;
  cursor: pointer;
}

#modal-title {
    text-align: center;
    font-size: 25px;
    font-weight: bold;
}

        .search-area {
                    text-align: center;
                    display: flex;
                    justify-content: center;
                    align-items: center;
                }

        

        .search-area input[type="text"] {
            padding: 5px;
            margin-right: 20px;
            width: 500px;
            height: 30px;
            border: 1px solid gray;
            border-radius: 10px;
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

        .search-result {
  display: flex;
  justify-content: space-evenly;
  align-items: center;
  padding: 10px;

}

.search-result div {
  flex: 1;
  text-align: center;
}

.search-result input[type="checkbox"] {
  transform: scale(1.5);
}

.result-title {
  font-weight: bold;
  font-size: 20px;
  text-align: center;
  padding: 10px;
}

.result-area {
  display: flex;
  justify-content: space-around;
  padding-bottom: 10px;
 
}

.modal-btn-area {
    display: flex;
    justify-content: end;

}

.modal-btn {
    padding: 10px 20px;
            background-color: #5A8CF2;
            border: none;
            font-weight: bold;
            font-size: 20px;
            color: white;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
            margin-left: 30px;
}


    #closeBtn {
        background-color: #aaa;
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
            <div id="title">수술 일정 상세 조회</div>
            <div id="date">등록일 : 2023-07-03 15:30</div>
        </div>
        <br>
        
        <hr>
        <br>
        <br>
        <br>
        <div class="register-area">
            <form action="" id="registerForm">
                <div class="area">
                    <span>수술명</span>
                    <input type="text" value="담낭염 수술" readonly>
                </div>
                
                <div class="area">
                    <span>환자이름</span>
                    <input type="text" value="홍길동" readonly>
                </div>
               
                <div class="area">   
                    <span>시작시간</span>
                    <input type="datetime-local" readonly>
                </div>

                <div class="area">
                    <span>종료시간</span>
                    <input type="datetime-local">
                </div>

                <div class="area">
                    <span>수술내용</span>
                    <textarea name="content" id="" cols="30" rows="10" readonly></textarea>
                </div>

                <div class="area">
                    
                    <span>참여인원</span>
                    <input type="text" name="people" id="people" readonly>
                </div>

                
            </form>
        </div>
        <br>
        <br>

        <div class="btn-area">
            <input type="submit" value="수술 종료" id="addBtn">
            <button id="backBtn">뒤로가기</button>
        </div>
   </main>

   <footer>
      <%@ include file="/WEB-INF/views/common/member/footer.jsp" %>
   </footer>
</body>
</html>

include 할때 side바가 들어가는 div태그에 여기 준 css 꼭 주세요