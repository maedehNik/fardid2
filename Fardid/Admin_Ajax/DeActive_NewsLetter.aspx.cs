using Logics_Layer.Admin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fardid.Admin_Ajax
{
    public partial class DeActive_NewsLetter : System.Web.UI.Page
    {
        private Newsletter_Logic Logic;
        protected void Page_Load(object sender, EventArgs e)
        {
            Logic = new Newsletter_Logic();
            if (Request["Id"] != null)
            {
                string s = Request["Id"];
                int Id = Convert.ToInt32(s);
                Response.Write(Logic.DeActiveMail(Id));
            }
        }
    }
}