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
    public class MainVideo_Logic:PDBC
    {
        public MainVideoModel GetMainVideo()
        {
            MainVideoModel model = new MainVideoModel();
            base.Connect();
            ////////MainVideoLink
            DataTable dt = base.Select("SELECT [ItemValue] FROM [tbl_SiteProperties] WHERE ItemKey Like N'MainVideoLink'");
            if (dt.Rows.Count != 0)
            {
                model.VideoLink = dt.Rows[0]["ItemValue"].ToString();
            }
            else
            {
                model.VideoLink = "";
            }
            ////////MainVideoSub1
            dt = base.Select("SELECT [ItemValue] FROM [tbl_SiteProperties] WHERE ItemKey Like N'MainVideoSub1'");
            if (dt.Rows.Count != 0)
            {
                model.VideoSub1 = dt.Rows[0]["ItemValue"].ToString();
            }
            else
            {
                model.VideoSub1 = "";
            }
            /////////MainVideoSub2
            dt = base.Select("SELECT [ItemValue] FROM [tbl_SiteProperties] WHERE ItemKey Like N'MainVideoSub2'");
            if (dt.Rows.Count != 0)
            {
                model.VideoSub2 = dt.Rows[0]["ItemValue"].ToString();
            }
            else
            {
                model.VideoSub2 = "";
            }
            /////////MainVideoBackground
            dt = base.Select("SELECT A.[PicId] , B.[PicAddress] From [tbl_PicUse] AS A INNER JOIN [tbl_PicUploader]AS B ON A.PicId=B.PicId WHERE A.PicUseAs LIKE N'MainVideoBackground'");
            if (dt.Rows.Count != 0)
            {
                model.MainVideoBackground_PicId = Convert.ToInt32(dt.Rows[0]["PicId"]);
                model.MainVideoBackground_Pic = dt.Rows[0]["PicAddress"].ToString();
            }
            else
            {
                model.MainVideoBackground_PicId = 0;
                model.MainVideoBackground_Pic = "";
            }
            /////////
            base.DC();

            return model;
        }

        public string UpdateMainVideo(MainVideoModel model)
        {
            string s = "";
            List<ExcParameters> parss;
            ExcParameters par;
            base.Connect();

            ////////MainVideoLink
            DataTable dt = base.Select("SELECT [ItemValue] FROM [tbl_SiteProperties] WHERE ItemKey Like N'MainVideoLink'");

            parss = new List<ExcParameters>();
            par = new ExcParameters
            {
                _KEY = "@ItemKey",
                _VALUE = "MainVideoLink"
            };
            parss.Add(par);
            par = new ExcParameters
            {
                _KEY = "@ItemValue",
                _VALUE = model.VideoLink
            };
            parss.Add(par);

            if (dt.Rows.Count == 0)
            {
                s += base.Script("INSERT INTO [tbl_SiteProperties]([ItemKey],[ItemValue]) VALUES( @ItemKey , @ItemValue )", parss);
            }
            else
            {
                s += base.Script("UPDATE [tbl_SiteProperties] SET [ItemValue] = @ItemValue WHERE [ItemKey] LIKE @ItemKey", parss);
            }
            ////////MainVideoSub1
            dt = base.Select("SELECT [ItemValue] FROM [tbl_SiteProperties] WHERE ItemKey Like N'MainVideoSub1'");
            parss = new List<ExcParameters>();
            par = new ExcParameters
            {
                _KEY = "@ItemKey",
                _VALUE = "MainVideoSub1"
            };
            parss.Add(par);
            par = new ExcParameters
            {
                _KEY = "@ItemValue",
                _VALUE = model.VideoSub1
            };
            parss.Add(par);
            if (dt.Rows.Count == 0)
            {
                s += base.Script("INSERT INTO [tbl_SiteProperties]([ItemKey],[ItemValue]) VALUES( @ItemKey , @ItemValue )", parss);
            }
            else
            {
                s += base.Script("UPDATE [tbl_SiteProperties] SET [ItemValue] = @ItemValue WHERE [ItemKey] LIKE @ItemKey", parss);
            }
            /////////MainVideoSub2
            dt = base.Select("SELECT [ItemValue] FROM [tbl_SiteProperties] WHERE ItemKey Like N'MainVideoSub2'");
            parss = new List<ExcParameters>();
            par = new ExcParameters
            {
                _KEY = "@ItemKey",
                _VALUE = "MainVideoSub2"
            };
            parss.Add(par);
            par = new ExcParameters
            {
                _KEY = "@ItemValue",
                _VALUE = model.VideoSub2
            };
            parss.Add(par);
            if (dt.Rows.Count == 0)
            {
                s += base.Script("INSERT INTO [tbl_SiteProperties]([ItemKey],[ItemValue]) VALUES( @ItemKey , @ItemValue )", parss);
            }
            else
            {
                s += base.Script("UPDATE [tbl_SiteProperties] SET [ItemValue] = @ItemValue WHERE [ItemKey] LIKE @ItemKey", parss);
            }
            /////////MainVideoBackground
            dt = base.Select("SELECT A.[PicId] , B.[PicAddress] From [tbl_PicUse] AS A INNER JOIN [tbl_PicUploader]AS B ON A.PicId=B.PicId WHERE A.PicUseAs LIKE N'MainVideoBackground'");
            parss = new List<ExcParameters>();
            par = new ExcParameters
            {
                _KEY = "@UseAs",
                _VALUE = "MainVideoBackground"
            };
            parss.Add(par);
            par = new ExcParameters
            {
                _KEY = "@PicId",
                _VALUE = model.MainVideoBackground_PicId
            };
            parss.Add(par);
            if (dt.Rows.Count == 0)
            {
                s += base.Script("INSERT INTO [tbl_PicUse]([PicId],[PicUseAs]) VALUES(@PicId ,@UseAs)", parss);
            }
            else
            {
                s += base.Script("UPDATE [tbl_PicUse] SET [PicId] = @PicId WHERE [PicUseAs] = @UseAs ", parss);
            }
            /////////
            base.DC();

            if (s == "1111")
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
