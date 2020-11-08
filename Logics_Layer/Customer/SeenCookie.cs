using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DB_Connect;
using Logics_Layer.Other;
using MD.PersianDateTime;

namespace Logics_Layer.Customer
{
    public class SeenCookie : PDBC
    {
        public string GetSeenCookie(string Ip)
        {
            PersianDateTime persianDateTime = new PersianDateTime(DateTime.Now);
            List<ExcParameters> parss = new List<ExcParameters>();
            ExcParameters par = new ExcParameters
            {
                _KEY = "@Ip",
                _VALUE = Ip
            };
            parss.Add(par);

            par = new ExcParameters
            {
                _KEY = "@day",
                _VALUE = persianDateTime.GetDayOfYear
            };
            parss.Add(par);

            par = new ExcParameters
            {
                _KEY = "@month",
                _VALUE = persianDateTime.GetMonthEnum(persianDateTime.GetLongMonthName)
            };
            parss.Add(par);

            par = new ExcParameters
            {
                _KEY = "@year",
                _VALUE = persianDateTime.GetShortYear
            };
            parss.Add(par);

            base.Connect();
            string s = base.Script("INSERT INTO [tbl_SiteSeen] ([IpAddress],[Day],[Month],[Year]) VALUES(@Ip,@day,@month,@year)", parss);
            base.DC();
            if (s == "1")
            {
                var security = new Security();

                return security.HMACMD5Generator("{ Today Seen }");
            }
            else
            {
                return "";
            }

        }

        public bool CheckCookie(string cookie)
        {
            var security = new Security();
            if (security.HMACMD5Generator("{ Today Seen }")==cookie)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}
