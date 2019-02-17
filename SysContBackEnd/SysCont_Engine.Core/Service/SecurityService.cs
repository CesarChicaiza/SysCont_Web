using System;
using System.Collections.Generic;
using System.Text;

namespace SysCont_Engine.Core.Service
{
    public class SecurityService : ISecurityService
    {
        public string GenerateRandomCode()
        {
            string code = "00000000";
            for (int i = 0; i < 10000; i++)
            {
                code = new Random().Next(9999999, 999999999).ToString();
            }
            return code;
        }
    }
}
