$(function(){

    //    setTimeout(function(){
    //    $('html,body').animate({scrollTop: '100px'}, 600);
    //},800);


    if ($(".swiper-slide").length > 0) {
        var mySwiper = new Swiper('.swiper-container', {
            pagination: $(".banner").find(".pagination")[0],
            loop: true,
            autoplay : 5600,
            paginationClickable: true
        });
    }

function onMouserEnterHandler() {
    $(".recommond .item").off("mouseenter", onMouserEnterHandler);
    var _this = $(this);
    var _others = $(this).siblings();
    TweenMax.to(_this, .4, {
        width: 560, onStart: function () {
            _this.addClass("active");
        },onComplete:function(){
            $(".recommond .item").on("mouseenter", onMouserEnterHandler);
        }
    });

    TweenMax.to($(this).find(".para"), .4, {width: 283});
    TweenMax.to($(this).find("img"), .4, {right:0, autoAlpha: 1});

    TweenMax.to(_others, .4, {
        width: 190, onStart: function () {
            _others.removeClass("active");
        }
    });
    TweenMax.to(_others.find(".para"), .4, {width: 190});
}

$(".recommond .item").on("mouseenter", onMouserEnterHandler);

});