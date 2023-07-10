<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    
    *{margin: auto;}

	#side-bar{
		height: 100%;
		width: 300px;
		background-color: #5A8CF2;
	}

    #SIDEBAR {
        background-color: #5A8CF2;
        align-content: center;
    }

    #side {
        height: 1480px;
        width: 280px;
        background-color: #5A8CF2;
    }

    #side-content {
        width: 100%;
    }

    #sidebar-menu, #sidebar-menu ul, #sidebar-menu li, #sidebar-menu a {
        border: 0;
        font-weight: normal;
        line-height: 1;
        list-style: none;
        margin: 0;
        padding: 0;
        position: relative;
        text-decoration: none;
    }

    .left_sub_menu {
        width: 100%;
    }

    .sub_menu {
        width: 100%;
    }

    .sub_menu *{
        color: white;
    }

    .sub_menu li:hover {
        background-color: #ffffffac;
    }

    .sub_menu li {
        color: white;
        font-size: 20px;
        font-weight: 450;
        padding: 20px 0px 8px 14px;
    }

    .sub_menu>h2 {
        padding-bottom: 4px;
        margin-top: 30px;
        font-size: 22px;
        font-weight: 600;
        color: white;
        margin-left: 10px;
        margin-right: 10px;
        font-family: 'NotoKrB';
        line-height: 35px;
    }

    .sub_menu ul,li{
        list-style-type: none;
    }

    .sub_menu>.big_menu>.small_menu li {
        color: #08354D;
        font-size: 17px;
        font-weight: 600;
        border-bottom: 0px solid #ff0000;
        margin-left: 14px;
        padding-top: 8px;
    }

    .big_menu {
        cursor: pointer;
    }



</style>
</head>
<body>

    <div id="side-bar">
		<div id="side" style="background-color: #5A8CF2">
			<div id="side-content">
					<div class="left_sub_menu">
						<div class="sub_menu">
                            <br><br>
							<h1 id="SIDEBAR" data-hover="HOME">HOME</h1>
                            <br><br>
							<ul class="big_menu">
								<li>행정업무 <i class="arrow fas fa-angle-right"></i></li>
								<ul class="small_menu">
									<li><a href="${root}/admin/reportlist">재고</a></li>
									<li><a href="${root}/admin/reportSearch">회의록</a></li>
									<li><a href="#">당직</a></li>
								</ul>
							</ul>
							<ul class="big_menu">
								<li>의료업무 <i class="arrow fas fa-angle-right"></i></li>
								<ul class="small_menu">
									<li><a href="#">수술</a></li>
									<li><a href="#">진료</a></li>
									<li><a href="#">입원</a></li>
								</ul>
							</ul>
							<ul class="big_menu">
								<li>게시판 <i class="arrow fas fa-angle-right"></i></li>
								<ul class="small_menu">
									<li><a href="#">건의</a></li>
									<li><a href="#">문의</a></li>
									<li><a href="#">공지</a></li>
								</ul>
							</ul>
							<ul class="big_menu">
								<li>메일 <i class="arrow fas fa-angle-right"></i></li>
								<ul class="small_menu">
									<li><a href="#">메일쓰기</a></li>
									<li><a href="#">받은 메일함</a></li>
									<li><a href="#">보낸 메일함</a></li>
									<li><a href="#">휴지통</a></li>
								</ul>
							</ul>
							<ul class="big_menu">
								<li>결재 <i class="arrow fas fa-angle-right"></i></li>
								<ul class="small_menu">
									<li><a href="#">결재하기</a></li>
									<li><a href="#">결재목록</a></li>
								</ul>
							</ul>
						</div>
					</div>
					<div class="overlay"></div>
				</div>
			</div>
		</div>

</body>
</html>