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
    public partial class AdminLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Label1.Text = "";
            Label2.Text = "";
            Label3.Text = "";

            Login_Logic login_Logic = new Login_Logic();


            string s = TextBox1.Text;
            string s2 = TextBox2.Text;
            if (s != "" && s2 != "")
            {
                var admin = login_Logic.CheckAdmin(s, s2);
                if (admin.A_Id != 0)
                {
                    Session["Admin_Id"] = admin.A_Id;
                    Session["Admin_Name"] = admin.Name;
                    Session["Admin_Family"] = admin.Family;
                    Session["Admin_Email"] = admin.Email;
                    Session["Admin_Phone"] = admin.PhoneNum;
                    Session["Admin_Pic"] = admin.ProfilePic_Path;
                    Response.Redirect("/Admin_Index.aspx");
                }
                else
                {
                    Label1.Text = "نام کاربری یا رمز عبور اشتباه است !";
                }
            }else
            {
                if(s=="")
                {
                    Label2.Text = "نام کاربری را وارد کنید";
                }
                if (s2 == "")
                {
                    Label3.Text = "رمز عبور را وارد کنید";
                }
            }

        }
    }
}