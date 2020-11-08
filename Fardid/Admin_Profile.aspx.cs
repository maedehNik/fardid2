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
    public partial class Admin_Profile : System.Web.UI.Page
    {
        private Profile_Logic Logic;
        public AdminModel model;
        protected void Page_Load(object sender, EventArgs e)
        {
            Logic = new Profile_Logic();
            

            if (!IsPostBack) {
                model = Logic.Get_Profile();
                AdminNameLBL.Text = model.Name + " " + model.Family; 
                TextBox_Email.Text = model.Email;
                TextBox_Family.Text = model.Family;
                TextBox_Namle.Text = model.Name;
                TextBox_Phone.Text = model.PhoneNum;
                HiddenField_Profile.Value = JsonConvert.SerializeObject(new List<UploaderModel>()
                {
                    new UploaderModel(){
                    idOfImg = model.ProfilePic_Id.ToString()
                    }
                }); 
                HiddenField_AdminId.Value = model.A_Id.ToString();
                Label_error.Text = "";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if(TextBox_Email.Text!="" && TextBox_Family.Text != "" &&TextBox_Namle.Text != "" &&TextBox_Phone.Text != "")
            {
                var model1 = new AdminModel();

                model1.Email = TextBox_Email.Text;
                model1.Family = TextBox_Family.Text;
                model1.Name = TextBox_Namle.Text;
                model1.PhoneNum = TextBox_Phone.Text;
                model1.ProfilePic_Id = Convert.ToInt32(JsonConvert.DeserializeObject<List<UploaderModel>>(HiddenField_Profile.Value)[0].idOfImg);
                model1.A_Id = Convert.ToInt32(HiddenField_AdminId.Value);
                if (TextBox_Pass1.Text != "")
                {
                    if(TextBox_Pass1.Text == TextBox_Pass2.Text)
                    {
                        model1.Pass = TextBox_Pass1.Text;
                        Logic.Update_Profile(model1);
                    }
                    else
                    {
                        Label_error.Text=("مقادیر رمز عبور یکسان نیست");
                    }
                }
                else
                {
                    model1.Pass = "";
                    Logic.Update_Profile(model1);
                }

            }
            else
            {
                Label_error.Text = ("لطفا همه ی مقادیر را پر کنید");
            }
        }

        
    }
}