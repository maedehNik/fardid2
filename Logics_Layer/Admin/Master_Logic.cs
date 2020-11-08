using Logics_Layer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DB_Connect;
using MD.PersianDateTime;

namespace Logics_Layer.Admin
{
    public class Master_Logic:PDBC
    {
        public MasterModel GetMaster()
        {
            var model = new MasterModel();
            PersianDateTime persianDateTime = new PersianDateTime(DateTime.Now);
            int day = persianDateTime.Day;
            int month = persianDateTime.Month;
            int Year = persianDateTime.Year;
            List<ExcParameters> parss = new List<ExcParameters>();
            ExcParameters par = new ExcParameters
            {
                _KEY = "@day",
                _VALUE = day
            };
            parss.Add(par);

            par = new ExcParameters
            {
                _KEY = "@month",
                _VALUE = month
            };
            parss.Add(par);

            par = new ExcParameters
            {
                _KEY = "@year",
                _VALUE = Year
            };
            parss.Add(par);

            base.Connect();
            model.SeenInDay = base.Select("SELECT COUNT(*) FROM [tbl_SiteSeen] WHERE [Day] =@day AND [Month]=@month AND [Year]=@year", parss).Rows[0][0].ToString();

            model.Messages = base.Select("SELECT COUNT(*) FROM [tbl_Message] WHERE [Answered]=0").Rows[0][0].ToString();

            model.AllSeens = base.Select("SELECT COUNT(*) FROM [tbl_SiteSeen]").Rows[0][0].ToString();

            model.Newsletters=base.Select("SELECT COUNT(*) FROM [tbl_Newsletter] WHERE IsActive=1").Rows[0][0].ToString();
            model.ChartData = "";
            StringBuilder st = new StringBuilder();
            for(int i = 0; i < 30; i++)
            {
                parss = new List<ExcParameters>();
                par = new ExcParameters
                {
                    _KEY = "@month",
                    _VALUE = month
                };
                parss.Add(par);

                par = new ExcParameters
                {
                    _KEY = "@year",
                    _VALUE = Year
                };
                parss.Add(par);

                day = i + 1;
                par = new ExcParameters
                {
                    _KEY = "@day",
                    _VALUE = day
                };
                parss.Add(par);

               st.Append(base.Select("SELECT COUNT(*) FROM [tbl_SiteSeen] WHERE [Day] =@day AND [Month]=@month AND [Year]=@year", parss).Rows[0][0].ToString());

                if (i != 29)
                {
                    st.Append(",");
                }
            }
            base.DC();
            model.ChartData = st.ToString();

            model.ChartLabels = persianDateTime.MonthName + persianDateTime.Year;


            return model;
        }
    }
}
