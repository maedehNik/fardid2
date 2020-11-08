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
    public class CustomerIndex_Logic : PDBC
    {
        public IndexModel GetData()
        {
            DataTable dt;
            base.Connect();
            ////Sliders
            List<PicModel> Sliders = new List<PicModel>();
            dt = base.Select("SELECT A.[PicId],[PicAddress],[PicLable] ,[PicDescription],[PicThumbnailAddress] FROM [tbl_PicUploader] as A inner join [tbl_PicUse] as B on A.PicId=B.PicId where B.PicUseAs LIKE N'Slider'");

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                var Slider = new PicModel()
                {
                    PicId = Convert.ToInt32(dt.Rows[i]["PicId"]),
                    Path = dt.Rows[i]["PicAddress"].ToString(),
                    ThumpnailPic = dt.Rows[i]["PicThumbnailAddress"].ToString(),
                    Description = dt.Rows[i]["PicDescription"].ToString(),
                    Lable = dt.Rows[i]["PicLable"].ToString()
                };
                Sliders.Add(Slider);
            }
            ////////Portfolios
            List<PortfolioModel> Portfolios = new List<PortfolioModel>();
            dt = base.Select("SELECT top 4 [P_Id],[Subject],[BackGroundPicId],(SELECT [PicThumbnailAddress] FROM [tbl_PicUploader] where PicId=[BackGroundPicId]) as BackGroundPic,[LogoPicId],(SELECT [PicThumbnailAddress] FROM [tbl_PicUploader] where PicId=[LogoPicId]) as LogoPic ,[Discription],[SEO_KeyWord],[SEO_Discription],[Show_MainPage] FROM [tbl_Portfolio] where [Show_MainPage]=1 AND [Deleted]=0");

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                var Portfolio = new PortfolioModel()
                {

                    Background_Id = Convert.ToInt32(dt.Rows[i]["BackGroundPicId"]),
                    Background_Path = dt.Rows[i]["BackGroundPic"].ToString(),
                    Discription = dt.Rows[i]["Discription"].ToString(),
                    Logo_Path = dt.Rows[i]["LogoPic"].ToString(),
                    Log_Id = Convert.ToInt32(dt.Rows[i]["LogoPicId"]),
                    PortfolioId = Convert.ToInt32(dt.Rows[i]["P_Id"]),
                    SEO_discription = dt.Rows[i]["SEO_Discription"].ToString(),
                    SEO_Keyword = dt.Rows[i]["SEO_KeyWord"].ToString(),
                    Subject = dt.Rows[i]["Subject"].ToString(),
                    Show = Convert.ToInt32(dt.Rows[i]["Show_MainPage"])
                };
                Portfolios.Add(Portfolio);
            }

            ////////Clients
            List<PicModel> Clients = new List<PicModel>();

            dt = base.Select("SELECT top 7 A.[PicId],[PicAddress],[PicThumbnailAddress] FROM [tbl_PicUploader] as A inner join [tbl_PicUse] as B on A.PicId=B.PicId where B.PicUseAs LIKE N'OurClients'");

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                var C = new PicModel()
                {
                    PicId = Convert.ToInt32(dt.Rows[i]["PicId"]),
                    Path = dt.Rows[i]["PicAddress"].ToString(),
                    ThumpnailPic = dt.Rows[i]["PicThumbnailAddress"].ToString()
                };
                Clients.Add(C);
            }

            ////////MainVideo
            MainVideoModel mainVideo = new MainVideoModel();
            ////////MainVideoLink
            dt = base.Select("SELECT [ItemValue] FROM [tbl_SiteProperties] WHERE ItemKey Like N'MainVideoLink'");
            if (dt.Rows.Count != 0)
            {
                mainVideo.VideoLink = dt.Rows[0]["ItemValue"].ToString();
            }
            else
            {
                mainVideo.VideoLink = "";
            }
            ////////MainVideoSub1
            dt = base.Select("SELECT [ItemValue] FROM [tbl_SiteProperties] WHERE ItemKey Like N'MainVideoSub1'");
            if (dt.Rows.Count != 0)
            {
                mainVideo.VideoSub1 = dt.Rows[0]["ItemValue"].ToString();
            }
            else
            {
                mainVideo.VideoSub1 = "";
            }
            /////////MainVideoSub2
            dt = base.Select("SELECT [ItemValue] FROM [tbl_SiteProperties] WHERE ItemKey Like N'MainVideoSub2'");
            if (dt.Rows.Count != 0)
            {
                mainVideo.VideoSub2 = dt.Rows[0]["ItemValue"].ToString();
            }
            else
            {
                mainVideo.VideoSub2 = "";
            }
            /////////MainVideoBackground
            dt = base.Select("SELECT A.[PicId] , B.[PicAddress] From [tbl_PicUse] AS A INNER JOIN [tbl_PicUploader]AS B ON A.PicId=B.PicId WHERE A.PicUseAs LIKE N'MainVideoBackground'");
            if (dt.Rows.Count != 0)
            {
                mainVideo.MainVideoBackground_PicId = Convert.ToInt32(dt.Rows[0]["PicId"]);
                mainVideo.MainVideoBackground_Pic = dt.Rows[0]["PicAddress"].ToString();
            }
            else
            {
                mainVideo.MainVideoBackground_PicId = 0;
                mainVideo.MainVideoBackground_Pic = "";
            }
            /////////
            ////////VideoLogo
            dt = base.Select("SELECT A.[PicId],[PicAddress],[PicThumbnailAddress] FROM [tbl_PicUploader] as A inner join [tbl_PicUse] as B on A.PicId=B.PicId where B.PicUseAs LIke N'VideoLogo'");
            if (dt.Rows.Count != 0)
            {
                mainVideo.MainVideoLogo_Pic = dt.Rows[0]["PicAddress"].ToString();
                mainVideo.MainVideoBackground_PicId = Convert.ToInt32(dt.Rows[0]["PicId"]);
            }
            else
            {
                mainVideo.MainVideoLogo_Pic = "";
                mainVideo.MainVideoBackground_PicId = 0;
            }

            base.DC();

            var model = new IndexModel()
            {
                mainVideo = mainVideo,
                Clients = Clients,
                portfolios = Portfolios,
                Sliders = Sliders
            };
            return model;
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
