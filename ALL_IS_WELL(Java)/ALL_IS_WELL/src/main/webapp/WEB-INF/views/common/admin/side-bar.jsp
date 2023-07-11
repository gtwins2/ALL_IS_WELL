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
        height: 1200px;
        width: 300px;
        background-color: #FF8686;
        padding: 15px;
    }

    .home{
        font-size: 40px;
        color: #ffffff;
        padding: 15px 0;
        cursor: pointer;
        user-select: none;
    }

    .menu-item-home {
        position: relative;
        margin-bottom: 30px;
    }

    .menu {
        font-size: 40px;
        color: #ffffff;
        padding: 15px 0;
        cursor: pointer;
        user-select: none;
    }

    .menu-item {
        position: relative;
        margin-bottom: 120px;
    }

    .sub-menu {
        position: absolute;
        top: 10;
        left: 0;
        font-size: 20px;
        line-height: 1.6;
        background-color: #FF8686;
        color: white;
        max-height: 0;
        overflow: hidden;
        transition: max-height 0.35s ease-in, max-height 0.35s ease-out;
        white-space: nowrap;
    }

    .sub-menu-item {
        font-size: 20px;
        cursor: pointer;
    }

    .menu-item a,
    .sub-menu-item a {
        text-decoration: none;
        color: inherit;
    }

    .menu-item:hover .menu,
    .sub-menu-item:hover {
        background-color: #ffffff;
        color: #FF8686;
    }

    .arrow {
        display: inline-block;
        width: 10px;
        height: 10px;
        border-right: 2px solid #ffffff;
        border-bottom: 2px solid #ffffff;
        transform: rotate(-45deg);
        transition: transform 0.35s, border-color 0.35s;
    }

    .expanded {
        transform: rotate(45deg);
    }

    .menu-item:hover .arrow {
        border-right-color: #FF8686;
        border-bottom-color: #FF8686;
    }

    .menu-item:not(:hover) .sub-menu {
        max-height: 0 !important;
    }

    .menu-item:hover .sub-menu {
        max-height: 100vh !important;
    }
</style>
</head>
<body>
    <body>
        <div id="side-bar">
            <div class="menu-item-home" onclick="window.location.href='admin.html';">
                <div class="home">
                    <span>HOME</span>
                </div>
            </div>
            <div class="menu-item">
                <div class="menu" onclick="window.location.href='admin.html';">
                   <span>행정업무</span>
                    <div class="arrow"></div>
                </div>
                <div class="sub-menu">
                    <div class="sub-menu-item" onclick="window.location.href='approval.html';">결재</div>
                    <div class="sub-menu-item" onclick="window.location.href='inventory.html';">재고</div>
                    <div class="sub-menu-item" onclick="window.location.href='meeting.html';">회의록</div>
                    <div class="sub-menu-item" onclick="window.location.href='duty.html';">당직</div>
                </div>
            </div>
            <div class="menu-item">
                <div class="menu" onclick="window.location.href='medical.html';">
                    <span>의료업무</span>
                    <div class="arrow"></div>
                </div>
                <div class="sub-menu">
                    <div class="sub-menu-item" onclick="window.location.href='surgery.html';">수술</div>
                    <div class="sub-menu-item" onclick="window.location.href='treatment.html';">진료</div>
                    <div class="sub-menu-item" onclick="window.location.href='admission.html';">입원</div>
                </div>
            </div>
            <div class="menu-item">
                <div class="menu" onclick="window.location.href='boards.html';">
                    <span>게시판</span>
                    <div class="arrow"></div>
                </div>
                <div class="sub-menu">
                    <div class="sub-menu-item" onclick="window.location.href='suggestion.html';">건의 게시판</div>
                    <div class="sub-menu-item" onclick="window.location.href='question.html';">문의 게시판</div>
                    <div class="sub-menu-item" onclick="window.location.href='notice.html';">공지 게시판</div>
                </div>
            </div>
            <div class="menu-item">
                <div class="menu" onclick="window.location.href='mail.html';">
                    <span>메일</span>
                    <div class="arrow"></div>
                </div>
                <div class="sub-menu">
                    <div class="sub-menu-item" onclick="window.location.href='compose.html';">메일 쓰기</div>
                    <div class="sub-menu-item" onclick="window.location.href='inbox.html';">받은 메일함</div>
                    <div class="sub-menu-item" onclick="window.location.href='sent.html';">보낸 메일함</div>
                    <div class="sub-menu-item" onclick="window.location.href='trash.html';">휴지통</div>
                </div>
            </div>
        </div>

<script>
document.querySelectorAll(".menu-item").forEach(function (menuItem) {
    const onClick = (element) => {
        if (!element.querySelector('a')) {
            return;
        }
        window.location.href = element.querySelector('a').getAttribute('href');
    };

    menuItem.querySelector(".menu").addEventListener("click", function () {
        onClick(menuItem);
    });

    menuItem.addEventListener("mouseenter", function () {
        const subMenuList = Array.from(menuItem.querySelectorAll(".sub-menu-item"));
        const totalSubmenuHeight = subMenuList.reduce(function (height, submenu) {
            return height + submenu.offsetHeight;
        }, 0);
        var subMenu = menuItem.querySelector(".sub-menu");
        var arrow = menuItem.querySelector(".arrow");
        if (subMenu) {
            subMenu.style.maxHeight = totalSubmenuHeight + "px";
            subMenu.style.opacity = "1";
            subMenu.style.display = "block";
            if (arrow) arrow.classList.add('expanded');
        }
    });

    menuItem.addEventListener("mouseleave", function () {
        var subMenu = menuItem.querySelector(".sub-menu");
        var arrow = menuItem.querySelector(".arrow");
        if (subMenu) {
            subMenu.style.maxHeight = "0";
            subMenu.style.opacity = "0";
            subMenu.style.display = "none";
            if (arrow) arrow.classList.remove('expanded');
        }
    });

    menuItem.querySelectorAll(".sub-menu-item").forEach(function (submenu) {
        submenu.addEventListener("click", function () {
            onClick(submenu);
        });
    });
});
</script>

</body>
</html>
