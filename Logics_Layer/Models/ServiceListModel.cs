using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Logics_Layer.Models
{
    public class ServiceListModel
    {
        public int Num { get; set; }
        public int S_Id { get; set; }
        public string Subject { get; set; }
        public int ShowMenu { get; set; }
        public int Deleted { get; set; }
        public int Active { get; set; }
    }
}
