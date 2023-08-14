<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>환자 입원 등록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<style type="text/css">
	 #wrap{
			width: 1920px;
			height: 750px;
			display: grid;
			grid-template-columns: 150px 1770px;
		}
	   
	   .main-area {
	        width: 80%;
        	margin: auto;
            padding: 20px;
	    }
	   
	   .title-area {
	   			text-align: center;
	            display: flex;
	            justify-content: space-between;
	        }

        #title {
            font-size: 28px;
            margin-top: 10px;
            margin-left: 140px;
        }


        .register-area {
               margin: auto;
        width: 80%;
        height: 800px;
        	height: 50%;
            margin: 0 auto;
            margin-top: 20px;
            background: #FFFFFF;
            border: 1px solid #C4C4C4;
            box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
            border-radius: 20px;
             padding: 30px;
        }

        #registerForm {
       
           /*  display: grid;
            grid-template-columns: repeat(2, 1fr); */
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
            width: 20%;
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
            height: 100%;
        }

        #people {
            width: 50%;
            height: 100%;
        }

        .btn-area {
            margin: 0 auto;
            display: flex;
            justify-content: flex-end;
            align-items: center;
            margin-right: 140px;
            margin-top: 30px;
        }

        #addBtn {
        	
            padding: 10px 20px;
            background-color: #5A8CF2;
            border: none;
            font-weight: bold;
            font-size: 15px;
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
            font-size: 15px;
            color: white;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
            margin-left: 20px;
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
            height: 40px;
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
		  justify-content: space-between;
		  align-items: center;
		  padding: 5px;

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
		 
		  padding: 5px;
		}
		
		.search-result-deco {
			font-weight: normal;
			font-size: 15px;
			padding: 10px;
			
		}
		
		.result-area {
		  display: flex;
		  justify-content: center;
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
	    
	    #searchBtn {
	    	padding: 10px 20px;
            background-color: #5A8CF2;
            border: none;
            font-weight: bold;
            font-size: 15px;
            color: white;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
           
	    }

        
</style>
</head>
<body>
	 <header>
      <%@include file="/WEB-INF/views/common/member/header.jsp" %>
   </header>
   
   <main id="wrap">
   		<div>
   			<%@ include file="/WEB-INF/views/common/member/side-bar.jsp" %>
   		</div>
      
		
		<div class="main-area">
			<div class="title-area">
                <div id="title">환자 입원 접수</div>
           	</div>

           	<div class="register-area">
                <form action="/app/admission/registerPatient" id="registerForm" method="POST">
                    <div class="area">
                        <span>환자명</span>
                        <input type="text" name="patientName" required id="patientName">
                        <input type="hidden" name="patientNo" id="patientNo">
                        <input type="hidden" name="no" id="roomNo">
                        
                    </div>
                    
                
                    <div class="area">   
                        <span>입원날짜</span>
                        <input type="datetime-local" name="admissionDate" id="admissionDate" required>
                    </div>

                    <div class="area">
                        <span>퇴원날짜</span>
                        <input type="datetime-local" name="dischargeDate">
                    </div>

                    <div class="area">
                        <span>입원 사유</span>
                        <textarea id="" cols="30" rows="10" name="reason" required></textarea>
                    </div>

                    

                
                </form>
            </div>    
           
           	
           	<div class="btn-area">
            	<input type="submit" value="접수" id="addBtn">
            	<button id="backBtn" onclick="goBack();">뒤로가기</button>
        	</div>
           	
           	
           	
        </div>
        
		
    </main>

    <div id="modal" class="modal">
  <div class="modal-content">
    <span class="close">&times;</span>
    <h2 id="modal-title">환자 검색</h2>
    <br>
    <form action="" id="searchForm" class="search-area" onsubmit="searchPatients(); return false;">
        <label for="search" class="category-area">
            <select name="search" id="search">
                <option value="name">성명</option>
            </select>
            

        </label>
        <input type="text" id="search-input" name="searchName" >
       	<input type="submit" value="검색" id="searchBtn">
    </form>
    <br>
    <br>

    <div class="result-area">
        <div class="result-title">이름</div>
        <div class="result-title">주민등록번호</div>
        <div></div>
    </div>
    <hr>
	
	<div class="result-container">
	
	</div>
	
    

   <br>
   <br>
   <br>

    <div class="modal-btn-area">
        <button class="modal-btn">확인</button>
        <button class="modal-btn" id="closeBtn">취소</button>
    </div>
  </div>
