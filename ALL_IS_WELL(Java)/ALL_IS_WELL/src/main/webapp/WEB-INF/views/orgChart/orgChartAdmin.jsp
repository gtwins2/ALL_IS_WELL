<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        margin-top: 150px;
        grid-column: 1/7;
        margin-left: -210px;
        height: 100px;
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

	.btnClass{
		width: 180px;
        height: 70px;
        background-color: #FF8686;
         font-size: 25px;
          margin-left: 50px;
          font-weight: bold;
        color: white;
        border: none;
	}
	.btnClass33{
		width: 180px;
        height: 80px;
        background-color: #FF8686;
        font-size: 25px;
        margin-left: 932px;
        font-weight: bold;
        color: white;
        border: none;
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
        margin-left: 100px;
        font-size: 25px;
    }

    .updown2 {
        margin-left: 135px;
    	border: 1px solid black;
        width: 0.1px;
        height: 100px;
    }
    
    .updown1 {
        margin-left: 1020px;
        border: 1px solid black;
        width: 0.1px;
        height: 215px;
    }
    
    .updown3 {
        margin-left: 160px;
        border: 1px solid black;
        width: 1600px;
        height: 0.1px;
    }

    .updownall{
        position: absolute;
        margin-left: 0px;
        margin-top: -100px;
        border: 1px solid black;
        width: 0.1px;
        height: 395px;
    }

    .rightbox{
        margin-left: 135px;
        border: 1px solid black;
        width: 135px;
        height: 0.1px;
    }

    .centerbox{
        border: 1px solid black;
        width: 270px;
        height: 0.1px;
    }

    .leftbox{
    	margin-left: -2px;
        border: 1px solid black;
        width: 139px;
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
        left: 700px;
        top: 200px;
        width: 800px; /* Full width */
        height: 500px; /* Full height */
        overflow: hidden;
        /* background-color: rgb(0,0,0);
        background-color: rgba(0,0,0,0.4); /* 
      }

        /* Modal Content/Box */
        .modal-content {
        background-color: #fefefe;
        margin: 15% auto; /* 15% from the top and centered */
        margin-left: 100px;
        padding: 20px;
        border: 1px solid #888;
        width: 500px; /* Could be more or less, depending on screen size */
        height: 300px;
        text-align: justify;
        line-height: 1.6;
      }

      .close {
        color: #aaaaaa;
        float: right;
        font-size: 40px;
        font-weight: bold;
      }

      .close:hover,
      .close:focus {
        color: #000;
        text-decoration: none;
        cursor: pointer;
      }
      
      #sendRequest {
        font-size: 20px;
        color: white;
        background-color: #FF8686;
        size: 10px;
        border: none;
        padding: 10px 15px;
        cursor: pointer;
        border-radius: 5px;
        font-weight: bold;
    }
    
    .modal > p {
    	margin-left: 200px;
    }

