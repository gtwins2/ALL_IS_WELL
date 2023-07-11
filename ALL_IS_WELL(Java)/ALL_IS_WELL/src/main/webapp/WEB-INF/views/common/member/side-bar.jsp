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
        position: fixed;
        height: 100vh;
        width: 300px;
        background-color: #5A8CF2;
        z-index: 1;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .menu {
        font-size: 40px;
        color: #ffffff;
        padding: 15px 0;
        cursor: pointer;
        user-select: none;
        box-sizing: border-box;
        text-align: center;
        transition: background-color 0.3s, color 0.3s;
    }

    .menu-item {
        position: relative;
        margin-top: 20px;
    }

    .sub-menu {
        position: fixed;
        top: 0;
        left: 300px;
        height: 100vh;
        width: 300px;
        font-size: 18px;
        line-height: 1.6;
        background-color: #83a6ee;
        color: white;
        display: none;
        opacity: 0;
        transition: opacity 0.2s;
        z-index: 1;
    }

    .sub-menu-item {
        padding: 8px 16px;
        margin-top: 20px;
        font-size: 40px;
        cursor: pointer;
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

    span{
        text-align: center;
    }

    .third-sidebar {
        position: fixed;
        top: 0;
        left: 600px;
        height: 100vh;
        width: 300px;
        font-size: 40px;
        line-height: 1.6;
        background-color: #97b7fc;
        color: white;
        display: none;
        opacity: 0;
        transition: opacity 0.2s;
        z-index: 1;
    }

    .third-sidebar div {
        padding: 8px 16px;
        margin-top: 20px;
        font-size: 40px;
        cursor: pointer;
    }

    .sub-menu-item:hover {
        background-color: #ffffff;
        color: #5A8CF2;
    }

    .third-sidebar div {
        padding: 8px 16px;
        margin-top: 20px;
        font-size: 40px;
        cursor: pointer;
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
        <div class="menu-item" title="home">
            <div class="menu">
                <span style="font-size: 50px;">HOME</span>
            </div>
        </div>
        <div class="menu-item">
            <div class="menu">
                <span>행정업무</span>
            </div>
            <div class="sub-menu">
                <div class="sub-menu-item">결재
                    <div class="third-sidebar">
                        <div>예제 항목</div>
                        <div>예제 항목</div>
                        <div>예제 항목</div>
                    </div>
                </div>
                <div class="sub-menu-item">재고
                    <div class="third-sidebar">
                        <div>예제 항목</div>
                        <div>예제 항목</div>
                        <div>예제 항목</div>
                    </div>
                </div>
                <div class="sub-menu-item">회의록
                    <div class="third-sidebar">
                        <div>예제 항목</div>
                        <div>예제 항목</div>
                        <div>예제 항목</div>
                    </div>
                </div>
                <div class="sub-menu-item">당직
                    <div class="third-sidebar">
                        <div>예제 항목</div>
                        <div>예제 항목</div>
                        <div>예제 항목</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="menu-item">
            <div class="menu">
                <span>의료업무</span>
            </div>
            <div class="sub-menu">
                <div class="sub-menu-item">수술
                    <div class="third-sidebar">
                        <div>예제 항목</div>
                        <div>예제 항목</div>
                        <div>예제 항목</div>
                    </div>
                </div>
                <div class="sub-menu-item">진료
                    <div class="third-sidebar">
                        <div>예제 항목</div>
                        <div>예제 항목</div>
                        <div>예제 항목</div>
                    </div>
                </div>
                <div class="sub-menu-item">입원
                    <div class="third-sidebar">
                        <div>예제 항목</div>
                        <div>예제 항목</div>
                        <div>예제 항목</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="menu-item">
            <div class="menu">
                <span>게시판</span>
            </div>
            <div class="sub-menu">
                <div class="sub-menu-item">건의 게시판
                    <div class="third-sidebar">
                        <div>예제 항목</div>
                        <div>예제 항목</div>
                        <div>예제 항목</div>
                    </div>
                </div>
                <div class="sub-menu-item">문의 게시판
                    <div class="third-sidebar">
                        <div>예제 항목</div>
                        <div>예제 항목</div>
                        <div>예제 항목</div>
                    </div>
                </div>
                <div class="sub-menu-item">공지 게시판
                    <div class="third-sidebar">
                        <div>예제 항목</div>
                        <div>예제 항목</div>
                        <div>예제 항목</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="menu-item">
            <div class="menu">
                <span>메일</span>
            </div>
            <div class="sub-menu">
                <div class="sub-menu-item">메일 쓰기
                    <div class="third-sidebar">
                        <div>예제 항목</div>
                        <div>예제 항목</div>
                        <div>예제 항목</div>
                    </div>
                </div>
                <div class="sub-menu-item">받은 메일함
                    <div class="third-sidebar">
                        <div>예제 항목</div>
                        <div>예제 항목</div>
                        <div>예제 항목</div>
                    </div>
                </div>
                <div class="sub-menu-item">보낸 메일함
                    <div class="third-sidebar">
                        <div>예제 항목</div>
                        <div>예제 항목</div>
                        <div>예제 항목</div>
                    </div>
                </div>
                <div class="sub-menu-item">휴지통
                    <div class="third-sidebar">
                        <div>예제 항목</div>
                        <div>예제 항목</div>
                        <div>예제 항목</div>
                    </div>
                </div>
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
                const adminMenuItem = document.querySelector("div[title='home']");
                subMenu.style.top = adminMenuItem.offsetTop + adminMenuItem.offsetHeight + 'px';
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
                    const adminMenuItem = document.querySelector("div[title='home']");
                    thirdSidebar.style.top = (adminMenuItem.offsetTop + adminMenuItem.offsetHeight) + 'px';
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
