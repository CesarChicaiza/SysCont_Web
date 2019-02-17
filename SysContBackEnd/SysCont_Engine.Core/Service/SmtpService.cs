using System;
using System.Collections.Generic;
using System.Configuration;
using System.Net;
using System.Net.Mail;
using System.Text;

namespace SysCont_Engine.Core.Service
{
    public class SmtpService : ISmtpService
    {

        public bool Send(MailMessage mailMessage)
        {
            SmtpClient client = new SmtpClient();
            client.Port = Convert.ToInt32(ConfigurationManager.AppSettings["SmtpPort"]);
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.UseDefaultCredentials = false;
            client.Host = ConfigurationManager.AppSettings["SmtpHost"];
            client.Credentials = new NetworkCredential(ConfigurationManager.AppSettings["SmtpEmail"], ConfigurationManager.AppSettings["SmtpPassword"]);
            client.EnableSsl = true;

            client.Send(mailMessage);
            return true;
        }
    }
}
