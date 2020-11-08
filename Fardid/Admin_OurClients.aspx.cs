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
    public partial class Admin_OurClients : System.Web.UI.Page
    {
        private OurClients_Logic logic;
        public List<PicModel> Models;
        protected void Page_Load(object sender, EventArgs e)
        {
            logic = new OurClients_Logic();
            Models = logic.GetClients();

        }
    }
}