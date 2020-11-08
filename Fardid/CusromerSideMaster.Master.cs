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
    public partial class CusromerSideMaster : System.Web.UI.MasterPage
    {
        private CustomerMaster_Logic logic;
        public CustomerMasterModel MasterModels;
        protected void Page_Load(object sender, EventArgs e)
        {
            logic = new CustomerMaster_Logic();
            MasterModels = logic.GetData();
        }
    }
}