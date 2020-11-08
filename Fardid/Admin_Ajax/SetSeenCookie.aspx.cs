using MD.PersianDateTime;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Logics_Layer.Customer;
using System.Net;

namespace Fardid.Admin_Ajax
{
    public partial class SetSeenCookie : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var logic = new SeenCookie();
            if (Request["Cookie"] != null )
            {
                string s = Request["Cookie"];
                
                if(logic.CheckCookie(s))
                {
                    Response.Write("Seen");
                }
                else
                {
                    Response.Write(logic.GetSeenCookie(Dns.GetHostByName(Dns.GetHostName()).AddressList[0].ToString()));
                }

                
            }

        }
    }
}