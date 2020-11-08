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
    public class Customer_Portfolio_Logic : PDBC
    {
        public List<PortfolioModel> GetPortfolios()
        {
            base.Connect();
            ////////Portfolios
            List<PortfolioModel> Portfolios = new List<PortfolioModel>();
            DataTable dt = base.Select("SELECT [P_Id],[Subject],[BackGroundPicId],(SELECT [PicThumbnailAddress] FROM [tbl_PicUploader] where PicId=[BackGroundPicId]) as BackGroundPic,[LogoPicId],(SELECT [PicThumbnailAddress] FROM [tbl_PicUploader] where PicId=[LogoPicId]) as LogoPic ,[Discription],[SEO_KeyWord],[SEO_Discription],[Show_MainPage] FROM [tbl_Portfolio] where [Deleted]=0");
            base.DC();

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
            return Portfolios;
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
