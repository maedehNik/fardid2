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
    public partial class Admin_MainSetting : System.Web.UI.Page
    {
        private MainSetting_Logic Logic;
        protected void Page_Load(object sender, EventArgs e)
        {
            Logic = new MainSetting_Logic();
            if (!IsPostBack)
            {
                var model = Logic.GetMainSetting();
                TextBox_Email.Text = model.Email;
                TextBox_Eng.Text = model.Eng_Address;
                TextBox_Facebook.Text = model.FaceBook;
                TextBox_Insta.Text = model.Instagram;
                TextBox_Linkedin.Text = model.Linkedin;
                TextBox_per.Text = model.Per_Address;
                TextBox_Phone.Text = model.PhoneNumber;
                TextBox_SEO_D.Text = model.SEO_discription;
                TextBox_SEO_K.Text = model.SEO_Keyword;
                TextBox_SiteName.Text = model.SiteName;
                TextBox_Site_D.Text = model.SiteDiscription;
                TextBox_twitter.Text = model.Twitter;
                

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            var model = new MainSettingModel();

            model.Email = TextBox_Email.Text;
            model.Eng_Address = TextBox_Eng.Text;
            model.FaceBook = TextBox_Facebook.Text;
            model.Instagram = TextBox_Insta.Text;
            model.Linkedin = TextBox_Linkedin.Text;
            model.Per_Address = TextBox_per.Text;
            model.PhoneNumber = TextBox_Phone.Text;
            model.SEO_discription = TextBox_SEO_D.Text;
            model.SEO_Keyword = TextBox_SEO_K.Text;
            model.SiteName = TextBox_SiteName.Text;
            model.SiteDiscription = TextBox_Site_D.Text;
            model.Twitter = TextBox_twitter.Text;

            Logic.UpdateMainSetting(model);


        }
    }
}