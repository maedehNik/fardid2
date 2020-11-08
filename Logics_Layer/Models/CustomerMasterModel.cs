using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Logics_Layer.Models
{
    public class CustomerMasterModel
    {
        public List<KeyValueModel> ServiceList { get; set; }
        public MainSettingModel SiteTexts { get; set; }
        public PicsSettingModel SitePics { get; set; }
    }
}
