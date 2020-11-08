<%@ Page Title="" Language="C#" MasterPageFile="~/CusromerSideMaster.Master" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="Fardid.AboutUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="main">
    <section class="about-section col-lg-12 col-md=12 col-sm-12 col-xs-12">
        <div class="container">
            <div class="about-title">
                <span class="col-lg-6 col-md-6 col-sm-6 col-xs-6 float-right text-right about-main-fa-title">درباره فردید</span>
                <span class="col-lg-6 col-md-6 col-sm-6 col-xs-6 float-left text-left">ABOUT US</span>
            </div>
            <div class="about-content col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <%for (int i = 0; i < AboutUs_Text.Length; i++)
                    {%>
                <p><%=AboutUs_Text[i] %></p>
                    <%} %>
            </div>
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
        $('#AddBtn').click(function () {
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