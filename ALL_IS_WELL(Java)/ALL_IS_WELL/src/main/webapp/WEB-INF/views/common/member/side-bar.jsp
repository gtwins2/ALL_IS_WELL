<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Custom Sidebar</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: Arial, sans-serif;
        }

        #side-bar {
            height: 100vh;
            width: 300px;
            background-color: #5A8CF2;
            padding: 15px;
        }

        .menu {
            font-size: 24px;
            color: #ffffff;
            padding: 15px 0;
            cursor: pointer;
            user-select: none;
        }

        .menu-item {
            position: relative;
        }

        .sub-menu {
            font-size: 18px;
            line-height: 1.6;
            display: none;
            position: absolute;
            left: 100%;
            top: 0;
            min-width: 100%;
            background-color: #5A8CF2;
            z-index: 1000;
        }

        .menu-item:hover .sub-menu {
            display:block;
        }
        
        .sub-menu-item {
            padding: 8px 16px;
            white-space: nowrap;
        }

        .menu-item:hover .menu, .sub-menu-item:hover {
            background-color: #ffffff;
            color: #5A8CF2;
        }
    </style>
</head>
<body>

    <div id="side-bar">
        <div class="menu-item">
            <div class="menu">HOME</div>
        </div>
        <div class="menu-item">
            <div class="menu">행정업무</div>
            <div class="sub-menu">
                <div class="sub-menu-item">결재</div>
                <div class="sub-menu-item">재고</div>
                <div class="sub-menu-item">회의록</div>
                <div class="sub-menu-item">당직</div>
            </div>
        </div>
        <div class="menu-item">
            <div class="menu">의료업무</div>
            <div class="sub-menu">
                <div class="sub-menu-item">수술</div>
                <div class="sub-menu-item">진료</div>
                <div class="sub-menu-item">입원</div>
            </div>
        </div>
        <div id="menu-item">
            <div id="menu">게시판 >
                <div id="sub-menu">건의 게시판</div>
                <div id="sub-menu">문의 게시판</div>
                <div id="sub-menu">공지 게시판</div>
            </div>
        </div>
        <div id="menu-item">
            <div id="menu">메일 >
                <div id="sub-menu">메일쓰기</div>
                <div id="sub-menu">받은 메일함</div>
                <div id="sub-menu">보낸 메일함</div>
                <div id="sub-menu">휴지통</div>
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