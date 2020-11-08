using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Logics_Layer.Models;
using Logics_Layer.Admin;

namespace Fardid
{
    public partial class Admin_Newsletter : System.Web.UI.Page
    {
        private Newsletter_Logic Logic;
        public List<EmailModel> Models;
        protected void Page_Load(object sender, EventArgs e)
        {

            Logic = new Newsletter_Logic();
            Models = Logic.GetNewsletter();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            //int Id = Convert.ToInt32(s);
            //Logic.DeActiveMail(Id);
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            
            //int Id = Convert.ToInt32(s);
            //Logic.ActiveMail(Id);
        }
    }
}