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
    public class SliderSetting_Logic : PDBC
    {
        public List<PicModel> GetSliders()
        {
            List<PicModel> Models = new List<PicModel>();
            base.Connect();
            DataTable dt = base.Select("SELECT A.[PicId],[PicAddress],[PicThumbnailAddress] FROM [tbl_PicUploader] as A inner join [tbl_PicUse] as B on A.PicId=B.PicId where B.PicUseAs LIKE N'Slider'");
            base.DC();

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                var model = new PicModel()
                {
                    PicId = Convert.ToInt32(dt.Rows[i]["PicId"]),
                    Path = dt.Rows[i]["PicAddress"].ToString(),
                    ThumpnailPic = dt.Rows[i]["PicThumbnailAddress"].ToString()
                };
                Models.Add(model);
            }

            return Models;
        }

        public string DeletePic_Sliders(int PicId)
        {
            string s = "";
            List<ExcParameters> parss = new List<ExcParameters>();
            ExcParameters par = new ExcParameters
            {
                _KEY = "@P_Id",
                _VALUE = PicId
            };
            parss.Add(par);

            base.Connect();
            DataTable dt = base.Select("SELECT [PicId] ,[PicUseAs] FROM [tbl_PicUse] where PicId=@P_Id AND PicUseAs LIKE N'Slider'", parss);
            if (dt.Rows.Count != 0)
            {
                s += base.Script("DELETE FROM [tbl_PicUse] WHERE PicId=@P_Id AND PicUseAs LIKE N'Slider'", parss);
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

        public string AddPic_Sliders(List<int> PicId)
        {
            string s = "";
            List<ExcParameters> parss;
            ExcParameters par;

            base.Connect();
            DataTable dt;

            for (int i = 0; i < PicId.Count; i++)
            {
                parss = new List<ExcParameters>();
                par = new ExcParameters
                {
                    _KEY = "@P_Id",
                    _VALUE = PicId[i]
                };
                parss.Add(par);
                dt = base.Select("SELECT [PicId] ,[PicUseAs] FROM [tbl_PicUse] where PicId=@P_Id AND PicUseAs LIKE N'Slider'", parss);

                if (dt.Rows.Count == 0)
                {
                    s += base.Script("INSERT INTO [tbl_PicUse] ([PicId],[PicUseAs]) VALUES(@P_Id,N'Slider')", parss);
                }
            }

            base.DC();

            return "Success";
        }

    }
}
