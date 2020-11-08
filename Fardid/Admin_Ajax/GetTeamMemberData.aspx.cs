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
    public partial class GetTeamMemberData : System.Web.UI.Page
    {
        private OurTeam_Logic logic;
        protected void Page_Load(object sender, EventArgs e)
        {
            logic = new OurTeam_Logic();
            if (Request["Id"] != null)
            {
                int Id = Convert.ToInt32(Request["Id"]);
                var model = logic.GetMember(Id);
                model.PicModel= JsonConvert.SerializeObject(new List<UploaderModel>()
                {
                    new UploaderModel(){
                    idOfImg = model.PicId.ToString()
                    }
                });
                Response.Write(Newtonsoft.Json.JsonConvert.SerializeObject(model));
            }
        }
    }
}