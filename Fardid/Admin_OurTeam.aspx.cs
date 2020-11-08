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
    public partial class Admin_OurTeam : System.Web.UI.Page
    {
        private OurTeam_Logic logic;
        public List<OurTeamModel> Models;
        protected void Page_Load(object sender, EventArgs e)
        {
            logic = new OurTeam_Logic();
            Models = logic.GetTeam();

        }
    }
}