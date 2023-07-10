<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Insert title here</title>
        <style>
            * {
                margin: auto;
            }

            #side-bar {
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

            .sub_menu {
                width: 80%;
                margin-left: 15px;
            }

            .sub_menu * {
                color: white;
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

            .big_menu {
                cursor: pointer;
            }

            .container-menu {
                position: relative;
            }

            .menu {
                font-size: 40px;
                margin-top: 40px;
                cursor: pointer;
            }
            .menu:hover {
                color: black;
                background-color: white;
            }

            .subMenu {
                display: none;
                position: relative;
                top: 0;
                font-size: 20px;
                background-color: #5A8CF2;
            }

            .subMenu:hover {
                color: black;
                background-color: white;
            }

            .arrow-down {
                display: none;
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
                            <div class="menu" data-hover="HOME">HOME</div>
                            <div class="container-menu">
                                <div class="menu">
                                    행정업무
                                    <span class="arrow-right">&#x25B8;</span><span class="arrow-down">&#x25BE;</span>
                                </div>
                                <div class="subMenu">
                                    <div>결재</div>
                                    <div>재고</div>
                                    <div>회의록</div>
                                    <div>당직</div>
                                </div>
                            </div>
                            <div id="menu">의료업무 >
                                <div id="subMenu">수술</div>
                                <div id="subMenu">진료</div>
                                <div id="subMenu">입원</div>
                            </div>
                            <div id="menu">게시판 >
                                <div id="subMenu">건의 게시판</div>
                                <div id="subMenu">문의 게시판</div>
                                <div id="subMenu">공지 게시판</div>
                            </div>
                            <div id="menu">메일 >
                                <div id="subMenu">메일쓰기</div>
                                <div id="subMenu">받은 메일함</div>
                                <div id="subMenu">보낸 메일함</div>
                                <div id="subMenu">휴지통</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>
            $(document).ready(function () {
                $(".menu").mouseenter(function () {
                $(this).siblings(".subMenu").slideDown();
                $(this).find(".arrow-right").hide();
                $(this).find(".arrow-down").show();
                });

                $(".container-menu").mouseleave(function () {
                $(this).find(".subMenu").slideUp();
                $(this).find(".arrow-right").show();
                $(this).find(".arrow-down").hide();
                });
            });
        </script>

    </body>

    </html>