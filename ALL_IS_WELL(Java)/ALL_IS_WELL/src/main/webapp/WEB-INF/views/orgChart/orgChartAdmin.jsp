<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

    #wrapper{
    	margin-left: -70px;
        display: grid;
        width: 1620px;
        height: 1200px;
        grid-template-rows: repeat(3, 1fr);
        grid-template-columns: repeat(6, 1fr);
    }

    #box1{
        grid-column: 1/7;
        margin-left: -210px;
    }

    #box2{

    }

    #btn1{
        width: 245px;
        height: 70px;
        background-color: #FF8686;
        margin-left: 900px;
        margin-top: 150px;
        font-size: 25px;
    }

    #text1{
        display: inline-block;
        width: 180px;
        height: 40px;
        margin: 15px;
        margin-left: 30px;
        color: white;
        font-size: 25px;
    }

    #btn3{
        width: 180px;
        height: 70px;
        background-color: #FF8686;
        margin-left: 50px;
        margin-top: 0px;
        font-size: 25px;
    }
    #btn4{
        width: 180px;
        height: 70px;
        background-color: #FF8686;
        margin-left: 50px;
        margin-top: 0px;
        font-size: 25px;
    }
    #btn5{
        width: 180px;
        height: 70px;
        background-color: #FF8686;
        margin-left: 50px;
        margin-top: 0px;
        font-size: 25px;
    }
    #btn6{
        width: 180px;
        height: 70px;
        background-color: #FF8686;
        margin-left: 50px;
        margin-top: 0px;
        font-size: 25px;
    }
    #btn7{
        width: 180px;
        height: 70px;
        background-color: #FF8686;
        margin-left: 50px;
        margin-top: 0px;
        font-size: 25px;
    }
    #btn8{
        width: 180px;
        height: 70px;
        background-color: #FF8686;
        margin-left: 50px;
        margin-top: 0px;
        font-size: 25px;
    }
    #btn9{
        width: 180px;
        height: 70px;
        background-color: #FF8686;
        margin-left: 50px;
        margin-top: 0px;
        font-size: 25px;
    }
    #btn10{
        width: 180px;
        height: 70px;
        background-color: #FF8686;
        margin-left: 50px;
        margin-top: 0px;
        font-size: 25px;
    }
    #btn11{
        width: 180px;
        height: 70px;
        background-color: #FF8686;
        margin-left: 50px;
        margin-top: 0px;
        font-size: 25px;
    }
    #btn12{
        width: 180px;
        height: 70px;
        background-color: #FF8686;
        margin-left: 50px;
        margin-top: 0px;
        font-size: 25px;
    }
    #btn13{
        width: 180px;
        height: 70px;
        background-color: #FF8686;
        margin-left: 50px;
        margin-top: 0px;
        font-size: 25px;
    }
    #btn2{
        width: 180px;
        height: 70px;
        background-color: #FF8686;
        margin-left: 50px;
        margin-top: 0px;
        font-size: 25px;
    }

    #text2{
        display: inline-block;
        width: 150px;
        height: 40px;
        margin: 15px;
        margin-left: 10px;
        color: white;
        font-size: 25px;
    }

    #btn3{
        width: 180px;
        height: 70px;
        background-color: #FF8686;
        margin-left: 600px;
        margin-top: 300px;
    }

    #text3{
        display: inline-block;
        width: 150px;
        height: 40px;
        margin: 15px;
        margin-left: 10px;
        color: white;
        font-size: 25px;
    }

    #namearea{
        margin-left: 70px;
        font-size: 25px;
    }

    .updown2 {
        margin-left: 135px;
    	border: 3px solid black;
        width: 0.1px;
        height: 100px;
    }
    
    .updown1 {
        margin-left: 1020px;
        border: 3px solid black;
        width: 0.1px;
        height: 200px;
    }
    
    .updown3 {
        margin-left: 160px;
        border: 3px solid black;
        width: 1600px;
        height: 0.1px;
    }

    .updownall{
        position: absolute;
        margin-left: 0px;
        margin-top: -100px;
        border: 3px solid black;
        width: 0.1px;
        height: 390px;
    }

    .rightbox{
        margin-left: 135px;
        border: 3px solid black;
        width: 135px;
        height: 0.1px;
    }

    .centerbox{
        border: 3px solid black;
        width: 270px;
        height: 0.1px;
    }

    .leftbox{
    	margin-left: -2px;
        border: 3px solid black;
        width: 143px;
        height: 0.1px;
    }
    
     #wrap{
      width: 1920px;
      height: 1500px;
      display: grid;
      grid-template-columns: 300px 1620px;
   	}

    .modal {
        display: none; /* Hidden by default */
        position: fixed; /* Stay in place */
        z-index: 1; /* Sit on top */
        left: 0;
        top: 0;
        width: 100%; /* Full width */
        height: 100%; /* Full height */
        overflow: auto; /* Enable scroll if needed */
        background-color: rgb(0,0,0); /* Fallback color */
        background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
      }

        /* Modal Content/Box */
        .modal-content {
        background-color: #fefefe;
        margin: 15% auto; /* 15% from the top and centered */
        padding: 20px;
        border: 1px solid #888;
        width: 80%; /* Could be more or less, depending on screen size */
      }

      /* The Close Button */
      .close {
        color: #aaaaaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
      }

      .close:hover,
      .close:focus {
        color: #000;
        text-decoration: none;
        cursor: pointer;
      }

