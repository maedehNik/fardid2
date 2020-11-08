using MimeKit;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;
using DB_Connect;
using System.Data;

namespace Logics_Layer.EmailModule
{
    public class SendEmail
    {
        public string _EmailFrom { get; set; }
        public string _Password { get; set; }

        public SendEmail( string username, string password)
        {
            _EmailFrom = username;
            _Password = password;
        }

        public string Send_Email(string Subject,string body,string Sendto)
        {
            SmtpClient smtpClient = new SmtpClient("mail.fardid.co", 25)
            {
                Credentials = new System.Net.NetworkCredential(_EmailFrom,_Password),//"admin_fardid@fardid.co"
                //"Fardid@Pass1234"
                DeliveryMethod = SmtpDeliveryMethod.Network
            };

            MailMessage mailMessage = new MailMessage("admin_fardid@fardid.co", Sendto);
            mailMessage.Subject = Subject;
            mailMessage.Body = body;
            try
            {
                smtpClient.Send(mailMessage);
                 return "Message sent";
            }
            catch (Exception ex)
            {
                return ex.ToString();
            }
        }

        public List<string> AllMails()
        {
            var Mails = new List<string>();
            PDBC db = new PDBC();
            db.Connect();
            DataTable dt = db.Select("SELECT [EmailAddress] FROM [tbl_Newsletter] WHERE IsActive=1");
            db.DC();

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                Mails.Add(dt.Rows[i]["EmailAddress"].ToString());
            }

            return Mails;
        }
    }
}
