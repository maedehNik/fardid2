using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DB_Connect;
using Logics_Layer.Models;

namespace Logics_Layer.Admin
{
    public class ServiceList_Logic:PDBC
    {

        public List<ServiceListModel> GetService()
        {
            List<ServiceListModel> Models = new List<ServiceListModel>();
            base.Connect();
            DataTable dt = base.Select("SELECT[S_Id],[Subject],[Show_Menu],[Deleted],[Active] FROM [tbl_Services]");
            base.DC();

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                var model = new ServiceListModel()
                {
                    Num = i + 1,
                    S_Id = Convert.ToInt32(dt.Rows[i]["S_Id"]),
                    Deleted = Convert.ToInt32(dt.Rows[i]["Deleted"]),
                    Subject = dt.Rows[i]["Subject"].ToString(),
                    ShowMenu = Convert.ToInt32(dt.Rows[i]["Show_Menu"]),
                    Active = Convert.ToInt32(dt.Rows[i]["Active"])
                };
                Models.Add(model);
            }

            return Models;
        }

        public string DeleteService(int S_Id)
        {
            string s = "";
            List<ExcParameters> parss = new List<ExcParameters>();
            ExcParameters par = new ExcParameters
            {
                _KEY = "@S_Id",
                _VALUE = S_Id
            };
            parss.Add(par);


            base.Connect();
            s += base.Script("UPDATE [tbl_Services] SET [Deleted] = 1 WHERE S_Id= @S_Id ", parss);
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

        public string ActiveService(int S_Id)
        {
            string s = "";
            List<ExcParameters> parss = new List<ExcParameters>();
            ExcParameters par = new ExcParameters
            {
                _KEY = "@S_Id",
                _VALUE = S_Id
            };
            parss.Add(par);


            base.Connect();
            s += base.Script("UPDATE [tbl_Services] SET [Active] = 1 WHERE S_Id= @S_Id ", parss);
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

        public string DeActiveService(int S_Id)
        {
            string s = "";
            List<ExcParameters> parss = new List<ExcParameters>();
            ExcParameters par = new ExcParameters
            {
                _KEY = "@S_Id",
                _VALUE = S_Id
            };
            parss.Add(par);


            base.Connect();
            s += base.Script("UPDATE [tbl_Services] SET [Active] = 0 WHERE S_Id= @S_Id ", parss);
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
