using SysCont_Framework.EventHandler;
using SysCont_Repository.Core.Entity;
using System;
using System.Collections.Generic;
using System.Text;

namespace SysCont_Engine.Core
{
    public interface IAuthenticationEngine
    {
        OperationResult<Membership> CheckUserCredential(string username, string password);
    }
}
