$(document).ready(function () {
    $("img , p , span , h1 , h2 , h3 , h4 , h5 , i , a , b").on('dragstart',function(event){event.preventDefault();});
    $('.slider-inner').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        autoplay: true,
        autoplaySpeed: 2500,
        delay: 500,
        vertical: true,
        dots: true,
        infinite: true,
        speed: 1000,
    });
    $(".scroll").on("click" , function () {
        var header = $("header").height();
        var sliderHeight = $(".slider").height();
        var scollHeight = header + sliderHeight;
        $('html, body').animate({scrollTop:scollHeight}, 'slow');
    })
    $(".scroll-bottom").on("click" , function () {
        $('html, body').animate({
            scrollTop: $("#client-section").offset().top
        }, 2000);    })
    $(".menu-toggle").on("click" , function(){
        $(".nav-bg").fadeIn();
        $(".nav-bg nav").addClass("menu-show");
    })
    $(".m-menu a").on("click" , function () {
        $(this).parent().next().slideToggle();
    })
    $(".menu-close").on("click" , function(){
        $(".nav-bg nav").removeClass("menu-show");
        setTimeout(function () {
            $(".nav-bg").fadeOut();
            $(".sub-menu").slideUp(0);
        } , 300)
    })
    $("#nl-form").submit(function(){
        var thisEmail = $(this).find("input[name=email]").val();
        if(thisEmail != "" && validateEmail(thisEmail) == true){
            return false;
        }else{
            $("#email-nl-form").addClass("error-nl");
            return false;
        }
    });
    $("#email-nl-form").keyup(function () {
        var thisEmail = $("#email-nl-form").val();
        if(validateEmail(thisEmail) == true){
            $("#email-nl-form").removeClass("error-nl");
        }else{
            $("#email-nl-form").addClass("error-nl");
        }
    })
    $("#contact-form").validate({
        rules: {
            name: {
                required: true,
                maxlength: 30
            },
            email: {
                required: true,
                email: true,
                maxlength: 60
            },
            subject: {
                required: true,
                maxlength: 30
            },
            message: {
                required: true,
                maxlength: 180
            }
        },
        messages: {
        }
    });
})
function nlOk() {
    $("#nl-form div").addClass("subscribed");
    $(".subscribed input").attr("disabled","disabled");
    $(".subscribed input:last-child").val("Subscribed");
}
function validateEmail(email) {
    var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(email);
}
function alert(type,text) {
    // 1 -> success
    // 0 -> danger
    var alertVal = false;
    if(type == "1"){
        $(".custom-alert div").addClass("custom-alert-success");
        alertVal = true;
    }else if(type == "0"){
        $(".custom-alert div").addClass("custom-alert-danger");
        alertVal = true;
    }
    if(alertVal){
        $(".custom-alert").slideDown(500);
        if(text != ""){
            $(".custom-alert div").text(text);
        }
    }
}