using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Logics_Layer.Models
{
    public class AdminModel
    {
        public int A_Id { get; set; }
        public string Name { get; set; }
        public string Family { get; set; }
        public string Email { get; set; }
        public string PhoneNum { get; set; }
        public int ProfilePic_Id { get; set; }
        public string ProfilePic_Path { get; set; }
        public string Pass { get; set; }
    }
}
