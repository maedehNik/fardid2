<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Admin_MainSetting.aspx.cs" Inherits="Fardid.Admin_MainSetting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder_Css" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_Modal" runat="server">
    <div class="modal fade p-0" id="uploader" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered tshuploader-dialog" role="document">
            <div class="modal-content tshuploader-content">
                <div class="modal-header">
                    <h5 class="modal-title col-12">
                        <ul class="uploader-header col-12">
                            <li class="row">
                                <li class="col-6">
                                    <span class="active-upload upload-btn"><i class="fa fa-upload"></i>
                                        آپلود
                                    </span>
                                </li>
                                <li class="col-6">
                                    <span class="gal-btn"><i class="fa fa-images"></i>
                                        گالری
                                    </span>
                                </li>
                            </li>
                        </ul>
                    </h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="close" style="position: absolute; left: 15px; top: 25px;">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body" style="overflow-y: auto; overflow-x: hidden;">
                    <div class="upload-fields col-12">
                        <div class="container-fluid">
                            <div class="row">
                                <div class="form-group m-form__group col-lg-4" style="padding: 0;">
                                    <div class="col-lg-12">
                                        <label class="form-control-label">نام عکس:</label>
                                        <input type="text" class="form-control m-input picname" placeholder="" value="">
                                    </div>
                                </div>
                                <div class="form-group m-form__group col-lg-4" style="padding: 0;">
                                    <div class="col-lg-12">
                                        <label class="form-control-label">لیبل:</label>
                                        <input type="text" class="form-control m-input piclabel" placeholder="" value="">
                                    </div>
                                </div>
                                <div class="form-group m-form__group col-lg-4" style="padding: 0;">
                                    <div class="col-lg-12">
                                        <label class="form-control-label">توضیح مختصر:</label>
                                        <input type="text" class="form-control m-input picdesc" placeholder="" value="">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="upload-div col-12">
                        <div class="col-12 dropzone-uploader">
                            <div class="m-dropzone dropzone" action="inc/api/dropzone/upload.php" id="m-dropzone-one">
                                <div class="m-dropzone__msg dz-message needsclick">
                                    <h3 class="m-dropzone__msg-title">فایل را اینجا رها کنید یا انتخاب کنید</h3>
                                    <span class="m-dropzone__msg-desc">فقط امکان انتخاب یک فایل وجود دارد</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="gal-div col-12" style="display: none; height: 100%;">
                        <div class="row" style="height: 100%;">
                            <div class="col-lg-12 upload-right">
                                <div class="gal-img col-lg-12" style="padding: 0; float: right">
                                    <h3 class="gal-h3 h3-active"><i class="fa fa-images"></i>
                                        عکس
                                    </h3>
                                    <div class="inner-gal">
                                        <div class="col-lg-3">
                                            <div style="position: relative;">
                                                <label class="m-checkbox m-checkbox--bold m-checkbox--state-brand" style="position: absolute; right: -8px; top: -10px; z-index: 999;">
                                                    <input type="checkbox">
                                                    <span style="background-color: white!important;"></span>
                                                </label>
                                                <img src="AdminAssets/demo/default/media/img/misc/preservation-copy.jpg" class="uimg" data-name="نام عکس" data-label="لیبل" data-desc="توضیحات" alt="">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="gal-img col-lg-12" style="padding: 0; float: right">
                                    <h3 class="gal-h3"><i class="fa fa-video"></i>
                                        ویدیو
                                    </h3>
                                    <div class="inner-gal" style="display: none">
                                        <div class="col-lg-3">
                                            <div style="position: relative;">
                                                <label class="m-checkbox m-checkbox--bold m-checkbox--state-brand" style="position: absolute; right: -8px; top: -10px; z-index: 999;">
                                                    <input type="checkbox">
                                                    <span style="background-color: white!important;"></span>
                                                </label>
                                                <img src="AdminAssets/demo/default/media/img/misc/preservation-copy.jpg" class="uimg" data-name="نام عکس" data-label="لیبل" data-desc="توضیحات" alt="">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="gal-img col-lg-12" style="padding: 0; float: right">
                                    <h3 class="gal-h3"><i class="fa fa-file"></i>
                                        فایل
                                    </h3>
                                    <div class="inner-gal" style="display: none">
                                        <div class="col-lg-3">
                                            <div style="position: relative;">
                                                <label class="m-checkbox m-checkbox--bold m-checkbox--state-brand" style="position: absolute; right: -8px; top: -10px; z-index: 999;">
                                                    <input type="checkbox">
                                                    <span style="background-color: white!important;"></span>
                                                </label>
                                                <img src="AdminAssets/demo/default/media/img/misc/preservation-copy.jpg" class="uimg" data-name="نام عکس" data-label="لیبل" data-desc="توضیحات" alt="">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-3 upload-left">
                                <div class="col-12">
                                    <img src="AdminAssets/demo/default/media/img/misc/preservation-copy.jpg" class="left-img" alt="">
                                </div>
                                <div class="mt-3">
                                    <div class="form-group m-form__group col-12" style="padding: 0;">
                                        <div class="col-lg-12">
                                            <label class="form-control-label">نام عکس:</label>
                                            <input type="text" class="form-control m-input picname picinps" disabled="disabled" placeholder="" value="">
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group col-12" style="padding: 0;">
                                        <div class="col-lg-12">
                                            <label class="form-control-label">لیبل:</label>
                                            <input type="text" class="form-control m-input piclabel picinps" disabled="disabled" placeholder="" value="">
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group col-12" style="padding: 0;">
                                        <div class="col-lg-12">
                                            <label class="form-control-label">توضیح مختصر:</label>
                                            <input type="text" class="form-control m-input picdesc picinps" disabled="disabled" placeholder="" value="">
                                        </div>
                                    </div>
                                    <div class="form-group m-form__group col-12 btn-uploader">
                                        <button class="btn btn-brand ubtn1">
                                            <i class="fa fa-edit"></i>
                                            ویرایش
                                        </button>
                                        <button class="btn btn-danger ubtn2 deleteimgbtn" data-target="#deleteimg" data-toggle="modal" data-name="نام عکس">
                                            <i class="fa fa-trash"></i>
                                            حذف
                                        </button>
                                        <button class="btn btn-success ubtn3" style="display: none">
                                            <i class="fa fa-save"></i>
                                            ذخیره
                                        </button>
                                        <button class="btn btn-warning ubtn4" style="display: none">
                                            <i class="fa fa-times"></i>
                                            انصراف
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="modal fade" id="deleteimg" tabindex="-1" role="dialog" aria-hidden="true" style="background-color: rgba(0,0,0,.4);">
                                <div class="modal-dialog modal-dialog-centered" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h5 class="modal-title">پاک کردن عکس</h5>
                                            <button type="button" class="close" onclick="closeDI();" aria-label="close">
                                                <span aria-hidden="true">×</span>
                                            </button>
                                        </div>
                                        <div class="modal-body">
                                            <p>
                                                عکس
                                            <span id="data-name"></span>
                                                پاک شود؟
                                            </p>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" onclick="closeDI();">خیر</button>
                                            <button type="button" class="btn btn-danger">بله</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-warning" data-dismiss="modal">انصراف</button>
                    <button type="button" class="btn btn-success select-uploader" style="display: none">انتخاب</button>
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
                            <span class="m-subheader__daterange-title tshfontsize2" style="margin-right: 2px; margin-left: 2px;">تنظیمات کلی</span>
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
                                                    اطلاعات شخصی
                                                </cust_title>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="tab-content">
                        <div class="tab-pane active" id="m_user_profile_tab_1">
                            <div  class="m-form m-form--fit m-form--label-align-right" id="mainsettingForm" autocomplete="off">
                                <div class="m-portlet__body" style="padding-bottom: 0">
                                    <div class="per-info">
                                        <div class="row">
                                            <div class="form-group m-form__group col-lg-6 col-xs-12">
                                                <label for="siv1" class="col-12 col-form-label tshtextright">نام سایت</label>
                                                <div class="col-12">
                                                    <%--<input class="form-control m-input" id="siv1" name="siv1" type="text" value="">--%>
                                                    <asp:TextBox ID="TextBox_SiteName" runat="server" CssClass="form-control m-input"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group m-form__group col-lg-6 col-xs-12" style="padding-top: 0;">
                                                <label for="siv2" class="col-12 tshtextright col-form-label">توضیحات سایت</label>
                                                <div class="col-12">
                                                    <%--<input class="form-control m-input" id="siv2" name="siv2" type="text" value="">--%>
                                                    <asp:TextBox ID="TextBox_Site_D" runat="server" CssClass="form-control m-input"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group m-form__group col-lg-6 col-xs-12">
                                                <label for="siv3" class="col-12 tshtextright col-form-label">شماره تماس</label>
                                                <div class="col-12">
                                                    <%--<input class="form-control m-input" id="siv3" name="siv3" type="text" value="">--%>
                                                    <asp:TextBox ID="TextBox_Phone" runat="server" CssClass="form-control m-input"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group m-form__group col-lg-6 col-xs-12" style="padding-top: 0;">
                                                <label for="siv4" class="col-12 tshtextright col-form-label">ایمیل</label>
                                                <div class="col-12">
                                                    <%--<input class="form-control m-input" id="siv4" name="siv4" type="text" value="">--%>
                                                    <asp:TextBox ID="TextBox_Email" runat="server" CssClass="form-control m-input"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group m-form__group col-lg-6 col-xs-12">
                                                <label for="siv5" class="col-12 tshtextright col-form-label">آدرس فارسی</label>
                                                <div class="col-12">
                                                    <%--<input class="form-control m-input" id="siv5" name="siv5" type="number" value="">--%>
                                                    <asp:TextBox ID="TextBox_per" runat="server" CssClass="form-control m-input"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group m-form__group col-lg-6 col-xs-12" style="padding-top: 0;">
                                                <label for="siv6" class="col-12 tshtextright col-form-label">آدرس انگلیسی</label>
                                                <div class="col-12">
                                                    <%--<input class="form-control m-input" id="siv6" name="siv6" type="number" value="">--%>
                                                    <asp:TextBox ID="TextBox_Eng" runat="server" CssClass="form-control m-input"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group m-form__group col-lg-6 col-xs-12">
                                                <label for="siv7" class="col-12 tshtextright col-form-label">کلیدواژه سئو</label>
                                                <div class="col-12">
                                                    <%--<input class="form-control m-input" id="siv7" name="siv7" type="number" value="">--%>
                                                    <asp:TextBox ID="TextBox_SEO_K" runat="server" CssClass="form-control m-input"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group m-form__group col-lg-6 col-xs-12" style="padding-top: 0;">
                                                <label for="siv8" class="col-12 tshtextright col-form-label">توضیحات سئو</label>
                                                <div class="col-12">
                                                    <%--<input class="form-control m-input" id="siv8" name="siv8" type="number" value="">--%>
                                                    <asp:TextBox ID="TextBox_SEO_D" runat="server" CssClass="form-control m-input"></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="form-group m-form__group col-lg-3 col-xs-12">
                                                <label for="siv9" class="col-12 tshtextright col-form-label">اینستاگرام</label>
                                                <div class="col-12">
                                                    <%--<input class="form-control m-input" id="siv9" name="siv9" type="number" value="">--%>
                                                    <asp:TextBox ID="TextBox_Insta" runat="server" CssClass="form-control m-input"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group m-form__group col-lg-3 col-xs-12" style="padding-top: 0;">
                                                <label for="siv10" class="col-12 tshtextright col-form-label">فیسبوک</label>
                                                <div class="col-12">
                                                    <%--<input class="form-control m-input" id="siv10" name="siv10" type="number" value="">--%>
                                                    <asp:TextBox ID="TextBox_Facebook" runat="server" CssClass="form-control m-input"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group m-form__group col-lg-3 col-xs-12" style="padding-top: 0;">
                                                <label for="siv11" class="col-12 tshtextright col-form-label">توییتر</label>
                                                <div class="col-12">
                                                   <%-- <input class="form-control m-input" id="siv11" name="siv11" type="number" value="">--%>
                                                    <asp:TextBox ID="TextBox_twitter" runat="server" CssClass="form-control m-input"></asp:TextBox>
                                                </div>
                                            </div>
                                            <div class="form-group m-form__group col-lg-3 col-xs-12" style="padding-top: 0;">
                                                <label for="siv12" class="col-12 tshtextright col-form-label">لینکدین</label>
                                                <div class="col-12">
                                                    <%--<input class="form-control m-input" id="siv12" name="siv12" type="number" value="">--%>
                                                    <asp:TextBox ID="TextBox_Linkedin" runat="server" CssClass="form-control m-input" ></asp:TextBox>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="m-portlet__foot m-portlet__foot--fit mt-4">
                                            <div class="m-form__actions">
                                                <div class="row">
                                                    <div class="col-2">
                                                    </div>
                                                    <div class="col-12 tshtextleft">
                                                       <%-- <button type="submit" class="btn btn-accent m-btn m-btn--air m-btn--custom">ذخیره</button>&nbsp;&nbsp;--%>
                                                        <asp:Button ID="Button1" runat="server" Text="ذخیره" CssClass="btn btn-accent m-btn m-btn--air m-btn--custom" OnClick="Button1_Click"/>
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

    
    <script>
        var Treeview = {
            init: function () {
                $("#m_tree_3").jstree({
                    core: {
                        themes: { responsive: !1 },
                        check_callback: !1,
                        data: [
                            {
                                text: "1", icon: "fa fa-folder m--font-warning",
                                children: [
                                    {
                                        text: "2", icon: "fa fa-folder m--font-warning",
                                        children: [
                                            {
                                                text: "3", icon: "fa fa-folder m--font-warning",
                                                children: [
                                                    { text: "4", icon: "fa fa-folder m--font-warning" },
                                                ],
                                            },
                                        ],
                                    },
                                ],
                            },
                            {
                                text: "11", icon: "fa fa-folder m--font-warning",
                                children: [
                                    {
                                        text: "22", icon: "fa fa-folder m--font-warning",
                                        children: [
                                            {
                                                text: "33", icon: "fa fa-folder m--font-warning",
                                                children: [
                                                    { text: "44", icon: "fa fa-folder m--font-warning" },
                                                ],
                                            },
                                        ],
                                    },
                                ],
                            },
                        ],
                    },
                    types: { default: { icon: "fa fa-folder m--font-brand" }, file: { icon: "fa fa-file  m--font-brand" } },
                    state: { key: "demo" },
                    plugins: ["contextmenu", "state", "types", "checkbox"],
                }),
                    $("#m_tree_33").jstree({
                        core: {
                            themes: { responsive: !1 },
                            check_callback: !1,
                            data: [
                                {
                                    text: "1", icon: "fa fa-folder m--font-warning",
                                    children: [
                                        {
                                            text: "2", icon: "fa fa-folder m--font-warning",
                                            children: [
                                                {
                                                    text: "3", icon: "fa fa-folder m--font-warning",
                                                    children: [
                                                        { text: "4", icon: "fa fa-folder m--font-warning" },
                                                    ],
                                                },
                                            ],
                                        },
                                    ],
                                },
                                {
                                    text: "11", icon: "fa fa-folder m--font-warning",
                                    children: [
                                        {
                                            text: "22", icon: "fa fa-folder m--font-warning",
                                            children: [
                                                {
                                                    text: "33", icon: "fa fa-folder m--font-warning",
                                                    children: [
                                                        { text: "44", icon: "fa fa-folder m--font-warning" },
                                                    ],
                                                },
                                            ],
                                        },
                                    ],
                                },
                            ],
                        },
                        types: { default: { icon: "fa fa-folder m--font-brand" }, file: { icon: "fa fa-file  m--font-brand" } },
                        state: { key: "demo" },
                        plugins: ["contextmenu", "state", "types", "checkbox"],
                    });
            },
        };
        jQuery(document).ready(function () {
            Treeview.init();
        });

    </script>
</asp:Content>
