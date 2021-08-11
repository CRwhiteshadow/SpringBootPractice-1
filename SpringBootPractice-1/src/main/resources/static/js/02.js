let slideNum = 0;
let slideCount = $(".slides li").length;
let lastIndex = slideCount - 1;

$(".dot li").eq(0).css("background-color", "white");
$(window).ready(function(){
    autoplay();
})

$("ul li").hover(function(){
    clearInterval(time);},function(){
    autoplay();
});

$(".dot li").mouseenter(function () {
    slideNum = $(".dot li").index($(this));
    show();
});

$("#nextSlide").click(function () {
    clearInterval(time);
    next();
    autoplay();
})

$("#prevSlide").click(function () {
    clearInterval(time);
    slideNum--;
    if (slideNum < 0) {
        slideNum = lastIndex;
    }
    show();
    autoplay();
})

function show() {
    $(".dot li").eq(slideNum).css("background-color", "white")
        .siblings().css("background-color", "transparent");
    let slideMove = 0 - (800 * slideNum);
    $("ul.slides").css("left", slideMove);
}

function next(){
    slideNum++;
    if (slideNum > lastIndex) {
        slideNum = 0;
    }
    show();
}

function autoplay(){
    time=setInterval(next,3000);
}