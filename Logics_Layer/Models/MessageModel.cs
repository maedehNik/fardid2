using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Logics_Layer.Models
{
    public class MessageModel
    {
        public int Num { get; set; }
        public int M_Id { get; set; }
        public string Name { get; set; }
        public string Email { get; set; }
        public string Subject { get; set; }
        public string Message { get; set; }
        public string Date { get; set; }
        public int Seen { get; set; }
        public int Answered { get; set; }
        public string Answere { get; set; }
    }
}
