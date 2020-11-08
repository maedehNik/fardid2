<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Admin_AboutSetting.aspx.cs" Inherits="Fardid.Admin_AboutSetting" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder_Css" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_Modal" runat="server">
   
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

     <div class="m-grid__item m-grid__item--fluid m-wrapper">

            <!-- BEGIN: Subheader -->
            <div class="m-subheader">
                <div class="d-flex align-items-center">
                    <div class="mr-auto">
						<span class="m-subheader__daterange" id="m_dashboard_daterangepicker">
							<span class="m-subheader__daterange-label">
								<h3 class="m-subheader__title" style="padding-left: 0!important;margin: 0 0 0 2px!important;">
									پیشخوان
									<i class="fa fa-chevron-left tshfontsize2" style="transform: translateY(3px);color: #aaaeb8;margin-right: 2px;"></i>
									<span class="m-subheader__daterange-title tshfontsize2" style="margin-right: 2px;margin-left: 2px;">تنظیمات درباره ما</span>
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
                                                    درباره ما
                                                </cust_title>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="tab-content">
                                <div class="tab-pane active" id="m_user_profile_tab_1">
                                    <div class="m-form m-form--fit m-form--label-align-right" id="mainabout-form">
                                        <div class="m-portlet__body" style="padding-bottom: 0">
                                            <div class="container-fluid">
                                                <div class="col-12">
                                                    <div class="form-group">
                                                        <label for="siv16" class="form-control-label" style="display: none">درباره ما</label>
                                                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control textarea-padding" Height="300px" TextMode="MultiLine"></asp:TextBox>
                                                    </div>
                                                </div>
                                                <div class="m-portlet__foot m-portlet__foot--fit mt-3">
                                                    <div class="m-form__actions">
                                                        <div class="row">
                                                            <div class="col-lg-12 tshtextleft" style="padding-left: 0;">
                                                                <asp:Button ID="Button1" runat="server" Text="ذخیره" CssClass="btn btn-accent m-btn m-btn--air m-btn--custom sendblg" OnClick="Button1_Click"/>
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


    
    <!-- end:: Body -->



