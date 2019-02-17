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
    [Route("api/Authentication")]
    public class AuthenticationController : Controller
    {
        private readonly IAuthenticationEngine authenticationEngine;

        public AuthenticationController(IAuthenticationEngine authenticationEngine)
        {
            this.authenticationEngine = authenticationEngine;
        }



        [HttpGet]
        public ApiResult<contextSelector> Validate(string username, string password)
        {


            var data = authenticationEngine.CheckUserCredential(username, password);
            contextSelector contextSelector = new contextSelector();

            if (data.Success)
            {
                contextSelector.user = data.Result.Id;
                foreach (var item in data.Result.CompanyAllocations)
                {
                    var company = new company
                    {
                        id = item.Company_Id,
                        servidor = item.Company.ConnectionString,
                        name = item.Company.Name
                    };

                    contextSelector.companies.Add(company);
                }

            }

            return new ApiResult<contextSelector>
            {
                result = contextSelector,
                success = data.Success,
                message = data.NonSuccessMessage
            };


        }
    }
}