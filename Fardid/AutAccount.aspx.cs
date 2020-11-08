using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fardid
{
    public partial class AutAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["Admin_Id"] = null;
            Session["Admin_Name"] = null;
            Session["Admin_Family"] = null;
            Session["Admin_Email"] = null;
            Session["Admin_Phone"] = null;
            Session["Admin_Pic"] = null;
            Response.Redirect("/AdminLogin.aspx");
        }
    }
}