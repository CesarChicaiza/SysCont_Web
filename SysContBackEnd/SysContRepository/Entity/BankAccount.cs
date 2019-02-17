using SysCont_Repository.Entity.Company;
using System;
using System.Collections.Generic;

namespace SysCont_Repository.Entity
{
    public partial class BankAccount
    {
        public BankAccount()
        {
            BankAccountMovement = new HashSet<BankAccountMovement>();
        }

        public Guid Id { get; set; }
        public string Number { get; set; }
        public decimal Total { get; set; }
        public Guid BankId { get; set; }
        public Guid CompanyId { get; set; }
        public Guid BankAccountTypeId { get; set; }
        public int RowStatus { get; set; }
        public bool Locked { get; set; }
        public bool Required { get; set; }
        public Guid? EmployeeId { get; set; }
        public Guid? CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public Guid? ModifiedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public string Picture { get; set; }

        public virtual Bank Bank { get; set; }
        public virtual BankAccountType BankAccountType { get; set; }
        public virtual CompanyEntity Company { get; set; }
        public virtual ICollection<BankAccountMovement> BankAccountMovement { get; set; }
    }
}
