<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="Fardid.AdminLogin" %>

<!DOCTYPE html>
<html lang="en" direction="rtl" style="direction: rtl;">
<head>
    <meta charset="utf-8" />
    <title>پنل مدیریت | ورود</title>
    <meta name="description" content="Latest updates and statistic charts">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, shrink-to-fit=no">
    <link href="AdminAssets/vendors/base/vendors.bundle.rtl.css" rel="stylesheet" type="text/css" />
    <link href="AdminAssets/demo/default/base/style.bundle.rtl.css" rel="stylesheet" type="text/css" />
    <link rel="shortcut icon" href="AdminAssets/demo/default/media/img/logo/favicon.ico" />
    <style>
        @media screen and (max-width: 567px) {
            .res-ns {
                display: none !important;
            }

            .res-s {
                display: block !important;
            }
        }
    </style>
</head>
<body class="m--skin- m-header--fixed m-header--fixed-mobile m-aside-left--enabled m-aside-left--skin-dark m-aside-left--fixed m-aside-left--offcanvas m-footer--push m-aside--offcanvas-default">
    <div class="m-grid m-grid--hor m-grid--root m-page">
        <div class="m-grid__item m-grid__item--fluid m-grid m-grid--desktop m-grid--ver-desktop m-grid--hor-tablet-and-mobile m-login m-login--6" id="m_login">
            <div class="res-ns m-grid__item   m-grid__item--order-tablet-and-mobile-2  m-grid m-grid--hor m-login__aside " style="background-image: url(./AdminAssets/app/media/img//bg/bg-4.jpg);">
                <div class="m-grid__item">
                    <div class="m-login__logo">
                        <a href="login-6.html#">
                            <img src="AdminAssets/demo/default/media/img/logo/logo.png">
                        </a>
                    </div>
                </div>
                <div class="m-grid__item m-grid__item--fluid m-grid m-grid--ver">
                    <div class="m-grid__item m-grid__item--middle">
                        <!--
							<span class="m-login__title" style="text-align: justify;font-size: 15px" >لورم ایپسوم متن ساختگی با تولید سادگی نامفهوم از صنعت چاپ و با استفاده از طراحان گرافیک است. چاپگرها و متون بلکه روزنامه و مجله در ستون و سطرآنچنان که لازم است و برای شرایط فعلی تکنولوژی مورد نیاز و کاربردهای متنوع با هدف بهبود ابزارهای کاربردی می باشد. </span>
						-->
                    </div>
                </div>
                <div class="m-grid__item">
                    <div class="m-login__info">
                        <div class="m-login__section" style="color: #BEAFF1;">
                            2020 ©
							<a href="https://tshpanda.com" class="m-link">توسعه سیستم هوشمند پاندا</a>
                        </div>
                        <div class="m-login__section">
                            <a href="#" class="m-link">قوانین</a>
                            <a href="#" class="m-link">درباره ما</a>
                            <a href="#" class="m-link">تماس با ما</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="m-grid__item m-grid__item--fluid  m-grid__item--order-tablet-and-mobile-1  m-login__wrapper">
                <div class="m-login__body">
                    <div class="m-login__signin sign-in-div">
                        <div class="m-login__title">
                            <h3 style="border-bottom: 4px solid #5867dd; color: #5867dd; width: auto; display: inline-block; padding-bottom: 4px;">ورود</h3>
                        </div>
                        <form class="m-login__form m-form" action="" id="pnllogin" autocomplete="off" runat="server">
                            <div class="form-group m-form__group">
                                <%--<input class="form-control m-input" type="text" placeholder="نام کاربری" name="adusername" style="border-radius: 5px">--%>
                                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control m-input" placeholder="نام کاربری" Style="border-radius: 5px" Name="adusername"></asp:TextBox>
                                <asp:Label ID="Label2" runat="server" Font-Size="Small" ForeColor="Red"></asp:Label>
                            </div>
                            <div class="form-group m-form__group">
                                <%--<input class="form-control m-input m-login__form-input--last" type="password" placeholder="رمز عبور" name="adpassword" style="border-radius: 5px">--%>
                                <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control m-input m-login__form-input--last" placeholder="رمز عبور" Style="border-radius: 5px" TextMode="Password" Name="adpassword"></asp:TextBox>
                                <asp:Label ID="Label3" runat="server" Font-Size="Small" ForeColor="Red"></asp:Label>
                            </div>
                           
                            <div class="m-login__action">
                                <a href="#" class="m-link">
							<span class="forgot-pw-btn">رمز عبور را فراموش کرده اید؟</span>
						</a>
                                <a href="#">
                                    <%--<button id="m_login_signin_submit" class="btn btn-primary m-btn m-btn--pill m-btn--custom m-btn--air m-login__btn m-login__btn--primary">ورود</button>--%>
                                    <asp:Button ID="m_login_signin_submi" runat="server" Text="ورود" CssClass="btn btn-primary m-btn m-btn--pill m-btn--custom m-btn--air m-login__btn m-login__btn--primary" OnClick="Button1_Click" Name=""/>
                                </a>
                            </div>
                        </form>
                         <asp:Label ID="Label1" runat="server" Text="" ForeColor="Red"></asp:Label>
                    </div>
                    <%--<div class="m-login__signin forgot-pw" style="display:none;">
					<div class="m-login__title">
						<h3 style="border-bottom: 4px solid #5867dd;color: #5867dd;width: auto;display: inline-block;padding-bottom: 4px;">فراموشی رمز عبور</h3>
					</div>
					<form class="m-login__form m-form" action="" id="pnllogin2" autocomplete="off">
						<div class="form-group m-form__group">
							<input class="form-control m-input" type="text" placeholder="شماره موبایل" name="phone" style="border-radius: 5px">
						</div>
						<div class="m-login__action">
							<a href="#" class="m-link go-back">
								ورود به حساب کاربری
							</a>
							<a href="#">
								<button id="m_login_signin_submit2" class="btn btn-primary m-btn m-btn--pill m-btn--custom m-btn--air m-login__btn m-login__btn--primary">ارسال رمز جدید</button>
							</a>
						</div>
					</form>
				</div>--%>
                </div>
            </div>
            <div class="res-s m-grid__item   m-grid__item--order-tablet-and-mobile-2  m-grid m-grid--hor m-login__aside " style="background-image: url(./AdminAssets/app/media/img//bg/bg-4.jpg); display: none; position: absolute; bottom: 0; right: 0;">
                <div class="m-grid__item">
                    <div class="m-login__logo">
                        <a href="login-6.html#">
                            <img src="AdminAssets/demo/default/media/img/logo/logo.png">
                        </a>
                    </div>
                </div>
                <div class="m-grid__item">
                    <div class="m-login__info">
                        <div class="m-login__section" style="color: #BEAFF1;">
                            2020 ©
							<a href="https://tshpanda.com" class="m-link">توسعه سیستم هوشمند پاندا</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="AdminAssets/vendors/base/vendors.bundle.js" type="text/javascript"></script>
    <script src="AdminAssets/demo/default/base/scripts.bundle.js" type="text/javascript"></script>
    <script src="AdminAssets/snippets/custom/pages/user/login.js" type="text/javascript"></script>
    <script src="AdminAssets/snippets/custom/pages/user/validate-login.js"></script>
    <script>
        $(document).ready(function () {
            $(".forgot-pw-btn").on("click", function () {
                $(".sign-in-div").hide();
                $(".forgot-pw").show();
            })
            $(".go-back").on("click", function () {
                $(".sign-in-div").show();
                $(".forgot-pw").hide();
            })
        })
    </script>
</body>
</html>
