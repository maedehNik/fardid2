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
    public class OurTeam_Logic:PDBC
    {

        public List<OurTeamModel> GetTeam()
        {
            List<OurTeamModel> Models = new List<OurTeamModel>();
            base.Connect();
            DataTable dt = base.Select("SELECT [T_Id],[Name],[Subject],A.[PicId],B.PicAddress,Deleted,B.PicThumbnailAddress FROM [tbl_TeamMembers] as A inner join [tbl_PicUploader] as B on A.PicId=B.PicId");
            base.DC();

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                var model = new OurTeamModel()
                {
                    
                    T_Id = Convert.ToInt32(dt.Rows[i]["T_Id"]),
                    deleted = Convert.ToInt32(dt.Rows[i]["Deleted"]),
                    Name = dt.Rows[i]["Name"].ToString(),
                    Job = dt.Rows[i]["Subject"].ToString(),
                    PicId = Convert.ToInt32(dt.Rows[i]["PicId"]),
                    Pic_Path= dt.Rows[i]["PicAddress"].ToString()
                };
                Models.Add(model);
            }

            return Models;
        }

        public string AddMember(OurTeamModel model)
        {
            string s = "";
            List<ExcParameters> parss = new List<ExcParameters>();
            ExcParameters par = new ExcParameters
            {
                _KEY = "@PicId",
                _VALUE = model.PicId
            };
            parss.Add(par);

            par = new ExcParameters
            {
                _KEY = "@Name",
                _VALUE = model.Name
            };
            parss.Add(par);

            par = new ExcParameters
            {
                _KEY = "@Job",
                _VALUE = model.Job
            };
            parss.Add(par);

            base.Connect();
            s += base.Script("INSERT INTO [tbl_TeamMembers]([Name],[Subject],[PicId],[Deleted])VALUES( @Name , @Job ,@PicId , 0)", parss);
            base.DC();

            if (s == "1")
            {
                return "Success";
            }
            else
            {
                return "fail";
            }
        }

        public string UpdateMember(OurTeamModel model)
        {
            string s = "";
            List<ExcParameters> parss = new List<ExcParameters>();
            ExcParameters par = new ExcParameters
            {
                _KEY = "@T_Id",
                _VALUE = model.T_Id
            };
            parss.Add(par);

            par = new ExcParameters
            {
                _KEY = "@PicId",
                _VALUE = model.PicId
            };
            parss.Add(par);

            par = new ExcParameters
            {
                _KEY = "@Name",
                _VALUE = model.Name
            };
            parss.Add(par);

            par = new ExcParameters
            {
                _KEY = "@Job",
                _VALUE = model.Job
            };
            parss.Add(par);

            base.Connect();
            s += base.Script("UPDATE [tbl_TeamMembers] SET [Name] = @Name ,[Subject] = @Job ,[PicId] = @PicId WHERE T_Id= @T_Id ", parss);
            base.DC();

            if (s == "1")
            {
                return "Success";
            }
            else
            {
                return "fail";
            }
        }

        public string DeleteMember(int M_Id)
        {
            string s = "";
            List<ExcParameters> parss = new List<ExcParameters>();
            ExcParameters par = new ExcParameters
            {
                _KEY = "@T_Id",
                _VALUE = M_Id
            };
            parss.Add(par);

            
            base.Connect();
            s += base.Script("UPDATE [tbl_TeamMembers] SET [Deleted] = 1 WHERE T_Id= @T_Id ", parss);
            base.DC();

            if (s == "1")
            {
                return "Success";
            }
            else
            {
                return "fail";
            }
        }

        public OurTeamModel GetMember(int Id)
        {

            List<ExcParameters> parss = new List<ExcParameters>();
            ExcParameters par = new ExcParameters
            {
                _KEY = "@T_Id",
                _VALUE = Id
            };
            parss.Add(par);

            base.Connect();
            DataTable dt = base.Select("SELECT [T_Id],[Name],[Subject],A.[PicId],B.PicAddress,Deleted,B.PicThumbnailAddress FROM [tbl_TeamMembers] as A inner join [tbl_PicUploader] as B on A.PicId=B.PicId where T_Id=@T_Id",parss);
            base.DC();
            var model = new OurTeamModel();
            if (dt.Rows.Count!=0)
            {
                model.T_Id = Convert.ToInt32(dt.Rows[0]["T_Id"]);
                model.deleted = Convert.ToInt32(dt.Rows[0]["Deleted"]);
                model.Name = dt.Rows[0]["Name"].ToString();
                model.Job = dt.Rows[0]["Subject"].ToString();
                model.PicId = Convert.ToInt32(dt.Rows[0]["PicId"]);
                model.Pic_Path = dt.Rows[0]["PicAddress"].ToString();
            }
            else
            {
                model.T_Id = 0;
                model.deleted = 0;
                model.Name = "";
                model.Job = "";
                model.PicId = 0;
                model.Pic_Path = "";
            }

            return model;
        }

    }
}
