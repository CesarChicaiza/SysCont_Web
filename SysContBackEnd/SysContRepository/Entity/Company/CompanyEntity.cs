using System;
using System.Collections.Generic;
using SysCont_Framework.DataAccess;

namespace SysCont_Repository.Entity.Company
{
    public partial class CompanyEntity:EntityBase
    {
        public CompanyEntity()
        {
            /*BankAccount = new HashSet<BankAccount>();
            CompanyPlace = new HashSet<CompanyPlaceEntity>();*/
        }

        public string LegalId { get; set; }
        public string Name1 { get; set; }
        public string Name2 { get; set; }
        public string Address { get; set; }
        public string Phone { get; set; }
        public string SignatureName { get; set; }
        public string SignatureKey { get; set; }
        public string AccountingRequired { get; set; }
        public string SpecialContributor { get; set; }
        public string CurrencyCode { get; set; }
        public string CurrencyName { get; set; }
        public string WebSite { get; set; }
        public string Host { get; set; }
        public string SmtpHost { get; set; }
        public int? SmtpPort { get; set; }
        public bool? SmtpEnableSsl { get; set; }
        public string Image { get; set; }
        public string MainActivity { get; set; }
        public string TaxPayerId { get; set; }
        public Guid CurrencyId { get; set; }
        
        public virtual Currency Currency { get; set; }
        /*public virtual ICollection<BankAccount> BankAccount { get; set; }
        public virtual ICollection<CompanyPlaceEntity> CompanyPlace { get; set; }*/
    }
}
