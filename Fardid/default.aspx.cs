using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Logics_Layer.Models;
using Logics_Layer.Customer;

namespace Fardid
{
    public partial class index : System.Web.UI.Page
    {
        private CustomerIndex_Logic Logic;
        public IndexModel Models;
        protected void Page_Load(object sender, EventArgs e)
        {
            Logic = new CustomerIndex_Logic();
            Models = Logic.GetData();
        }
    }
}