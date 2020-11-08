using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Logics_Layer.Customer;
using Logics_Layer.Models;

namespace Fardid
{
    public partial class ContactUs : System.Web.UI.Page
    {
        private ContactUs_Logic logic;
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            logic = new ContactUs_Logic();
            var model = new MessageModel();
            if(TextBox_Name.Text!=""&& TextBox_Email.Text != "" && TextBox_Sub.Text != "" && TextBox_Message.Text != "")
            {
                model.Name = TextBox_Name.Text;
                model.Subject = TextBox_Sub.Text;
                model.Email = TextBox_Email.Text;
                model.Message = TextBox_Message.Text;
                string s = logic.SendMessage(model);
                if(s=="Success")
                {
                    Response.Write("<script>alert('Done')</script>");
                }
            }
            else
            {
                if (TextBox_Name.Text != "")
                {
                    Label_Name.Text = "This field is required.";
                }

                if (TextBox_Email.Text != "")
                {
                    Label_Email.Text = "This field is required.";
                }

                if (TextBox_Message.Text != "")
                {
                    Label_Message.Text = "This field is required.";
                }

                if (TextBox_Sub.Text != "")
                {
                    Label_Sub.Text = "This field is required.";
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Write("<script>alert('Done')</script>");
        }
    }
}