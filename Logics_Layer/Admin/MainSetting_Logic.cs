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
    public class MainSetting_Logic:PDBC
    {
        public MainSettingModel GetMainSetting()
        {
            MainSettingModel model = new MainSettingModel();

            base.Connect();
            ////////Eng_Address
            DataTable dt = base.Select("SELECT [ItemValue] FROM [tbl_SiteProperties] WHERE ItemKey Like N'Eng_Address'");
            if (dt.Rows.Count != 0)
            {
                model.Eng_Address = dt.Rows[0]["ItemValue"].ToString();
            }
            else
            {
                model.Eng_Address = "";
            }
            ////////Facebook
            dt = base.Select("SELECT [ItemValue] FROM [tbl_SiteProperties] WHERE ItemKey Like N'Facebook'");
            if (dt.Rows.Count != 0)
            {
                model.FaceBook = dt.Rows[0]["ItemValue"].ToString();
            }
            else
            {
                model.FaceBook = "";
            }
            /////////Instagram
            dt = base.Select("SELECT [ItemValue] FROM [tbl_SiteProperties] WHERE ItemKey Like N'Instagram'");
            if (dt.Rows.Count != 0)
            {
                model.Instagram = dt.Rows[0]["ItemValue"].ToString();
            }
            else
            {
                model.Instagram = "";
            }
            /////////Linkedin
            dt = base.Select("SELECT [ItemValue] FROM [tbl_SiteProperties] WHERE ItemKey Like N'Linkedin'");
            if (dt.Rows.Count != 0)
            {
                model.Linkedin = dt.Rows[0]["ItemValue"].ToString();
            }
            else
            {
                model.Linkedin = "";
            }
            /////////Per_Address
            dt = base.Select("SELECT [ItemValue] FROM [tbl_SiteProperties] WHERE ItemKey Like N'Per_Address'");
            if (dt.Rows.Count != 0)
            {
                model.Per_Address = dt.Rows[0]["ItemValue"].ToString();
            }
            else
            {
                model.Per_Address = "";
            }
            /////////Site_Email
            dt = base.Select("SELECT [ItemValue] FROM [tbl_SiteProperties] WHERE ItemKey Like N'Site_Email'");
            if (dt.Rows.Count != 0)
            {
                model.Email = dt.Rows[0]["ItemValue"].ToString();
            }
            else
            {
                model.Email = "";
            }
            /////////Site_Phone
            dt = base.Select("SELECT [ItemValue] FROM [tbl_SiteProperties] WHERE ItemKey Like N'Site_Phone'");
            if (dt.Rows.Count != 0)
            {
                model.PhoneNumber = dt.Rows[0]["ItemValue"].ToString();
            }
            else
            {
                model.PhoneNumber = "";
            }
            /////////Site_SEO_Discription
            dt = base.Select("SELECT [ItemValue] FROM [tbl_SiteProperties] WHERE ItemKey Like N'Site_SEO_Discription'");
            if (dt.Rows.Count != 0)
            {
                model.SEO_discription = dt.Rows[0]["ItemValue"].ToString();
            }
            else
            {
                model.SiteDiscription = "";
            }
            /////////Site_SEO_Keyword
            dt = base.Select("SELECT [ItemValue] FROM [tbl_SiteProperties] WHERE ItemKey Like N'Site_SEO_Keyword'");
            if (dt.Rows.Count != 0)
            {
                model.SEO_Keyword = dt.Rows[0]["ItemValue"].ToString();
            }
            else
            {
                model.SEO_Keyword = "";
            }
            /////////SiteDiscription
            dt = base.Select("SELECT [ItemValue] FROM [tbl_SiteProperties] WHERE ItemKey Like N'SiteDiscription'");
            if (dt.Rows.Count != 0)
            {
                model.SiteDiscription = dt.Rows[0]["ItemValue"].ToString();
            }
            else
            {
                model.SiteDiscription = "";
            }
            /////////SiteName
            dt = base.Select("SELECT [ItemValue] FROM [tbl_SiteProperties] WHERE ItemKey Like N'SiteName'");
            if (dt.Rows.Count != 0)
            {
                model.SiteName = dt.Rows[0]["ItemValue"].ToString();
            }
            else
            {
                model.SiteName = "";
            }
            /////////Twitter
            dt = base.Select("SELECT [ItemValue] FROM [tbl_SiteProperties] WHERE ItemKey Like N'Twitter'");
            if (dt.Rows.Count != 0)
            {
                model.Twitter = dt.Rows[0]["ItemValue"].ToString();
            }
            else
            {
                model.Twitter = "";
            }
            /////////
            base.DC();
            return model;
        }

        public string UpdateMainSetting(MainSettingModel model)
        {
            string s = "";
            List<ExcParameters> parss;
            ExcParameters par;
            base.Connect();

            ////////Eng_Address
            DataTable dt = base.Select("SELECT [ItemValue] FROM [tbl_SiteProperties] WHERE ItemKey Like N'Eng_Address'");

            parss = new List<ExcParameters>();
            par = new ExcParameters
            {
                _KEY = "@ItemKey",
                _VALUE = "Eng_Address"
            };
            parss.Add(par);
            par = new ExcParameters
            {
                _KEY = "@ItemValue",
                _VALUE = model.Eng_Address
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
            ////////Facebook
            dt = base.Select("SELECT [ItemValue] FROM [tbl_SiteProperties] WHERE ItemKey Like N'Facebook'");
            par = new ExcParameters
            {
                _KEY = "@ItemKey",
                _VALUE = "Facebook"
            };
            parss.Add(par);
            par = new ExcParameters
            {
                _KEY = "@ItemValue",
                _VALUE = model.FaceBook
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
            /////////Instagram
            dt = base.Select("SELECT [ItemValue] FROM [tbl_SiteProperties] WHERE ItemKey Like N'Instagram'");
            par = new ExcParameters
            {
                _KEY = "@ItemKey",
                _VALUE = "Instagram"
            };
            parss.Add(par);
            par = new ExcParameters
            {
                _KEY = "@ItemValue",
                _VALUE = model.Instagram
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
            /////////Linkedin
            dt = base.Select("SELECT [ItemValue] FROM [tbl_SiteProperties] WHERE ItemKey Like N''");
            par = new ExcParameters
            {
                _KEY = "@ItemKey",
                _VALUE = "Linkedin"
            };
            parss.Add(par);
            par = new ExcParameters
            {
                _KEY = "@ItemValue",
                _VALUE = model.Linkedin
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
            /////////Per_Address
            dt = base.Select("SELECT [ItemValue] FROM [tbl_SiteProperties] WHERE ItemKey Like N'Per_Address'");
            par = new ExcParameters
            {
                _KEY = "@ItemKey",
                _VALUE = "Per_Address"
            };
            parss.Add(par);
            par = new ExcParameters
            {
                _KEY = "@ItemValue",
                _VALUE = model.Per_Address
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
            /////////Site_Email
            dt = base.Select("SELECT [ItemValue] FROM [tbl_SiteProperties] WHERE ItemKey Like N'Site_Email'");
            par = new ExcParameters
            {
                _KEY = "@ItemKey",
                _VALUE = "Site_Email"
            };
            parss.Add(par);
            par = new ExcParameters
            {
                _KEY = "@ItemValue",
                _VALUE = model.Email
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
            /////////Site_Phone
            dt = base.Select("SELECT [ItemValue] FROM [tbl_SiteProperties] WHERE ItemKey Like N'Site_Phone'");

            par = new ExcParameters
            {
                _KEY = "@ItemKey",
                _VALUE = "Site_Phone"
            };
            parss.Add(par);
            par = new ExcParameters
            {
                _KEY = "@ItemValue",
                _VALUE = model.PhoneNumber
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
            /////////Site_SEO_Discription
            dt = base.Select("SELECT [ItemValue] FROM [tbl_SiteProperties] WHERE ItemKey Like N'Site_SEO_Discription'");

            par = new ExcParameters
            {
                _KEY = "@ItemKey",
                _VALUE = "Site_SEO_Discription"
            };
            parss.Add(par);
            par = new ExcParameters
            {
                _KEY = "@ItemValue",
                _VALUE = model.SEO_discription
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
            /////////Site_SEO_Keyword
            dt = base.Select("SELECT [ItemValue] FROM [tbl_SiteProperties] WHERE ItemKey Like N'Site_SEO_Keyword'");

            par = new ExcParameters
            {
                _KEY = "@ItemKey",
                _VALUE = "Site_SEO_Keyword"
            };
            parss.Add(par);
            par = new ExcParameters
            {
                _KEY = "@ItemValue",
                _VALUE = model.SEO_Keyword
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
            /////////SiteDiscription
            dt = base.Select("SELECT [ItemValue] FROM [tbl_SiteProperties] WHERE ItemKey Like N'SiteDiscription'");

            par = new ExcParameters
            {
                _KEY = "@ItemKey",
                _VALUE = "SiteDiscription"
            };
            parss.Add(par);
            par = new ExcParameters
            {
                _KEY = "@ItemValue",
                _VALUE = model.SiteDiscription
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
            /////////SiteName
            dt = base.Select("SELECT [ItemValue] FROM [tbl_SiteProperties] WHERE ItemKey Like N'SiteName'");

            par = new ExcParameters
            {
                _KEY = "@ItemKey",
                _VALUE = "SiteName"
            };
            parss.Add(par);
            par = new ExcParameters
            {
                _KEY = "@ItemValue",
                _VALUE = model.SiteName
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
            /////////Twitter
            dt = base.Select("SELECT [ItemValue] FROM [tbl_SiteProperties] WHERE ItemKey Like N'Twitter'");

            par = new ExcParameters
            {
                _KEY = "@ItemKey",
                _VALUE = "Twitter"
            };
            parss.Add(par);
            par = new ExcParameters
            {
                _KEY = "@ItemValue",
                _VALUE = model.Twitter
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
            /////////
            base.DC();

            if (s == "111111111111")
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
