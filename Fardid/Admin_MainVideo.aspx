<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Admin_MainVideo.aspx.cs" Inherits="Fardid.Admin_MainVideo" %>

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
                            <span class="m-subheader__daterange-title tshfontsize2" style="margin-right: 2px; margin-left: 2px;">تنظیمات ویدیو صفحه اصلی</span>
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
                <div class="m-portlet m-portlet--full-height m-portlet--tabs">
                    <div class="m-portlet__head">
                        <div class="m-portlet__head-tools">
                            <ul class="nav nav-tabs m-tabs m-tabs-line   m-tabs-line--left m-tabs-line--primary" role="tablist">
                                <li class="nav-item m-tabs__item">
                                    <a class="nav-link m-tabs__link active" data-toggle="tab" href="#m_user_profile_tab_1" role="tab">
                                        <i class="flaticon-share m--hide"></i>
                                        <cust_title>
													تنظیمات ویدیو صفحه اصلی
												</cust_title>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab-content">
                        <div class="tab-pane active" id="m_user_profile_tab_1">
                            <div class="m-form m-form--fit m-form--label-align-right" id="mainvideo-form" autocomplete="off">
                                <div class="m-portlet__body" style="padding-bottom: 0">
                                    <div class="container-fluid">
                                        <div class="col-12 rowresml0">
                                            <div class="row">
                                                <div class="col-12">
                                                    <div class="m-portlet__head-title col-12 mt-4">
                                                        <h3 class="m-portlet__head-text" style="font-size: 12px; border-bottom: 1px solid rgba(0,0,0,.1); padding-bottom: 17px;">پس زمینه ویدیو
                                                        </h3>
                                                    </div>
                                                    <div class="m-section__content tshtextright col-12">
                                                        <button onclick="GotoUploader('ContentPlaceHolder_HiddenField_VideoBack',1,'HiddenField_VideoBackGroundGeneratedGal')" class="btn btn-brand btn-sm mt-3" type="button" data-target="#uploader" data-toggle="modal">انتخاب عکس</button>
                                                        <asp:HiddenField ID="HiddenField_VideoBack" runat="server" />
                                                    </div>
                                                </div>
                                                <div id="HiddenField_VideoBackGroundGeneratedGal" class="col-12">
                                                    <div class="col-12 selected-img-div">
                                                        <div class="selected-pic" style="position: relative;">
                                                            <img src="<%= model.MainVideoBackground_Pic %>" class="uimg" data-name="نام عکس" data-label="لیبل" data-desc="توضیحات" alt="">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group col-lg-12 mt-4" style="padding-top: 0;">
                                                    <div class="col-12">
                                                        <label for="siv13" class="form-control-label">امبد ویدیو (آپارات)</label>
                                                        <%--<input type="text" name="siv13" id="siv13" class="form-control m-input" placeholder="" value="">--%>
                                                        <asp:TextBox ID="TextBox_VideoLink" runat="server" CssClass="form-control m-input"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group col-lg-6 mt-4" style="padding-top: 0;">
                                                    <div class="col-12">
                                                        <label for="siv14" class="form-control-label">عنوان اول ویدیو</label>
                                                        <%--<input type="text" name="siv14" id="siv14" class="form-control m-input" placeholder="" value="">--%>
                                                        <asp:TextBox ID="TextBox_VideoSub1" runat="server" CssClass="form-control m-input"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group col-lg-6 mt-4" style="padding-top: 0;">
                                                    <div class="col-12">
                                                        <label for="siv15" class="form-control-label">عنوان دوم ویدیو</label>
                                                        <%--<input type="text" name="siv15" id="siv15" class="form-control m-input" placeholder="" value="">--%>
                                                        <asp:TextBox ID="TextBox_VideoSub2" runat="server" CssClass="form-control m-input"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="m-portlet__foot m-portlet__foot--fit col-12 mt-3">
                                            <div class="m-form__actions">
                                                <div class="row">
                                                    <div class="col-lg-12 tshtextleft" style="padding-left: 0;">
                                                        <%--	<button type="submit" class="btn btn-accent m-btn m-btn--air m-btn--custom sendblg">ذخیره</button>--%>
                                                        <asp:Button ID="Button1" runat="server" Text="ذخیره" CssClass="btn btn-accent m-btn m-btn--air m-btn--custom sendblg" OnClick="Button1_Click" />
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
</asp:Content>
