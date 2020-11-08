using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DB_Connect;

namespace Logics_Layer.Admin
{
    public class AboutSetting_Logic:PDBC
    {
 
        public string Get_AboutUs()
        {
            base.Connect();
            DataTable dt = base.Select("SELECT [ItemValue] FROM [tbl_SiteProperties] where [ItemKey] LIKE N'AboutUs'");
            base.DC();
            if(dt.Rows.Count!=0)
            {
                return dt.Rows[0][0].ToString();

            }else
            {
                return "";
            }

        }

        public string Update_AboutUs(string Text)
        {
            string s = "";
            base.Connect();
           
            if (base.Select("SELECT [ItemValue] FROM [tbl_SiteProperties] where [ItemKey] LIKE N'AboutUs'").Rows.Count != 0)
            {
                List<ExcParameters> parss = new List<ExcParameters>();
                ExcParameters par = new ExcParameters {
                    _KEY = "@Text_A",
                    _VALUE = Text };
                parss.Add(par);
                s = base.Script("UPDATE [tbl_SiteProperties] SET [ItemValue] = @Text_A WHERE [ItemKey] LIKE N'AboutUs'", parss);
                base.DC();
            }
            else
            {
                List<ExcParameters> parss = new List<ExcParameters>();
                ExcParameters par = new ExcParameters
                {
                    _KEY = "@Text_A",
                    _VALUE = Text
                };
                parss.Add(par);
                s = base.Script("INSERT INTO [tbl_SiteProperties]([ItemKey],[ItemValue]) VALUES (N'AboutUs',@Text_A)", parss);
                base.DC();
            }

            if(s=="1")
            {
                return "Success";
            }else
            {
                return "Fail";
            }
        }

    }
}
