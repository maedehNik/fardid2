<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Admin_Newsletter.aspx.cs" Inherits="Fardid.Admin_Newsletter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder_Css" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_Modal" runat="server">
    <div class="modal fade" id="deactivemodal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <%--<asp:Label runat="server" style="display: none" id="DeActiveDiv"></asp:Label>--%>
                    <div id="DeActiveDiv" style="display: none"></div>
                    <h5 class="modal-title">غیرفعال سازی اشتراک خبرنامه</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>
                        اشتراک خبرنامه
                    <span id="data-name"></span>
                        غیرفعال شود؟
                    </p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">خیر</button>
                    <button type="button" class="btn btn-warning" onclick="return DeactiveButton()">بله</button>
                    <%--<asp:Button ID="Button1" runat="server" Text="بله" CssClass="btn btn-warning" OnClick="Button1_Click"/>--%>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="activemodal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <div style="display: none" id="ActiveDiv"></div>
                    <h5 class="modal-title">فعال سازی اشتراک خبرنامه</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>
                        اشتراک خبرنامه
                    <span id="data-name"></span>
                        فعال شود؟
                    </p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">خیر</button>
                    <button type="button" class="btn btn-success" onclick="return ActiveButton()">بله</button>
                    
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="send-email-modal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-lg modal-dialog-centered" role="document">
            <div class="modal-content">
                <div id="send-email-form">
                    <div class="modal-header">
                        <h5 class="modal-title">ارسال ایمیل</h5>
                        <div style="display: none" id="SendDiv"></div>
                        <button type="button" class="close" data-dismiss="modal" aria-label="بستن">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="form-group col-md-6">
                                <label for="email-target" class="form-control-label">دریافت کننده</label>
                                <input type="text" class="form-control" id="email-target" disabled="disabled">
                            </div>
                            <div class="form-group col-md-6">
                                <label for="email-subject" class="form-control-label">موضوع</label>
                                <input type="text" class="form-control" name="sefs1" id="email-subject">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="message-text" class="form-control-label">پیام</label>
                            <textarea class="form-control textarea-padding resize-none" name="sefs2" id="message-text" style="height: 150px;"></textarea>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">بستن</button>
                        <button id="SendMailBTN" type="submit" class="btn btn-primary" onclick="return SendEmail()">ارسال</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

    <div class="m-subheader">
        <div class="d-flex align-items-center">
            <div class="mr-auto">
                <span class="m-subheader__daterange" id="m_dashboard_daterangepicker">
                    <span class="m-subheader__daterange-label">
                        <h3 class="m-subheader__title" style="padding-left: 0!important; margin: 0 0 0 2px!important;">پیشخوان
									<i class="fa fa-chevron-left tshfontsize2" style="transform: translateY(3px); color: #aaaeb8; margin-right: 2px;"></i>
                            <span class="m-subheader__daterange-title tshfontsize2" style="margin-right: 2px; margin-left: 2px;">خبرنامه</span>
                            <!--
                                    <i class="fa fa-chevron-left" style="transform: translateY(3px);color: #aaaeb8;"></i>
                                    <span class="m-subheader__daterange-title" style="margin-right: 2px;">نمایش همه ی پست ها</span>
                                    -->
                        </h3>
                    </span>
                </span>
            </div>
        </div>
    </div>
    <div class="m-content">
        <div class="row">
            <div class="col-lg-12">
                <div class="m-portlet m-portlet--full-height m-portlet--tabs  ">
                    <div class="m-portlet__head">
                        <div class="m-portlet__head-tools">
                            <ul class="nav nav-tabs m-tabs m-tabs-line   m-tabs-line--left m-tabs-line--primary" role="tablist">
                                <li class="nav-item m-tabs__item">
                                    <a class="nav-link m-tabs__link active" data-toggle="tab" href="#m_user_profile_tab_1" role="tab">
                                        <i class="flaticon-share m--hide"></i>
                                        خبرنامه
                                    </a>
                                </li>
                                <!--<li class="nav-item m-tabs__item">
                                            <a class="nav-link m-tabs__link" data-toggle="tab" href="#m_user_profile_tab_2" role="tab">
                                                پیام ها
                                            </a>
                                        </li>
                                        <li class="nav-item m-tabs__item">
                                            <a class="nav-link m-tabs__link" data-toggle="tab" href="#m_user_profile_tab_3" role="tab">
                                                تنظیمات
                                            </a>
                                        </li>-->
                            </ul>
                        </div>
                    </div>
                    <div class="tab-content">
                        <div class="tab-pane active" id="m_user_profile_tab_1">
                            <div class="m-portlet__body">
                                <div class="m-section container-fluid">
                                    <div class="m-section__content container-fluid">
                                        <table class="cust-table table table-striped table-hover m-table m-table--head-separator-primary">
                                            <thead>
                                                <tr>
                                                    <th>#</th>
                                                    <th>ایمیل</th>
                                                    <th>تاریخ عضویت</th>
                                                    <th>وضعیت</th>
                                                    <th style="padding-left: 0;">عملیات
                                                                <button class="btn btn-primary tshpcustom send-email-btn" style="float: left" data-toggle="modal" data-target="#send-email-modal" data-email="همه کاربران" onclick="return SendMail_All()"><i class="flaticon-mail"></i>ارسال ایمیل به همه کاربران</button>
                                                    </th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%foreach (var item in Models)
                                                    {%>
                                                <tr>
                                                    <th scope="row"><% = item.Num %></th>
                                                    <td id="Mail-<%=item.EmailId %>"><% = item.Email %></td>
                                                    <td><% = item.Date %></td>
                                                    <td>
                                                        <% if (item.Active == 1)
                                                            {%>
                                                        <button class="btn btn-success tshpcustom deactivate-btn" data-target="#deactivemodal" data-toggle="modal" data-name="<% = item.Email %>" onclick="return DeActive(<% = item.EmailId %>)"><i class="fa fa-check tshfa"></i>فعال</button>
                                                        <%}
                                                            else
                                                            {%>
                                                        <button class="btn btn-warning tshpcustom deactivate-btn" data-target="#activemodal" data-toggle="modal" data-name="<% = item.Email %>"  onclick="return Active_Func(<% = item.EmailId %>)"><i class="fa minus-circle tshfa"></i>غیرفعال</button>
                                                        <%}
                                                        %>

                                                    </td>
                                                    <td>
                                                        <button class="btn btn-primary tshpcustom send-email-btn" data-toggle="modal" data-target="#send-email-modal" data-email="<% = item.Email %> "  onclick="return SendMail(<% = item.EmailId %>)"><i class="flaticon-mail"></i>ارسال ایمیل</button>
                                                    </td>
                                                </tr>

                                                <%} %>
                                            </tbody>
                                        </table>
                                        <table style="display: none;" class="cust-table cust-table-2 table table-striped table-hover m-table m-table--head-separator-primary">
                                            <button class="btn btn-primary tshpcustom send-email-btn res-show" style="width: 100%; border-radius: .25rem .25rem 0 0; display: none;" data-toggle="modal" data-target="#send-email-modal" data-email="همه کاربران"><i class="flaticon-mail"></i>ارسال ایمیل به همه کاربران</button>
                                            <tr>
                                                <th>#</th>
                                                <td>1</td>
                                            </tr>
                                            <tr>
                                                <th>ایمیل</th>
                                                <td>amir@gmail.com</td>
                                            </tr>
                                            <tr>
                                                <th>تاریخ عضویت</th>
                                                <td>1399/07/21</td>
                                            </tr>
                                            <tr>
                                                <th>وضعیت</th>
                                                <td>
                                                    <button class="btn btn-success tshpcustom deactivate-btn" data-target="#deactivemodal" data-toggle="modal" data-name="amir@gmail.com"><i class="fa fa-check tshfa"></i>فعال</button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>عملیات</th>
                                                <td>
                                                    <button class="btn btn-primary tshpcustom send-email-btn" data-toggle="modal" data-target="#send-email-modal" data-email="amir@gmail.com"><i class="flaticon-mail"></i>ارسال ایمیل</button>
                                                </td>
                                            </tr>
                                        </table>
                                        <div class="col-lg-12 mt-4 mb-4">
                                            <span style="display: none;" class="col-lg-3">صفحه
                                                        <span>50</span>
                                                از
                                                        <span>170</span>
                                            </span>
                                            <ul style="display: none;" class="tshpaglist col-lg-9">
                                                <li class="btn btn-brand disabled">قبلی</li>
                                                <li class="btn btn-brand active-pag">1</li>
                                                <li class="btn btn-brand">2</li>
                                                <li class="btn btn-brand">3</li>
                                                <li class="btn btn-brand">4</li>
                                                <li class="btn btn-brand">5</li>
                                                <li class="btn btn-brand">6</li>
                                                <li class="btn btn-brand">7</li>
                                                <li class="btn btn-brand">8</li>
                                                <li class="btn btn-brand">9</li>
                                                <li class="btn btn-brand">10</li>
                                                <li class="btn btn-brand">بعدی</li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane " id="m_user_profile_tab_2">
                        </div>
                        <div class="tab-pane " id="m_user_profile_tab_3">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder_Scripts" runat="server">
    <script>
        function SendMail(Id) {
            mail = $('#Mail-' + Id).text();
            $('#email-target').val(mail);
            //alert("Done mail" + $('#email-target').val());
            return false;
        }

        function SendMail_All() {
            
            $('#email-target').val("همه کاربران");
            $('#email-subject').val("");
            $('#message-text').val("");
            //alert("Done mail" + $('#email-target').val());
            return false;
        }

        function Active_Func(Id) {
            $('#ActiveDiv').text(Id);
           // alert("Done Active" + $('#ActiveDiv').text());
            return false;
        }

        function DeActive(Id) {
            $('#DeActiveDiv').text(Id);
           // alert("Done DeActive" + $('#DeActiveDiv').text());
            return false;
        }

        function DeactiveButton() {
            Id = $('#DeActiveDiv').text();
            $.ajax({
                url: 'Admin_Ajax/DeActive_NewsLetter.aspx?Id='+Id,
                type: "post",
                contentType: "application/json; charset=utf-8",
                success: function (response) {
                    if (response == "Success") {
                        location.reload(true);
                    } 
                    
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert("مشکل در برقراری ارتباط با سرور");
                }
            });
            
        }

        function ActiveButton() {
            Id = $('#ActiveDiv').text();
            $.ajax({
                url: 'Admin_Ajax/Active_NewsLetter.aspx?Id=' + Id,
                type: "post",
                contentType: "application/json; charset=utf-8",
                success: function (response) {
                    if (response == "Success") {
                        location.reload(true);
                    }

                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert("مشکل در برقراری ارتباط با سرور");
                }
            });

        }

        function SendEmail() {
            $("#SendMailBTN").prop('disabled', true);
            mail = $('#email-target').val();
            sub = $('#email-subject').val();
            body_ = $('#message-text').val();

            if (mail == "همه کاربران") {
                $.ajax({
                    url: 'Admin_Ajax/SendGroupEmail.aspx?Subject=' + sub + '&Body=' + body_,
                    type: "post",
                    contentType: "application/json; charset=utf-8",
                    success: function (response) {
                        
                            $("#SendMailBTN").prop('disabled', false);
                            alert("ایمیل با موفقیت ارسال شد.")
                            $('#email-target').val("");
                            $('#email-subject').val("");
                            $('#message-text').val("");
                       

                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        alert("مشکل در برقراری ارتباط با سرور");
                    }
                });


            } else {
                $.ajax({
                    url: 'Admin_Ajax/SendMail.aspx?Mail=' + mail + '&Subject=' + sub + '&Body=' + body_,
                    type: "post",
                    contentType: "application/json; charset=utf-8",
                    success: function (response) {
                        if (response == "Message sent") {
                            $("#SendMailBTN").prop('disabled', false);
                            $('#email-target').val("");
                            $('#email-subject').val("");
                            $('#message-text').val("");
                            alert("ایمیل با موفقیت ارسال شد.")
                            
                        }

                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        alert("مشکل در برقراری ارتباط با سرور");
                    }
                });
            }
            return false;
        }


    </script>
</asp:Content>
