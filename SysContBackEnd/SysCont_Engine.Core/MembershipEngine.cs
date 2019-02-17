using SysCont_Engine.Core.Service;
using SysCont_Framework.EventHandler;
using SysCont_Repository.Core;
using SysCont_Repository.Core.Entity;
using System;
using System.Configuration;
using System.Linq;
using System.Net.Mail;

namespace SysCont_Engine.Core
{
    public class MembershipEngine : IMembershipEngine
    {
        private readonly IRepository<Membership> membershipRepository;
        private readonly ISmtpService smtpService;
        private readonly ISecurityService securityService;


        public MembershipEngine(IRepository<Membership> membershipRepository, ISmtpService smtpService, ISecurityService securityService)
        {
            this.membershipRepository = membershipRepository;
            this.smtpService = smtpService;
            this.securityService = securityService;
        }

        public OperationResult<bool> ResetPasswordRequest(string email)
        {
            try
            {
                var membership = membershipRepository.Get(x => x.Email == email).FirstOrDefault();
                if (membership != null)
                {

                    membership.ResetPasswordToken = securityService.GenerateRandomCode();
                    membership.TokenExpirationDate = DateTime.Now.AddMinutes(5);

                    membershipRepository.Update(membership);

                    MailMessage mailMessage = new MailMessage(ConfigurationManager.AppSettings["SmtpEmail"], membership.Email);
                    mailMessage.IsBodyHtml = true;
                    mailMessage.Priority = MailPriority.High;
                    mailMessage.Subject = "Recuperación de contraseña";
                    mailMessage.Body = string.Format("Código de recuperación: <strong>{0}<strong>", membership.ResetPasswordToken);

                    var sendResult = smtpService.Send(mailMessage);
                    if (!sendResult)
                        return OperationResult<bool>.CreateSuccessResult(false);


                    return OperationResult<bool>.CreateSuccessResult(true);
                }

                return OperationResult<bool>.CreateFailure("No fue posible recuperar la contraseña.");

            }
            catch (Exception e)
            {
                return OperationResult<bool>.CreateFailure(e);
            }

        }



        public OperationResult<bool> ResetPasswordConfirm(string email, string token, string newPassword, string confirmNewPassword)
        {
            try
            {
                var membership = membershipRepository.Get(x => x.Email == email).FirstOrDefault();

                if (membership == null)
                    return OperationResult<bool>.CreateFailure("Usuario incorrecto.");


                //Validate same password
                if (newPassword != confirmNewPassword)
                    return OperationResult<bool>.CreateFailure("Las contraseñas deben ser indénticas. Vuelve a intentarlo.");

                //Validate token expiration
                if (DateTime.Now > membership.TokenExpirationDate)
                    return OperationResult<bool>.CreateFailure("Ha excedido el tiempo");

                //Validate token
                if (membership.ResetPasswordToken != token)
                    return OperationResult<bool>.CreateFailure("Token incorrecto.");


                //Set new password
                membership.Password = newPassword;
                membership.ResetPasswordToken = string.Empty;
                membership.TokenExpirationDate = null;

                //Update password
                membershipRepository.Update(membership);
                return OperationResult<bool>.CreateSuccessResult(true);

            }
            catch (Exception e)
            {
                return OperationResult<bool>.CreateFailure("No fue posible crear la contraseña");
            }

        }

        //public OperationResult<int> ChangePassword(string currentPassword, string newPassword, string confirmPassword)
        //{
        //    try
        //    {
        //        var membership = membershipRepository.GetByID(new Guid());

        //        if (membership == null)
        //            return OperationResult<int>.CreateFailure("Usuario incorrecto");


        //        if (membership.Password != currentPassword)
        //            return OperationResult<int>.CreateFailure("Las contraseñas no coinciden.");


        //        membership.Password = newPassword;
        //        membershipRepository.Update(membership);
        //        return OperationResult<int>.CreateSuccessResult(1);



        //    }
        //    catch (Exception e)
        //    {
        //        return OperationResult<int>.CreateFailure("No fue posible cambiar la contraseña");
        //    }
        //}

    }
}