</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder_Scripts" runat="server">

    <script>
    var Treeview = {
        init: function () {
            $("#m_tree_1").jstree({ core: { themes: { responsive: !1 } }, types: { default: { icon: "fa fa-folder" }, file: { icon: "fa fa-file" } }, plugins: ["types"] }),
                $("#m_tree_2").jstree({ core: { themes: { responsive: !1 } }, types: { default: { icon: "fa fa-folder m--font-warning" }, file: { icon: "fa fa-file  m--font-warning" } }, plugins: ["types"] }),
                $("#m_tree_2").on("select_node.jstree", function (e, t) {
                    var n = $("#" + t.selected).find("a");
                    if ("#" != n.attr("href") && "javascript:;" != n.attr("href") && "" != n.attr("href")) return "_blank" == n.attr("target") && (n.attr("href").target = "_blank"), (document.location.href = n.attr("href")), !1;
                }),
                $("#m_tree_3").jstree({
                    plugins: ["wholerow", "checkbox", "types"],
                    core: {
                        themes: { responsive: !1 },
                        data: [
                            {
                                text: "تمامی دسته بندی ها",
                                children: [
                                    { text: "ساب منو ساب من ساب منو" },
                                    { text: "ساب منو ساب منو"},
                                    { text: "سب منو"},
                                ],
                            },
                            {
                                text: "تمامی دسته بندی ها",
                                children: [
                                    { text: "ساب منو ساب من ساب منو" },
                                    { text: "ساب منو ساب منو"},
                                    { text: "سب منو"},
                                ],
                            },
                            {
                                text: "تمامی دسته بندی ها",
                                children: [
                                    { text: "ساب منو ساب من ساب منو" },
                                    { text: "ساب منو ساب منو"},
                                    { text: "سب منو"},
                                ],
                            },
                            {
                                text: "تمامی دسته بندی ها",
                                children: [
                                    { text: "ساب منو ساب من ساب منو" },
                                    { text: "ساب منو ساب منو"},
                                    { text: "سب منو"},
                                ],
                            },
                            {
                                text: "تمامی دسته بندی ها",
                                children: [
                                    { text: "ساب منو ساب من ساب منو" },
                                    { text: "ساب منو ساب منو"},
                                    { text: "سب منو"},
                                ],
                            },
                        ],
                    },
                    types: { default: { icon: "fa fa-folder m--font-warning" }, file: { icon: "fa fa-file  m--font-warning" } },
                }),
                $("#m_tree_4").jstree({
                    core: {
                        themes: { responsive: !1 },
                        check_callback: !0,
                        data: [
                            {
                                text: " انتخاب همه",
                                children: [
                                    { text: "انتخاب شده", state: { selected: !0 } },
                                    { text: "آیکون سفارشی", icon: "fa fa-warning m--font-danger" },
                                    { text: "باز", icon: "fa fa-folder m--font-success", state: { opened: !0 }, children: [{ text: "دیگر گره ها", icon: "fa fa-file m--font-waring" }] },
                                    { text: "دیگر آیکون سفارشی", icon: "fa fa-warning m--font-waring" },
                                    { text: " انتخاب همه غیرفعال ", icon: "fa fa-check m--font-success", state: { disabled: !0 } },
                                    {
                                        text: "زیر گره ها",
                                        icon: "fa fa-folder m--font-danger",
                                        children: [
                                            { text: "آیتم 1", icon: "fa fa-file m--font-waring" },
                                            { text: "آیتم 2", icon: "fa fa-file m--font-success" },
                                            { text: "آیتم 3", icon: "fa fa-file m--font-default" },
                                            { text: "آیتم 4", icon: "fa fa-file m--font-danger" },
                                            { text: "آیتم 5", icon: "fa fa-file m--font-info" },
                                        ],
                                    },
                                ],
                            },
                            "دیگر انتخاب همه",
                        ],
                    },
                    types: { default: { icon: "fa fa-folder m--font-brand" }, file: { icon: "fa fa-file  m--font-brand" } },
                    state: { key: "demo2" },
                    plugins: ["contextmenu", "state", "types"],
                }),
                $("#m_tree_5").jstree({
                    core: {
                        themes: { responsive: !1 },
                        check_callback: !0,
                        data: [
                            {
                                text: " انتخاب همه",
                                children: [
                                    { text: "انتخاب شده", state: { selected: !0 } },
                                    { text: "آیکون سفارشی", icon: "fa fa-warning m--font-danger" },
                                    { text: "باز", icon: "fa fa-folder m--font-success", state: { opened: !0 }, children: [{ text: "دیگر گره ها", icon: "fa fa-file m--font-waring" }] },
                                    { text: "دیگر آیکون سفارشی", icon: "fa fa-warning m--font-waring" },
                                    { text: "غیرفعال", icon: "fa fa-check m--font-success", state: { disabled: !0 } },
                                    {
                                        text: "زیر گره",
                                        icon: "fa fa-folder m--font-danger",
                                        children: [
                                            { text: "آیتم 1", icon: "fa fa-file m--font-waring" },
                                            { text: "آیتم 2", icon: "fa fa-file m--font-success" },
                                            { text: "آیتم 3", icon: "fa fa-file m--font-default" },
                                            { text: "آیتم 4", icon: "fa fa-file m--font-danger" },
                                            { text: "آیتم 5", icon: "fa fa-file m--font-info" },
                                        ],
                                    },
                                ],
                            },
                            "دیگر انتخاب همه",
                        ],
                    },
                    types: { default: { icon: "fa fa-folder m--font-success" }, file: { icon: "fa fa-file  m--font-success" } },
                    state: { key: "demo2" },
                    plugins: ["dnd", "state", "types"],
                }),
                $("#m_tree_6").jstree({
                    core: {
                        themes: { responsive: !1 },
                        check_callback: !0,
                        data: {
                            url: function (e) {
                                return "https://keenthemes.com/metronic/themes/themes/metronic/dist/preview/inc/api/jstree/ajax_data.php";
                            },
                            data: function (e) {
                                return { parent: e.id };
                            },
                        },
                    },
                    types: { default: { icon: "fa fa-folder m--font-brand" }, file: { icon: "fa fa-file  m--font-brand" } },
                    state: { key: "demo3" },
                    plugins: ["dnd", "state", "types"],
                });
        },
    };
    jQuery(document).ready(function () {
        Treeview.init();
    });

</script>
<script>
    var ActionsDemo={init:function(){$(".summernote").summernote({height:350})}};jQuery(document).ready(function(){ActionsDemo.init()});
</script>


</asp:Content>
