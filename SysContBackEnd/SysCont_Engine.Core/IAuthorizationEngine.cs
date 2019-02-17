using SysCont_Framework.Configuration;
using SysCont_Framework.EventHandler;
using System;
using System.Collections.Generic;
using System.Text;

namespace SysCont_Engine.Core
{
    public interface IAuthorizationEngine
    {
        OperationResult<Context> Tokenize(Guid membership, Guid company);
        OperationResult<bool> ValidateToken(string email, string token);
    }
}
