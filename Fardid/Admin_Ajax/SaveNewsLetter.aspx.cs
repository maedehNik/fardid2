using Logics_Layer.Admin;
using Logics_Layer.Customer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fardid.Admin_Ajax
{
    public partial class SaveNewsLetter : System.Web.UI.Page
    {
        private CustomerAboutUs_Logic Logic;
        protected void Page_Load(object sender, EventArgs e)
        {
            Logic = new CustomerAboutUs_Logic();
            if (Request["Mail"] != null)
            {
                string Mail = Request["Mail"];
                Response.Write(Logic.AddNewsLetter(Mail));
            }
        }
    }
}