using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Logics_Layer.Models
{
    public class OurTeamModel
    {
        public int T_Id { get; set; }
        public int PicId { get; set; }
        public string Pic_Path { get; set; }
        public string Name { get; set; }
        public string Job { get; set; }
        public int deleted { get; set; }
        public string PicModel { get; set; }
    }
}
