using System;
using System.Collections.Generic;
using System.Text;

namespace SysCont_Framework.Configuration
{
    public class Context
    {
        public Guid User { get; set; }
        public Guid Company { get; set; }
        public string Tenant { get; set; }
        public bool Valid { get; set; }
    }
}
