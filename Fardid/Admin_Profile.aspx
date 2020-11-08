<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Admin_Profile.aspx.cs" Inherits="Fardid.Admin_Profile" %>

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
                            <span class="m-subheader__daterange-title tshfontsize2" style="margin-right: 2px; margin-left: 2px;">پروفایل</span>
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
                                        پروفایل
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
                            <div class="m-form m-form--fit m-form--label-align-right" id="profile-form">
                                <div class="m-portlet__body">
                                    <div class="m-card-profile">
                                        <div class="m-card-profile__pic">
                                            <asp:HiddenField ID="HiddenField_AdminId" runat="server" />
                                            <div class="m-card-profile__pic-wrapper" id="HiddenField_ProfileGeneratedGal">
                                                <img src="<%= model.ProfilePic_Path %>" alt="">
                                                
                                            </div>
                                        </div>
                                        <div class="m-section__content container-fluid tshtextcenter mb-3">
                                            <button class="btn btn-brand btn-sm" type="button" onclick="GotoUploader('ContentPlaceHolder_HiddenField_Profile',1,'HiddenField_ProfileGeneratedGal')">انتخاب عکس</button>
                                            <asp:HiddenField ID="HiddenField_Profile" runat="server" />
                                        </div>
                                        <div class="m-card-profile__details">
                                            <%--<span class="m-card-profile__name">امیرحسین عرب
                                            </span>--%>
                                            <asp:Label ID="AdminNameLBL" runat="server" CssClass="m-card-profile__name"></asp:Label>
                                           <%-- <a class="m-card-profile__email m-link tshcurpoi">شماره کاربری : 97776543</a>--%>
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group row">
                                        <div class="col-10 ml-auto">
                                            <h3 class="m-form__section">1. اطلاعات شخصی</h3>
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group row">
                                        <label for="firstname" class="col-lg-4 col-xs-12 col-form-label">نام</label>
                                        <div class="col-lg-5 col-xs-12">
                                            <%--<input class="form-control m-input" id="firstname" name="firstname" type="text" value="امیرحسین">--%>
                                            <asp:TextBox ID="TextBox_Namle" runat="server" CssClass="form-control m-input"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group row">
                                        <label for="lastname" class="col-lg-4 col-xs-12 col-form-label">نام خانوادگی</label>
                                        <div class="col-lg-5 col-xs-12">
                                            <%--<input class="form-control m-input" id="lastname" name="lastname" type="text" value="عرب">--%>
                                            <asp:TextBox ID="TextBox_Family" runat="server" CssClass="form-control m-input"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group row">
                                        <label for="email" class="col-lg-4 col-xs-12 col-form-label">ایمیل</label>
                                        <div class="col-lg-5 col-xs-12">
                                            <%--<input class="form-control m-input" id="email" name="email" type="text" value="test@test.com">--%>
                                            <asp:TextBox ID="TextBox_Email" runat="server" CssClass="form-control m-input"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group row">
                                        <label for="phone" class="col-lg-4 col-xs-12 col-form-label">شماره تلفن</label>
                                        <div class="col-lg-5 col-xs-12">
                                            <%--<input class="form-control m-input" id="phone" name="phone" type="text" value="09197386684">--%>
                                            <asp:TextBox ID="TextBox_Phone" runat="server" CssClass="form-control m-input"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="m-form__seperator m-form__seperator--dashed m-form__seperator--space-2x"></div>

                                    <div class="form-group m-form__group row">
                                        <div class="col-10 ml-auto">
                                            <h3 class="m-form__section">2. رمز عبور
														<small style="display: block; font-size: 14px; margin-top: 10px;">برای تغییر رمز عبور فرم زیر را پر کنید.</small>
                                            </h3>
                                        </div>
                                    </div>

                                    <div class="form-group m-form__group row">
                                        <label for="password" class="col-lg-4 col-xs-12 col-form-label">رمز عبور</label>
                                        <div class="col-lg-5 col-xs-12">
                                           <%-- <input class="form-control m-input" id="password" name="password" type="password" value="">--%>
                                            <asp:TextBox ID="TextBox_Pass1" runat="server" CssClass="form-control m-input" TextMode="Password" ></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group row">
                                        <label for="repassword" class="col-lg-4 col-xs-12 col-form-label">تکرار رمز عبور</label>
                                        <div class="col-lg-5 col-xs-12">
                                            <%--<input class="form-control m-input" id="repassword" name="repassword" type="password" value="">--%>
                                            <asp:TextBox ID="TextBox_Pass2" runat="server" CssClass="form-control m-input" TextMode="Password"></asp:TextBox>
                                        </div>
                                    </div>

                                </div>
                                <div class="m-portlet__foot m-portlet__foot--fit">
                                    <div class="m-form__actions">
                                        <div class="row">
                                            <div class="col-2">
                                            </div>
                                            <asp:Label ID="Label_error" runat="server" Text="" ForeColor="Red"></asp:Label>
                                            <div class="col-7 tshtextleft">
                                                <%--<button type="submit" class="btn btn-accent m-btn m-btn--air m-btn--custom">ذخیره</button>&nbsp;&nbsp;--%>
                                                <asp:Button ID="Button1" runat="server" Text="ذخیره" CssClass="btn btn-accent m-btn m-btn--air m-btn--custom" OnClick="Button1_Click"/>
                                                
                                            </div>
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
    <div class="TSHP-UploaderAndGallery"></div> 
    <script src="AdminAssets/app/js/Uploader.js"></script>
</asp:Content>
