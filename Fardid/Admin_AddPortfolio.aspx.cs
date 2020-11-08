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
    public partial class addportfolio : System.Web.UI.Page
    {
        private AddPortfolio_Logic Logic;
        public PortfolioModel model;
        protected void Page_Load(object sender, EventArgs e)
        {
            Logic = new AddPortfolio_Logic();

            if (!IsPostBack && Request["Type"] == "Edit")
            {
                int Id = Convert.ToInt32(Request["Id"]);
                model = Logic.GetPortfolio(Id);
                TextBox_discription.Text = model.Discription;
                TextBox_BackGround.Value = JsonConvert.SerializeObject(new List<UploaderModel>()
                {
                    new UploaderModel(){
                    idOfImg = model.Background_Id.ToString()
                    }
                });
                TextBox_Logo.Value = JsonConvert.SerializeObject(new List<UploaderModel>()
                {
                    new UploaderModel(){
                    idOfImg = model.Log_Id.ToString()
                    }
                });
                TextBox_SEO_D.Text = model.SEO_discription;
                TextBox_SEO_K.Text = model.SEO_Keyword;
                TextBox_Subject.Text = model.Subject;

                if (model.Show == 1)
                {
                    CheckBox_Show.Checked = true;
                }
            }
            else
            {
                model = new PortfolioModel()
                {
                    Logo_Path = "",
                    Background_Path = ""
                };
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            var model = new PortfolioModel();


            model.Discription = TextBox_discription.Text;
            model.Background_Id = Convert.ToInt32(JsonConvert.DeserializeObject<List<UploaderModel>>(TextBox_BackGround.Value)[0].idOfImg);
            model.Log_Id = Convert.ToInt32(JsonConvert.DeserializeObject<List<UploaderModel>>(TextBox_Logo.Value)[0].idOfImg);
            model.SEO_discription = TextBox_SEO_D.Text;
            model.SEO_Keyword = TextBox_SEO_K.Text;
            model.Subject = TextBox_Subject.Text;
            if (CheckBox_Show.Checked)
            {
                model.Show = 1;
            }
            else
            {
                model.Show = 0;
            }

            if (Request["Type"] == "Edit")
            {
                int Id = Convert.ToInt32(Request["Id"]);
                model.PortfolioId = Id;
                Logic.UpdatePorufolio(model);
                string myScriptValue = " swal(' با موفقیت ثبت شد!', status, 'success').then(function (e) {console.log('1'); ";
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "myScriptName", myScriptValue, true);
                Response.Redirect("/Admin_Portfolio.aspx");
            }
            else
            {
                model.PortfolioId = 0;
                Logic.AddPorufolio(model);
                string myScriptValue = " swal(' با موفقیت ثبت شد!', status, 'success').then(function (e) {console.log('1'); ";
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "myScriptName", myScriptValue, true);
                Response.Redirect("/Admin_Portfolio.aspx");
            }



        }
    }
}