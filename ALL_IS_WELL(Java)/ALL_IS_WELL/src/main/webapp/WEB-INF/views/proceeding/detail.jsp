<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회의록 상세조회</title>
<style>
#title{
    display: float;
    margin-left: 500px;
    margin-top: 200px;
    width: 1420px;
    height: 48px;
    flex-direction: column;
    flex-shrink: 0;
}
#title1{
    font-size: 40px;
}
#title2{
    font-size: 25px;
}


#box{
    width: 1500px;
    height: 810px;
    border: 1px solid gray;
    border-radius: 10%;
    display: grid;
    grid-template-rows: 1fr 3fr;
    grid-template-columns: 1fr 3fr;
    margin-top: 50px;
}

#TITLE{
    margin-left: 20px;
    margin-top: 90px;
    font-size: 25px;
}

#CONTENT{
    margin-left: 20px;
    font-size: 25px;
}

/* #writeProceed , #backPage{
    
    
} */

</style>
</head>
<body>

    <div id="title">
        <div id="title1" style="border: 1px solid white; float: left; width: 33%;">
            회의록 상세조회
        </div>
        <div id="title2" align="right" style="border: 1px solid white; float: left; width: 60%;">
            <br>
            <br>
            등록일 : 2023-07-03 15:30
            <br>
            수정일 : 2023-07-03 20:30
            <br>
            작성자 : ${write}
        </div>
    </div>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <hr>    
    <br>
    <br>
    <div id="box" class="textarea">

        <div id="TITLE" >
            제목
        </div>

        <div id="TITLE">
            <textarea cols="150" rows="1" placeholder="제목이 출력됩니다."></textarea>
        </div>
        
        <div id="CONTENT">
            내용
        </div>

        <div id="CONTENT">
            <textarea cols="150" rows="30" placeholder="내용이 출력됩니다."></textarea>
        </div>

        


    </div>
    <button type="button" id="fixProceed" onclick="alert('Hello World!')">수정하기</button>
    <button type="button" id="backPage" onclick="alert('Hello World!')">뒤로가기</button>
    
    

    

</body>
</html>