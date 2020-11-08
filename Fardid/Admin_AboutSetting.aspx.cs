using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;
using Logics_Layer.Admin;
namespace Fardid
{
    public partial class Admin_AboutSetting : System.Web.UI.Page
    {
        private AboutSetting_Logic aboutSetting_Logic;
        string res;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                aboutSetting_Logic = new AboutSetting_Logic();
                TextBox1.Text = aboutSetting_Logic.Get_AboutUs();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string ss = res;
            aboutSetting_Logic = new AboutSetting_Logic();
            string s= aboutSetting_Logic.Update_AboutUs(TextBox1.Text);
           // Response.Write("<script>alert('"+s+"')</script>");
        }

        
    }
}