</div>


   <footer>
      <%@ include file="/WEB-INF/views/common/member/footer.jsp" %>
   </footer>
   
   <script>
   
		   var modal = document.getElementById('modal');
		   var patientName = document.getElementById('patientName');
		   var closeBtn = document.getElementsByClassName('close')[0];
		
		   var closeButton = document.querySelector("#closeBtn");
		   
		   closeButton.addEventListener("click", function(){
			   closeModal();
		   });
		   
		   function openModal() {
		       modal.style.display = 'block';
		       
		       $.ajax({
		    	   url: "/app/admission/getPatientList",
		            type: "get",
		            dataType: "json",
		            success: function (data) {
		                console.log(data);
		                
		                updateResultContainer(data);
		                
		            },
		            error: function (error) {
		                console.log(error);
		                alert("검색 결과 전달 실패");
		            }
		       });
		   }
		
		   function closeModal() {
		       modal.style.display = 'none';
		       document.getElementById('searchForm').reset();
		       clearSearchResults();
		       clearSearchInput();
		       resetSelectedPatients();
		   }
		
		   patientName.addEventListener('focus', openModal);
		
		   closeBtn.addEventListener('click', closeModal);
		
		   function clearSearchResults() {
		       const resultContainer = document.querySelector('.result-container');
		       resultContainer.innerHTML = '';
		   }
		
		   function clearSearchInput() {
		       const searchInput = document.getElementById('search-input');
		       searchInput.value = '';
		   }
		
		   function resetSelectedPatients() {
		       selectedPatients = [];
		   }


	</script>
	
	<script type="text/javascript">
	 var selectedPatients = [];
	
		document.getElementById('searchBtn').addEventListener('click', function (event) {
		    event.preventDefault();
		    searchPatients();
		});
		
		
	
	
		function searchPatients() {
		    const modalSearch = document.querySelector('#search-input').value;

		    if (modalSearch.length > 0) {
		        $.ajax({
		            url: "/app/admission/searchPatient",
		            type: "get",
		            data: { name: modalSearch },
		            dataType: "json",
		            success: function (data) {
		                console.log(data);
		                
		                updateResultContainer(data);
		                
		            },
		            error: function (error) {
		                console.log(error);
		                alert("검색 결과 전달 실패");
		            }
		        });
		    } else {
		    	const resultContainer = document.querySelector('.result-container');
		        resultContainer.innerHTML = '';
		    }
		}
		
		
		

		
		function updateResultContainer(data) {
		    const resultContainer = document.querySelector('.result-container');
		    resultContainer.innerHTML = '';

		    data.forEach(item => {
		      const resultRow = document.createElement('div');
		      resultRow.classList.add('search-result');

		      // 이름
		      const nameColumn = document.createElement('div');
		      nameColumn.classList.add('search-result-deco');
		      nameColumn.textContent = item.name;
		      resultRow.appendChild(nameColumn);

		      // 주민등록번호
		      const registrationNumberColumn = document.createElement('div');
		      registrationNumberColumn.classList.add('search-result-deco');
		      registrationNumberColumn.textContent = item.registrationNumber;
		      resultRow.appendChild(registrationNumberColumn);

		      // 체크박스 추가
		      const checkboxColumn = document.createElement('div');
		      const checkbox = document.createElement('input');
		      checkbox.type = 'checkbox';
		      checkbox.name = 'patientName';
		      checkbox.id = 'checkbox_' + item.no;
		      checkbox.value = item.name;
		      checkboxColumn.appendChild(checkbox);
		      resultRow.appendChild(checkboxColumn);

		      resultContainer.appendChild(resultRow);

		      checkbox.addEventListener('change', function () {
		        if (this.checked) {
		          selectedPatients.push({
		            no: item.no,
		            name: item.name,
		          });
		        } else {
		          selectedPatients = selectedPatients.filter(patient => patient.name !== item.name);
		        }
		      });
		    });
		  }
	    
	    
		 const confirmBtn = document.querySelector('.modal-btn');
		 
		 
		 confirmBtn.addEventListener('click', function () {
			    const checkedCheckbox = document.querySelector('input[name="patientName"]:checked');

			    if (checkedCheckbox) {
			        const selectedPatientName = checkedCheckbox.value;
			        const selectedPatientNo = checkedCheckbox.id.split('_')[1];

			        console.log('Selected Patient Name:', selectedPatientName);
			        console.log('Selected Patient No:', selectedPatientNo);

			        document.getElementById('patientName').value = selectedPatientName;
			        document.getElementById('patientNo').value = selectedPatientNo;
			     }

			    closeModal();
			});
		    
		    
	        
		 

		</script>




	
	<script type="text/javascript">
		const sideBar = document.querySelector("#side-bar")
	    const subMenus = document.querySelectorAll(".sub-menu");
	    const thirdSidebars = document.querySelectorAll(".third-sidebar");
	
	    subMenus.forEach(subMenu => {
	        subMenu.style.height = sideBar.offsetHeight + 'px';
	    });
	
	    thirdSidebars.forEach(thirdSidebar => {
	        thirdSidebar.style.height = sideBar.offsetHeight + 'px';
	    });
	    
	    //뒤로가기 버튼
	    function goBack() {
        	window.history.back();
   	 	}
	    
	    
	    //입원실 방 번호 뽑아오기
	    const urlParams = new URLSearchParams(window.location.search);

		const roomNumber = urlParams.get('no');
		
		const roomNo = document.querySelector("#roomNo");
		
		roomNo.value = roomNumber;
	   
	    
	    //제출하기
	    const submitBtn = document.getElementById('addBtn');
	    submitBtn.addEventListener('click', function (event) {
	        event.preventDefault(); 
	        
	        
	        
	        document.getElementById('registerForm').submit();
	        
	        alert("접수 완료");
	    });
	    
	    
	   
	   
	</script>
</body>
</html>