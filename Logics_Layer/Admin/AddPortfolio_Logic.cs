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
    public class AddPortfolio_Logic : PDBC
    {
        public PortfolioModel GetPortfolio(int Id)
        {
            List<ExcParameters> parss = new List<ExcParameters>();
            ExcParameters par = new ExcParameters
            {
                _KEY = "@P_Id",
                _VALUE = Id
            };
            parss.Add(par);

            base.Connect();
            DataTable dt = base.Select("SELECT [P_Id],[Subject],[BackGroundPicId],(SELECT [PicThumbnailAddress] FROM [tbl_PicUploader] where PicId=[BackGroundPicId]) as BackGroundPic,[LogoPicId],(SELECT [PicThumbnailAddress] FROM [tbl_PicUploader] where PicId=[LogoPicId]) as LogoPic ,[Discription],[SEO_KeyWord],[SEO_Discription],[Show_MainPage] FROM [tbl_Portfolio] where P_Id=@P_Id",parss);
            base.DC();

            PortfolioModel model = new PortfolioModel();

            if (dt.Rows.Count != 0)
            {
                model.Background_Id = Convert.ToInt32(dt.Rows[0]["BackGroundPicId"]);
                model.Background_Path = dt.Rows[0]["BackGroundPic"].ToString();
                model.Discription = dt.Rows[0]["Discription"].ToString();
                model.Logo_Path = dt.Rows[0]["LogoPic"].ToString();
                model.Log_Id = Convert.ToInt32(dt.Rows[0]["LogoPicId"]);
                model.PortfolioId = Convert.ToInt32(dt.Rows[0]["P_Id"]);
                model.SEO_discription = dt.Rows[0]["SEO_Discription"].ToString();
                model.SEO_Keyword = dt.Rows[0]["SEO_KeyWord"].ToString();
                model.Subject = dt.Rows[0]["Subject"].ToString();
                model.Show = Convert.ToInt32(dt.Rows[0]["Show_MainPage"]);

            }
            else
            {
                model.Background_Id = 0;
                model.Background_Path = "";
                model.Discription = "";
                model.Logo_Path = "";
                model.Log_Id = 0;
                model.PortfolioId = 0;
                model.SEO_discription = "";
                model.SEO_Keyword = "";
                model.Subject = "";
                model.Show = 0;
            }
            return model;
        }

        public string AddPorufolio(PortfolioModel model)
        {
            List<ExcParameters> parss = new List<ExcParameters>();
            ExcParameters par = new ExcParameters
            {
                _KEY = "@Subject",
                _VALUE = model.Subject
            };
            parss.Add(par);

            par = new ExcParameters
            {
                _KEY = "@Background_Id",
                _VALUE = model.Background_Id
            };
            parss.Add(par);

            par = new ExcParameters
            {
                _KEY = "@Discription",
                _VALUE = model.Discription
            };
            parss.Add(par);

            par = new ExcParameters
            {
                _KEY = "@Log_Id",
                _VALUE = model.Log_Id
            };
            parss.Add(par);

            par = new ExcParameters
            {
                _KEY = "@SEO_discription",
                _VALUE = model.SEO_discription
            };
            parss.Add(par);

            par = new ExcParameters
            {
                _KEY = "@SEO_Keyword",
                _VALUE = model.SEO_Keyword
            };
            parss.Add(par);

            par = new ExcParameters
            {
                _KEY = "@Show",
                _VALUE = model.Show
            };
            parss.Add(par);

            string s = "";
            base.Connect();
            s = base.Script("INSERT INTO [tbl_Portfolio]([Subject],[BackGroundPicId],[LogoPicId],[Discription],[SEO_KeyWord],[SEO_Discription],[Show_MainPage],[Deleted]) VALUES( @Subject ,@Background_Id ,@Log_Id ,@Discription ,@SEO_Keyword ,@SEO_discription ,@Show,0)", parss);
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

        public string UpdatePorufolio(PortfolioModel model)
        {
            List<ExcParameters> parss = new List<ExcParameters>();
            ExcParameters par = new ExcParameters
            {
                _KEY = "@P_Id",
                _VALUE = model.PortfolioId
            };
            parss.Add(par); 
            
            par = new ExcParameters
            {
                _KEY = "@Subject",
                _VALUE = model.Subject
            };
            parss.Add(par);

            par = new ExcParameters
            {
                _KEY = "@Background_Id",
                _VALUE = model.Background_Id
            };
            parss.Add(par);

            par = new ExcParameters
            {
                _KEY = "@Discription",
                _VALUE = model.Discription
            };
            parss.Add(par);

            par = new ExcParameters
            {
                _KEY = "@Log_Id",
                _VALUE = model.Log_Id
            };
            parss.Add(par);

            par = new ExcParameters
            {
                _KEY = "@SEO_discription",
                _VALUE = model.SEO_discription
            };
            parss.Add(par);

            par = new ExcParameters
            {
                _KEY = "@SEO_Keyword",
                _VALUE = model.SEO_Keyword
            };
            parss.Add(par);

            par = new ExcParameters
            {
                _KEY = "@Show",
                _VALUE = model.Show
            };
            parss.Add(par);

            string s = "";
            base.Connect();
            s = base.Script("UPDATE [tbl_Portfolio] SET [Subject] = @Subject ,[BackGroundPicId] = @Background_Id ,[LogoPicId] = @Log_Id ,[Discription] = @Discription ,[SEO_KeyWord] = @SEO_Keyword ,[SEO_Discription] = @SEO_discription ,[Show_MainPage] = @Show WHERE P_Id=@P_Id ", parss);
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
    }
}
