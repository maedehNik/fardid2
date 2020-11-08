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
    public partial class Admin_AddService : System.Web.UI.Page
    {
        private AddServices_Logic Logic;
        public ServiceModel model;
        protected void Page_Load(object sender, EventArgs e)
        {
            Logic = new AddServices_Logic();
            string s = Request["Type"];
            if (!IsPostBack && s == "Edit")
            {
                string ss = Request["Id"];
                int Id = Convert.ToInt32(ss);
                model = Logic.GetService(Id);

                TextBoxSub.Text = model.Subject;
                TextBox_RSub.Text = model.RightSub;
                TextBox1.Text = model.discription;
                TextBox_SEO_D.Text = model.SEO_discription;
                TextBox_SEO_K.Text = model.SEO_Keyword;
                TextBox_VideoLink.Text = model.VideoLink;
                TextBox_VideoSub1.Text = model.VideoSub1;
                TextBox_VideoSub2.Text = model.VideoSub2;
                HiddenField_BackGround.Value = JsonConvert.SerializeObject(new List<UploaderModel>()
                {
                    new UploaderModel(){
                    idOfImg = model.Background_Id.ToString()
                    }
                });
                HiddenField_LeftPic.Value = JsonConvert.SerializeObject(new List<UploaderModel>()
                {
                     new UploaderModel(){
                    idOfImg = model.LeftPic_Id.ToString()
                    }
                });
                HiddenField_RightPic.Value = JsonConvert.SerializeObject(new List<UploaderModel>()
                {
                    new UploaderModel(){
                    idOfImg = model.RightPic_Id.ToString()
                    }
                });
                HiddenField_VideoBack.Value = JsonConvert.SerializeObject(new List<UploaderModel>()
                {
                     new UploaderModel(){
                    idOfImg = model.VideoBackground_Id.ToString()
                    }
                });

                if (model.Show == 1)
                {
                    CheckBox_Show.Checked = true;
                }

            }else
            {
                model = new ServiceModel();
                model.Background_Path = "";
                model.LeftPic_Path = "";
                model.RightPic_Path = "";
                model.VideoBackground_Path = "";

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            var model = new ServiceModel();
            string s = Request["Type"];
            

            model.Subject = TextBoxSub.Text;
            model.RightSub = TextBox_RSub.Text;
            model.discription = TextBox1.Text;
            model.SEO_discription = TextBox_SEO_D.Text;
            model.SEO_Keyword = TextBox_SEO_K.Text;
            model.VideoLink = TextBox_VideoLink.Text;
            model.VideoSub1 = TextBox_VideoSub1.Text;
            model.VideoSub2 = TextBox_VideoSub2.Text;
            model.Background_Id = Convert.ToInt32(JsonConvert.DeserializeObject<List<UploaderModel>>(HiddenField_BackGround.Value)[0].idOfImg);
            model.VideoBackground_Id = Convert.ToInt32(JsonConvert.DeserializeObject<List<UploaderModel>>(HiddenField_VideoBack.Value)[0].idOfImg);
            model.LeftPic_Id = Convert.ToInt32(JsonConvert.DeserializeObject<List<UploaderModel>>(HiddenField_LeftPic.Value)[0].idOfImg);
            model.RightPic_Id = Convert.ToInt32(JsonConvert.DeserializeObject<List<UploaderModel>>(HiddenField_RightPic.Value)[0].idOfImg);

            if (CheckBox_Show.Checked)
            {
                model.Show = 1;
            }
            else
            {
                model.Show = 0;
            }


            if (s == "Edit")
            {
                int Id = Convert.ToInt32(Request["Id"]);
                model.S_Id = Id;
                Logic.UpdateService(model);
                string myScriptValue = " swal(' با موفقیت ثبت شد!', status, 'success').then(function (e) {console.log('1'); ";
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "myScriptName", myScriptValue, true);
                Response.Redirect("/Admin_Services.aspx");
            }
            else
            {
                model.S_Id = 0;
                Logic.AddService(model);
                string myScriptValue = " swal(' با موفقیت ثبت شد!', status, 'success').then(function (e) {console.log('1'); ";
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "myScriptName", myScriptValue, true);
                Response.Redirect("/Admin_Services.aspx");
            }
            
        }
    }
}