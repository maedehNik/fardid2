<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Admin_OurTeam.aspx.cs" Inherits="Fardid.Admin_OurTeam" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder_Css" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder_Modal" runat="server">

    <div class="modal fade" id="delete-team" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">حذف از تیم</h5>
                    <div style="display: none" id="DeleteTeamDiv"></div>
                    <button type="button" class="close" data-dismiss="modal" aria-label="close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">
                    <p>
                        <span id="data-name"></span>
                        <br>
                        از تیم حذف شود؟
                    </p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">خیر</button>
                    <button type="button" class="btn btn-danger" onclick="return DeleteTeamMember()">بله</button>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="edit-team" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
            <div class="modal-content">
                <div id="ourteam-modal-edit-form">
                    <div class="modal-header">
                        <h5 class="modal-title">ویرایش</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div style="display: none" id="UpdateId"></div>
                    <div class="modal-body">
                        <div class="form-group" id="EditPicGroundGeneratedGal">
                            <img src="" id="team-edit-img" alt="" style="width: 100%;">
                        </div>
                        <div class="form-group text-center">
                            <button onclick="GotoUploader('ChangePic',1,'EditPicGroundGeneratedGal')" class="btn btn-brand btn-sm" type="button" data-target="#uploader" data-toggle="modal">انتخاب عکس</button>
                            <input id="ChangePic" hidden />
                        </div>
                        <div class="form-group">
                            <label for="team-edit-name" class="form-control-label">نام و نام خانوادگی</label>
                            <input type="text" class="form-control" name="sefs4" id="team-edit-name">
                        </div>
                        <div class="form-group">
                            <label for="team-edit-title" class="form-control-label">عنوان</label>
                            <input type="text" class="form-control" name="sefs5" id="team-edit-title">
                        </div>
                    </div>
                    <input type="type" name="name" value="" hidden id="UpdateTeamOur" />
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">بستن</button>
                        <button type="submit" class="btn btn-success" onclick="return saveUpdatesTeam()">ذخیره</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="add-team" tabindex="-1" role="dialog" aria-hidden="true">
        <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
            <div class="modal-content">
                <div id="ourteam-modal-add-form">
                    <div class="modal-header">
                        <h5 class="modal-title">افزودن</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group" id="NewPicGroundGeneratedGal">
                            <img src="" id="team-add-img" alt="" style="width: 100%;">
                        </div>
                        <div class="form-group text-center">
                            <button onclick="GotoUploader('NewPic',1,'NewPicGroundGeneratedGal')" class="btn btn-brand btn-sm" type="button" data-target="#uploader" data-toggle="modal">انتخاب عکس</button>
                            <input id="NewPic" hidden />
                        </div>
                        <div class="form-group">
                            <label for="team-edit-name" class="form-control-label">نام و نام خانوادگی</label>
                            <input type="text" class="form-control" name="sefs6" id="team-add-name">
                        </div>
                        <div class="form-group">
                            <label for="team-edit-title" class="form-control-label">عنوان</label>
                            <input type="text" class="form-control" name="sefs7" id="team-add-title">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">بستن</button>
                        <button type="submit" class="btn btn-success" onclick="return AddMember()">افزودن</button>
                    </div>
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
                            <span class="m-subheader__daterange-title tshfontsize2" style="margin-right: 2px; margin-left: 2px;">تیم ما</span>
                            <!--
                                    <i class="fa fa-chevron-left" style="transform: translateY(3px);color: #aaaeb8;"></i>
                                    <span class="m-subheader__daterange-title" style="margin-right: 2px;">نمایش همه ی پست ها</span>
                                    -->
                        </h3>
                    </span>
                </span>
                <button class="btn btn-success add-team-btn-top-res add-team-btn-form" data-toggle="modal" data-target="#add-team" style="margin-right: 15px;" onclick="return false">
                    <i class="fa fa-plus tshfa"></i>افزودن
                </button>
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
                        <div>
                            <div>
                                <img src="<%= item.Pic_Path %>" alt="" style="width: 100%;">
                            </div>
                        </div>
                        <div class="m-card-profile__details">
                            <span class="m-card-profile__name" style="margin-top: 15px;"><%=item.Name %>
                            </span>
                            <div>
                                <a class="m-card-profile__email m-link tshcurpoi"><%=item.Job %></a>
                            </div>
                            <div class="m-widget1 row">
                                <%if (item.deleted == 0)
                                    {%>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <button class="col-12 btn btn-primary edit-team-btn" data-toggle="modal" data-target="#edit-team" onclick="return Updatebtn(<%= item.T_Id %>)">
                                        <i class="fa fa-edit"></i>
                                        ویرایش
                                    </button>
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                    <button class="col-12 btn btn-danger remove-team-btn" data-toggle="modal" data-target="#delete-team" onclick="return ModalDelete(<%=item.T_Id %>)">
                                        <i class="fa fa-edit"></i>
                                        حذف
                                    </button>
                                </div>
                                <%}
                                    else
                                    { %>
                                <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8 offset-2">
                                    <button class="col-12 btn btn-danger remove-team-btn" onclick="return false">
                                        <i class="fa fa-edit"></i>
                                        حذف شده
                                    </button>
                                </div>
                                <%} %>
                            </div>
                        </div>
                    </div>

                </div>
                <!--end::Portlet-->
            </div>
            <%}
            %>
        </div>
    </div>


