using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Logics_Layer.Models;
using Logics_Layer.Admin;
using Newtonsoft.Json;

namespace Fardid
{
    public partial class Admin_MainVideo : System.Web.UI.Page
    {
        private MainVideo_Logic Logic;
        public MainVideoModel model;
        protected void Page_Load(object sender, EventArgs e)
        {

            Logic = new MainVideo_Logic();
            model = Logic.GetMainVideo();
            if (!IsPostBack)
            {
                 
                TextBox_VideoLink.Text = model.VideoLink;
                TextBox_VideoSub1.Text = model.VideoSub1;
                TextBox_VideoSub2.Text = model.VideoSub2;
                HiddenField_VideoBack.Value = JsonConvert.SerializeObject(new List<UploaderModel>()
                {
                    new UploaderModel(){
                    idOfImg = model.MainVideoBackground_PicId.ToString()
                    }
                });
            }
            else
            {
               
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            var model = new MainVideoModel();

            model.VideoLink= TextBox_VideoLink.Text;
            model.VideoSub1= TextBox_VideoSub1.Text;
            model.VideoSub2= TextBox_VideoSub2.Text;
            model.MainVideoBackground_PicId= Convert.ToInt32(JsonConvert.DeserializeObject<List<UploaderModel>>(HiddenField_VideoBack.Value)[0].idOfImg);
            model.MainVideoBackground_Pic = JsonConvert.DeserializeObject<List<UploaderModel>>(HiddenField_VideoBack.Value)[0].imgsrc;
            Logic.UpdateMainVideo(model);
            Response.Redirect("/Admin_MainVideo.aspx");
        }
    }
}