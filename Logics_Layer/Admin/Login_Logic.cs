using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DB_Connect;
using Logics_Layer.Models;
using Logics_Layer.Other;

namespace Logics_Layer.Admin
{
    public class Login_Logic : PDBC
    {
        private string ProfilePic = "8570e9fd738a66a58e48b35aea683714.jpg";
        public AdminModel CheckAdmin(string UN, string Pass)
        {
            Security security = new Security();
            List<ExcParameters> parss = new List<ExcParameters>();
            ExcParameters par = new ExcParameters
            {
                _KEY = "@UN",
                _VALUE = UN
            };
            parss.Add(par);

            par = new ExcParameters
            {
                _KEY = "@Pass",
                _VALUE = security.HMACMD5Generator(Pass)
            };
            parss.Add(par);

            base.Connect();
            DataTable dt = base.Select("SELECT [Admin_Id],[Name],[Family],[EmailAddress],[PhoneNum],[Password],[ProfilePic_Id] FROM [tbl_Admin] WHERE (EmailAddress=@UN AND Password=@Pass) OR (PhoneNum=@UN AND Password=@Pass)", parss);

            base.DC();

            var model = new AdminModel();
            if (dt.Rows.Count != 0)
            {
                model.A_Id = Convert.ToInt32(dt.Rows[0]["Admin_Id"]);
                model.ProfilePic_Id = 0;
                model.Name = dt.Rows[0]["Name"].ToString();
                model.Family = dt.Rows[0]["Family"].ToString();
                model.Email = dt.Rows[0]["EmailAddress"].ToString();
                model.PhoneNum = dt.Rows[0]["PhoneNum"].ToString();
                

                if (!string.IsNullOrEmpty( dt.Rows[0]["ProfilePic_Id"].ToString())|| dt.Rows[0]["ProfilePic_Id"].ToString() != "0")
                {

                    parss = new List<ExcParameters>();
                    par = new ExcParameters
                    {
                        _KEY = "@PicId",
                        _VALUE = dt.Rows[0]["ProfilePic_Id"].ToString()
                    };
                    parss.Add(par);
                    DataTable dt2 = base.Select("SELECT[PicId],[PicAddress],[PicThumbnailAddress] FROM [tbl_PicUploader] where PicId=@PicId", parss);
                    if(dt2.Rows.Count!=0)
                    {
                        model.ProfilePic_Path = dt2.Rows[0]["PicAddress"].ToString();
                    }else
                    {
                        model.ProfilePic_Path = ProfilePic;
                    }
                }
                else
                {
                    model.ProfilePic_Path = ProfilePic;
                }
            }
            else
            {
                model.A_Id = 0;
                model.ProfilePic_Id = 0;
                model.Name = "";
                model.Family = "";
                model.Email = "";
                model.PhoneNum = "";
                model.ProfilePic_Path = "";
            }
            return model;
        }

    }
}
