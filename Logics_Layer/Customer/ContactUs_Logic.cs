using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DB_Connect;
using Logics_Layer.Models;

namespace Logics_Layer.Customer
{
    public class ContactUs_Logic:PDBC
    {
        public string SendMessage(MessageModel model)
        {
            string s = "";
            List<ExcParameters> parss = new List<ExcParameters>();
            ExcParameters par = new ExcParameters
            {
                _KEY = "@Message",
                _VALUE = model.Message
            };
            parss.Add(par);

            par = new ExcParameters
            {
                _KEY = "@Name",
                _VALUE = model.Name
            };
            parss.Add(par);

            par = new ExcParameters
            {
                _KEY = "@Email",
                _VALUE = model.Email
            };
            parss.Add(par);

            par = new ExcParameters
            {
                _KEY = "@Subject",
                _VALUE = model.Subject
            };
            parss.Add(par);
            base.Connect();
            s += base.Script("INSERT INTO [tbl_Message]([Name],[Subject],[EmailAddress],[Date],[Message],[Answered],[Seen],[AnswerMessage])VALUES(@Name,@Subject,@Email,GETDATE(),@Message,0,0,N'')", parss);
            base.DC();

            if (s == "1")
            {
                return "Success";
            }
            else
            {
                return "fail";
            }
        }
    }
}
