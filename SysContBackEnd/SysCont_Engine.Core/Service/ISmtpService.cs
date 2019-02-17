using System;
using System.Collections.Generic;
using System.Net.Mail;
using System.Text;

namespace SysCont_Engine.Core.Service
{
    public interface ISmtpService
    {
        bool Send(MailMessage mailMessage);
    }
}
