using Logics_Layer.Admin;
using Logics_Layer.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fardid.Admin_Ajax
{
    public partial class UploaderGalleryItems : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Admin_Id"] != null)
            {
                var logic = new ad_LogicUploader();
                List<PicModel> model = logic.loadGallery();
                Response.Write(JsonConvert.SerializeObject(model));


            }
        }
    }
}