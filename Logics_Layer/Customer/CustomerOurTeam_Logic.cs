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
    public class CustomerOurTeam_Logic:PDBC
    {
        public List<OurTeamModel> GetTeam()
        {
            List<OurTeamModel> Models = new List<OurTeamModel>();
            base.Connect();
            DataTable dt = base.Select("SELECT [T_Id],[Name],[Subject],A.[PicId],B.PicAddress,Deleted,B.PicThumbnailAddress FROM [tbl_TeamMembers] as A inner join [tbl_PicUploader] as B on A.PicId=B.PicId where [Deleted]=0");
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
                    Pic_Path = dt.Rows[i]["PicAddress"].ToString()
                };
                Models.Add(model);
            }

            return Models;
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
