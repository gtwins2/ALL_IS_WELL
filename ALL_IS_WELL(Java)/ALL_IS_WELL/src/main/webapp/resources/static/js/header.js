//사이드바
$(function () {
    $(".sub_menu ul.small_menu").hide();
    $(".sub_menu ul.big_menu").click(function () {
        $("ul", this).slideToggle(300);
    });
});

//상단으로
uppage.addEventListener("click", () => {
    window.scrollTo({ top: 0, behavior: "smooth" });  
});

//하단으로
downpage.addEventListener("click", () => {
    window.scrollTo({ 
        top: document.body.scrollHeight,
        behavior: "smooth", 
    });
});

//사이드바열기
const aside = document.querySelector("#sidebar-category");
const rightSide = document.querySelector("#right-sidebar-category");
const sideClose = document.querySelector("#side-close");

rightSide.addEventListener("click" , function(){
    aside.classList.add("active1");
    sideClose.classList.remove("active2");
});


//사이드바닫기
sideClose.addEventListener("click", function(){
    aside.classList.remove("active1");
    sideClose.classList.add("active2");
});

