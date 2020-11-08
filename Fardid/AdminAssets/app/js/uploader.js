//{START} -- Configuration
var RouteURLS = {
    'UploadImageURL': '/Admin_Ajax/fileUploader.ashx',
    'DeleteImage': '/Admin_Ajax/UploaderGalleryItems_DELETE.aspx',
    'EditImage': '/Admin_Ajax/UploaderGalleryItems_EDIT.aspx',
    'LoadGalleryItems': '/Admin_Ajax/UploaderGalleryItems.aspx'
}


//{END} -- Configuration

jQuery(document).ready(function () {
    mApp.block(".m-page", {
        overlayColor: "#2c2e3e", type: "loader", state: "success", message: "در حال بارگزاری"
    });
    if ($(".TSHP-UploaderAndGallery").length > 0) {
        var Galhtml = '<div class="modal fade p-0" id="uploader" tabindex="-1" role="dialog" aria-hidden="true"><div class="modal-dialog modal-dialog-centered tshuploader-dialog" role="document"><div class="modal-content tshuploader-content"><div class="modal-header"><input id="MasterSelectorImageByID" style="display: none;" /><input id="MasterSelectorImageByIDHowMuchCANSELECT" style="display: none;" /><input id="AllimageSelected" style="display: none;" /><input id="WhichTopass" style="display: none;" /><input id="ChangeAndGeneratefunc" style="display: none;" /><input id="Checkgarbrage" style="display: none;" /><h5 class="modal-title col-12"><ul class="uploader-header col-12"><li class="row"><li class="col-6"><span class="active-upload upload-btn"><i class="fa fa-upload"></i>                                    آپلود</span></li><li class="col-5"><span class="gal-btn"><i class="fa fa-images"></i>                                    گالری</span></li><li class="col-1"><span class="relogal-btn"><i class="fa fa-circle-notch"></i>                                    تازه سازی گالری</span></li></ul></h5><button type="button" class="close" data-dismiss="modal" aria-label="close" style="position: absolute; left: 15px; top: 25px;"><span aria-hidden="true">×</span></button></div><div class="modal-body" id="UploaderModalBody" style="overflow-y: auto; overflow-x: hidden;"><div class="upload-fields col-12"><div class="container-fluid"><div class="row"><div class="form-group m-form__group col-lg-4" style="padding: 0;"><div class="col-lg-12"><label class="form-control-label">نام عکس:</label><input id="inpUploaderNAME" type="text" class="form-control m-input picname" placeholder="" value=""></div></div><div class="form-group m-form__group col-lg-4" style="padding: 0;"><div class="col-lg-12"><label class="form-control-label">لیبل:</label><input id="inpUploaderLBL" type="text" class="form-control m-input piclabel" placeholder="" value=""></div></div><div class="form-group m-form__group col-lg-4" style="padding: 0;"><div class="col-lg-12"><label class="form-control-label">توضیح مختصر:</label><input id="inpUploaderDESC" type="text" class="form-control m-input picdesc" placeholder="" value=""></div></div></div></div></div><div class="upload-div col-12"><div class="col-12 dropzone-uploader"><div class="m-dropzone dropzone" id="m-dropzone-one"><div class="m-dropzone__msg dz-message f"><h3 class="m-dropzone__msg-title">فایل را اینجا انتخاب کنید</h3><span class="m-dropzone__msg-desc">فقط امکان انتخاب یک فایل وجود دارد</span><br /><input type="file" class="form-control m-input" accept="image/gif, image/jpeg"  id="f_UploadImage"></div></div></div></div>			<div class="gal-div col-12" style="display: none; height: 100%;"><div class="row" style="height: 100%;"><div class="col-lg-12 upload-right"><div class="gal-img col-lg-12" style="padding: 0; float: right"><h3 class="gal-h3 h3-active"><i class="fa fa-images"></i>                                        عکس</h3><div class="inner-gal gal-Items" id="GALITEMAS"></div></div></div><div class="col-lg-3 upload-left" id="UPLEFTY" style="display: none;"><div class="col-12"><img src="AdminAssets/demo/default/media/img/misc/preservation-copy.jpg" class="left-img" alt=""></div><div class="mt-3"><div class="form-group m-form__group col-12" style="padding: 0;"><div class="col-lg-12"><label class="form-control-label">نام عکس:</label><input type="text" id="inpimgGalName" class="form-control m-input picname picinps" disabled="disabled" placeholder="" value=""></div></div><div class="form-group m-form__group col-12" style="padding: 0;"><div class="col-lg-12"><label class="form-control-label">لیبل:</label><input id="inpimgGallable" type="text" class="form-control m-input piclabel picinps" disabled="disabled" placeholder="" value=""></div></div><div class="form-group m-form__group col-12" style="padding: 0;"><div class="col-lg-12"><label class="form-control-label">توضیح مختصر:</label><input id="inpimgGaldesc" type="text" class="form-control m-input picdesc picinps" disabled="disabled" placeholder="" value=""><input id="SelectedImage" style="display:none ;"></div></div><div class="form-group m-form__group col-12 btn-uploader"><button class="btn btn-brand ubtn1"><i class="fa fa-edit"></i>                                            ویرایش</button><button class="btn btn-danger ubtn2 deleteimgbtn" data-target="#deleteimg" data-toggle="modal" data-name="نام عکس"><i class="fa fa-trash"></i>                                            حذف</button><button class="btn btn-success ubtn3" style="display: none"><i class="fa fa-save"></i>                                            ذخیره</button><button class="btn btn-warning ubtn4" style="display: none"><i class="fa fa-times"></i>                                            انصراف</button></div></div></div><div class="modal fade" id="deleteimg" tabindex="-1" role="dialog" aria-hidden="true" style="background-color: rgba(0,0,0,.4);"><div class="modal-dialog modal-dialog-centered" role="document"><div class="modal-content"><div class="modal-header"><h5 class="modal-title">پاک کردن عکس</h5><button type="button" class="close" onclick="closeDI();" aria-label="close"><span aria-hidden="true">×</span></button></div><div class="modal-body"><p>                                                عکس<span id="data-name"></span>                                                پاک شود؟</p></div><input id="IdforDeleteIMG" style="display: none;" /><div class="modal-footer"><button type="button" class="btn btn-secondary" onclick="closeDI();">خیر</button><button type="button" class="btn btn-danger btnDELETEIMGS">بله</button></div></div></div></div></div></div></div><div class="modal-footer"><button type="button" class="btn btn-warning" data-dismiss="modal">انصراف</button><button type="button" class="btn btn-success select-uploader" style="display: none">انتخاب</button><button type="button" class="btn btn-success CompleteUpload" >آپلود</button></div></div></div></div>';
        $(".TSHP-UploaderAndGallery").html(Galhtml);
        $(".deleteimgbtn").on("click", function (e) {
            var data = $(this).data('name');
            $("#IdforDeleteIMG").val($("#SelectedImage").val());
            $('#deleteimg').find('#data-name').text(data);
            $('#deleteimg').modal('show');

            return false;
        })
        $(".CompleteUpload").on("click", function (e) {
            if ($("#inpUploaderDESC").val().length == 0) {
                swal("عدم رعایت قوانین ارسال", "پرکردن توضیحات اجباریست", "error").then(function (e) {
                    console.log(1);
                })
                return false;
            }
            if ($("#inpUploaderLBL").val().length == 0) {
                swal("عدم رعایت قوانین ارسال", "پرکردن برچسب اجباریست", "error").then(function (e) {
                    console.log(1);
                })
                return false;
            }
            if ($('#f_UploadImage')[0].files[0].length == 0) {
                swal("عدم رعایت قوانین ارسال", "انتخاب عکس اجباریست", "error").then(function (e) {
                    console.log(1);
                })
                return false;
            }
            if ($("#inpUploaderNAME").val().length == 0) {
                swal("عدم رعایت قوانین ارسال", "پرکردن نام اجباریست", "error").then(function (e) {
                    console.log(1);
                })
                return false;
            }
            mApp.block("#UploaderModalBody", {
                overlayColor: "#2c2e3e", type: "loader", state: "success", message: "در حال بارگزاری"
            });
            var formData = new FormData();
            formData.append('file', $('#f_UploadImage')[0].files[0]);
            formData.append('name', $('#inpUploaderNAME').val());
            formData.append('lable', $('#inpUploaderLBL').val());
            formData.append('desc', $('#inpUploaderDESC').val());
            $.ajax({
                type: 'post',
                url: RouteURLS.UploadImageURL,
                data: formData,
                success: function (status) {
                    swal("درخواست با موفقیت ارسال شد!", status, "success").then(function (e) {
                        console.log("1");
                    })
                    $(".relogal-btn").click();
                    $('#inpUploaderNAME').val('');
                    $('#inpUploaderLBL').val('');
                    $('#inpUploaderDESC').val('');
                    $('#f_UploadImage').val('');
                    mApp.unblock("#UploaderModalBody");
                },
                processData: false,
                contentType: false,
                error: function (st) {
                    swal("درخواست با موفقیت ارسال شد!", st, "error").then(function (e) {
                        console.log("1");
                    })
                    mApp.unblock("#UploaderModalBody");
                }
            });

            return false;
        })
        $(".btnDELETEIMGS").on("click", function (e) {
            var data = $("#IdforDeleteIMG").val();
            mApp.block("#UPLEFTY", {
                overlayColor: "#2c2e3e", type: "loader", state: "success", message: "در حال بارگزاری"
            });
            $.ajax({
                url: RouteURLS.DeleteImage,
                data: { 'id': data },
                type: 'GET',
                cache: false,
                success: function (data) {
                    mApp.unblock("#UPLEFTY");
                    try {
                        swal("درخواست با موفقیت ارسال شد!", data, "success").then(function (e) {
                            mApp.block("#GALITEMAS", {
                                overlayColor: "#2c2e3e", type: "loader", state: "success", message: "در حال بارگزاری"
                            });
                            LoadGallery();
                            swal("درخواست با موفقیت ارسال شد!", "گالری با موفقیت تازه سازی شد", "success").then(function (e) {
                                console.log("1");
                            })
                            mApp.unblock("#GALITEMAS");
                            $('#deleteimg').modal('hide');
                        })
                    } catch{

                        swal("درخواست با موفقیت ارسال شد!", "درخواست با موفقیت ارسال شد!", "success").then(function (e) {
                            mApp.block("#GALITEMAS", {
                                overlayColor: "#2c2e3e", type: "loader", state: "success", message: "در حال بارگزاری"
                            });
                            swal("درخواست با موفقیت ارسال شد!", "گالری با موفقیت تازه سازی شد", "success").then(function (e) {
                                console.log("1");
                            })
                            mApp.unblock("#GALITEMAS");
                            $('#deleteimg').modal('hide');
                        })
                        mApp.block("#GALITEMAS", {
                            overlayColor: "#2c2e3e", type: "loader", state: "success", message: "در حال بارگزاری"
                        });
                        LoadGallery();
                        mApp.unblock("#GALITEMAS");
                    }

                },
                error: function () {
                    mApp.unblock("#UPLEFTY");

                    try {

                        swal("متاسفانه در ارسال درخواست مشکلی بوجود آمده", data.Errormessage, "error").then(function (e) {
                        })
                    } catch{
                        alert("متاسفانه در ارسال درخواست مشکلی بوجود آمده");
                    }
                }
            });
            return false;
        })



        $(".gal-btn").on("click", function () {
            $(".uploader-header li span").removeClass("active-upload");
            $(this).addClass("active-upload")
            $(".upload-div").hide();
            $(".gal-div").show();
            $(".select-uploader").show();
            $(".upload-fields").hide();
            $(".upload-btn-footer").hide();
            $(".CompleteUpload").hide();
        })
        $(".upload-btn").on("click", function () {
            $(".uploader-header li span").removeClass("active-upload");
            $(this).addClass("active-upload")
            $(".upload-div").show();
            $(".gal-div").hide();
            $(".select-uploader").hide();
            $(".upload-fields").show();
            $(".upload-btn-footer").show();
            $(".CompleteUpload").show();
        })
        $(".gal-h3").on("click", function () {
            $(".gal-h3").removeClass("h3-active");
            $(this).addClass("h3-active")
            $(".gal-h3").next().not($(this).next()).slideUp();
            if ($(this).next().css("display") == 'block') {
                $(this).next().slideUp();
                $(this).removeClass("h3-active");
            } else {
                $(this).next().slideDown();
            }
        })
        $(".ubtn1").on("click", function () {
            $(".ubtn1").hide();
            $(".ubtn2").hide();
            $(".ubtn3").show();
            $(".ubtn4").show();
            $(".picinps").removeAttr("disabled");
            return false;
        })
        $(".ubtn3").on("click", function () {
            $(".ubtn1").show();
            $(".ubtn2").show();
            $(".ubtn3").hide();
            $(".ubtn4").hide();
            mApp.block("#UPLEFTY", {
                overlayColor: "#2c2e3e", type: "loader", state: "success", message: "در حال بارگزاری"
            });
            $.ajax({
                url: RouteURLS.EditImage,
                data: {
                    'id': $("#SelectedImage").val(),
                    'name': $("#inpimgGalName").val(),
                    'lable': $("#inpimgGallable").val(),
                    'desc': $("#inpimgGaldesc").val(),
                },
                type: 'GET',
                cache: false,
                success: function (data) {
                    mApp.unblock("#UPLEFTY");
                    try {
                        swal("درخواست با موفقیت ارسال شد!", data, "success").then(function (e) {
                            mApp.block("#GALITEMAS", {
                                overlayColor: "#2c2e3e", type: "loader", state: "success", message: "در حال بارگزاری"
                            });
                            LoadGallery();
                            mApp.unblock("#GALITEMAS");
                            swal("درخواست با موفقیت ارسال شد!", "گالری با موفقیت تازه سازی شد", "success").then(function (e) {
                                console.log("1");
                            })
                        })
                    } catch{
                        alert("درخواست با موفقیت ارسال شد!");
                        mApp.block("#GALITEMAS", {
                            overlayColor: "#2c2e3e", type: "loader", state: "success", message: "در حال بارگزاری"
                        });
                        LoadGallery();

                        mApp.unblock("#GALITEMAS");
                        swal("درخواست با موفقیت ارسال شد!", "گالری با موفقیت تازه سازی شد", "success").then(function (e) {
                            console.log("1");
                        })
                    }

                },
                error: function (data) {
                    mApp.unblock("#UPLEFTY");
                    var __AA = 0;
                    swal("درخواست با موفقیت ارسال شد!", data, "success").then(function (e) {
                        __AA = 1;
                    })

                }
            });
            $(".picinps").attr("disabled", "disabled");
            return false;
        })
        $(".ubtn4").on("click", function () {
            $(".ubtn1").show();
            $(".ubtn2").show();
            $(".ubtn3").hide();
            $(".ubtn4").hide();
            $(".picinps").attr("disabled", "disabled");
            return false;
        })
        $(".uimg").on("click", function () {
            console.log($(".upload-left").attr('style'));

            $(this).prev().find("input").click();
            $(".upload-left .img-border").removeClass("no-border");
            $(".upload-left div video").hide();
            $(".show-file").hide();
            $(".upload-left div img").show();
            $(".uimg").parent().removeClass("active-border");
            $(".uvideo").parent().removeClass("active-border");
            $(".ufile").removeClass("active-border");
            $(this).parent().addClass("active-border");
            setTimeout(function () {
                $(".upload-left").addClass("upload-left-active");

            }, 500)
            $(".upload-left").show(100);
            $(".upload-right").removeClass("col-lg-12");
            $(".upload-right").addClass("col-lg-9");
            var picsrc = $(this).attr("src");
            var picname = $(this).data('name');
            var piclabel = $(this).data('label');
            var picdesc = $(this).data('desc');
            $(".left-img").attr("src", picsrc);
            $(".picname").val(picname);
            $(".piclabel").val(piclabel);
            $(".picdesc").val(picdesc);
            $(".deleteimgbtn").data('name', picname)

        })
        $(".uimg-2").on("click", function () {
            $(this).find("input").click();
        })
        $(".uvideo").on("click", function () {
            $(".upload-left .img-border").removeClass("no-border");
            $(".upload-left div img").hide();
            $(".show-file").hide();
            $(".upload-left div video").show();
            $(".uimg").parent().removeClass("active-border");
            $(".uvideo").parent().removeClass("active-border");
            $(".ufile").removeClass("active-border");
            $(this).parent().addClass("active-border");
            setTimeout(function () {
                $(".upload-left").addClass("upload-left-active");
            }, 500)
            $(".upload-right").removeClass("col-lg-12");
            $(".upload-right").addClass("col-lg-9");
            var picsrc = $(this).attr("src");
            var picname = $(this).data('name');
            var piclabel = $(this).data('label');
            var picdesc = $(this).data('desc');
            var picurl = $(this).data('url');
            $(".left-img").attr("src", picsrc);
            $(".picname").val(picname);
            $(".piclabel").val(piclabel);
            $(".picdesc").val(picdesc);
            $(".upload-left div video source").attr("src", picurl);
            $(".deleteimgbtn").data('name', picname)
        })
        $(".ufile").on("click", function () {
            $(".upload-left .img-border").addClass("no-border");
            $(".upload-left div img").hide();
            $(".show-file").show();
            $(".upload-left div video").hide();
            $(".ufile").removeClass("active-border");
            $(".uvideo").parent().removeClass("active-border");
            $(".uimg").parent().removeClass("active-border");
            $(this).addClass("active-border");
            setTimeout(function () {
                $(".upload-left").addClass("upload-left-active");
            }, 500)
            $(".upload-right").removeClass("col-lg-12");
            $(".upload-right").addClass("col-lg-9");
            var picsrc = $(this).attr("src");
            var picname = $(this).data('name');
            var piclabel = $(this).data('label');
            var picdesc = $(this).data('desc');
            var picurl = $(this).data('url');
            $(".left-img").attr("src", picsrc);
            $(".picname").val(picname);
            $(".piclabel").val(piclabel);
            $(".picdesc").val(picdesc);
            $(".upload-left div video source").attr("src", picurl);
            $(".deleteimgbtn").data('name', picname)
        })
        $(".delete-selected-pic").on("click", function () {
            var AA = $(this).attr("DELETEFROM");
            $(this).parent().parent().remove();
        })
    }
    if ($("#UploaderModalBody").length > 0) {
        LoadGallery();
        $(".relogal-btn").on("click", function () {
            mApp.block("#GALITEMAS", {
                overlayColor: "#2c2e3e", type: "loader", state: "success", message: "در حال بارگزاری"
            });
            LoadGallery();
            mApp.unblock("#GALITEMAS");
            $(".gal-btn").click();
            swal("درخواست با موفقیت ارسال شد!", "گالری با موفقیت تازه سازی شد", "success").then(function (e) {
                console.log("1");
            })
        });
        $(".select-uploader").on("click", function () {
            $("#" + $("#WhichTopass").val()).val($("#AllimageSelected").val());
            $('#uploader').modal('toggle');
            ChangeAndGenerate($("#ChangeAndGeneratefunc").val(), $("#WhichTopass").val())
            return false;
        });
    }
    mApp.unblock(".m-page");

});
function CanSelect() {

    var obj = {
        'HowMuchcanSelect': parseInt($("#MasterSelectorImageByIDHowMuchCANSELECT").val()),
        'CanSelect': true
    };
    if (obj.HowMuchcanSelect != -1) {

        if (CountOfSelecteds() > obj.HowMuchcanSelect) {
            obj.CanSelect = false;
        } else {
            obj.CanSelect = true;

        }
    } else {
        return true;
    }


    return obj;
}
function CountOfSelecteds() {
    var counts = 0;


    $(".CKHEDs:checkbox:checked").each(function () {
        counts++;
    });


    return counts;
}
function GenerateGalItems(data) {
    var htmlcode = '';
    for (var _IK = 0; _IK < data.length; _IK++) {
        htmlcode += '<div class="col-lg-3">  <div style="position: relative;" class="active-border">  <label class="m-checkbox m-checkbox--bold m-checkbox--state-brand" style="position: absolute;right: -8px;top: -10px;z-index: 999;">  <input type="checkbox"class="CKHEDs" id="img-' + data[_IK].PicId + '" >  <span style="background-color: white!important;"class=""></span>  </label>  <img src="' +
            data[_IK].Path
            + '" class="uimg" data-name="' +
            data[_IK].Name
            + '" data-label="' +
            data[_IK].Lable
            + '" data-desc="' +
            data[_IK].Description
            + '" imgid="' +
            data[_IK].PicId
            + '"  alt="" id="IGAL-' + data[_IK].PicId + '"> </div> </div>';
    }
    return htmlcode;

}
function LoadGallery() {
    $(".gal-Items").html("");
    $.ajax({
        url: RouteURLS.LoadGalleryItems,
        data: { 'AGET': "SALAM" },
        type: 'GET',
        cache: false,
        success: function (data) {
            var Galimages = jQuery.parseJSON(data);
            $(".gal-Items").html(GenerateGalItems(Galimages));
            $(".uimg").on("click", function () {
                $(this).prev().find("input").click();
                $(".upload-left .img-border").removeClass("no-border");
                $(".upload-left div video").hide();
                $(".show-file").hide();
                $(".upload-left div img").show();
                $(".uimg").parent().removeClass("active-border");
                $(".uvideo").parent().removeClass("active-border");
                $(".ufile").removeClass("active-border");
                $(this).parent().addClass("active-border");
                setTimeout(function () {
                    $(".upload-left").addClass("upload-left-active");
                    $(".upload-left").show();

                }, 500)
                $(".upload-right").removeClass("col-lg-12");
                $(".upload-right").addClass("col-lg-9");
                var picsrc = $(this).attr("src");
                var picname = $(this).data('name');
                var piclabel = $(this).data('label');
                var picdesc = $(this).data('desc');
                $(".left-img").attr("src", picsrc);
                $(".picname").val(picname);
                $(".piclabel").val(piclabel);
                $(".picdesc").val(picdesc);
                $(".deleteimgbtn").data('name', picname)
                $("#SelectedImage").val($(this).attr("imgid"));

            })
            $(".CKHEDs").on("click", function () {
                var allcheckdimg = [];
                $(".CKHEDs:checkbox:checked").each(function () {
                    if (CanSelect().CanSelect) {
                        allcheckdimg = [];
                        $(".CKHEDs:checkbox:checked").each(function () {

                            var idselected = $(this).attr("id").replace('img-', '');
                            const ImgsSelectedjson = {
                                'idOfImg': $(this).attr("id").replace('img-', ''),
                                'imgsrc': $("#IGAL-" + $(this).attr("id").replace('img-', '')).attr("src"),
                                'imgname': $("#IGAL-" + $(this).attr("id").replace('img-', '')).data('name'),
                                'imgdes': $("#IGAL-" + $(this).attr("id").replace('img-', '')).data('desc'),
                                'imglable': $("#IGAL-" + $(this).attr("id").replace('img-', '')).data('label'),
                                'DeleteToken': 'getterinput-' + $(this).attr("id").replace('img-', '')
                            };
                            allcheckdimg.push(ImgsSelectedjson);

                        });


                    } else {
                        swal("خطا", "عدم توانایی در انتخاب (بیش از " + CanSelect().HowMuchcanSelect + " آیتم نمیتوانید انتخاب کنید!)", "error").then(function (e) {
                            console.log('1');
                        })
                        $('#' + $(this).attr('id')).prop('checked', false);
                    }
                });
                $("#AllimageSelected").val(JSON.stringify(allcheckdimg));
                $("#MasterSelectorImageByID").val($("#AllimageSelected").val());
                //}
            });

            SelectSelectedImgs();
        },
        error: function () {
        }
    });
}
function GotoUploader(SelectorInpid, SelectedCount, AfterSelectGeerateDiv) {
    //var Galimages = jQuery.parseJSON(data);
    $("#MasterSelectorImageByID").val($("#" + SelectorInpid).val());
    $("#AllimageSelected").val($("#" + SelectorInpid).val());
    SelectSelectedImgs();
    $("#WhichTopass").val(SelectorInpid);
    $("#MasterSelectorImageByIDHowMuchCANSELECT").val(SelectedCount);
    $("#ChangeAndGeneratefunc").val(AfterSelectGeerateDiv);
    return false;
}
function SelectSelectedImgs() {
    $("#Checkgarbrage").val($("#MasterSelectorImageByID").val());

    if ($("#Checkgarbrage").val().length > 0) {
        var ImgsforSlider = JSON.parse($("#Checkgarbrage").val());

        for (var t = 0; t < ImgsforSlider.length; t++) {
            $("#img-" + ImgsforSlider[t].idOfImg).click();
        }

    }
    $("#Checkgarbrage").val("");

}
function ChangeAndGenerate(DivID, getterinput) {

    //<div class="col-12 selected-img-div" style="margin-top: 0;">
    //    <div class="selected-pic" style="position: relative;">
    //        <button type="button" class="btn btn-danger delete-selected-pic" style="position: absolute; right: -8px; top: -10px; z-index: 999; padding: 4px 5px;"><i class="fa fa-trash"></i></button>
    //        <img src="AdminAssets/demo/default/media/img/misc/preservation-copy.jpg" class="uimg" data-name="نام عکس" data-label="لیبل" data-desc="توضیحات" alt="">
    //                                                            </div>
    //    </div>
    var generated = '';
    var objgenerated = jQuery.parseJSON($("#" + getterinput).val());
    for (var KI = 0; KI < objgenerated.length; KI++) {
        generated += ' <div class="col-12 selected-img-div" style="margin-top: 0;">  <div class="selected-pic" style="position: relative;">  <button DELETEFROM="getterinput-' +
            objgenerated[KI].idOfImg
            + '" type="button" class="btn btn-danger delete-selected-pic" style="position: absolute; right: -8px; top: -10px; z-index: 999; padding: 4px 5px;"><i class="fa fa-trash"></i></button>  <img src="' +
            objgenerated[KI].imgsrc
            + '" class="uimg" data-name="' +
            objgenerated[KI].imgname
            + '" data-label="' +
            objgenerated[KI].imglable
            + '" data-desc="' +
            objgenerated[KI].imgdes
            + '" alt="">  </div>  </div>'
    }
    $("#" + DivID).html(generated);
    $(".delete-selected-pic").on("click", function () {
        var AA = $(this).attr("DELETEFROM");
        var objgenerated = jQuery.parseJSON($("#" + getterinput).val());
        objgenerated = objgenerated.filter(function (obj) {
            return obj.DeleteToken !== AA;
        });
        $("#" + getterinput).val(JSON.stringify(objgenerated));
        $(this).parent().parent().remove();
    })

}
