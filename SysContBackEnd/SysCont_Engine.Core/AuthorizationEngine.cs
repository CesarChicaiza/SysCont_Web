using SysCont_Framework.Configuration;
using SysCont_Framework.EventHandler;
using SysCont_Repository.Core;
using SysCont_Repository.Core.Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SysCont_Engine.Core
{
    public class AuthorizationEngine : IAuthorizationEngine
    {

        private readonly IRepository<Membership> membershipRepository;

        public AuthorizationEngine(IRepository<Membership> membershipRepository)
        {
            this.membershipRepository = membershipRepository;
        }

        public OperationResult<Context> Tokenize(Guid membershipId, Guid companyId)
        {
            try
            {
                if (Guid.Equals(membershipId, Guid.Empty) || Guid.Equals(companyId, Guid.Empty))
                    return OperationResult<Context>.CreateFailure("Access denied.");

                Context context = new Context
                {
                    Company = companyId,
                    User = membershipId,
                    Valid = true,
                };

                return OperationResult<Context>.CreateSuccessResult(context);

                //EncryptionManager encryptionManager = new EncryptionManager();
                //string token = encryptionManager.Encrypt(context.ToJsonString());


                //var sb = new StringBuilder();
                //var bytes = Encoding.Unicode.GetBytes(token);
                //foreach (var t in bytes)
                //{
                //    sb.Append(t.ToString("X2"));
                //}

                //token = sb.ToString();
            }
            catch (Exception e)
            {
                return OperationResult<Context>.CreateFailure("Hubo un inconveniente al autenticar. Espera un momento y vuelve a intentarlo");
            }

        }

        public OperationResult<bool> ValidateToken(string email, string token)
        {
            try
            {
                var membership = membershipRepository.Get(x => x.Email == email).FirstOrDefault();

                //Validate token expiration
                if (DateTime.Now > membership.TokenExpirationDate)
                    return OperationResult<bool>.CreateFailure("Ha excedido el tiempo. Vuelva a intentarlo.");

                //Validate token
                if (membership.ResetPasswordToken == token)
                    return OperationResult<bool>.CreateSuccessResult(true);


                return OperationResult<bool>.CreateFailure("Acceso incorrecto.");
            }
            catch (Exception e)
            {
                return OperationResult<bool>.CreateFailure("No fue posible validar el token.");
            }
        }

    }
}
