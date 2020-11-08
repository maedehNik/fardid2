using Logics_Layer.Admin;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fardid.Admin_Ajax
{
    public partial class DeletePortfolio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var logic = new Portfolio_Logic();
            if (Request["Id"] != null)
            {
                int Id = Convert.ToInt32(Request["Id"]);
                Response.Write(logic.DeletePortfolio(Id));
            }
        }
    }
}