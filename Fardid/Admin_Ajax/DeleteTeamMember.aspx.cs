using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Logics_Layer.Admin;
using Logics_Layer.Models;

namespace Fardid.Admin_Ajax
{
    public partial class DeleteTeamMember : System.Web.UI.Page
    {
        private OurTeam_Logic logic;
        protected void Page_Load(object sender, EventArgs e)
        {
            logic = new OurTeam_Logic();
            if (Request["Id"] != null)
            {
                int Id = Convert.ToInt32(Request["Id"]);
                Response.Write(logic.DeleteMember(Id));
            }

        }
    }
}