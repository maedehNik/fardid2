using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Logics_Layer.Customer;
using Logics_Layer.Models;

namespace Fardid
{
    public partial class AboutUs : System.Web.UI.Page
    {
        private CustomerAboutUs_Logic logic;
        public string[] AboutUs_Text;
        protected void Page_Load(object sender, EventArgs e)
        {
            logic = new CustomerAboutUs_Logic();
            AboutUs_Text = logic.Get_AboutUs().Split('*');

        }
    }
}