using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DB_Connect;
using Logics_Layer.Models;
using Logics_Layer.Other;

namespace Logics_Layer.Admin
{
    public class Newsletter_Logic:PDBC
    {
        public List<EmailModel> GetNewsletter()
        {
            List<EmailModel> Models = new List<EmailModel>();
            base.Connect();
            DataTable dt = base.Select("SELECT [Mail_Id],[EmailAddress],[Date],[IsActive] FROM [tbl_Newsletter]");
            base.DC();

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                var model = new EmailModel()
                {
                    Num=i+1,
                    EmailId = Convert.ToInt32(dt.Rows[i]["Mail_Id"]),
                    Active = Convert.ToInt32(dt.Rows[i]["IsActive"]),
                    Email = dt.Rows[i]["EmailAddress"].ToString(),
                    Date=Statics.DateReturner(dt.Rows[i]["Date"].ToString(), "ShortDate")
                };
                Models.Add(model);
            }

            return Models;
        }

        public string ActiveMail(int MailId)
        {
            string s = "";
            List<ExcParameters> parss = new List<ExcParameters>();
            ExcParameters par = new ExcParameters
            {
                _KEY = "@M_Id",
                _VALUE = MailId
            };
            parss.Add(par);

            base.Connect();
            DataTable dt = base.Select("SELECT [EmailAddress] FROM [tbl_Newsletter] WHERE Mail_Id= @M_Id", parss);
            if (dt.Rows.Count != 0)
            {
                s += base.Script("UPDATE [tbl_Newsletter] SET [IsActive] = 1 WHERE Mail_Id=@M_Id", parss);
            }
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

        public string DeActiveMail(int MailId)
        {
            string s = "";
            List<ExcParameters> parss = new List<ExcParameters>();
            ExcParameters par = new ExcParameters
            {
                _KEY = "@M_Id",
                _VALUE = MailId
            };
            parss.Add(par);

            base.Connect();
            DataTable dt = base.Select("SELECT [EmailAddress] FROM [tbl_Newsletter] WHERE Mail_Id= @M_Id", parss);
            if (dt.Rows.Count != 0)
            {
                s += base.Script("UPDATE [tbl_Newsletter] SET [IsActive] = 0 WHERE Mail_Id=@M_Id", parss);
            }
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
