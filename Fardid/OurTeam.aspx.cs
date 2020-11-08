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
    public partial class OurTeam : System.Web.UI.Page
    {
        private CustomerOurTeam_Logic logic;
        public List<OurTeamModel> OurTeams;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            logic = new CustomerOurTeam_Logic();
            OurTeams = logic.GetTeam();
        }

        
       
    }
}