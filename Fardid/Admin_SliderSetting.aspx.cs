using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Logics_Layer.Admin;
using Logics_Layer.Models;

namespace Fardid
{
    public partial class Admin_SliderSetting : System.Web.UI.Page
    {
        private SliderSetting_Logic logic;
        public List<PicModel> Models;

        protected void Page_Load(object sender, EventArgs e)
        {
            logic = new SliderSetting_Logic();
            Models = logic.GetSliders();
        }
    }
}