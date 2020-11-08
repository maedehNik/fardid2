<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Admin_SliderSetting.aspx.cs" Inherits="Fardid.Admin_SliderSetting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder_Css" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_Modal" runat="server">
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
                            <span class="m-subheader__daterange-title tshfontsize2" style="margin-right: 2px; margin-left: 2px;">تنظیمات اسلایدر</span>
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
                                        <cust_title>
													تنظیمات اسلایدر
												</cust_title>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab-content">
                        <div class="tab-pane active" id="m_user_profile_tab_1">
                            <div class="m-form m-form--fit m-form--label-align-right" onsubmit="return false;" id="sliderform" autocomplete="off">
                                <div class="m-portlet__body" style="padding-bottom: 0">
                                    <div class="container-fluid">
                                        <div class="row">
                                            <div class="container-fluid">
                                                <div class="m-section__content container-fluid tshtextright">
                                                    <button class="btn btn-brand btn-sm" onclick="GotoUploader('NewPics',100,'NewPicsGroundGeneratedGal')" type="button" data-target="#uploader" data-toggle="modal" style="margin-top: 15px;">انتخاب عکس</button>
                                                </div>
                                                <div>
                                                    <%foreach (var item in Models)
                                                        {%>


                                                    <div class="col-lg-6 selected-img-div" id="SelectedsliderIMG-<%=item.PicId %>">
                                                        <div class="selected-pic" style="position: relative;">
                                                            <button onclick="return DELETESLIDERITEM(<%=item.PicId %>)" type="button" class="btn btn-danger delete-selected-pic" style="position: absolute; right: -8px; top: -10px; z-index: 999; padding: 4px 5px;"><i class="fa fa-trash"></i></button>
                                                            <img src="<%=item.Path %>" class="uimg" data-name="نام عکس" data-label="لیبل" data-desc="توضیحات" alt="">
                                                        </div>
                                                    </div>



                                                    <%}
                                                    %>
                                                </div>
                                                <div id="NewPicsGroundGeneratedGal">
                                                </div>
                                            </div>
                                             <input id="NewPics" hidden />
                                        <div class="m-portlet__foot m-portlet__foot--fit mt-3">
                                            <div class="m-form__actions">
                                                <div class="row">
                                                    <div class="col-lg-12 tshtextleft" style="padding-left: 0;">
                                                        <button type="submit" class="btn btn-accent m-btn m-btn--air m-btn--custom sendblg" onclick="return SaveSliderPics()">ذخیره</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        </div>
                                       
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder_Scripts" runat="server">

    <div class="TSHP-UploaderAndGallery"></div>
    <script src="AdminAssets/app/js/Uploader.js"></script>
    <script>
        var ActionsDemo = { init: function () { $(".summernote").summernote({ height: 350 }) } }; jQuery(document).ready(function () { ActionsDemo.init() });
    </script>
    <script>
        function SaveSliderPics() {
            Pics = $('#NewPics').val();
            alert(Pics);

            $.ajax({
                url: '/Admin_Ajax/SaveSliderPics.aspx?Pics=' + Pics,
                type: "post",
                contentType: "application/json; charset=utf-8",
                success: function (response) {
                    swal("درخواست با موفقیت ارسال شد!", status, "success").then(function (e) {
                        console.log("1");
                        location.reload(true);
                    });
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    swal("عدم موفقیت در ارسال!", st, "error").then(function (e) {
                        console.log("1");
                    });
                    mApp.unblock(".m-page");
                }
            });
            return false;



            //$.ajax({
            //    url: '/Admin_Ajax/SaveSliderPics.aspx?Pics=' + Pics,
            //    type: "post",
            //    contentType: "application/json; charset=utf-8",
            //    success: function (response) {
            //        swal("درخواست با موفقیت ارسال شد!", status, "success").then(function (e) {
            //            console.log("1");
            //            location.reload(true);
            //        });
            //            },
            //    error: function (jqXHR, textStatus, errorThrown) {
            //        swal("عدم موفقیت در ارسال!", st, "error").then(function (e) {
            //            console.log("1");
            //        });
            //        mApp.unblock(".m-page");
            //    }
            //});
        }
        function DELETESLIDERITEM(id) {

            //mApp.block(".m-page", {
            //    overlayColor: "#2c2e3e", type: "loader", state: "success", message: "در حال بارگزاری"
            //});
            alert(id);
            $.ajax({
                url: '/Admin_Ajax/DeleteSlider.aspx?idIMG=' + id,
                type: "post",
                contentType: "application/json; charset=utf-8",
                success: function (status) {
                    swal("درخواست با موفقیت ارسال شد!", status, "success").then(function (e) {
                        console.log("1");
                    });
                    $("#SelctdimgDIV-" + id).hide(200);
                    $("#SelctdimgDIV-" + id).html("");
                    mApp.unblock(".m-page");

                },
                processData: false,
                contentType: false,
                error: function (st) {
                    swal("عدم موفقیت در ارسال!", st, "error").then(function (e) {
                        console.log("1");
                    });
                    mApp.unblock(".m-page");
                }
            });
        }
       //DEBUG SHAVAD
    </script>


</asp:Content>
