using Logics_Layer.Admin;
using MD.PersianDateTime;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace Fardid.Admin_Ajax
{
    /// <summary>
    /// Summary description for fileUploader
    /// </summary>
    public class fileUploader : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            //try
            //{

            PersianDateTime PDT = new PersianDateTime(DateTime.Now);
            string AbsolutePath = HttpContext.Current.Server.MapPath(Path.Combine($"~/uploads/{PDT.Year}/{PDT.Month}/{PDT.Day}"));
            if (!Directory.Exists(AbsolutePath))
            {
                Directory.CreateDirectory(AbsolutePath);
            }
            string name = context.Request.Form["name"];
            string lable = context.Request["lable"];
            string desc = context.Request["desc"];
            string webFileAddress = "";
            foreach (string s in context.Request.Files)
            {
                HttpPostedFile file = context.Request.Files[s];
                string fileName = file.FileName;
                string fileExtension = file.ContentType;

                if (!string.IsNullOrEmpty(fileName))
                {
                    string EX = Path.GetExtension(file.FileName);
                    string FileNAME = name.Replace(" ", "-") + DateTime.Now.Ticks.ToString() + EX;
                    string address = HttpContext.Current.Server.MapPath(Path.Combine($"~/uploads/{PDT.Year}/{PDT.Month}/{PDT.Day}", FileNAME));
                    webFileAddress = $"/uploads/{PDT.Year}/{PDT.Month}/{PDT.Day}/{FileNAME}";
                    AbsolutePath = address;
                    file.SaveAs(address);
                }
            }
            ad_LogicUploader up = new ad_LogicUploader();
            bool stat = up.saveIMG(name, lable, desc, webFileAddress, AbsolutePath);
            if (stat)
            {
                context.Response.Write("با موفقیت ثبت شد!");
            }
            else
            {
                context.Response.Write("عدم توانایی در ثبت عکس با پشتیبانی تماس حاصل فرمایید!");

            }
            //  database record update logic here  ()
            //}
            //catch (Exception ac)
            //{

            //}
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}