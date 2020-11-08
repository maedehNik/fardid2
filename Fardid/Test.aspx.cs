using Logics_Layer.Other;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Logics_Layer.EmailModule;
using System.Net.Mail;

namespace Fardid
{
    public partial class Test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SendEmail sendEmail = new SendEmail("admin_fardid@fardid.co", "Fardid@Pass1234");
            int count = 0;
            string s = "";
            for(int i=0;i<100;i++)
                {
                s=sendEmail.Send_Email("Helloooo", "hi", "fatemeh.nickaeen@gmail.com");
                if(s== "Message sent")
                {
                    count++;
                }
            }


            Response.Write(count);


        //SmtpClient smtpClient = new SmtpClient("mail.fardid.co", 25);

        //smtpClient.Credentials = new System.Net.NetworkCredential("admin_fardid@fardid.co", "Fardid@Pass1234");
        //smtpClient.DeliveryMethod = SmtpDeliveryMethod.Network;

        //    MailMessage mailMessage = new MailMessage("admin_fardid@fardid.co", "fatemeh.nickaeen@gmail.com");
        //mailMessage.Subject = "Hellooo";
        //mailMessage.Body = "Helloooo";
        //    try
        //    {
        //        smtpClient.Send(mailMessage);
        //        Response.Write("Message sent");
        //    }
        //    catch (Exception ex)
        //    {
        //        Response.Write(ex.ToString());
        //    }
        }
}
}