using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SysCont_WebApi.Model.Core
{
    public class contextSelector
    {
        public contextSelector()
        {
            companies = new List<company>();
        }

        public Guid user { get; set; }
        public List<company> companies { get; set; }
    }
}
