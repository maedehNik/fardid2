using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Logics_Layer.Admin;
using Logics_Layer.Models;
using Newtonsoft.Json;

namespace Fardid.Admin_Ajax
{
    public partial class UpdateTeamMember : System.Web.UI.Page
    {
        private OurTeam_Logic logic;
        protected void Page_Load(object sender, EventArgs e)
        {
            logic = new OurTeam_Logic();
            string s1 = Request["picId"];
            string s2 = Request["Name"];
            string s3 = Request["Subject"];
            string s4 = Request["Id"];
            if (Request["picId"] != null && Request["Name"] != null && Request["Subject"] != null&& Request["Id"]!=null)
            {

                var model = new OurTeamModel()
                {
                    T_Id = Convert.ToInt32(Request["Id"]),
                    deleted = 0,
                    PicId = Convert.ToInt32(JsonConvert.DeserializeObject<List<UploaderModel>>(Request["picId"])[0].idOfImg),
                    Name = Request["Name"],
                    Job = Request["Subject"],
                    Pic_Path = ""
                };

                Response.Write(logic.UpdateMember(model));
            }
        }
    }
}