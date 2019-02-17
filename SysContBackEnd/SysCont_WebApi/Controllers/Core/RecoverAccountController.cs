using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using SysCont_Engine.Core;
using SysCont_Framework.Http;
using SysCont_WebApi.Model.Core;

namespace SysCont_WebApi.Controllers.Core
{
    [Produces("application/json")]
    [Route("api/RecoverAccount")]
    public class RecoverAccountController : Controller
    {
        private readonly IMembershipEngine membershipEngine;
        private readonly IAuthorizationEngine authorizationEngine;

        public RecoverAccountController(IMembershipEngine membershipEngine, IAuthorizationEngine authorizationEngine)
        {
            this.membershipEngine = membershipEngine;
            this.authorizationEngine = authorizationEngine;
        }

        [HttpGet]
        public ApiResult<bool> RecoverPasswordRequest(string username)
        {
            var result = membershipEngine.ResetPasswordRequest(username);

            return new ApiResult<bool>
            {
                message = result.NonSuccessMessage,
                result = result.Result,
                success = result.Success,
            };
        }

        [HttpPost]
        public ApiResult<bool> RecoverPasswordValidateToken([FromBody] recoverPassword recoverPassword)
        {
            var result = authorizationEngine.ValidateToken(recoverPassword.username, recoverPassword.token);
            var changePasswordResult = membershipEngine.ResetPasswordConfirm(recoverPassword.username, recoverPassword.token, recoverPassword.newPassword, recoverPassword.newPassword);

            return new ApiResult<bool>
            {
                message = changePasswordResult.NonSuccessMessage,
                result = changePasswordResult.Result,
                success = changePasswordResult.Success,
            };
        }
    }
}