</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceHolder_Scripts" runat="server">
    <div class="TSHP-UploaderAndGallery"></div>
    <script src="AdminAssets/app/js/Uploader.js"></script>
    <script>
        function ModalDelete(Id) {
            $('#DeleteTeamDiv').text(Id);
            //alert("Done Active" + $('#ActiveDiv').text());
            return false;
        }

        function DeleteTeamMember() {
            Id = $('#DeleteTeamDiv').text();
            $.ajax({
                url: 'Admin_Ajax/DeleteTeamMember.aspx?Id=' + Id,
                type: "post",
                contentType: "application/json; charset=utf-8",
                success: function (response) {
                    if (response == "Success") {
                        location.reload(true);
                    }

                },
                error: function (jqXHR, textStatus, errorThrown) {
                    swal("عدم موفقیت در ارسال!", st, "error").then(function (e) {
                        console.log("1");
                    })
                    mApp.unblock(".m-page");
                }
            });

        }


        function AddMember() {

            var picId = $("#NewPic").val();
            var Name_ = $("#team-add-name").val();
            var Subjecy__ = $("#team-add-title").val();
            $.ajax({
                url: '/Admin_Ajax/AddTeamMember.aspx?picId=' + picId + '&Name=' + Name_ + '&Sub=' + Subjecy__,
                type: "post",
                contentType: "application/json; charset=utf-8",
                success: function (response) {
                   
                    if (response == "Success") {
                        //location.reload(true);
                        swal("درخواست با موفقیت ارسال شد!", status, "success").then(function (e) {
                            console.log("1");
                            location.reload(true);
                        })

                        mApp.unblock(".m-page");
                    }
                   
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    swal("عدم موفقیت در ارسال!", st, "error").then(function (e) {
                        console.log("1");
                    })
                    mApp.unblock(".m-page");
                }
            });

            return false;
        }

        function Updatebtn(Id) {

            $.ajax({
                url: 'Admin_Ajax/GetTeamMemberData.aspx?Id=' + Id,
                type: "post",
                contentType: "application/json; charset=utf-8",
                success: function (response) {
                    var obj = JSON.parse(response);
                    $("#ChangePic").val(obj.PicModel);
                    $("#UpdateId").val(obj.T_Id);
                    $("#team-edit-name").val(obj.Name);
                    $("#team-edit-title").val(obj.Job);
                    $("#team-edit-img").attr("src", obj.Pic_Path);
                    $("#UpdateTeamOur").val(obj.T_Id);
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    swal("عدم موفقیت در ارسال!", st, "error").then(function (e) {
                        console.log("1");
                    })
                    mApp.unblock(".m-page");
                }
            });
            return false;
        }
        function saveUpdatesTeam() {

            var id = $("#UpdateTeamOur").val();
            var Name_ = $("#team-edit-name").val();
            var Subjecy__ = $("#team-edit-title").val();
            var picId = $("#ChangePic").val();
            
            //mApp.block(".m-page", {
            //    overlayColor: "#2c2e3e", type: "loader", state: "success", message: "در حال بارگزاری"
            //});

            $.ajax({
                url: '/Admin_Ajax/UpdateTeamMember.aspx?picId=' + picId + '&Name=' + Name_ + '&Subject=' + Subjecy__ + '&Id=' + id,
                type: "post",
                contentType: "application/json; charset=utf-8",
                success: function (status) {
                    swal("درخواست با موفقیت ارسال شد!", status, "success").then(function (e) {
                        console.log("1");
                        location.reload(true);
                    })

                    mApp.unblock(".m-page");

                },
                processData: false,
                contentType: false,
                error: function (st) {
                    swal("عدم موفقیت در ارسال!", st, "error").then(function (e) {
                        console.log("1");
                    })
                    mApp.unblock(".m-page");
                }
            });
            return false;
        }
        //DEBUG SHAVAD
    </script>


</asp:Content>
