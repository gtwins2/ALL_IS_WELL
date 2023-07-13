<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회의록 목록</title>
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


#listbox{
    width: 1500px;
    height: 810px;
    border: 1px solid gray;
    
    margin-top: 90px;
    font-size: 25px;
    border-radius: 10%;
    display: grid;
    grid-template-rows: repeat(9, 1fr);
    grid-template-columns: repeat(2 , 1fr);
}



#list1 , #list2 , #list3 , #list4 , #list5 , #list6 , #list7 , #list8 , #list9{
    margin-left: 20px;
    font-size: 25px;
    display: flex;
    margin: auto;

    
}

.underline{
    border-bottom: 10px solid black; 
}

</style>
</head>
<body>

    <div id="title">
        <div id="title1" style="border: 1px solid white; float: left; width: 33%;">
            회의록 목록
        </div>
        <button type="button" id="writeProceed">글쓰기</button>
    </div>
    <br>
    <br>
    <hr>    
    <br>
    <br>
    <div id="listbox">
        <div id="list1" class="underline">제목</div>
        <div id="list1">등록일</div>
        <div id="list2">회의록8</div>
        <div id="list2">등록일</div>
        <div id="list3">회의록7</div>
        <div id="list3">등록일</div>
        <div id="list4">회의록6</div>
        <div id="list4">등록일</div>
        <div id="list5">회의록5</div>
        <div id="list6">등록일</div>
        <div id="list6">회의록4</div>
        <div id="list6">등록일</div>
        <div id="list7">회의록3</div>
        <div id="list7">등록일</div>
        <div id="list8">회의록2</div>
        <div id="list8">등록일</div>
        <div id="list9">회의록1</div>
        <div id="list9">등록일</div>
        
        

        


    </div>
    
    

    

</body>
</html>