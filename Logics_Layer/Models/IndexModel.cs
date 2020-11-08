using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Logics_Layer.Models
{
    public class IndexModel
    {
        public List<PicModel> Sliders { get; set; }
        public List<PortfolioModel> portfolios { get; set; }
        public List<PicModel> Clients { get; set; }
        public MainVideoModel mainVideo { get; set; }
    }
}
