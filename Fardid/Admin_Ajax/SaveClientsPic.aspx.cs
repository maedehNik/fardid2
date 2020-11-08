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
    public partial class SaveClientsPic : System.Web.UI.Page
    {
        private OurClients_Logic logic;
        protected void Page_Load(object sender, EventArgs e)
        {
            logic = new OurClients_Logic();
            if (Request["Pics"] != null)
            {
                var s = JsonConvert.DeserializeObject<List<UploaderModel>>(Request["Pics"]);
                List<int> pics = new List<int>();
                for (int i = 0; i < s.Count; i++)
                {
                    pics.Add(Convert.ToInt32(s[i].idOfImg));
                }

                Response.Write(logic.AddPic_Clients(pics));
            }
        }
    }
}