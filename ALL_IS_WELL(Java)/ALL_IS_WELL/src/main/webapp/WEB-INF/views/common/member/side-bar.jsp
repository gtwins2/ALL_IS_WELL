<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        background-color: #5A8CF2;
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
        background-color: #83a6ee;
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
        background-color: #97b7fc;
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
                <div>의료업무</div>
            </div>
            <div class="sub-menu">
                <div class="sub-menu-item" onclick="location.href='${root}/receipt/regist'">환자 등록</div>
                <div class="sub-menu-item" onclick="location.href='${root}/receipt/registList'">환자 목록</div>
                <div class="sub-menu-item" onclick="location.href='${root}/prescription/list'">처방전</div>
            </div>
        </div>
        <div class="menu-item">
            <div class="menu">
                <div>게시판</div>
            </div>
            <div class="sub-menu">
                <div class="sub-menu-item" onclick="location.href='${root}/Mboard/noticeList'">공지사항</div>
                <div class="sub-menu-item" onclick="location.href='${root}/Mboard/suggestList'">건의사항</div>
                <div class="sub-menu-item" onclick="location.href='${root}/Mboard/inquiryList'">문의사항</div>
            </div>
        </div>
        <div class="menu-item">
            <div class="menu">
                <div>수술</div>
            </div>
            <div class="sub-menu">
                <div class="sub-menu-item" onclick="location.href='${root}/operation/roomList'">수술실</div>
                <div class="sub-menu-item" onclick="location.href='${root}/operation/scheduleList'">수술 일정</div>
            </div>
        </div>
        <div class="menu-item">
            <div class="menu">
                <div>입원</div>
            </div>
            <div class="sub-menu">
                <div class="sub-menu-item" onclick="location.href='${root}/admission/roomList'">입원실</div>
                <div class="sub-menu-item" onclick="location.href='${root}/admission/admissionRecord'">입원 일정</div>
            </div>
        </div>
        <div class="menu-item">
            <div class="menu">
                <div>메일</div>
            </div>
            <div class="sub-menu">
                <div class="sub-menu-item" onclick="location.href='${root}/mail/receiveList'">받은 메일함</div>
                <div class="sub-menu-item" onclick="location.href='${root}/mail/sendMailList'">보낸 메일함</div>
                <div class="sub-menu-item" onclick="location.href='${root}/mail/mailTrash'">휴지통</div>
            </div>
        </div>
        <div class="menu-item">
            <div class="menu">
                <div>근태</div>
            </div>
            <div class="sub-menu">
                <div class="sub-menu-item" onclick="location.href='${root}/attendance/list'">근태 목록</div>
            </div>
        </div>
        <div class="menu-item">
            <div class="menu">
                <div>결재</div>
            </div>
            <div class="sub-menu">
                <div class="sub-menu-item" onclick="location.href='${root}/approval/draftList'">기안 문서 목록</div>
                <c:if test="${loginMember.positionNo == '1'}">
                    <div class="sub-menu-item" onclick="location.href='${root}/approval/list'">결재 문서 목록</div>
                </c:if>
            </div>
        </div>
        <div class="menu-item">
            <div class="menu">
                <div>회의록</div>
            </div>
            <div class="sub-menu">
                <div class="sub-menu-item" onclick="location.href='${root}/proceeding/list'">회의록 목록</div>
            </div>
        </div>
        <div class="menu-item">
            <div class="menu">
                <div>당직</div>
            </div>
            <div class="sub-menu">
                <div class="sub-menu-item" onclick="location.href='${root}/duty/select'">당직 목록</div>
            </div>
        </div>
        <div class="menu-item">
            <div class="menu">
                <div onclick="location.href='${root}/orgChart'">조직도</div>
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
