<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Admin_Services.aspx.cs" Inherits="Fardid.Admin_Services" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder_Css" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_Modal" runat="server">

    <div class="modal fade" id="deactivemodal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">غیرفعال سازی خدمت</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div style="display:none" id="DeActiveServiceDiv"></div>
                <div class="modal-body">
                    <p>
                        <span id="data-name"></span>
                        غیرفعال شود؟
                    </p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">خیر</button>
                    <button type="button" class="btn btn-warning" onclick="return DeActiveButton()">بله</button>
                </div>
            </div>
        </div>
    </div>

     <div class="modal fade" id="activemodal" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">فعال سازی خدمت</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div style="display:none" id="ActiveServiceDiv"></div>
                <div class="modal-body">
                    <p>
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

    <div class="modal fade" id="deleteCus" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">پاک کردن خدمت</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div style="display:none" id="DeleteServiceDiv"></div>
                <div class="modal-body">
                    <p>
                        <span id="data-name-delete"></span>
                        حذف شود؟
                    </p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">خیر</button>
                    <button type="button" class="btn btn-danger" onclick="return DeleteButton()">بله</button>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

    <!-- BEGIN: Subheader -->
    <div class="m-subheader">
        <div class="d-flex align-items-center">
            <div class="mr-auto">
                <span class="m-subheader__daterange" id="m_dashboard_daterangepicker">
                    <span class="m-subheader__daterange-label">
                        <h3 class="m-subheader__title" style="padding-left: 0!important; margin: 0 0 0 2px!important;">پیشخوان
									<i class="fa fa-chevron-left tshfontsize2" style="transform: translateY(3px); color: #aaaeb8; margin-right: 2px;"></i>
                            <span class="m-subheader__daterange-title tshfontsize2" style="margin-right: 2px; margin-left: 2px;">مدیریت خدمات</span>
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
                                        خدمات
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
                                                    <th>عنوان</th>
                                                    <th>وضعیت</th>
                                                    <th>نمایش در منو</th>
                                                    <th>عملیات</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <% foreach (var item in Models)
                                                    {%>
                                                <tr>
                                                    <th scope="row"><%= item.Num %></th>
                                                    <td><%= item.Subject %></td>

                                                    <% if (item.Deleted == 1)
                                                        { %>
                                                    <td>
                                                        <button class="btn btn-danger tshpcustom deactivate-btn"><i class="fa fa-trash tshfa" onclick="new function(){return false;}"></i>حذف شده</button>
                                                    </td>

                                                    <%}
                                                        else if (item.Active == 1)
                                                        {%>
                                                    <td>
                                                        <button class="btn btn-success tshpcustom deactivate-btn" data-target="#deactivemodal" data-toggle="modal" data-name="influencer marketing" onclick="return ModalDeActive(<%=item.S_Id %>)"><i class="fa fa-check tshfa"></i>فعال</button>
                                                    </td>
                                                    <%}
                                                        else
                                                        { %>
                                                    <td>
                                                        <button class="btn btn-warning tshpcustom deactivate-btn" data-target="#activemodal" data-toggle="modal" data-name="influencer marketing" onclick="return ModalActive(<%=item.S_Id %>)"><i class="fa fa-minus-circle tshfa"></i>غیرفعال</button>
                                                    </td>
                                                    <%} %>

                                                    <td>
                                                        <%if (item.ShowMenu == 1)
                                                            {  %>
                                                        <button class="btn btn-success tshpcustom" style="padding-left: 0;"><i class="fa fa-check tshfa"></i></button>
                                                        <%}
                                                        else
                                                        { %>
                                                        <button class="btn btn-danger tshpcustom" style="padding-left: 0;"><i class="fa fa-times tshfa"></i></button>
                                                        <%} %>
                                                    </td>
                                                    <td>
                                                        <%if (item.Deleted == 0)
                                                            { %>
                                                        <a href="Admin_AddService.aspx?Type=Edit&Id=<%= item.S_Id %>" class="btn btn-brand tshpcustom"><i class="fa fa-eye tshfa"></i>نمایش</a>
                                                        <button class="btn btn-danger tshpcustom cus-delete-btn" data-target="#deleteCus" data-toggle="modal" data-name="influencer marketing" onclick="return ModalDelete(<%=item.S_Id %>)"><i class="fa fa-trash tshfa"></i>حذف</button>
                                                        <%} %>
                                                    </td>
                                                </tr>
                                                <% } %>
                                            </tbody>
                                        </table>
                                        <table style="display: none;" class="cust-table cust-table-2 table table-striped table-hover m-table m-table--head-separator-primary">
                                            <tr>
                                                <th>#</th>
                                                <td>1</td>

                                            </tr>
                                            <tr>
                                                <th>عنوان</th>
                                                <td>influencer marketing</td>
                                            </tr>
                                            <tr>
                                                <th>وضعیت</th>
                                                <td>
                                                    <button class="btn btn-success tshpcustom deactivate-btn" data-target="#deactivemodal" data-toggle="modal" data-name="influencer marketing"><i class="fa fa-check tshfa"></i>فعال</button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>نمایش در منو</th>
                                                <td>
                                                    <button class="btn btn-success tshpcustom" style="padding-left: 0;"><i class="fa fa-check tshfa"></i></button>
                                                    <button class="btn btn-danger tshpcustom" style="padding-left: 0;"><i class="fa fa-times tshfa"></i></button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>عملیات</th>
                                                <td>
                                                    <button class="btn btn-brand tshpcustom"><i class="fa fa-eye tshfa"></i>نمایش</button>
                                                    <button class="btn btn-danger tshpcustom cus-delete-btn" data-target="#deleteCus" data-toggle="modal" data-name="influencer marketing"><i class="fa fa-trash tshfa"></i>حذف</button>
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
        function ModalDelete(Id) {
            $('#DeleteServiceDiv').text(Id);
            
            return false;
        }

        function ModalActive(Id) {
            $('#ActiveServiceDiv').text(Id);
            
            return false;
        }

        function ModalDeActive(Id) {
            $('#DeActiveServiceDiv').text(Id);
            
            return false;
        }

        function ActiveButton() {
            Id = $('#ActiveServiceDiv').text();
            $.ajax({
                url: 'Admin_Ajax/ActiveService.aspx?Id=' + Id,
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

        function DeActiveButton() {
            Id = $('#DeActiveServiceDiv').text();
            $.ajax({
                url: 'Admin_Ajax/DeActiveService.aspx?Id=' + Id,
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

        function DeleteButton() {
            Id = $('#DeleteServiceDiv').text();
            $.ajax({
                url: 'Admin_Ajax/DeleteService.aspx?Id=' + Id,
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

    </script>

</asp:Content>
