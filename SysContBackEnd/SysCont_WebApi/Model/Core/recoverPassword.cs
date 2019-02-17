using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace SysCont_WebApi.Model.Core
{
    public class recoverPassword
    {
        public string username { get; set; }
        public string token { get; set; }
        public string newPassword { get; set; }
    }
}
