using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Logics_Layer.Models
{
    public class ServiceModel
    {
        public int S_Id { get; set; }
        public string Subject { get; set; }
        public int Background_Id { get; set; }
        public string Background_Path { get; set; }
        public string RightSub { get; set; }
        public int RightPic_Id { get; set; }
        public string RightPic_Path { get; set; }
        public int LeftPic_Id { get; set; }
        public string LeftPic_Path { get; set; }
        public string discription { get; set; }
        public int VideoBackground_Id { get; set; }
        public string VideoBackground_Path { get; set; }
        public string VideoLink { get; set; }
        public string VideoSub1 { get; set; }
        public string VideoSub2 { get; set; }
        public string SEO_Keyword { get; set; }
        public string SEO_discription { get; set; }
        public int Show { get; set; }
    }
}
