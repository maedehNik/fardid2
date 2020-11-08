using Logics_Layer.EmailModule;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fardid.Admin_Ajax
{
    public partial class SendMail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SendEmail sendEmail = new SendEmail("admin_fardid@fardid.co", "Fardid@Pass1234");
            string Email = Request["Mail"];
            string Subject = Request["Subject"];
            string Body = Request["Body"];
            int count = 0;
            string s = "";
           s = sendEmail.Send_Email(Subject, Body, Email);
        
            Response.Write(s);
        }
    }
}