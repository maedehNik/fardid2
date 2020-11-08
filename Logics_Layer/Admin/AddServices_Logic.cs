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
    public class AddServices_Logic : PDBC
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
                model.Background_Path ="";
                model.discription ="";
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

        public string AddService(ServiceModel model)
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
                _VALUE = model.discription
            };
            parss.Add(par);

            par = new ExcParameters
            {
                _KEY = "@LeftPic_Id",
                _VALUE = model.LeftPic_Id
            };
            parss.Add(par);

            par = new ExcParameters
            {
                _KEY = "@RightPic_Id",
                _VALUE = model.RightPic_Id
            };
            parss.Add(par);

            par = new ExcParameters
            {
                _KEY = "@RightSub",
                _VALUE = model.RightSub
            };
            parss.Add(par);

            par = new ExcParameters
            {
                _KEY = "@VideoBackground_Id",
                _VALUE = model.VideoBackground_Id
            };
            parss.Add(par);

            par = new ExcParameters
            {
                _KEY = "@VideoLink",
                _VALUE = model.VideoLink
            };
            parss.Add(par);

            par = new ExcParameters
            {
                _KEY = "@VideoSub1",
                _VALUE = model.VideoSub1
            };
            parss.Add(par);

            par = new ExcParameters
            {
                _KEY = "@VideoSub2",
                _VALUE = model.VideoSub2
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
            s = base.Script("INSERT INTO [tbl_Services]([Subject],[Right_Subject],[Left_PicId],[Right_PicId],[Background_PicId],[Discription],[VideoBackGround_PicId],[Video_Link],[VideoSub1],[VideoSub2],[SEO_KeyWord],[SEO_Discription],[Show_Menu],[Deleted],[Active]) VALUES(@Subject,@RightSub,@LeftPic_Id,@RightPic_Id,@Background_Id,@Discription, @VideoBackground_Id , @VideoLink , @VideoSub1, @VideoSub2, @SEO_Keyword, @SEO_discription,@Show,0,1)", parss);
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

        public string UpdateService(ServiceModel model)
        {
            List<ExcParameters> parss = new List<ExcParameters>();
            ExcParameters par = new ExcParameters
            {
                _KEY = "@S_Id",
                _VALUE = model.S_Id
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
                _VALUE = model.discription
            };
            parss.Add(par);

            par = new ExcParameters
            {
                _KEY = "@LeftPic_Id",
                _VALUE = model.LeftPic_Id
            };
            parss.Add(par);

            par = new ExcParameters
            {
                _KEY = "@RightPic_Id",
                _VALUE = model.RightPic_Id
            };
            parss.Add(par);

            par = new ExcParameters
            {
                _KEY = "@RightSub",
                _VALUE = model.RightSub
            };
            parss.Add(par);

            par = new ExcParameters
            {
                _KEY = "@VideoBackground_Id",
                _VALUE = model.VideoBackground_Id
            };
            parss.Add(par);

            par = new ExcParameters
            {
                _KEY = "@VideoLink",
                _VALUE = model.VideoLink
            };
            parss.Add(par);

            par = new ExcParameters
            {
                _KEY = "@VideoSub1",
                _VALUE = model.VideoSub1
            };
            parss.Add(par);

            par = new ExcParameters
            {
                _KEY = "@VideoSub2",
                _VALUE = model.VideoSub2
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
            s = base.Script("UPDATE [tbl_Services]SET [Subject] = @Subject ,[Right_Subject] = @RightSub ,[Left_PicId] = @LeftPic_Id ,[Right_PicId] = @RightPic_Id ,[Background_PicId] = @Background_Id ,[Discription] = @Discription,[VideoBackGround_PicId] = @VideoBackground_Id ,[Video_Link] = @VideoLink ,[VideoSub1] = @VideoSub1 ,[VideoSub2] = @VideoSub2 ,[SEO_KeyWord] = @SEO_Keyword ,[SEO_Discription] = @SEO_discription ,[Show_Menu] = @Show WHERE S_Id= @S_Id ", parss);
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
