<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Custom Sidebar</title>
<style>
    *, body{
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    #side-bar {
        position: relative;
        height: 100%;
        width: 150px;
        box-sizing: border-box;
        background-color: #FF8686;
        z-index: 1;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .menu {
        font-size: 20px;
        color: #ffffff;
        padding: 13.5px 0;
        cursor: pointer;
        user-select: none;
        box-sizing: border-box;
        text-align: center;
        transition: background-color 0.3s, color 0.3s;
    }

    .menu-item {
        position: relative;
    }

    .sub-menu {
        position: fixed;
        top: 100px;
        left: 0;
        width: 150px;
        font-size: 18px;
        line-height: 1.6;
        background-color: #ffaeae;
        color: white;
        opacity: 0;
        display: none;
        transition: opacity 0.2s;
        z-index: 1;
    }

    .sub-menu-item {
        padding: 11px 0;
        font-size: 20px;
        text-align: center;
        cursor: pointer;
        box-sizing: border-box;
    }

    .menu-item ,
    .sub-menu-item  {
        text-decoration: none;
        color: inherit;
    }

    .menu-item:hover .menu,
    .sub-menu-item:hover {
        background-color: #ffffff;
        color: #5A8CF2;
        transition: background-color 0.3s, color 0.3s;
    }

    .third-sidebar {
        position: fixed;
        top: 100px;
        left: 200px;
        width: 150px;
        font-size: 20px;
        line-height: 1.6;
        background-color: #ffcfcf;
        color: white;
        display: none;
        opacity: 0;
        transition: opacity 0.2s;
        z-index: 1;
    }

    .sub-menu-item:hover {
        background-color: #ffffff;
        color: #5A8CF2;
    }

    .third-sidebar div {
        padding: 11px 0;
        font-size: 20px;
        text-align: center;
        cursor: pointer;
        box-sizing: border-box;
        transition: background-color 0.3s, color 0.3s;
    }

    .third-sidebar div:hover {
        background-color: #ffffff;
        color: #5A8CF2;
    }

</style>
</head>
<body>
    <div id="side-bar">
        <div class="menu-item">
            <div class="menu">
                <div>회원관리</div>
            </div>
            <div class="sub-menu">
                <div class="sub-menu-item" onclick="location.href='${root}/member/list'">회원 목록</div>
                <div class="sub-menu-item" onclick="location.href='${root}/member/join'">회원 가입</div>
            </div>
        </div>
        <div class="menu-item">
            <div class="menu">
                <div>게시판</div>
            </div>
            <div class="sub-menu">
                <div class="sub-menu-item" onclick="location.href='${root}/board/noticeList'">공지사항</div>
                <div class="sub-menu-item" onclick="location.href='${root}/board/suggestList'">건의사항</div>
                <div class="sub-menu-item" onclick="location.href='${root}/board/inquiryList'">문의사항</div>
            </div>
        </div>
        <div class="menu-item">
            <div class="menu">
                <div>근태</div>
            </div>
            <div class="sub-menu">
                <div class="sub-menu-item" onclick="location.href='${root}/attendance/admin/list'">근태 목록</div>
            </div>
        </div>
        <div class="menu-item">
            <div class="menu">
                <div>결재</div>
            </div>
            <div class="sub-menu">
                <div class="sub-menu-item" onclick="location.href='${root}/approval/admin/list'">결재 목록</div>
            </div>
        </div>
        <div class="menu-item">
            <div class="menu">
                <div>재고</div>
            </div>
            <div class="sub-menu">
                <div class="sub-menu-item" onclick="location.href='${root}/inventory/list'">재고 목록</div>
                <div class="sub-menu-item" onclick="location.href='${root}/inventory/storeList'">재고 문서 조회</div>
            </div>
        </div>
        <div class="menu-item">
            <div class="menu">
                <div>회의록</div>
            </div>
            <div class="sub-menu">
                <div class="sub-menu-item" onclick="location.href='${root}/proceeding/admin/list'">회의록 목록</div>
            </div>
        </div>
        <div class="menu-item">
            <div class="menu">
                <div>당직</div>
            </div>
            <div class="sub-menu">
                <div class="sub-menu-item" onclick="location.href='${root}/duty/admin/select'">당직 목록</div>
                <div class="sub-menu-item" onclick="location.href='${root}/duty/put'">당직 지정</div>
            </div>
        </div>
        <div class="menu-item">
            <div class="menu">
                <div onclick="location.href='${root}/orgChartAdmin'">조직도</div>
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
            const subMenu = menuItem.querySelector(".sub-menu");

            if (subMenu) {
                const menuItemCoords = menuItem.getBoundingClientRect();
                subMenu.style.left = menuItemCoords.right + 'px';
                subMenu.style.display = "block";
                subMenu.style.opacity = "1";
            }
        });

        menuItem.addEventListener("mouseleave", function () {
            var subMenu = menuItem.querySelector(".sub-menu");

            if (subMenu) {
                subMenu.style.opacity = "0";
                setTimeout(() => {
                    subMenu.style.display = "none";
                    subMenu.style.top = '';
                }, 200);
            }
        });

        menuItem.querySelectorAll(".sub-menu-item").forEach(function (submenu) {
            submenu.addEventListener("click", function () {
                onClick(submenu);
            });

            submenu.addEventListener("mouseenter", function () {
                const thirdSidebar = submenu.querySelector(".third-sidebar");
                if (thirdSidebar) {
                    const submenuCoords = submenu.getBoundingClientRect();
                    thirdSidebar.style.left = submenuCoords.right + 'px';
                    thirdSidebar.style.display = "block";
                    thirdSidebar.style.opacity = 1;
                }
            });
            submenu.addEventListener("mouseleave", function () {
                const thirdSidebar = submenu.querySelector(".third-sidebar");
                if (thirdSidebar) {
                    thirdSidebar.style.opacity = "0";
                    setTimeout(() => {
                        thirdSidebar.style.display = "none";
                    }, 200);
                }
            });
        });
    });
  </script>
</body>

</html>
