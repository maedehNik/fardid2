using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Logics_Layer.Models;
using Logics_Layer.Admin;

namespace Fardid
{
    public partial class Admin_Messages : System.Web.UI.Page
    {
        private Messages_Logic Logic;
        public List<MessageModel> messageModels;
        protected void Page_Load(object sender, EventArgs e)
        {
            Logic = new Messages_Logic();
            messageModels = Logic.GetMessages();

            //DataList1.DataSource = messageModels;
            //DataList1.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {

        }

        protected void Unnamed_ServerClick(object sender, EventArgs e)
        {
            //LinkButton btn =(LinkButton)sender;


            //int Id = Convert.ToInt32(btn.Item_Id);
            //int index = Convert.ToInt32(btn.RowNum) - 1;
            //Logic.SeenMessage(Id);
            //var model = messageModels[index];
            //if (Id == model.M_Id)
            //{
            //    TextBoxModalName.Text = model.Name;
            //    TextBoxModalMail.Text = model.Email;
            //    TextBoxModelSub.Text = model.Subject;
            //    TextBox1.Text = model.Message;
            //}
            //else
            //{
            //    foreach (var item in messageModels)
            //    {
            //        if (item.M_Id == Id)
            //        {
            //            model = item;
            //            TextBoxModalName.Text = model.Name;
            //            TextBoxModalMail.Text = model.Email;
            //            TextBoxModelSub.Text = model.Subject;
            //            TextBox1.Text = model.Message;
            //        }

            //    }
            //}

            //Page.ClientScript.RegisterStartupScript(GetType(), "modelBox", "$('#view-message').modal('show');", true);
        }
    }
}