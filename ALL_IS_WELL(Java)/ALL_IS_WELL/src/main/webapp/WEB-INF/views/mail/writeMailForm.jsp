<%-- <%@page import="com.kh.app.member.vo.MemberVo"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메일 작성하기</title>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

<style>
	   
	   #wrap{
				width: 1920px;
				height: 1500px;
				display: grid;
				grid-template-columns: 150px 1770px;
			}
		   
        .main-area {
            width: 90%;
            min-height: 80%;
            margin: 0 auto;
            margin-top: 50px;
            margin-left: 370px;
        }

        #writeMail {
            font-size: 30px;
        }

        #send {
            color: white;
            background-color: #5A8CF2;
            size: 5px;
            border: none;
            padding: 10px 10px;
            cursor: pointer;
            border-radius: 5px;
            font-weight: bold;

        }

        #send:hover {
            background-color: #555;

        }

        .receive-area {
            display: flex;
            flex-direction: row;
            align-items: center;
        }

        .receive-area div {
            margin-right: 10px;
        }

        .receive-area input[type="checkbox"] {
            margin-right: 5px;
        }

        .receive-area input[type="text"] {
            padding: 5px;
            border: 1px solid lightgray;
            border-radius: 3px;
            width: 700px;
            height: 30px;
            
        }

            #me {
                font-size: 10px;
            }

            .title-area {
                display: flex;
                flex-direction: row;
                align-items: center;
            }

            .title-area div {
            margin-right: 10px;
        }

        .title-area input[type="text"] {
            padding: 5px;
            border: 1px solid lightgray;
            border-radius: 3px;
            width: 800px;
            height: 30px;
            margin-left: 93px;
        }

        .title-area input[type="text"]:focus {
            outline: none;
            border-color: #5A8CF2;
            box-shadow: 0 0 3px #5A8CF2;
           
        }

        .receive-area input[type="text"]:focus {
            outline: none;
            border-color: #5A8CF2;
            box-shadow: 0 0 3px #5A8CF2;
           
           
        }


        .file-area {
            display: flex;
            align-items: center;
        }

        .file-area div {
            margin-right: 10px;
        }

        .file-area button {
            color: white;
            background-color: #5A8CF2;
            size: 5px;
            border: none;
            padding: 5px 10px;
            cursor: pointer;
            
            font-weight: bold;
        }

        .file-area button:hover {
            background-color: #555;
        }

        #chooseFile {
            margin-right: 10px;
            margin-left: 62px;
        }

        #deleteAll {
        	margin-left: 100px;
            margin-right: 10px;
        }

      
   
        .custom-hr {
        border: none;
        height: 1px;
        width: 940px;
        background-color: #DDD;
        margin: 0;
    }
    
	    #address {
	    background-color: #5A8CF2;
	    border: none;
	    color: white;
	    width: 80px;
	    height: 30px;
	    padding: 5px 10px;
	    font-weight: bold;
	    font-size: 15px;
	    border-radius: 5px;
	    cursor: pointer;
	    transition: background-color 0.3s ease-in-out;
	    margin-left: 20px;
	}

#address:hover {
    background-color: #4C7BEF;
}

#address:focus {
    outline: none;
    box-shadow: 0 0 3px rgba(90, 140, 242, 0.5);
}

.search-title {
	display: flex;
	flex-direction: row;
	justify-content: space-between;
}

.add-email-button {
	background-color: #5A8CF2;
	color: white;
	border: none;
	padding: 5px 5px;
	border-radius: 10px;
}


