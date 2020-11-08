using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Logics_Layer.Models
{
    public class PortfolioModel
    {
        public int PortfolioId { get; set; }
        public string Subject { get; set; }
        public int Background_Id { get; set; }
        public string Background_Path { get; set; }
        public int Log_Id { get; set; }
        public string Logo_Path { get; set; }
        public string Discription { get; set; }
        public string SEO_Keyword { get; set; }
        public string SEO_discription { get; set; }
        public int Show { get; set; }

    }
}
