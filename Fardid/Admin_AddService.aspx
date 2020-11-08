<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Admin_AddService.aspx.cs" Inherits="Fardid.Admin_AddService" %>

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
                            <span class="m-subheader__daterange-title tshfontsize2" style="margin-right: 2px; margin-left: 2px;">افزودن خدمت جدید</span>
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
													افزودن خدمت جدید
												</cust_title>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab-content">
                        <div class="tab-pane active" id="m_user_profile_tab_1">
                            <div class="m-form m-form--fit m-form--label-align-right" id="addservice-form" autocomplete="off">
                                <div class="m-portlet__body" style="padding-bottom: 0">
                                    <div class="container-fluid">
                                        <div class="col-12 rowresml0">
                                            <div class="row">
                                                <div class="col-12">
                                                    <div class="m-portlet__head-title col-12">
                                                        <h3 class="m-portlet__head-text" style="font-size: 12px; border-bottom: 1px solid rgba(0,0,0,.1); padding-bottom: 17px;">پس زمینه اصلی
                                                        </h3>
                                                    </div>
                                                    <div class="m-section__content container-fluid tshtextright">
                                                        <button onclick="GotoUploader('ContentPlaceHolder_HiddenField_BackGround',1,'HiddenField_BackGroundGeneratedGal')" class="btn btn-brand btn-sm mt-3" type="button" data-target="#uploader" data-toggle="modal">انتخاب عکس</button>
                                                        <asp:HiddenField ID="HiddenField_BackGround" runat="server" Value="" />
                                                    </div>
                                                </div>
                                                <div class="col-12" id="HiddenField_BackGroundGeneratedGal">
                                                    <div class="col-12 selected-img-div" style="margin-top: 0;">
                                                        <div class="selected-pic" style="position: relative;">
                                                            <img src="<%= model.Background_Path %>" class="uimg" data-name="" data-label="" data-desc="" alt="">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="form-group col-lg-6 mt-4" style="padding-top: 0;">
                                                    <div class="col-12">
                                                        <label for="sefs8" class="form-control-label">عنوان</label>
                                                        <%--<input type="text" name="sefs8" id="sefs8" class="form-control m-input" placeholder="" value="">--%>
                                                        <asp:TextBox ID="TextBoxSub" runat="server" CssClass="form-control m-input"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group col-lg-6 mt-4" style="padding-top: 0;">
                                                    <div class="col-12">
                                                        <label for="sefs9" class="form-control-label">عنوان سمت راست</label>
                                                        <%--<input type="text" name="sefs9" id="sefs9" class="form-control m-input" placeholder="" value="">--%>
                                                        <asp:TextBox ID="TextBox_RSub" runat="server" CssClass="form-control m-input"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="row" style="padding-top: 0; margin-top: 30px;">
                                                <div class="col-md-6">
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <label class="form-control-label col-12">تصویر سمت چپ</label>
                                                            <div class="m-section__content tshtextright col-12">
                                                                <button onclick="GotoUploader('ContentPlaceHolder_HiddenField_LeftPic',1,'HiddenField_LeftPicGeneratedGal')" class="btn btn-brand btn-sm" type="button" data-target="#uploader" data-toggle="modal" style="margin-bottom: 30px;">انتخاب عکس</button>
                                                                <asp:HiddenField ID="HiddenField_LeftPic" runat="server" Value="" />
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6" id="HiddenField_LeftPicGeneratedGal">
                                                            <div class="selected-pic" style="position: relative;">
                                                                <img src="<%= model.LeftPic_Path %>" class="uimg" data-name="" data-label="" data-desc="" alt="">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="row">
                                                        <div class="col-md-6 res-mt-39">
                                                            <label class="form-control-label col-12">تصویر سمت راست</label>
                                                            <div class="m-section__content tshtextright col-12">
                                                                <button onclick="GotoUploader('ContentPlaceHolder_HiddenField_RightPic',1,'HiddenField_RightPicGeneratedGal')" class="btn btn-brand btn-sm" type="button" data-target="#uploader" data-toggle="modal" style="margin-bottom: 30px;">انتخاب عکس</button>
                                                                <asp:HiddenField ID="HiddenField_RightPic" runat="server" Value="" />
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6" id="HiddenField_RightPicGeneratedGal">
                                                                <div class="selected-pic" style="position: relative;">
                                                                <img src="<%= model.RightPic_Path %>" class="uimg" data-name="" data-label="" data-desc="" alt="">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group col-12">
                                                <label for="sefs10" class="col-form-label tshtextright">توضیحات</label>
                                                <div>
                                                    <%--<textarea maxlength="150" id="sefs10" name="sefs10" class="form-control m-input" placeholder="" style="padding-top: 20px;min-height: 70px"></textarea>--%>
                                                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control m-input" Style="padding-top: 10px; min-height: 70px" TextMode="MultiLine"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-12">
                                                    <div class="m-portlet__head-title col-12 mt-4">
                                                        <h3 class="m-portlet__head-text" style="font-size: 12px; border-bottom: 1px solid rgba(0,0,0,.1); padding-bottom: 17px;">پس زمینه ویدیو
                                                        </h3>
                                                    </div>
                                                    <div class="m-section__content tshtextright col-12">
                                                        <button onclick="GotoUploader('ContentPlaceHolder_HiddenField_VideoBack',1,'HiddenField_VideoBackGeneratedGal')" class="btn btn-brand btn-sm mt-3" type="button" data-target="#uploader" data-toggle="modal">انتخاب عکس</button>
                                                        <asp:HiddenField ID="HiddenField_VideoBack" runat="server" Value="" />
                                                    </div>
                                                </div>
                                                <div class="col-12" id="HiddenField_VideoBackGeneratedGal">
                                                    <div class="selected-pic" style="position: relative;">
                                                            <img src="<%= model.VideoBackground_Path %>" class="uimg" data-name="" data-label="" data-desc="" alt="">
                                                        </div>
                                                </div>
                                                <div class="form-group col-lg-12 mt-4" style="padding-top: 0;">
                                                    <div class="col-12">
                                                        <label for="sefs11" class="form-control-label">امبد ویدیو (آپارات)</label>
                                                        <%--<input type="text" name="sefs11" id="sefs11" class="form-control m-input" placeholder="" value="">--%>
                                                        <asp:TextBox ID="TextBox_VideoLink" runat="server" CssClass="form-control m-input"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group col-lg-6 mt-4" style="padding-top: 0;">
                                                    <div class="col-12">
                                                        <label for="sefs12" class="form-control-label">عنوان اول ویدیو</label>
                                                        <%--<input type="text" name="sefs12" id="sefs12" class="form-control m-input" placeholder="" value="">--%>
                                                        <asp:TextBox ID="TextBox_VideoSub1" runat="server" CssClass="form-control m-input"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group col-lg-6 mt-4" style="padding-top: 0;">
                                                    <div class="col-12">
                                                        <label for="sefs13" class="form-control-label">عنوان دوم ویدیو</label>
                                                        <%--									<input type="text" name="sefs13" id="sefs13" class="form-control m-input" placeholder="" value="">--%>
                                                        <asp:TextBox ID="TextBox_VideoSub2" runat="server" CssClass="form-control m-input"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group col-lg-6 mt-4" style="padding-top: 0;">
                                                    <div class="col-12">
                                                        <label for="sefs14" class="form-control-label">کلیدواژه سئو</label>
                                                        <%--<input type="text" name="sefs14" id="sefs14" class="form-control m-input" placeholder="" value="">--%>
                                                        <asp:TextBox ID="TextBox_SEO_K" runat="server" CssClass="form-control m-input"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="form-group col-lg-6 mt-4" style="padding-top: 0;">
                                                    <div class="col-12">
                                                        <label for="sefs15" class="form-control-label">توضیحات سئو</label>
                                                        <%--<input type="text" name="sefs15" id="sefs15" class="form-control m-input" placeholder="" value="">--%>
                                                        <asp:TextBox ID="TextBox_SEO_D" runat="server" CssClass="form-control m-input"></asp:TextBox>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="m-portlet__foot m-portlet__foot--fit col-12 mt-3">
                                            <div class="m-form__actions">
                                                <div class="row">
                                                    <div class="col-lg-4" style="padding-top: 10px;">
                                                        <label class="m-checkbox">
                                                            <asp:CheckBox ID="CheckBox_Show" runat="server" />
                                                            نمایش در منو
																	<span></span>
                                                        </label>
                                                    </div>
                                                    <div class="col-lg-8 tshtextleft" style="padding-left: 0;">
                                                        <%--<button type="submit" class="btn btn-accent m-btn m-btn--air m-btn--custom">افزودن</button>--%>
                                                        <asp:Button ID="Button1" runat="server" Text="افزودن" CssClass="btn btn-accent m-btn m-btn--air m-btn--custom" OnClick="Button1_Click" />
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
    <script src="AdminAssets/demo/default/custom/header/actions.js" type="text/javascript"></script>
    <div class="TSHP-UploaderAndGallery"></div>
    <script src="AdminAssets/app/js/Uploader.js"></script>

    <script>
        var ActionsDemo = { init: function () { $(".summernote").summernote({ height: 350 }) } }; jQuery(document).ready(function () { ActionsDemo.init() });
    </script>

</asp:Content>
