using Logics_Layer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DB_Connect;
using System.Data;

namespace Logics_Layer.Admin
{
    public class Portfolio_Logic:PDBC
    {
        public List<PortfolioListModel> GetPortfolio()
        {
            List<PortfolioListModel> Models = new List<PortfolioListModel>();
            base.Connect();
            DataTable dt = base.Select("SELECT [P_Id],[Subject],[LogoPicId],[Deleted],B.PicAddress FROM [tbl_Portfolio] as A inner join [tbl_PicUploader] as B on A.LogoPicId=B.PicId");
            base.DC();

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                var model = new PortfolioListModel()
                {

                    P_Id = Convert.ToInt32(dt.Rows[i]["P_Id"]),
                    Deleted = Convert.ToInt32(dt.Rows[i]["Deleted"]),
                    Subject = dt.Rows[i]["Subject"].ToString(),
                    LogoPath = dt.Rows[i]["PicAddress"].ToString()
                };
                Models.Add(model);
            }

            return Models;
        }

        public string DeletePortfolio(int P_Id)
        {
            string s = "";
            List<ExcParameters> parss = new List<ExcParameters>();
            ExcParameters par = new ExcParameters
            {
                _KEY = "@P_Id",
                _VALUE = P_Id
            };
            parss.Add(par);


            base.Connect();
            s += base.Script("UPDATE [tbl_Portfolio] SET [Deleted] = 1 WHERE P_Id= @P_Id ", parss);
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
