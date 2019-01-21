using System;
using System.Collections.Generic;

namespace SysCont_Repository.Entity
{
    public partial class ContractRecurringPaymentRule
    {
        public Guid Id { get; set; }
        public DateTime Start { get; set; }
        public DateTime? End { get; set; }
        public Guid ContractId { get; set; }
        public Guid ContractRecurrenceTypeId { get; set; }
        public Guid CustomerPaymentOptionId { get; set; }
        public int RowStatus { get; set; }
        public bool Locked { get; set; }
        public bool Required { get; set; }
        public Guid? EmployeeId { get; set; }
        public Guid? CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public Guid? ModifiedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public string Picture { get; set; }

        public virtual Contract Contract { get; set; }
        public virtual ContractRecurrenceType ContractRecurrenceType { get; set; }
        public virtual CustomerPaymentOption CustomerPaymentOption { get; set; }
    }
}
