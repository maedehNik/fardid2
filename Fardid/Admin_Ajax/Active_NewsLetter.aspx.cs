using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Logics_Layer.Admin;

namespace Fardid.Admin_Ajax
{
    public partial class Active_NewsLetter : System.Web.UI.Page
    {
        private Newsletter_Logic Logic;
        protected void Page_Load(object sender, EventArgs e)
        {
            Logic = new Newsletter_Logic();
            if(Request["Id"]!=null)
            {
                int Id = Convert.ToInt32(Request["Id"]);
                Response.Write(Logic.ActiveMail(Id));
            }
        }
    }
}