using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DB_Connect;

namespace Logics_Layer.Customer
{
    public class CustomerAboutUs_Logic:PDBC
    {
        public string Get_AboutUs()
        {
            base.Connect();
            DataTable dt = base.Select("SELECT [ItemValue] FROM [tbl_SiteProperties] where [ItemKey] LIKE N'AboutUs'");
            base.DC();
            if (dt.Rows.Count != 0)
            {
                return dt.Rows[0][0].ToString();

            }
            else
            {
                return "";
            }

        }

        public string AddNewsLetter(string Email)
        {

            string s = "";
            List<ExcParameters> parss = new List<ExcParameters>();
            ExcParameters par = new ExcParameters
            {
                _KEY = "@Email",
                _VALUE = Email
            };
            parss.Add(par);
            base.Connect();

            if (base.Select("SELECT [Mail_Id] FROM [tbl_Newsletter] where [EmailAddress]=@Email", parss).Rows.Count != 0)
            {

                s = base.Script("INSERT INTO [tbl_Newsletter]([EmailAddress],[Date],[IsActive])VALUES(@Email,GETDATE(),1)", parss);
                base.DC();
                if (s == "1")
                {
                    return "Success";
                }
                else
                {
                    return "Fail";
                }
            }
            else
            {
                return "repeated";
            }
        }

    }
}
