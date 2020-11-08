using DB_Connect;
using Logics_Layer.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Logics_Layer.Admin
{
    public class ad_LogicUploader : PDBC
    {
        public List<PicModel> loadGallery()
        {
            List<PicModel> Models = new List<PicModel>();
            base.Connect();
            DataTable dt = base.Select("SELECT [PicId] ,[PicAddress] ,[PicThumbnailAddress] ,[PicName] ,[PicLable] ,[PicDescription] FROM [tbl_PicUploader]");
            base.DC();

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                var model = new PicModel()
                {
                    PicId = Convert.ToInt32(dt.Rows[i]["PicId"]),
                    Path = dt.Rows[i]["PicAddress"].ToString(),
                    ThumpnailPic = dt.Rows[i]["PicThumbnailAddress"].ToString(),
                    Description = dt.Rows[i]["PicDescription"].ToString(),
                    Lable = dt.Rows[i]["PicLable"].ToString(),
                    Name = dt.Rows[i]["PicName"].ToString(),
                };
                Models.Add(model);
            }

            return Models;
        }
        public bool UpdateImageInformation(string id, string name, string lable, string desc)
        {
            List<ExcParameters> parms = new List<ExcParameters>();
            ExcParameters par = new ExcParameters()
            {
                _KEY = "@PicId",
                _VALUE = id
            };
            parms.Add(par);
            par = new ExcParameters()
            {
                _KEY = "@PicName",
                _VALUE = name
            };
            parms.Add(par);
            par = new ExcParameters()
            {
                _KEY = "@PicLable",
                _VALUE = lable
            };
            parms.Add(par);
            par = new ExcParameters()
            {
                _KEY = "@PicDescription",
                _VALUE = desc
            };
            parms.Add(par);
            base.Connect();
            string res = base.Script("UPDATE [tbl_PicUploader] SET  [PicName] = @PicName ,[PicLable] = @PicLable ,[PicDescription] = @PicDescription WHERE [PicId] = @PicId", parms);
            base.DC();
            if (res == "1")
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public int DeleteImage(string id)
        {
            List<ExcParameters> parms = new List<ExcParameters>();
            ExcParameters par = new ExcParameters()
            {
                _KEY = "@PicId",
                _VALUE = id
            };
            parms.Add(par);
            base.Connect();
            DataTable dt = base.Select("SELECT  [CanDelete],[PicThumbnailabsolutePath] ,[PicabsolutePath] FROM [tbl_PicUploader] WHERE  [PicId] =@PicId", parms);
            base.DC();
            if (dt.Rows.Count == 0)
            {
                return -1;
            }
            if (dt.Rows[0]["CanDelete"].ToString() == "0")
            {
                return -4;
            }

            base.Connect();
            string res = base.Script("DELETE FROM [tbl_PicUploader] WHERE [PicId] = @PicId", parms);
            base.DC();
            if (res == "1")
            {
                try
                {
                    File.Delete(dt.Rows[0]["PicabsolutePath"].ToString());
                    return 1;
                }
                catch
                {
                    return -2;
                }
            }
            else
            {
                return -3;
            }


        }

        public bool saveIMG(string name, string lable, string desc, string webAddress, string absolutepath)
        {
            List<ExcParameters> parms = new List<ExcParameters>();
            ExcParameters par = new ExcParameters()
            {
                _KEY = "@PicAddress",
                _VALUE = webAddress
            };
            parms.Add(par);
            par = new ExcParameters()
            {
                _KEY = "@PicName",
                _VALUE = name
            };
            parms.Add(par);
            par = new ExcParameters()
            {
                _KEY = "@PicLable",
                _VALUE = lable
            };
            parms.Add(par);
            par = new ExcParameters()
            {
                _KEY = "@PicDescription",
                _VALUE = desc
            };
            parms.Add(par);
            par = new ExcParameters()
            {
                _KEY = "@PicabsolutePath",
                _VALUE = absolutepath
            };
            parms.Add(par);
            par = new ExcParameters()
            {
                _KEY = "@PicThumbnailabsolutePath",
                _VALUE = absolutepath
            };
            parms.Add(par);

            par = new ExcParameters()
            {
                _KEY = "@PicThumbnailAddress",
                _VALUE = webAddress
            };
            parms.Add(par);
            base.Connect();
            string res = base.Script("INSERT INTO [tbl_PicUploader] ([PicAddress] ,[PicThumbnailAddress] ,[PicName] ,[PicLable] ,[PicDescription] ,[CanDelete] ,[PicabsolutePath] ,[PicThumbnailabsolutePath]) VALUES (@PicAddress   ,@PicThumbnailAddress  ,@PicName  ,@PicLable  ,@PicDescription  ,1 ,@PicabsolutePath  ,@PicThumbnailabsolutePath )", parms);
            base.DC();
            if (res == "1")
            {
                return true;
            }
            else
            {
                return false;
            }

        }

    }
}
