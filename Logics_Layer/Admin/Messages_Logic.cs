using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DB_Connect;
using Logics_Layer.Models;
using Logics_Layer.Other;

namespace Logics_Layer.Admin
{
    public class Messages_Logic:PDBC
    {
        public List<MessageModel> GetMessages()
        {
            List<MessageModel> Models = new List<MessageModel>();

            base.Connect();
            DataTable dt = base.Select("SELECT [M_Id],[Name],[Subject],[EmailAddress],[Date],[Message],[Answered],[Seen],[AnswerMessage] FROM [tbl_Message] ORDER BY([Date])DESC");
            base.DC();

            for (int i = 0; i < dt.Rows.Count; i++)
            {
                var model = new MessageModel()
                {
                    Num = i + 1,
                    M_Id= Convert.ToInt32(dt.Rows[i]["M_Id"]),
                    Answere = dt.Rows[i]["AnswerMessage"].ToString(),
                    Answered = Convert.ToInt32(dt.Rows[i]["Answered"]),
                    Date =Statics.DateReturner( dt.Rows[i]["Date"].ToString(), "ShortDate"),
                    Name = dt.Rows[i]["Name"].ToString(),
                    Seen = Convert.ToInt32(dt.Rows[i]["Seen"]),
                    Subject = dt.Rows[i]["Subject"].ToString(),
                    Email = dt.Rows[i]["EmailAddress"].ToString(),
                    Message= dt.Rows[i]["Message"].ToString()
                };
                Models.Add(model);
            }

            return Models;
        }

        public string AnswereMessage(int MessageId,string Answere)
        {
            string s = "";
            base.Connect();
            List<ExcParameters> parss = new List<ExcParameters>();
            ExcParameters par = new ExcParameters
            {
                _KEY = "@M_Id",
                _VALUE = MessageId
            };
            parss.Add(par);

            par = new ExcParameters
            {
                _KEY = "@Answer",
                _VALUE = Answere
            };
            parss.Add(par);

            DataTable dt = base.Select("SELECT [EmailAddress] FROM [tbl_Message] WHERE M_Id= @M_Id",parss);
            if (dt.Rows.Count != 0)
            {
                s += base.Script("UPDATE [tbl_Message] SET [Answered] =1 ,[AnswerMessage] = @Answer WHERE M_Id=@M_Id",parss);

            }
            base.DC();
            if(s=="1")
            {
                return "Success";
            }else
            {
                return "fail";
            }
        }

        public string SeenMessage(int MessageId)
        {
            string s = "";
            base.Connect();
            List<ExcParameters> parss = new List<ExcParameters>();
            ExcParameters par = new ExcParameters
            {
                _KEY = "@M_Id",
                _VALUE = MessageId
            };
            parss.Add(par);

            DataTable dt = base.Select("SELECT [Name] FROM [tbl_Message] WHERE M_Id= @M_Id",parss);
            if (dt.Rows.Count != 0)
            {
                s += base.Script("UPDATE [tbl_Message] SET [Seen] =1 WHERE M_Id=@M_Id", parss);
            }

            if (s == "1")
            {
                return "Success";
            }
            else
            {
                return "fail";
            }
        }


    }
}