</style>
</head>
<body>

	<header>
		<%@ include file="/WEB-INF/views/common/admin/header.jsp" %>
	</header>
	
	<div id="wrap">
		<div>
			<%@ include file="/WEB-INF/views/common/admin/side-bar.jsp" %>
		</div>
		
		<div id="wrapper">

		    <div id="box1">
		        <button type="button" class="btnClass" id="btn1">병원장</button>
		        <div class="updown1"></div>
		        
		    </div>
		
			<c:forEach items="${voList}" var="vo">
                         <div id="box2">
					        <div class="rightbox"></div>
					        <div class="updown2"></div>
					        <button type="button" class="btnClass" id="btn2">왜과</button>
					        <br>
					        <br>
					        <div id="namearea">
					            ${vo.mname}
					            <br>
					            ${vo.dname}
					            <br>
					            ${vo.position}
					            <br>
					            ${vo.phoneNumber}
					            <br>
					            ${vo.email}
					        </div>
					    </div>
            </c:forEach>
		
		   	<div id="box2">
		        <div class="rightbox"></div>
		        <div class="updown2"></div>
		        <button type="button" class="btnClass" id="btn2">일반외과</button>
		        <br>
		        <br>
		        <div id="namearea">
		            정   과장   송준섭
		            <br>
		            부   팀장   이현철
		        </div>
		    </div>
		

		    <div id="box2">
                <div class="centerbox"></div>
		        <div class="updown2"></div>
                <div class="updownall"></div>
		        <button type="button" class="btnClass" id="btn2">일반내과</button>
		        <br>
		        <br>
		        <div id="namearea">
		            정   과장   송준섭
		            <br>
		            부   팀장   이현철
		        </div>		        
		    </div>

   
            <div id="box2">
                <div class="centerbox"></div>
		        <div class="updown2"></div>
                
		        <button type="button" class="btnClass" id="btn2">소아과</button>
		        <br>
		        <br>
		        <div id="namearea">
		            정   과장   송준섭
		            <br>
		            부   팀장   이현철
		        </div>		        
            </div>

            <div id="box2">
                <div class="centerbox"></div>
		        <div class="updown2"></div>
                <div class="updownall"></div>
		        <button type="button" class="btnClass" id="btn2">정형외과</button>
		        <br>
		        <br>
		        <div id="namearea">
		            정   과장   송준섭
		            <br>
		            부   팀장   이현철
		        </div>		        
            </div>

            <div id="box2">
                <div class="centerbox"></div>
		        <div class="updown2"></div>
                
		        <button type="button" class="btnClass" id="btn2">산부인과</button>
		        <br>
		        <br>
		        <div id="namearea">
		            정   과장   송준섭
		            <br>
		            부   팀장   이현철
		        </div>		        
            </div>

            <div id="box2">
                <div class="leftbox"></div>
		        <div class="updown2"></div>
                <div class="updownall"></div>
		        <button type="button" class="btnClass" id="btn2">응급의학과</button>
		        <br>
		        <br>
		        <div id="namearea">
		            정   과장   송준섭
		            <br>
		            부   팀장   이현철
		        </div>		        
            </div>

            <div id="box2">
                <div class="rightbox"></div>
		        <div class="updown2"></div>
		        <button type="button" class="btnClass" id="btn2">치과</button>
		        <br>
		        <br>
		        <div id="namearea">
		            정   과장   송준섭
		            <br>
		            부   팀장   이현철
		        </div>		        
            </div>

            <div id="box2">
                <div class="leftbox"></div>
		        <div class="updown2"></div>
		        <button type="button" class="btnClass" id="btn2">재활과</button>
		        <br>
		        <br>
		        <div id="namearea">
		            정   과장   송준섭
		            <br>
		            부   팀장   이현철
		        </div>		        
            </div>

            <div id="box2">
                <div class="rightbox"></div>
		        <div class="updown2"></div>
		        <button type="button" class="btnClass" id="btn2">정신과</button>
		        <br>
		        <br>
		        <div id="namearea">
		            정   과장   송준섭
		            <br>
		            부   팀장   이현철
		        </div>		        
            </div>

            <div id="box2">
                <div class="leftbox"></div>
		        <div class="updown2"></div>
		        <button type="button" class="btnClass" id="btn2">안과</button>
		        <br>
		        <br>
		        <div id="namearea">
		            정   과장   송준섭
		            <br>
		            부   팀장   이현철
		        </div>		        
            </div>

            <div id="box2">
                <div class="rightbox"></div>
		        <div class="updown2"></div>
		        <button type="button" class="btnClass"  id="btn2" >임상병리과</button>
		        <br>
		        <br>
		        <div id="namearea">
		            정   과장   송준섭
		            <br>
		            부   팀장   이현철
		        </div>		        
            </div>

            <div id="box2">
                    <div class="leftbox"></div>
		        <div class="updown2"></div>
		        <button type="button" class="btnClass" id="btn2" >흉부외과</button>
		        <br>
		        <br>
		        <div id="namearea">
		            정   과장   송준섭
		            <br>
		            부   팀장   이현철
		        </div>		        
            </div>
		
		</div>
	
        <div id="myModal" class="modal">
            <div class="modal-content">
              <span class="close">&times;</span>
              <p>
                이름 : 송준섭
                <br>
                직급 : 과장
                <br>
                부서 : 외과
                <br>
                전화번호 : 0100101010
                <br>
                이메일 : asdfa@naver.com
              </p>
            </div>
        </div>

	<footer>
		<%@ include file="/WEB-INF/views/common/admin/footer.jsp" %>
	</footer>

<script>
        // Get the modal
        var modal = document.getElementById("myModal");
  
        // Get the button that opens the modal
        // var btn = document.querySelector("#btn2");
        var btns = document.querySelectorAll(".btnClass");
  
  
        // Get the <span> element that closes the modal
        
  
        // When the user clicks on the button, open the modal
        for(i=0; i<13; i++){

            var span = document.getElementsByClassName("close")[0];

            btns[i].onclick = function () {
              modal.style.display = "block";
            }

            span.onclick = function() {
            modal.style.display = "none";

            window.onclick = function(event) {
          if (event.target == modal) {
            modal.style.display = "none";
          }
        }

        }


        }
  
        // When the user clicks on <span> (x), close the modal
        
  
        // When the user clicks anywhere outside of the modal, close it
        



        
</script>


    

</body>
</html> --%>