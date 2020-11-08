<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Test.aspx.cs" Inherits="Fardid.Test" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8" dir="ltr">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Fardid Co</title>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/light.css">
    <link rel="stylesheet" href="assets/css/font-awesome.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" type="text/css" href="assets/slick/slick.css"/>
    <link rel="stylesheet" type="text/css" href="assets/slick/slick-theme.css"/>
</head>
<body>
<header class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
    <div class="header-left col-lg-6 col-md-6 col-sm-2 col-xs-3">
        <a href=".">
            <img src="assets/images/logo.png" alt="Fardid Logo">
        </a>
    </div>
    <div class="header-right col-lg-6 col-md-6 col-sm-6 col-xs-9">
        <ul class="col-lg-12 col-md-12 col-sm-12 col-xs-12 p-r-0 p-l-0 m-b-0">
            <li class="menu-toggle col-sm-2"><i class="fal fa-bars"></i></li>
            <li class="search-li">
                <form action="">
                    <button type="submit"><i class="fal fa-search"></i></button>
                    <input type="text" placeholder="Search">
                </form>
            </li>
        </ul>
    </div>
</header>
<div class="nav-bg">
    <nav class="col-lg-6 col-md-6 col-sm-6 col-xs-10">
        <ul>
            <img src="assets/images/logo2.png" alt="Logo">
            <li class="menu-active">
                <a href="">
                    HOME
                </a>
            </li>
            <li class="m-menu">
                <a href="javascript:void(0)">
                    SERVICES
                </a>
            </li>
            <ul class="sub-menu">
                <li>
                    <a href="">
                        influencer marketing
                    </a>
                </li>
                <li>
                    <a href="">
                        advertising
                    </a>
                </li>
                <li>
                    <a href="">
                        idea
                    </a>
                </li>
                <li>
                    <a href="">
                        consumer insight
                    </a>
                </li>
            </ul>
            <li>
                <a href="">
                    ABOUT US
                </a>
            </li>
            <li>
                <a href="">
                    OUR TEAM
                </a>
            </li>
            <li>
                <a href="">
                    CONTACT US
                </a>
            </li>
            <span class="menu-close">
                <i class="fal fa-chevron-right"></i>
            </span>
        </ul>
    </nav>
</div>
<div id="main">
    <section class="contact-section col-lg-12 col-md=12 col-sm-12 col-xs-12">
        <div class="container">
            <div class="container custom-alert">
                <div>

                </div>
            </div>
            <form action="" method="post" id="contact-form" autocomplete="off">
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                    <label for="nameinp">
                        NAME:
                    </label>
                    <input type="text" name="name" id="nameinp" placeholder="Enter Your Name">
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                    <label for="emailinp">
                        EMAIL:
                    </label>
                    <input type="text" name="email" id="emailinp" placeholder="Enter Your Email">
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
                    <label for="subjectinp">
                        SUBJECT:
                    </label>
                    <input type="text" name="subject" id="subjectinp" placeholder="Enter Your Subject">
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <label for="messageinp">
                        MESSAGE:
                    </label>
                    <textarea name="message" id="messageinp" placeholder="Your Message Here..."></textarea>
                </div>
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <input type="submit" value="SEND MESSAGE" id="sendinp" onclick="return Hello()">
                </div>
            </form>
        </div>
    </section>
</div>
<footer class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
    <div class="footer-left col-lg-6 col-md-6 col-sm-6 col-xs-12">
        <div>
            <img src="assets/images/logo3.png" alt="">
        </div>
        <div>
            <span>Fardidmedia@gmail.com</span>
        </div>
        <div>
            <ul>
                <li>
                    <a href="#" target="_blank">
                        <img src="assets/images/instagram.png" alt="Instagram">
                    </a>
                </li>
                <li>
                    <a href="#" target="_blank">
                        <img src="assets/images/facebook.png" alt="Facebook">
                    </a>
                </li>
                <li>
                    <a href="#" target="_blank">
                        <img src="assets/images/twitter.png" alt="Twitter">
                    </a>
                </li>
                <li>
                    <a href="#" target="_blank">
                        <img src="assets/images/linkedin.png" alt="Linkedin">
                    </a>
                </li>
            </ul>
        </div>
    </div>
    <div class="footer-right">
        <span style="margin-bottom: 5px;">
            <span style="font-size: 11.2px">
                تهران، میرداماد، میدان مادر، خیابان شهید سنجابی (بهروز سابق)
            </span>
            <br>
            <span style="direction: rtl">
                کوچه شریفی، پلاک 6، افق ارتباطات فردید
                |
                تلفن: 02122225896
            </span>
            <br>
        </span>
        <span style="margin-bottom: 5px;">
            <span style="font-size: 10.45px">
                N 6, Sharifi Alley, Sanjabi Ave, Madar Sq, Mirdamad Blvd
            </span>
            <br>
            <span class="display-inline-block not-full-width text-right-xs" style="float: left;width: 50%;border-right: 1px solid white;text-align: left">
                Tehran, Iran
            </span>
            <span class="display-inline-block not-full-width text-left-xs" style="float: right;width: 50%;">
                +98 22 22 58 960
            </span>
            <br>
        </span>
        <span class="copyright not-full-width" style="display: block;width: 100%;">
            <span style="border-right: 1px solid white;border-left: 1px solid white;width: 100%;display: block;text-align: center;opacity: .7">
                Fardid Media &copy; 2020. All Rights Reserved
            </span>
        </span>
    </div>
</footer>
<script src="assets/js/jquery-3.5.1.min.js"></script>
<script src="assets/js/jquery-migrate-1.2.1.min.js"></script>
<script src="assets/js/jquery.validate.js"></script>
<script src="assets/slick/slick.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/light.js"></script>
<script src="assets/js/fontawesome.min.js"></script>
<script src="assets/js/script.js"></script>
<script>
    function Hello() {
        alert("Hello");
    }
    //alert("1","ok")
    //alert("0","error")
</script>
</body>
</html>