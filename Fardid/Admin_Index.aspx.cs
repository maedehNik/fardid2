using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Logics_Layer;
using Logics_Layer.Admin;
using Logics_Layer.Models;

namespace Fardid
{
    public partial class Admin_Index : System.Web.UI.Page
    {
        private Master_Logic logic;
        public MasterModel model;
        protected void Page_Load(object sender, EventArgs e)
        {
            logic = new Master_Logic();
            model = logic.GetMaster();

        }
    }
}