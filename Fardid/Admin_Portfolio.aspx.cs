using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Logics_Layer.Admin;
using Logics_Layer.Models;

namespace Fardid
{
    public partial class Admin_Portfolio : System.Web.UI.Page
    {
        private Portfolio_Logic logic;
        public List<PortfolioListModel> Models;
        protected void Page_Load(object sender, EventArgs e)
        {
            logic = new Portfolio_Logic();
            Models = logic.GetPortfolio();
        }
    }
}