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
    public partial class Admin_Services : System.Web.UI.Page
    {
        private ServiceList_Logic logic;
        public List<ServiceListModel> Models;
        protected void Page_Load(object sender, EventArgs e)
        {
            logic = new ServiceList_Logic();
            Models = logic.GetService();
        }
    }
}