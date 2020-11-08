<%@ Page Title="" Language="C#" MasterPageFile="~/CusromerSideMaster.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="Fardid.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="main">
    <section class="slider col-lg-12 col-md=12 col-sm-12 col-xs-12">
        <div class="slider-inner">
            <% foreach (var item in Models.Sliders)
                {%>
            <div style="background-image: url('<%= item.Path %>')"></div>
               <% } %>
            
        </div>
        <div class="scroll"></div>
    </section>
    <section class="prd-section prd-li-p-xs sm-li-padding col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <div class="container">
            <ul>
                
                <% foreach (var item in Models.portfolios)
                    {%>
                <li class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div>
                        <div class="inner-prd" style="background-image: url('<%= item.Background_Path %>');">
                            <h3 class="prd-bg-rtl"><%= item.Subject %></h3>
                            <div class="rgba-bg"></div>
                            <img src="<%= item.Logo_Path %>" alt="PRD Logo">
                            <p><%= item.Discription %></p>
                        </div>
                    </div>
                </li>
                   <% } %>
                
            </ul>
        </div>
    </section>
    <section class="clients-section col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <div class="container">
            <h2 class="title">
                SOME OF OUR CLIENTS
            </h2>
            <ul class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <%foreach (var item in Models.Clients)
                    {%>
                <li class="col-lg-1 col-lg-push-1 col-xs-3">
                    <img src="<%= item.Path %>" alt="">
                </li>
                   <% } %>
                
            </ul>
            <div class="text-center">
                <a href="<%= ResolveUrl("~/portfolio.aspx") %>">
                    <button class="view-more"><span>VIEW ALL WORKS <i class="fal fa-arrow-right"></i></span></button>
                </a>
            </div>
        </div>
    </section>
    <section class="video-section col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <img class="video-bg" src="<%= Models.mainVideo.MainVideoBackground_Pic %>" alt="Video BG">
        <div class="inner-video">
            <img src="<%= Models.mainVideo.MainVideoLogo_Pic %>" alt="">
            <div>
                <h3>
                   <%= Models.mainVideo.VideoSub1 %>
                </h3>
                <h2>
                   <%= Models.mainVideo.VideoSub2 %>
                </h2>
            </div>
        </div>
        <span class="video-controller" data-toggle="modal" data-target="#videoModal">
            <i class="fa fa-play"></i>
        </span>
    </section>
    <section class="nl-section col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <div class="container">
            <h2 class="title">
                Subscribe Our Newsletter
            </h2>
            <h5 class="sub-title">
                Get the best news and stories delivered to your inbox
            </h5>
            <div  id="nl-form">
                <div class="nl-div col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <input type="email" id="email-nl-form" name="email" class="col-lg-4 col-lg-push-3 col-sm-7 col-sm-push-1 col-xs-8" placeholder="Enter Your Email">
                    <input type="button" id="AddBtn" class="col-lg-2 col-lg-push-3 col-sm-3 col-sm-push-1 col-xs-4" value="Subscribe">
                </div>
            </div>
        </div>
    </section>
</div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_Script" runat="server">
     <script>
        $('#submit-nl-form').click(function () {
            Mail = $('#email-nl-form').val();
            alert(Mail);
            if (Mail != "") {
                $.ajax({
                    url: 'Admin_Ajax/SaveNewsLetter.aspx?Mail=' + Mail,
                    type: "post",
                    contentType: "application/json; charset=utf-8",
                    success: function (response) {
                        if (response == "Success") {
                            alert("با موفقیت ثبت شد .");
                        } else if (response == "repeated") {
                            alert("شما پیش از این در خبرنامه ی ما عضو بوده اید");
                        }

                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        alert("مشکل در برقراری ارتباط با سرور");
                    }
                });
            }
            return false;
        });

    </script>
</asp:Content>