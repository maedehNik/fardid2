using Logics_Layer.Admin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fardid.Admin_Ajax
{
    public partial class DeleteSlider : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin_Id"] != null)
            {
                SliderSetting_Logic ol = new SliderSetting_Logic();
                string id = Request["idIMG"];
                string result = ol.DeletePic_Sliders(Convert.ToInt32(id));
                if (result == "Success")
                {
                    Response.Write("با موفقیت حذف شد");
                }
                else
                {
                    Response.Write("عدم توانایی در حذف");
                }

            }
            else
            {
                Response.Write("عدم توانایی در حذف لطفا صفحه را رفرش کرده و دوباره تلاش فرمایید");

            }
        }
    }
}