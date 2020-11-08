using DB_Connect;
using Logics_Layer.Models;
using Logics_Layer.Other;
using System;
using System.Collections.Generic;
using System.Data;

namespace Logics_Layer.Admin
{
    public class Profile_Logic : PDBC
    {
        public AdminModel Get_Profile()
        {
            base.Connect();
            DataTable dt = base.Select("SELECT TOP 1 [Admin_Id],[Name],[Family],[EmailAddress],[PhoneNum],B.PicAddress,B.PicId FROM [tbl_Admin] as A inner join [tbl_PicUploader] as B on A.ProfilePic_Id=B.PicId");
            base.DC();
            var model = new AdminModel();
            if (dt.Rows.Count != 0)
            {
                model.A_Id = Convert.ToInt32(dt.Rows[0]["Admin_Id"]);
                model.ProfilePic_Id = Convert.ToInt32(dt.Rows[0]["PicId"]);
                model.Name = dt.Rows[0]["Name"].ToString();
                model.Family = dt.Rows[0]["Family"].ToString();
                model.Email = dt.Rows[0]["EmailAddress"].ToString();
                model.PhoneNum = dt.Rows[0]["PhoneNum"].ToString();
                model.ProfilePic_Path = dt.Rows[0]["PicAddress"].ToString();
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

        public string Update_Profile(AdminModel model)
        {
            string s = "";
            base.Connect();

            if (base.Select("SELECT TOP 1 [Admin_Id] FROM [tbl_Admin]").Rows.Count != 0)
            {
                List<ExcParameters> parss = new List<ExcParameters>();
                ExcParameters par = new ExcParameters
                {
                    _KEY = "@Name",
                    _VALUE = model.Name
                };
                parss.Add(par);

                par = new ExcParameters
                {
                    _KEY = "@Family",
                    _VALUE = model.Family
                };
                parss.Add(par);

                par = new ExcParameters
                {
                    _KEY = "@EmailAddress",
                    _VALUE = model.Email
                };
                parss.Add(par);

                par = new ExcParameters
                {
                    _KEY = "@PhoneNum",
                    _VALUE = model.PhoneNum
                };
                parss.Add(par);

                par = new ExcParameters
                {
                    _KEY = "@ProfilePic_Id",
                    _VALUE = model.ProfilePic_Id
                };
                parss.Add(par);

                par = new ExcParameters
                {
                    _KEY = "@Admin_Id",
                    _VALUE = model.A_Id
                };
                parss.Add(par);

                
                if (!string.IsNullOrEmpty(model.Pass))
                {
                    Security security = new Security();
                    model.Pass = security.HMACMD5Generator(model.Pass);

                    par = new ExcParameters
                    {
                        _KEY = "@Pass",
                        _VALUE = model.Pass
                    };
                    parss.Add(par);

                    s = base.Script("UPDATE [tbl_Admin]SET [Name] = @Name ,[Family] = @Family ,[EmailAddress] = @EmailAddress ,[PhoneNum] = @PhoneNum ,[Password] = @Pass ,[ProfilePic_Id] = @ProfilePic_Id WHERE Admin_Id=@Admin_Id", parss);
                }
                else
                {
                    s = base.Script("UPDATE [tbl_Admin]SET [Name] = @Name ,[Family] = @Family ,[EmailAddress] = @EmailAddress ,[PhoneNum] = @PhoneNum ,[ProfilePic_Id] = @ProfilePic_Id WHERE Admin_Id=@Admin_Id", parss);
                }
                base.DC();
            }
            else
            {
                List<ExcParameters> parss = new List<ExcParameters>();
                ExcParameters par = new ExcParameters
                {
                    _KEY = "@Name",
                    _VALUE = model.Name
                };
                parss.Add(par);

                par = new ExcParameters
                {
                    _KEY = "@Family",
                    _VALUE = model.Family
                };
                parss.Add(par);

                par = new ExcParameters
                {
                    _KEY = "@EmailAddress",
                    _VALUE = model.Email
                };
                parss.Add(par);

                par = new ExcParameters
                {
                    _KEY = "@PhoneNum",
                    _VALUE = model.PhoneNum
                };
                parss.Add(par);

                par = new ExcParameters
                {
                    _KEY = "@ProfilePic_Id",
                    _VALUE = model.ProfilePic_Id
                };
                parss.Add(par);

                Security security = new Security();
                if (string.IsNullOrEmpty(model.Pass))
                {
                    model.Pass = "5cbc31473a4b259e2c3b2e3f184763a4";
                }
                else
                {
                    model.Pass = security.HMACMD5Generator(model.Pass);

                }

                par = new ExcParameters
                {
                    _KEY = "@Pass",
                    _VALUE = model.Pass
                };
                parss.Add(par);
                s = base.Script("INSERT INTO [tbl_Admin]([Name],[Family],[EmailAddress],[PhoneNum],[Password],[ProfilePic_Id]) output inserted.Admin_Id VALUES(@Name,@Family,@EmailAddress,@PhoneNum,@Pass,@ProfilePic_Id)", parss);
                base.DC();
            }

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