</style>
</head>
<body>

	<header>
		<%@ include file="/WEB-INF/views/common/admin/header.jsp" %>
	</header>
	
	<main id="wrap">
		<div>
			<%@ include file="/WEB-INF/views/common/admin/side-bar.jsp" %>
		</div>
		
		<div id="wrapper">

		    <div id="box1">
		         <button type="button" class="btnClass33" id="btn${vo.id}" data-name="${vo.mname}" data-position="${vo.position}" data-department="${vo.dname}" data-phone="${vo.phoneNumber}" data-email="${vo.email}">
			        병원장
			    </button>
		        <div class="updown1"></div>
		        
		    </div>
		
			<c:forEach items="${voList}" var="vo">
			<c:if test="${vo.dname eq '외과'}">
				<div id="box2">
					<div class="rightbox"></div>
			        <div class="updown2"></div>
			         <button type="button" class="btnClass" id="btn${vo.id}" data-name="${vo.mname}" data-position="${vo.position}" data-department="${vo.dname}" data-phone="${vo.phoneNumber}" data-email="${vo.email}">
        ${vo.dname}
    </button>
		        <br>
		        <br>
		        <div id="namearea">
		            ${vo.mname}
		            <br>
		            
		        </div>
		    </div>
		    </c:if>
		    
		    <c:if test="${vo.dname eq '소아청소년과'}">
				<div id="box2">
                <div class="centerbox"></div>
		        <div class="updown2"></div>
                
		         <button type="button" class="btnClass" id="btn${vo.id}" data-name="${vo.mname}" data-position="${vo.position}" data-department="${vo.dname}" data-phone="${vo.phoneNumber}" data-email="${vo.email}">
        ${vo.dname}
    </button>
		        <br>
		        <br>
		        <div id="namearea">
					${vo.mname}
		        </div>		        
            </div>
		    </c:if>


		    <c:if test="${vo.dname eq '피부과'}">
				<div id="box2">
                <div class="centerbox"></div>
		        <div class="updown2"></div>
		        <div class="updownall"></div>
                
		         <button type="button" class="btnClass" id="btn${vo.id}" data-name="${vo.mname}" data-position="${vo.position}" data-department="${vo.dname}" data-phone="${vo.phoneNumber}" data-email="${vo.email}">
        ${vo.dname}
    </button>
		        <br>
		        <br>
		        <div id="namearea">
					${vo.mname}
		        </div>		        
            </div>
		    </c:if>


		    <c:if test="${vo.dname eq '안과'}">
				<div id="box2">
                <div class="centerbox"></div>
		        <div class="updown2"></div>
                
		         <button type="button" class="btnClass" id="btn${vo.id}" data-name="${vo.mname}" data-position="${vo.position}" data-department="${vo.dname}" data-phone="${vo.phoneNumber}" data-email="${vo.email}">
        ${vo.dname}
    </button>
		        <br>
		        <br>
		        <div id="namearea">
					${vo.mname}
		        </div>		        
            </div>
		    </c:if>
		    
		    <c:if test="${vo.dname eq '치과'}">
				<div id="box2">
                <div class="leftbox"></div>
		        <div class="updown2"></div>
                
		         <button type="button" class="btnClass" id="btn${vo.id}" data-name="${vo.mname}" data-position="${vo.position}" data-department="${vo.dname}" data-phone="${vo.phoneNumber}" data-email="${vo.email}">
        ${vo.dname}
    </button>
		        <br>
		        <br>
		        <div id="namearea">
					${vo.mname}
		        </div>		        
            </div>
		    </c:if>
		    
		    
		    
		    <c:if test="${vo.dname eq '정신과'}">
				<div id="box2">
                <div class="rightbox"></div>
		        <div class="updown2"></div>
                
		         <button type="button" class="btnClass" id="btn${vo.id}" data-name="${vo.mname}" data-position="${vo.position}" data-department="${vo.dname}" data-phone="${vo.phoneNumber}" data-email="${vo.email}">
        ${vo.dname}
    </button>
		        <br>
		        <br>
		        <div id="namearea">
					${vo.mname}
		        </div>		        
            </div>
		    </c:if>
		    
		    <c:if test="${vo.dname eq '내과'}">
				<div id="box2">
                <div class="centerbox"></div>
		        <div class="updown2"></div>
		        <div class="updownall"></div>
                
		         <button type="button" class="btnClass" id="btn${vo.id}" data-name="${vo.mname}" data-position="${vo.position}" data-department="${vo.dname}" data-phone="${vo.phoneNumber}" data-email="${vo.email}">
        ${vo.dname}
    </button>
		        <br>
		        <br>
		        <div id="namearea">
					${vo.mname}
		        </div>		        
            </div>
		    </c:if>
		    
		    <c:if test="${vo.dname eq '물리치료과'}">
				<div id="box2">
                <div class="leftbox"></div>
		        <div class="updown2"></div>
                
		         <button type="button" class="btnClass" id="btn${vo.id}" data-name="${vo.mname}" data-position="${vo.position}" data-department="${vo.dname}" data-phone="${vo.phoneNumber}" data-email="${vo.email}">
        ${vo.dname}
    </button>
		        <br>
		        <br>
		        <div id="namearea">
					${vo.mname}
		        </div>		        
            </div>
		    </c:if>
		    
		    <c:if test="${vo.dname eq '산부인과'}">
				<div id="box2">
                <div class="rightbox"></div>
		        <div class="updown2"></div>
                
		         <button type="button" class="btnClass" id="btn${vo.id}" data-name="${vo.mname}" data-position="${vo.position}" data-department="${vo.dname}" data-phone="${vo.phoneNumber}" data-email="${vo.email}">
        ${vo.dname}
    </button>
		        <br>
		        <br>
		        <div id="namearea">
					${vo.mname}
		        </div>		        
            </div>
		    </c:if>
		    
		    <c:if test="${vo.dname eq '응급의학과'}">
				<div id="box2">
                <div class="leftbox"></div>
		        <div class="updown2"></div>
                
		         <button type="button" class="btnClass" id="btn${vo.id}" data-name="${vo.mname}" data-position="${vo.position}" data-department="${vo.dname}" data-phone="${vo.phoneNumber}" data-email="${vo.email}">
			        ${vo.dname}
			    </button>
		        <br>
		        <br>
		        <div id="namearea">
					${vo.mname}
		        </div>		        
            </div>
		    </c:if>
		    
		    
			</c:forEach> 


		<c:forEach items="${voList}" var="vo">
		<div id="myModal" class="modal">
            <div class="modal-content">
              <span class="close">&times;</span>
                <p style="text-align: center; font-size: 22px;">
	                이름 : <span id="mname"></span>
	                <br>
	                직급 : <span id="position"></span>
	                <br>
	                부서 : <span id="department"></span>
	                <br>
	                전화번호 : <span id="phone"></span>
	                <br>
	                이메일 : <span id="email"></span>
	                <br>
	                
	                <br>
	                 <button id="sendRequest" onclick="put();">회원리스트조회</button>
            	</p>
            </div>
        </div>
		</c:forEach>
		
		
		</div>
	
        
       
        
