<%@ Page Title="" Language="C#" MasterPageFile="~/CusromerSideMaster.Master" AutoEventWireup="true" CodeBehind="portfolio.aspx.cs" Inherits="Fardid.portfolio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="main">
    <section class="prd-section prd-li-p-xs sm-li-padding col-lg-12 col-md-12 col-sm-12 col-xs-12" style="padding-bottom: 0;">
        <div class="container">
            <div class="ourteam-title col-lg-12 col-md-12 col-sm-12 col-xs-12">
                / portfolio
            </div>
            <ul>
               
                <% foreach (var item in Models)
                    {%>
                 <li class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
                    <div>
                        <div class="inner-prd" style="background-image: url('<%= item.Background_Path %>');">
                            <h3 class="prd-bg-ltr"><%= item.Subject %></h3>
                            <div class="rgba-bg"></div>
                            <img src="<%= item.Logo_Path %>" alt="PRD Logo">
                            <p><%= item.Discription %></p>
                        </div>
                    </div>
                </li>
                    <%} %>

            </ul>
        </div>
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