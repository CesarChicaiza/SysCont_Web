using System;
using System.Collections.Generic;
using System.Text;

namespace SysCont_Engine.Core.Service
{
    public interface ISecurityService
    {
        string GenerateRandomCode();
    }
}
