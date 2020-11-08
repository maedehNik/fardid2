using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Logics_Layer.Admin;
using Logics_Layer.Models;
using Newtonsoft.Json;

namespace Fardid
{
    public partial class Admin_PicSetting : System.Web.UI.Page
    {
        private PicsSetting_Logic logic;
        public PicsSettingModel Models;
        protected void Page_Load(object sender, EventArgs e)
        {
            logic = new PicsSetting_Logic();
            Models = logic.GetPicsSetting();

            HiddenFieldMainLogoId.Value = JsonConvert.SerializeObject(new List<UploaderModel>()
                {
                    new UploaderModel(){
                    idOfImg = Models.MainLogo_Id.ToString()
                    }
                });
            HiddenField_FoIconId.Value = JsonConvert.SerializeObject(new List<UploaderModel>()
                {
                    new UploaderModel(){
                    idOfImg = Models.FoIcon_Id.ToString()
                    }
                });
            HiddenField_FooterLogoId.Value = JsonConvert.SerializeObject(new List<UploaderModel>()
                {
                    new UploaderModel(){
                    idOfImg = Models.FooterLogo_Id.ToString()
                    }
                });
            HiddenField_MenuLogoId.Value = JsonConvert.SerializeObject(new List<UploaderModel>()
                {
                    new UploaderModel(){
                    idOfImg = Models.MenuLogo_Id.ToString()
                    }
                });
            HiddenField_VideoLogoId.Value = JsonConvert.SerializeObject(new List<UploaderModel>()
                {
                    new UploaderModel(){
                    idOfImg = Models.VideoLogo_Id.ToString()
                    }
                });
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            var model = new PicsSettingModel();
            model.FoIcon_Id = Convert.ToInt32(JsonConvert.DeserializeObject<List<UploaderModel>>(HiddenField_FoIconId.Value)[0].idOfImg);
            model.FooterLogo_Id = Convert.ToInt32(JsonConvert.DeserializeObject<List<UploaderModel>>(HiddenField_FooterLogoId.Value)[0].idOfImg);
            model.MainLogo_Id = Convert.ToInt32(JsonConvert.DeserializeObject<List<UploaderModel>>(HiddenFieldMainLogoId.Value)[0].idOfImg);
            model.MenuLogo_Id = Convert.ToInt32(JsonConvert.DeserializeObject<List<UploaderModel>>(HiddenField_MenuLogoId.Value)[0].idOfImg);
            model.VideoLogo_Id = Convert.ToInt32(JsonConvert.DeserializeObject<List<UploaderModel>>(HiddenField_VideoLogoId.Value)[0].idOfImg);

            logic.UpdatePicsSetting(model);
        }
    }
}