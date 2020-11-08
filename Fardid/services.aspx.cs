using Logics_Layer.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Logics_Layer.Customer;

namespace Fardid
{
    public partial class services : System.Web.UI.Page
    {
        private CustomerServices_Logic Logic;
        public ServiceModel ServiceModel;
        public List<PicModel> Clients;
        protected void Page_Load(object sender, EventArgs e)
        {
            Logic = new CustomerServices_Logic();
            if (Request["Id"] != null)
            {
                string s = Request["Id"];
                int Id = Convert.ToInt32(s);
                ServiceModel = Logic.GetService(Id);

            }
            else
            {
                ServiceModel = new ServiceModel();
                ServiceModel.Background_Id = 0;
                ServiceModel.LeftPic_Id = 0;
                ServiceModel.RightPic_Id = 0;
                ServiceModel.S_Id = 0;
                ServiceModel.VideoBackground_Id = 0;
                ServiceModel.Show = 0;
                ServiceModel.Background_Path = "";
                ServiceModel.discription = "";
                ServiceModel.LeftPic_Path = "";
                ServiceModel.RightPic_Path = "";
                ServiceModel.RightSub = "";
                ServiceModel.SEO_discription = "";
                ServiceModel.SEO_Keyword = "";
                ServiceModel.Subject = "";
                ServiceModel.VideoBackground_Path = "";
                ServiceModel.VideoSub1 = "";
                ServiceModel.VideoSub2 = "";
                ServiceModel.VideoLink = "";
            }
            Clients = Logic.GetClients();
        }
    }
}