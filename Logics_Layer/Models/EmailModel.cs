using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Logics_Layer.Models
{
    public class EmailModel
    {
        public int Num { get; set; }
        public int EmailId { get; set; }
        public string Email { get; set; }
        public int Active { get; set; }
        public string Date { get; set; }
    }
}