</main>
	<footer>
		<%@ include file="/WEB-INF/views/common/admin/footer.jsp" %>
	</footer>

<script>
var modal = document.getElementById("myModal"); // 모달 요소
var buttons = document.querySelectorAll(".btnClass"); // 모든 버튼 요소들

// 각 버튼 요소에 대하여
buttons.forEach(function(btn) {
    // 클릭 이벤트 핸들러 등록
    btn.addEventListener("click", function() {
        // 버튼의 data 속성으로부터 정보를 가져옴
        var name = this.getAttribute("data-name");
        var position = this.getAttribute("data-position");
        var department = this.getAttribute("data-department");
        var phone = this.getAttribute("data-phone");
        var email = this.getAttribute("data-email");

        // 모달 내부의 요소에 정보를 설정
        var mnameElem = modal.querySelector("#mname");
        var positionElem = modal.querySelector("#position");
        var departmentElem = modal.querySelector("#department");
        var phoneElem = modal.querySelector("#phone");
        var emailElem = modal.querySelector("#email");
        mnameElem.innerText = name;
        positionElem.innerText = position;
        departmentElem.innerText = department;
        phoneElem.innerText = phone;
        emailElem.innerText = email;

        // 모달 요소를 표시
        modal.style.display = "block";
    });
});

// 모달 닫기 버튼 클릭 이벤트 핸들러 등록
var closeBtn = modal.querySelector(".close");
closeBtn.addEventListener("click", function() {
    modal.style.display = "none"; // 모달 숨기기
});

function put() {
	location.href = "${root}/member/list"
}
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


    

</body>
</html>