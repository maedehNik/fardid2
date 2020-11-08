using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Logics_Layer.Admin;
namespace Fardid.Admin_Ajax
{
    public partial class SeenMessage : System.Web.UI.Page
    {
        private Messages_Logic logic;
        protected void Page_Load(object sender, EventArgs e)
        {
            logic = new Messages_Logic();
            if (Request["Id"] != null)
            {
                string s = Request["Id"];
                int Id = Convert.ToInt32(s);
                Response.Write(logic.SeenMessage(Id));
            }
        }
    }
}