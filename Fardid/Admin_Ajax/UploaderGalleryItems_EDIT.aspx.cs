using Logics_Layer.Admin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fardid.Admin_Ajax
{
    public partial class UploaderGalleryItems_EDIT : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin_Id"] != null)
            {
                string aa = Request["id"];
                string name = Request["name"];
                string lable = Request["lable"];
                string desc = Request["desc"];
                ad_LogicUploader lu = new ad_LogicUploader();
                bool res = lu.UpdateImageInformation(aa, name, lable, desc);
                if (res)
                {
                    Response.Write("عکس با موفقیت ویرایش  شد");
                }
                else
                {
                    Response.Write("عدم توانایی در ویرایش تصویر با پشتیبانی تماس حاصل فرمایید");

                }
            }
        }
    }
}