.delete-email-btn {
	margin-left: 5px;
    border: none;
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
            <div id="writeMail">메일 쓰기</div>
            <br>
            <br>
            <br>
            <br>
            <button id="send" type="button">보내기</button>
            
            <br>
            <br>
            <hr class="custom-hr">
            <br>
            <br>
            <br>
            
            <form action="/app/mail/writeMail" method="post" enctype="multipart/form-data" id="sendForm">
                <div class="receive-area">
                    <div>받는 사람</div>
                    <input type="checkbox" name="to-me">
                    <div id="me">나에게</div>
    
                    <input type="text" name="receiverMailAddress" id="receivePerson">
        			<input type="hidden" name="selectedMemberNumbers" id="selectedMemberNumbers">
                    <button type="button" id="address" data-toggle="modal" data-target="#addressModal">주소록</button>
                </div>
                <br>
                <br>
                <br>

                <div class="title-area">
                    <div>제목</div>
                    <input type="text" name="mailTitle">
                </div>
                <br>
                <br>
                <br>

                <div class="file-area">
                    <div>파일 첨부</div>
                    <input type="file" id="chooseFile" multiple name="attachments"></input>
                    <button type="button" id="deleteAll">모두 삭제</button>
                </div>
                <br>
                <br>
                <br>


                <div class="content-area">
                    <textarea id="mailContent" name="mailContent" ></textarea>
                </div>
            </form>
            



            <br>
            <br>

        </div>
   </main>

   <footer>
      <%@ include file="/WEB-INF/views/common/member/footer.jsp" %>
   </footer>
   
   
   <!-- 모달창 -->
   <div class="modal fade" id="addressModal" tabindex="-1" role="dialog" aria-labelledby="addressModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addressModalLabel">이메일 검색</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="/app/mail/searchEmail" method="get" id="searchArea">
                    <div class="form-group">
                        <label for="searchInput">검색하기</label>
                        <input type="text" class="form-control" id="searchInput" placeholder="이름을 입력하세요">
                    </div>
                </form>
                <br>
                <br>
                
                <div class="search-result">
                	
                </div>
                <hr>
                 <div class="selected-emails">
        		</div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
                <button type="button" class="btn btn-primary" style="background-color: #5A8CF2; border:none;" id="choose">선택</button>
            </div>
           
        </div>
    </div>
</div>
   
   
   
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
	    
	   
	    
	    
	 
	    
	  
	    
	    
	</script>	  
	
	<script type="text/javascript">
		 //뒤로가기 버튼
	    function goBack() {
	    	window.history.back();
		 }
		 
		//썸머노트
	    $(document).ready(function() {
	    	//여기 아래 부분
	    	$('#mailContent').summernote({
	    	    height: 800,
	    	    width: 950,
	    	    minHeight: null,
	    	    maxHeight: null,
	    	    focus: true,
	    	    lang: "ko-KR",
	    	    placeholder: '내용을 입력하세요',
	    	    callbacks: {
	    	        onImageUpload : function(files) {
	    	        	sendFile(files[0], this);
	    	        }
	    	      },
	    	});
	    });
		
		//섬머노트 이미지 파일 업로드
		function sendFile(file, editor) {
			var data = new FormData();
			data.append("file", file);
			console.log(file);
			
			$.ajax({
				data : data,
				type : 'POST',
				url : '/app/mail/summernoteUpload',
				contentType: false,
				processData: false,
				success: function(data) {
					if(data.result === 'ok') {
						var saveFileName = data.saveFileName;
						
						var path = 'http://127.0.0.1:8888/app/resources/upload/';
						var imageSrc = path + saveFileName;
						
						console.log(imageSrc);
						$('#mailContent').summernote('insertImage', imageSrc);
					} else {
						console.log("에러 메시지 : 이미지 업로드에 실패");
					}
					
					console.log(data);
					console.log(editor);
				},
				error: function(x) {
					console.log(x);
				}
			});
		}
	   
		
	</script>
	
	
	<script type="text/javascript">
	//모달창으로 전체 회원 결과 조회
	$.ajax({
		type: 'GET',
		url : '/app/mail/getAllMembers',
		dataType: 'json',
		success: function(data) {
			 const searchResultDiv = $('.search-result');
             searchResultDiv.empty();

             data.forEach(function(item) {
            	//전체 회원 조회
            	 const memberNo = item.no;
             	
            	 const hiddenInput = $('<input>').attr('type', 'hidden').attr('name', 'no').val(memberNo);
            	searchResultDiv.append(hiddenInput);
            	 
             	 // 이름
                 const name = item.name;
                 const resultName = $('<div>').text('이름: ' + name);
                 searchResultDiv.append(resultName);

                 // 직급
                 const position = item.positionName;
                 const resultPosition = $('<div>').text('직급: ' + position);
                 searchResultDiv.append(resultPosition);

                 // 부서
                 const department = item.departmentName;
                 const resultDepartment = $('<div>').text('부서: ' + department);
                 searchResultDiv.append(resultDepartment);

                 // 이메일
                 const email = item.email;
                 const resultEmail = $('<div>').text('이메일: ' + email).addClass('email-address');;
                 searchResultDiv.append(resultEmail);

                 // 버튼 추가
                 const button = $('<button>').text('추가').addClass('add-email-button').data('email', email).data('member-number', memberNo);

                 searchResultDiv.append(button);
                 
                 searchResultDiv.append('<br>');
                 searchResultDiv.append('<br>');
                 
             });
		},
		 error: function(error) {
             console.log('Error:', error);
         }
	});
	
	
	//모달창으로 검색 결과 조회
    $(document).ready(function() {
        $('#searchArea').submit(function(e) {
            e.preventDefault();
            const name = $('#searchInput').val();
            
            $.ajax({
                type: 'GET',
                url: '/app/mail/searchEmail',
                data: { name: name },
                dataType: 'json',
                success: function(data) {
                    const searchResultDiv = $('.search-result');
                    searchResultDiv.empty();

                    data.forEach(function(item) {
                    	//회원번호
                    	const memberNo = item.no;
                    	
                    	 const hiddenInput = $('<input>').attr('type', 'hidden').attr('name', 'no').val(memberNo);
                    	searchResultDiv.append(hiddenInput);
                    	 
                    	 // 이름
                        const name = item.name;
                    	
                        const resultName = $('<div>').text('이름: ' + name);
                        searchResultDiv.append(resultName);

                        // 직급
                        const position = item.positionName;
                        const resultPosition = $('<div>').text('직급: ' + position);
                        searchResultDiv.append(resultPosition);

                        // 부서
                        const department = item.departmentName;
                        const resultDepartment = $('<div>').text('부서: ' + department);
                        searchResultDiv.append(resultDepartment);

                        // 이메일
                        const email = item.email;
                        const resultEmail = $('<div>').text('이메일: ' + email).addClass('email-address');
                        searchResultDiv.append(resultEmail);

                        
                        // 버튼 추가
                       const button = $('<button>').text('추가').addClass('add-email-button').data('email', email).data('member-number', memberNo);
                        searchResultDiv.append(button);
                        
                        searchResultDiv.append('<br>');
                        
                        
                        
                        $(document).on('click', '.add-email-button', function() {
                            const emailButton = $(this);
                            const email = emailButton.data('email');
                            const memberNumber = emailButton.data('member-number');

                            if (!selectedEmails.includes(email)) {
                                selectedEmails.push(email);
                                selectedMemberNumbers.push(memberNumber);
                            }

                            $('#receivePerson').val(selectedEmails.join(', '));
                        });

                    });
                },
                error: function(error) {
                    console.log('Error:', error);
                }
            });
        });
    });
	
	
  
    
    
    $(document).ready(function() {
        const selectedEmails = [];
        const selectedMemberNumbers = [];

       
        
        $(document).on('click', '.add-email-button', function() {
            const emailButton = $(this);
            const email = emailButton.data('email');
            const memberNumber = emailButton.data('member-number');

            if (!selectedEmails.includes(email)) {
                selectedEmails.push(email);
                selectedMemberNumbers.push(memberNumber);
            }

            $('#receivePerson').val(selectedEmails.join(', '));

            toggleSelectedEmails(email);  
        });


        // 선택된 이메일 삭제 버튼 클릭 이벤트
        $(document).on('click', '.delete-email-btn', function() {
            const email = $(this).prev().text();
            toggleSet(selectedEmails, email);
            $(this).parent().remove();
        });

        // 선택 버튼 클릭 이벤트
        $(document).on('click', '#choose', function() {
            $('#selectedMemberNumbers').val(selectedMemberNumbers.join(','));

            $('#addressModal').modal('hide');
        });

    });

    function toggleArray(array, value) {
        const index = array.indexOf(value);
        if (index > -1) {
            array.splice(index, 1); // Remove the value if it exists
        } else {
            array.push(value); // Add the value if it doesn't exist
        }
    }

    function toggleSelectedEmails(email) {
        const emailDiv = $('.selected-emails').find('div:contains("' + email + '")');
        if (emailDiv.length > 0) {
            emailDiv.remove();
        } else {
            $('.selected-emails').append($('<div>').text(email).append('<button class="delete-email-btn">&times;</button>'));
        }
    }

    
    
    
    //이메일이 나에게 체크되어있을 경우
   <%--  $(document).ready(function() {
    	const loggedInUserEmail = '<%= ((MemberVo) session.getAttribute("loginMember")).getEmail() %>';

        $('#to-me').change(function() {
            if ($(this).prop('checked')) {
                $('#receivePerson').val(loggedInUserEmail);
            } else {
                $('#receivePerson').val('');
            }
        }); --%>
        
        
   //파일 여러개 모두삭제
   function deleteAllFiles() {
        files = [];
        content_files = [];
        fileNum = 0;
        fileCount = 0;
        $('#chooseFile').val("");
    }
   
   $('#deleteAll').on('click', function() {
       deleteAllFiles();
   });
   
   
   //제출
  $('#send').on('click', function() {
    $('#sendForm').submit();
});


</script>  
</body>
</html>
