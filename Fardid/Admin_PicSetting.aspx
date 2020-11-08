<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Admin_PicSetting.aspx.cs" Inherits="Fardid.Admin_PicSetting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder_Css" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_Modal" runat="server">
    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

    <div class="m-subheader">
        <div class="d-flex align-items-center">
            <div class="mr-auto">
                <span class="m-subheader__daterange" id="m_dashboard_daterangepicker">
                    <span class="m-subheader__daterange-label">
                        <h3 class="m-subheader__title" style="padding-left: 0!important; margin: 0 0 0 2px!important;">پیشخوان
									<i class="fa fa-chevron-left tshfontsize2" style="transform: translateY(3px); color: #aaaeb8; margin-right: 2px;"></i>
                            <span class="m-subheader__daterange-title tshfontsize2" style="margin-right: 2px; margin-left: 2px;">تنظیمات تصاویر</span>
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
													تنظیمات تصاویر
												</cust_title>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab-content">
                        <div class="tab-pane active" id="m_user_profile_tab_1">
                            <div class="m-form m-form--fit m-form--label-align-right" onsubmit="return false;" id="newportfolio" autocomplete="off">
                                <div class="m-portlet__body" style="padding-bottom: 0">
                                    <div class="container-fluid">
                                        <div class="col-12 rowresml0">
                                            <div class="row mt-res-0" style="padding-top: 0; margin-top: 30px;">
                                                <div class="col-md-6">
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <label class="form-control-label col-12">لوگو اصلی</label>
                                                            <div class="m-section__content tshtextright col-12">
                                                                <button onclick="GotoUploader('ContentPlaceHolder_HiddenFieldMainLogoId',1,'HiddenFieldMainLogoIdGeneratedGal')" class="btn btn-brand btn-sm" type="button" data-target="#uploader" data-toggle="modal" style="margin-bottom: 30px;">انتخاب عکس</button>
                                                                <%--<input hidden id="MainLogoId" value="<%= Models.MainLogo_Id %>"/>--%>
                                                                <asp:HiddenField ID="HiddenFieldMainLogoId" runat="server" Value="<%= Models.MainLogo_Id %>" />
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6" id="HiddenFieldMainLogoIdGeneratedGal">
                                                            <div class="col-12 selected-img-div" style="margin: 0 0 30px 0;">
                                                                <div class="selected-pic" style="position: relative;">
                                                                    <button type="button" class="btn btn-danger delete-selected-pic" style="position: absolute; right: -8px; top: -10px; z-index: 999; padding: 4px 5px;"><i class="fa fa-trash"></i></button>
                                                                    <img src="<%= Models.MainLogo_Path %>" class="uimg" data-name="نام عکس" data-label="لیبل" data-desc="توضیحات" alt="">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="row">
                                                        <div class="col-md-6 res-mt-39">
                                                            <label class="form-control-label col-12">فو آیکن</label>
                                                            <div class="m-section__content tshtextright col-12">
                                                                <button class="btn btn-brand btn-sm" type="button" data-target="#uploader" data-toggle="modal" style="margin-bottom: 30px;" onclick="GotoUploader('ContentPlaceHolder_HiddenField_FoIconId',1,'HiddenField_FoIconIdGeneratedGal')">انتخاب عکس</button>
                                                                <%--       <input hidden id="FoIconId" value="<%= Models.FoIcon_Id %>"/>--%>
                                                                <asp:HiddenField ID="HiddenField_FoIconId" runat="server" Value="<%= Models.FoIcon_Id %>" />
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6" id="HiddenField_FoIconIdGeneratedGal">
                                                            <div class="col-12 selected-img-div" style="margin: 0 0 30px 0;">
                                                                <div class="selected-pic" style="position: relative;">
                                                                    <button type="button" class="btn btn-danger delete-selected-pic" style="position: absolute; right: -8px; top: -10px; z-index: 999; padding: 4px 5px;"><i class="fa fa-trash"></i></button>
                                                                    <img src="<%= Models.FoIcon_Path %>" class="uimg" data-name="نام عکس" data-label="لیبل" data-desc="توضیحات" alt="">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mt-res-0" style="padding-top: 0; margin-top: 30px;">
                                                <div class="col-md-6">
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <label class="form-control-label col-12">لوگو فوتر</label>
                                                            <div class="m-section__content tshtextright col-12">
                                                                <button class="btn btn-brand btn-sm" type="button" onclick="GotoUploader('ContentPlaceHolder_HiddenField_FooterLogoId',1,'HiddenField_FooterLogoIdGeneratedGal')" data-target="#uploader" data-toggle="modal" style="margin-bottom: 30px;">انتخاب عکس</button>
                                                                <%--<input hidden id="FooterLogoId" value="<%= Models.FooterLogo_Id %>"/>--%>
                                                                <asp:HiddenField ID="HiddenField_FooterLogoId" runat="server" Value="<%= Models.FooterLogo_Id %>" />
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6" id="HiddenField_FooterLogoIdGeneratedGal">
                                                            <div class="col-12 selected-img-div" style="margin: 0 0 30px 0;">
                                                                <div class="selected-pic" style="position: relative;">
                                                                    <button type="button" class="btn btn-danger delete-selected-pic" style="position: absolute; right: -8px; top: -10px; z-index: 999; padding: 4px 5px;"><i class="fa fa-trash"></i></button>
                                                                    <img src="<%= Models.FooterLogo_Path %>" class="uimg" data-name="نام عکس" data-label="لیبل" data-desc="توضیحات" alt="">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="row">
                                                        <div class="col-md-6 res-mt-39">
                                                            <label class="form-control-label col-12">لوگو ویدیو ها</label>
                                                            <div class="m-section__content tshtextright col-12">
                                                                <button class="btn btn-brand btn-sm" type="button" onclick="GotoUploader('ContentPlaceHolder_HiddenField_VideoLogoId',1,'HiddenField_VideoLogoIdGeneratedGal')" data-target="#uploader" data-toggle="modal" style="margin-bottom: 30px;">انتخاب عکس</button>
                                                                <%--<input hidden id="VideoLogoId" value="<%= Models.VideoLogo_Id %>"/>--%>
                                                                <asp:HiddenField ID="HiddenField_VideoLogoId" runat="server" Value="<%= Models.VideoLogo_Id %>" />
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6" id="HiddenField_VideoLogoIdGeneratedGal">
                                                            <div class="col-12 selected-img-div" style="margin: 0 0 30px 0;">
                                                                <div class="selected-pic" style="position: relative;">
                                                                    <button type="button" class="btn btn-danger delete-selected-pic" style="position: absolute; right: -8px; top: -10px; z-index: 999; padding: 4px 5px;"><i class="fa fa-trash"></i></button>
                                                                    <img src="<%= Models.VideoLogo_Path %>" class="uimg" data-name="نام عکس" data-label="لیبل" data-desc="توضیحات" alt="">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row mt-res-0" style="padding-top: 0; margin-top: 30px;">
                                                <div class="col-md-6">
                                                    <div class="row">
                                                        <div class="col-md-6 res-mt-39">
                                                            <label class="form-control-label col-12">لوگو منو</label>
                                                            <div class="m-section__content tshtextright col-12">
                                                                <button onclick="GotoUploader('ContentPlaceHolder_HiddenField_MenuLogoId',1,'HiddenField_MenuLogoIdGeneratedGal')" class="btn btn-brand btn-sm" type="button" data-target="#uploader" data-toggle="modal" style="margin-bottom: 30px;">انتخاب عکس</button>
                                                                <%--<input hidden id="MenuLogoId" value="<%= Models.MenuLogo_Id %>"/>--%>
                                                                <asp:HiddenField ID="HiddenField_MenuLogoId" runat="server" Value="<%= Models.MenuLogo_Id %>" />
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6" id="HiddenField_MenuLogoIdGeneratedGal">
                                                            <div class="col-12 selected-img-div" style="margin: 0 0 30px 0;">
                                                                <div class="selected-pic" style="position: relative;">
                                                                    <button type="button" class="btn btn-danger delete-selected-pic" style="position: absolute; right: -8px; top: -10px; z-index: 999; padding: 4px 5px;"><i class="fa fa-trash"></i></button>
                                                                    <img src="<%= Models.MenuLogo_Path %>" class="uimg" data-name="نام عکس" data-label="لیبل" data-desc="توضیحات" alt="">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                             <div class="m-portlet__foot m-portlet__foot--fit col-12 mt-3">
                                            <div class="m-form__actions">
                                                <div class="row">
                                                    <div class="col-lg-12 tshtextleft" style="padding-left: 0;">
                                                        <%-- <button type="submit" class="btn btn-accent m-btn m-btn--air m-btn--custom sendblg">ذخیره</button>--%>
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
    </div>
    

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder_Scripts" runat="server">

   <div class="TSHP-UploaderAndGallery"></div> 
    <script src="AdminAssets/app/js/Uploader.js"></script>
    <script>
        var ActionsDemo = { init: function () { $(".summernote").summernote({ height: 350 }) } }; jQuery(document).ready(function () { ActionsDemo.init() });
    </script>


</asp:Content>
