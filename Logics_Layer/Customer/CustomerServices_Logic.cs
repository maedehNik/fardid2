using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DB_Connect;
using Logics_Layer.Models;

namespace Logics_Layer.Customer
{
    public class CustomerServices_Logic:PDBC
    {
        public ServiceModel GetService(int Id)
        {
            List<ExcParameters> parss = new List<ExcParameters>();
            ExcParameters par = new ExcParameters
            {
                _KEY = "@S_Id",
                _VALUE = Id
            };
            parss.Add(par);

            base.Connect();
            DataTable dt = base.Select("SELECT[S_Id],[Subject],[Right_Subject],[Left_PicId],(SELECT [PicThumbnailAddress] FROM [tbl_PicUploader]WHERE PicId=[Left_PicId])as [Left_Pic],[Right_PicId],(SELECT [PicThumbnailAddress] FROM [tbl_PicUploader]WHERE PicId=[Right_PicId])as [Right_Pic],[Background_PicId],(SELECT [PicAddress] FROM [tbl_PicUploader]WHERE PicId=[Background_PicId])as [Background_Pic] ,[Discription],[VideoBackGround_PicId],(SELECT [PicThumbnailAddress] FROM [tbl_PicUploader]WHERE PicId=[VideoBackGround_PicId])as [VideoBackGround_Pic],[Video_Link],[VideoSub1],[VideoSub2],[SEO_KeyWord],[SEO_Discription],[Show_Menu] FROM [tbl_Services] where S_Id=@S_Id", parss);
            base.DC();

            ServiceModel model = new ServiceModel();

            if (dt.Rows.Count != 0)
            {
                model.Background_Id = Convert.ToInt32(dt.Rows[0]["Background_PicId"]);
                model.LeftPic_Id = Convert.ToInt32(dt.Rows[0]["Left_PicId"]);
                model.RightPic_Id = Convert.ToInt32(dt.Rows[0]["Right_PicId"]);
                model.S_Id = Convert.ToInt32(dt.Rows[0]["S_Id"]);
                model.VideoBackground_Id = Convert.ToInt32(dt.Rows[0]["VideoBackGround_PicId"]);
                model.Show = Convert.ToInt32(dt.Rows[0]["Show_Menu"]);
                model.Background_Path = dt.Rows[0]["Background_Pic"].ToString();
                model.discription = dt.Rows[0]["Discription"].ToString();
                model.LeftPic_Path = dt.Rows[0]["Left_Pic"].ToString();
                model.RightPic_Path = dt.Rows[0]["Right_Pic"].ToString();
                model.RightSub = dt.Rows[0]["Right_Subject"].ToString();
                model.SEO_discription = dt.Rows[0]["SEO_Discription"].ToString();
                model.SEO_Keyword = dt.Rows[0]["SEO_KeyWord"].ToString();
                model.Subject = dt.Rows[0]["Subject"].ToString();
                model.VideoBackground_Path = dt.Rows[0]["VideoBackGround_Pic"].ToString();
                model.VideoSub1 = dt.Rows[0]["VideoSub1"].ToString();
                model.VideoSub2 = dt.Rows[0]["VideoSub2"].ToString();
                model.VideoLink = dt.Rows[0]["Video_Link"].ToString();

            }
            else
            {
                model.Background_Id = 0;
                model.LeftPic_Id = 0;
                model.RightPic_Id = 0;
                model.S_Id = 0;
                model.VideoBackground_Id = 0;
                model.Show = 0;
                model.Background_Path = "";
                model.discription = "";
                model.LeftPic_Path = "";
                model.RightPic_Path = "";
                model.RightSub = "";
                model.SEO_discription = "";
                model.SEO_Keyword = "";
                model.Subject = "";
                model.VideoBackground_Path = "";
                model.VideoSub1 = "";
                model.VideoSub2 = "";
                model.VideoLink = "";

            }
            return model;
        }

        public List<PicModel> GetClients()
        {
            List<PicModel> Models = new List<PicModel>();
            base.Connect();
            DataTable dt = base.Select("SELECT top 7 A.[PicId],[PicAddress],[PicThumbnailAddress] FROM [tbl_PicUploader] as A inner join [tbl_PicUse] as B on A.PicId=B.PicId where B.PicUseAs LIKE N'OurClients'");
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
