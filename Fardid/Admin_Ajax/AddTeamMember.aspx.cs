using Logics_Layer.Admin;
using Logics_Layer.Models;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Fardid.Admin_Ajax
{
    public partial class AddTeamMember : System.Web.UI.Page
    {
        private OurTeam_Logic logic;
        protected void Page_Load(object sender, EventArgs e)
        {
            logic = new OurTeam_Logic();
            string s1 = Request["picId"];
            string s2 = Request["Name"];
            string s3 = Request["Sub"];
            if (Request["picId"] != null && Request["Name"] != null && Request["Sub"] != null)
            {

                var model = new OurTeamModel()
                {
                    T_Id = 0,
                    deleted = 0,
                    PicId = Convert.ToInt32(JsonConvert.DeserializeObject<List<UploaderModel>>(Request["picId"])[0].idOfImg), 
                    Name = Request["Name"],
                    Job = Request["Sub"],
                    Pic_Path = ""
                };

                Response.Write(logic.AddMember(model));
            }
        }

    }
}