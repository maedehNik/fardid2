using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DB_Connect;
using Logics_Layer.Admin;
using Logics_Layer.Models;

namespace Logics_Layer.Customer
{
    public class CustomerMaster_Logic : PDBC
    {
        public CustomerMasterModel GetData()
        {
            var model = new CustomerMasterModel();

            var Texts = new MainSetting_Logic();
            model.SiteTexts = Texts.GetMainSetting();
            var Pics = new PicsSetting_Logic();
            model.SitePics = Pics.GetPicsSetting();

            ///////////
            List<KeyValueModel> ServiceModels = new List<KeyValueModel>();
            base.Connect();
            DataTable dt = base.Select("SELECT top 4  [S_Id],[Subject] FROM [tbl_Services] WHERE [Deleted]=0 AND [Show_Menu]=1 AND [Active]=1");
            base.DC();

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                var m = new KeyValueModel()
                {
                    Key = Convert.ToInt32(dt.Rows[i]["S_Id"]),
                    Value = dt.Rows[i]["Subject"].ToString()
                };
                ServiceModels.Add(m);
            }
            model.ServiceList = ServiceModels;
       

            return model;
        }
    }
}
