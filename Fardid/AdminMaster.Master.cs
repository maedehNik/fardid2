using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fardid.Admin
{
    public partial class AdminMaster : System.Web.UI.MasterPage
    {
        public string Name;
        public string Pic;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["Admin_Id"]!=null)
            {
                Pic= Session["Admin_Pic"].ToString();
                
                Name = Session["Admin_Name"] + " " + Session["Admin_Family"];
            }
            else
            {
                Response.Redirect("/AdminLogin.aspx");
            }
        }

        
    }
}