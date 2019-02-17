using SysCont_Framework.EventHandler;
using SysCont_Repository.Core;
using SysCont_Repository.Core.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SysCont_Engine.Core
{
    public class WebAuthenticationEngine : IAuthenticationEngine
    {
        private readonly IRepository<Membership> membershipRepository;

        public WebAuthenticationEngine(IRepository<Membership> membershipRepository)
        {
            this.membershipRepository = membershipRepository;
        }

        public OperationResult<Membership> CheckUserCredential(string email, string password)
        {
            try
            {
                var membership = membershipRepository.Get(x => x.Email == email).FirstOrDefault();

                if (membership != null && membership.Password == password)
                    return OperationResult<Membership>.CreateSuccessResult(membership);
                else
                    return OperationResult<Membership>.CreateFailure("Credenciales incorrectas.");

            }
            catch (Exception e)
            {
                return OperationResult<Membership>.CreateFailure("No fue posible verificar las credenciales.");
            }

        }




    }
}
