<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅 검색 결과</title>
<script src="https://kit.fontawesome.com/794ac64f16.js" crossorigin="anonymous"></script>
<style>
   * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }

        .main-wrap {
            box-sizing: border-box;
            width: 600px;
            height: 800px;
            background-color: white;
            border: 1px solid black;
            position: relative; /* Added position relative */
        }

        .search-area {
            margin-top: 20px;
            margin-left: 60px;
            position: relative;
            width: 600px;
        }

        #search {
            width: 80%;
            height: 40px;
            border: none;
            background-color: lightgray;
            border-radius: 5px;
            padding-left: 35px;
        }

        #icon {
            position: absolute;
            width: 25px;
            top: 10px;
            left: 10px;
            color: gray;
        }

        .detail-area {
            display: flex;
            align-items: center;
            padding: 15px;
            border-bottom: 1px solid lightgray;
        }

        .profile-image {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            margin-right: 10px;
        }

        .details {
            display: flex;
            flex-direction: column;
            justify-content: center;
            flex: 1;
        }

        #status {
            width: 60px;
            height: 20px;
            background-color: #5A8CF2;
            color: white;
            border-radius: 10px;
            font-size: 12px;
            font-weight: bold;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 5px;
            text-transform: uppercase;
            margin-bottom: 5px;
        }

        #name {
            font-weight: normal;
            font-size: 18px;
        }

        #date {
            font-size: 12px;
        }


        .number-area {
            margin-top: 30px;
    display: flex;
    flex-direction: center;
    justify-content: space-evenly;
}

.number-area a {
    font-size: 25px;
    color: black;
    text-decoration: none;
    font-weight: bold;

    transition: background-color 0.3s ease;
}


#plus:hover {
    background-color: #555;
}

#addBtn {
    border: none;
    border-radius: 5px;
    background-color: #5A8CF2;
    color: white;
    padding: 8px 16px;
    font-size: 16px;
    font-weight: bold;
    cursor: pointer;
    transition: background-color 0.3s ease;
    text-align: center;
}

#addBtn:hover {
    background-color: #555;
}
   
</style>
</head>
<body>
   <div class="main-wrap">
        <form action="">
            <div class="search-area">
                <i class="fa-solid fa-magnifying-glass" id="icon"></i>
                <input id="search" type="search">
            </div>
        </form>
        
        <br>
        <hr>
    
        <div class="list-area">
            <div class="detail-area">
                <img src="" alt="" class="profile-image">
                <div class="details">
                    <div id="status">출근 전</div>
                    <div id="name">김간호(소아과 주임간호사)</div>
                </div>
                <button id="addBtn">대화하기</button>
            </div>
        </div>

        <div class="number-area">
            <a href=""><i class="fa-solid fa-arrow-left" style="color: #ababab;"></i></a>
            <a href=""><i class="fa-solid fa-arrow-right" style="color: #ababab;"></i></a>
        </div>

    </div>
  
</body>
</html>
