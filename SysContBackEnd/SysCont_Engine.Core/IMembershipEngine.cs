using SysCont_Framework.EventHandler;
using System;
using System.Collections.Generic;
using System.Text;

namespace SysCont_Engine.Core
{
    public interface IMembershipEngine
    {
        OperationResult<bool> ResetPasswordRequest(string email);
        OperationResult<bool> ResetPasswordConfirm(string email, string token, string newPassword, string confirmNewPassword);
        //OperationResult<int> ChangePassword(string currentPassword, string newPassword, string confirmPassword);
    }
}
