<%@ Page Title="" Language="C#" MasterPageFile="~/CusromerSideMaster.Master" AutoEventWireup="true" CodeBehind="services.aspx.cs" Inherits="Fardid.services" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div id="main">
    <section class="slider col-lg-12 col-md=12 col-sm-12 col-xs-12" style="background-image: url('<%= ServiceModel.Background_Path %>')">
        <div class="scroll"></div>
        <div class="slider-title">
            <h1>
                / <%= ServiceModel.Subject %>
            </h1>
        </div>
    </section>
    <section class="prd-section services-prd col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <div class="container">
            <ul class="md-transform-x">
                <li class="col-lg-3 col-md-3 col-sm-4 col-xs-12">
                    <div>
                        <img class="full-size-img" src="<%= ServiceModel.LeftPic_Path %>" alt="Services">
                    </div>
                </li>
                <li class="col-lg-3 services-li transform-translate-x-50 col-md-3 col-sm-4 col-xs-12">
                    <div class="services-desc">
                        <%= ServiceModel.discription %>
                    </div>
                    <button class="view-more scroll-bottom"><span></span></button>
                </li>
                <li class="custom-height-xs col-lg-3 col-lg-push-3 col-md-3 col-sm-4 col-xs-12">
                    <div>
                        <div class="inner-prd" style="background-image: url(' <%= ServiceModel.RightPic_Path %>');">
                            <h3 class="fix-h3 prd-bg-rtl"><%= ServiceModel.RightSub %></h3>
                            <div class="rgba-bg active-rgba-bg"></div>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </section>
    <section id="client-section" class="clients-section col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <div class="container">
            <h2 class="title">
                SOME OF OUR CLIENTS
            </h2>
            <ul class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <% foreach (var item in Clients)
                    {%>
                <li class="col-lg-1 col-lg-push-1 col-xs-3">
                    <img src="<%= item.Path %>" alt="">
                </li>
                    <%} %>
                
            </ul>
            <div class="text-center">
                <a href="<%= ResolveUrl("~/portfolio.aspx") %>">
                    <button class="view-more" onclick="return Click()"><span>VIEW ALL WORKS <i class="fal fa-arrow-right"></i></span></button>
                </a>
            </div>
        </div>
    </section>
    <section class="video-section col-lg-12 col-md-12 col-sm-12 col-xs-12">
        <img class="video-bg" src="<%= ServiceModel.VideoBackground_Path %>" alt="Video BG">
        <div class="inner-video purple-text">
            <img src="assets/images/logo4.png" alt="">
            <div>
                <h3>
                    <%= ServiceModel.VideoSub1 %>
                </h3>
                <h2>
                    <%= ServiceModel.VideoSub2 %>
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