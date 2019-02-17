using System;
using System.Collections.Generic;
using System.Text;

namespace SysCont_Framework.Http
{
    public class ApiResult<TResult>
    {
        public bool success { get; set; }
        public string message { get; set; }
        public TResult result { get; set; }
    }
}
