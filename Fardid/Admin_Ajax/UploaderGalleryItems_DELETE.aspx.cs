using Logics_Layer.Admin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fardid.Admin_Ajax
{
    public partial class UploaderGalleryItems_DELETE : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["Admin_Id"] != null)
            {
                string aa = Request["id"];
                ad_LogicUploader lu = new ad_LogicUploader();
                int res = lu.DeleteImage(aa);
                if (res == 1)
                {
                    Response.Write("عکس با موفقیت حذف شد");

                }
                else if (res == -1)
                {
                    Response.Write("عکس یافت نشد احتمالا در همین هنگام شخص دیگری آنرا حذف کرده است");

                }
                else if (res == -2)
                {
                    Response.Write("عکس با موفقیت حذف شد");
                }
                else if (res == -3)
                {
                    Response.Write("عدم توانایی در حذف تصویر با پشتیبانی تماس حاصل فرمایید");
                }
            }
        }
    }
}