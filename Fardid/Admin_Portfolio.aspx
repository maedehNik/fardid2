<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Admin_Portfolio.aspx.cs" Inherits="Fardid.Admin_Portfolio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder_Css" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_Modal" runat="server">

    <div class="modal fade" id="deleteCus" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">حذف نمونه کار</h5>
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
                            <span class="m-subheader__daterange-title tshfontsize2" style="margin-right: 2px; margin-left: 2px;">مدیریت نمونه کار ها</span>
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
            <%foreach (var item in Models)
                {%>
            <div class="col-lg-3">
                <!--begin::Portlet-->
                <div class="m-portlet">
                    <div class="m-card-profile" style="padding-top: 0;">
                        <div class="m-card-profile__pic" style="padding-left: 0;">
                            <div class="m-card-profile__pic-wrapper" style="width: 120px; height: 120px; line-height: 104px; text-align: center">
                                <img src="<%=item.LogoPath %>" alt="" style="width: 100%;">
                            </div>
                        </div>
                        <div class="m-card-profile__details">
                            <span class="m-card-profile__name" style="margin-top: 15px;">
                                <%=item.Subject %>
                            </span>
                            <div class="m-widget1 row">
                                <%if (item.Deleted == 0)
                                    { %>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">

                                    <a href="Admin_AddPortfolio.aspx?Type=Edit&Id=<%= item.P_Id %>" class="col-12 btn btn-primary"><i class="fa fa-edit"></i>
                                        ویرایش
                                    </a>

                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <button class="col-12 btn btn-danger remove-portfolio-btn" data-toggle="modal" data-target="#deleteCus" onclick="return ModalDelete(<%=item.P_Id%>)">
                                        <i class="fa fa-trash"></i>
                                        حذف
                                    </button>
                                </div>
                                <%}
                                    else
                                    { %>
                                <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8 offset-2">
                                    <button class="col-12 btn btn-danger remove-portfolio-btn" onclick="return false">
                                        <i class="fa fa-trash"></i>حذف شده
                                    </button>
                                </div>
                                <%} %>
                            </div>
                        </div>
                    </div>
                </div>
                <!--end::Portlet-->
            </div>
            <% } %>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder_Scripts" runat="server">
    <script>
        function ModalDelete(Id) {
            $('#DeleteServiceDiv').text(Id);

            return false;
        }

        function DeleteButton() {
            Id = $('#DeleteServiceDiv').text();
            $.ajax({
                url: 'Admin_Ajax/DeletePortfolio.aspx?Id=' + Id,
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
