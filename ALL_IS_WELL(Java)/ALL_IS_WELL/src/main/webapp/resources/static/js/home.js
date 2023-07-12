//사이드바닫기
const toggle = document.querySelector(".toggle");
const toggleClose = document.querySelector("#toggle-close");

toggleClose.addEventListener("click", function(){
    toggle.classList.remove("toggle");
    toggle.classList.add("active2");
});
