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
    public partial class portfolio : System.Web.UI.Page
    {
        private Customer_Portfolio_Logic Logic;
        public List<PortfolioModel> Models;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            Logic = new Customer_Portfolio_Logic();
            Models = Logic.GetPortfolios();
        }
    }
}