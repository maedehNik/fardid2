<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Admin_AddPortfolio.aspx.cs" Inherits="Fardid.addportfolio" %>

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
                            <span class="m-subheader__daterange-title tshfontsize2" style="margin-right: 2px; margin-left: 2px;">افزودن نمونه کار جدید</span>
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
													افزودن نمونه کار جدید
												</cust_title>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab-content">
                        <div class="tab-pane active" id="m_user_profile_tab_1">
                            <div class="m-form m-form--fit m-form--label-align-right" id="addportfolioForm" autocomplete="off">
                                <div class="m-portlet__body" style="padding-bottom: 0">
                                    <div class="container-fluid">
                                        <div class="row">
                                            <div class="form-group col-lg-6" style="padding-top: 0;">
                                                <div class="col-12">
                                                    <label for="sefs16" class="form-control-label">عنوان</label>
                                                    <%--<input type="text" name="sefs16" id="sefs16" class="form-control m-input" placeholder="" value="">--%>
                                                    <asp:TextBox ID="TextBox_Subject" runat="server" CssClass="form-control m-input"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group col-lg-6 col-xs-12" style="padding-top: 0;">
                                                <div class="col-12">
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <label for="postsubj" class="form-control-label">تصویر پس زمینه</label>
                                                            <div class="m-section__content container-fluid tshtextright" style="padding: 0;">
                                                                <button class="btn btn-brand btn-sm" type="button" onclick="GotoUploader('ContentPlaceHolder_TextBox_BackGround',1,'TextBox_BackGroundGeneratedGal')"  data-target="#uploader" data-toggle="modal" style="margin-bottom: 30px;">انتخاب عکس</button>
                                                                <asp:HiddenField  ID="TextBox_BackGround" runat="server" value="4"></asp:HiddenField>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6" id="TextBox_BackGroundGeneratedGal">
                                                            <div class="selected-pic" style="position: relative;">    <img src="<%= model.Background_Path %>" class="uimg" data-name="a" data-label="a" data-desc="a" alt="">  </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-12" style="margin-top: 40px;">
                                                    <div class="row">
                                                        <div class="col-md-6">
                                                            <label for="postsubj" class="form-control-label">لوگو</label>
                                                            <div class="m-section__content container-fluid tshtextright" style="padding: 0;">
                                                                <asp:HiddenField  ID="TextBox_Logo" runat="server" Value="2"></asp:HiddenField>
                                                                <button class="btn btn-brand btn-sm" onclick="GotoUploader('ContentPlaceHolder_TextBox_Logo',1,'TextBox_LogoGroundGeneratedGal')" type="button" data-target="#uploader" data-toggle="modal" style="margin-bottom: 30px;">انتخاب عکس</button>
                                                            </div>
                                                        </div>
                                                        <div class="col-md-6" id="TextBox_LogoGroundGeneratedGal">
                                                            <div class="col-12 selected-img-div" style="margin-top: 0;">
                                                                <div class="selected-pic" style="position: relative;">
                                                                    <img src="<%= model.Logo_Path %>" class="uimg" data-name="نام عکس" data-label="لیبل" data-desc="توضیحات" alt="">
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group m-form__group col-12">
                                                <label for="sefs17" class="col-form-label tshtextright">توضیحات</label>
                                                <div>
                                                    <%--<textarea maxlength="150" id="sefs17" name="sefs17" class="form-control m-input" placeholder="" style="padding-top: 20px; min-height: 70px"></textarea>--%>

                                                    <asp:TextBox ID="TextBox_discription" runat="server" CssClass="form-control m-input" TextMode="MultiLine" Style="padding-top: 20px; min-height: 70px"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group col-lg-6 mt-4" style="padding-top: 0;">
                                                <div class="col-12">
                                                    <label for="sefs18" class="form-control-label">کلیدواژه سئو</label>
                                                    <%--<input type="text" name="sefs18" id="sefs18" class="form-control m-input" placeholder="" value="">--%>
                                                    <asp:TextBox ID="TextBox_SEO_K" runat="server" CssClass="form-control m-input"></asp:TextBox>

                                                </div>
                                            </div>
                                            <div class="form-group col-lg-6 mt-4" style="padding-top: 0;">
                                                <div class="col-12">
                                                    <label for="sefs19" class="form-control-label">توضیحات سئو</label>
                                                    <%--<input type="text" name="sefs19" id="sefs19" class="form-control m-input" placeholder="" value="">--%>
                                                    <asp:TextBox ID="TextBox_SEO_D" runat="server" CssClass="form-control m-input"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="m-portlet__foot m-portlet__foot--fit mt-3">
                                            <div class="m-form__actions">
                                                <div class="row">
                                                    <div class="col-lg-4" style="padding-top: 10px;">
                                                        <label class="m-checkbox">
                                                            <%--<input type="checkbox">--%>
                                                            <asp:CheckBox ID="CheckBox_Show" runat="server" />
                                                            نمایش در صفحه اصلی
																	<span></span>
                                                        </label>
                                                    </div>
                                                    <div class="col-lg-8 tshtextleft" style="padding-left: 0;">
                                                        <%--<button type="submit" class="btn btn-accent m-btn m-btn--air m-btn--custom">افزودن</button>--%>
                                                        <asp:Button ID="Button1" runat="server" Text="افزودن" CssClass="btn btn-accent m-btn m-btn--air m-btn--custom" OnClick="Button1_Click"/>
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
