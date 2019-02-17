using SysCont_Repository.Entity.Catalogs;
using System;
using System.Collections.Generic;

namespace SysCont_Repository.Entity
{
    public partial class Bank
    {
        public Bank()
        {
            BankAccount = new HashSet<BankAccount>();
            BankAccountMovement = new HashSet<BankAccountMovement>();
            CustomerPaymentOption = new HashSet<CustomerPaymentOption>();
            SupplierPaymentOption = new HashSet<SupplierPaymentOption>();
        }

        public Guid Id { get; set; }
        public string Code { get; set; }
        public string Name { get; set; }
        public Guid? CountryId { get; set; }
        public int RowStatus { get; set; }
        public bool Locked { get; set; }
        public bool Required { get; set; }
        public Guid? EmployeeId { get; set; }
        public Guid? CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public Guid? ModifiedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public string Picture { get; set; }

        public virtual CountryEntity Country { get; set; }
        public virtual ICollection<BankAccount> BankAccount { get; set; }
        public virtual ICollection<BankAccountMovement> BankAccountMovement { get; set; }
        public virtual ICollection<CustomerPaymentOption> CustomerPaymentOption { get; set; }
        public virtual ICollection<SupplierPaymentOption> SupplierPaymentOption { get; set; }
    }
}
