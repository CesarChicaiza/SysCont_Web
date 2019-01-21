using System;
using System.Collections.Generic;

namespace SysCont_Repository.Entity
{
    public partial class BankAccountMovement
    {
        public Guid Id { get; set; }
        public long? Sequential { get; set; }
        public Guid BankAccountMovementTypeId { get; set; }
        public Guid BankAccountId { get; set; }
        public Guid ResponsibleEmployeeId { get; set; }
        public DateTime TransactionDate { get; set; }
        public decimal Amount { get; set; }
        public Guid BankId { get; set; }
        public string VoucherNumber { get; set; }
        public string CheckNumber { get; set; }
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
        public virtual BankAccount BankAccount { get; set; }
        public virtual BankAccountMovementType BankAccountMovementType { get; set; }
        public virtual Employee ResponsibleEmployee { get; set; }
    }
}
