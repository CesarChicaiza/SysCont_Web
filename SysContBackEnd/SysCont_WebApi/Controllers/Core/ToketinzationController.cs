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
    [Route("api/Toketinzation")]
    public class ToketinzationController : Controller
    {
        private readonly IAuthorizationEngine authorizationEngine;

        public ToketinzationController(IAuthorizationEngine authorizationEngine)
        {
            this.authorizationEngine = authorizationEngine;
        }

        [HttpGet]
        public ApiResult<token> Authenticate(Guid membership, Guid company)
        {
            var data = authorizationEngine.Tokenize(membership, company);

            token token = new token
            {
                id1 = data.Result.User,
                id2 = data.Result.Company
            };


            return new ApiResult<token>
            {
                result = token,
                success = data.Success,
                message = data.NonSuccessMessage
            };
        }
    }
}