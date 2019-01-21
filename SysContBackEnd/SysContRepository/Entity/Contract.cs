using System;
using System.Collections.Generic;

namespace SysCont_Repository.Entity
{
    public partial class Contract
    {
        public Contract()
        {
            ContractProgressPaymentRule = new HashSet<ContractProgressPaymentRule>();
            ContractRecurringPaymentRule = new HashSet<ContractRecurringPaymentRule>();
            Service = new HashSet<Service>();
        }

        public Guid Id { get; set; }
        public long? Number { get; set; }
        public string PhysicalNumber { get; set; }
        public string SignCustomerName { get; set; }
        public string SignCompanyName { get; set; }
        public DateTime? SigningDate { get; set; }
        public DateTime? ValidityStart { get; set; }
        public DateTime? ValidityEnd { get; set; }
        public DateTime? RealEnd { get; set; }
        public Guid? ContractEndReasonId { get; set; }
        public Guid? ContractStatusId { get; set; }
        public Guid ContractTypeId { get; set; }
        public Guid? SaleId { get; set; }
        public int RowStatus { get; set; }
        public bool Locked { get; set; }
        public bool Required { get; set; }
        public Guid? EmployeeId { get; set; }
        public Guid? CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public Guid? ModifiedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public string Picture { get; set; }

        public virtual ContractEndReason ContractEndReason { get; set; }
        public virtual ContractStatus ContractStatus { get; set; }
        public virtual ContractType ContractType { get; set; }
        public virtual Sale Sale { get; set; }
        public virtual ICollection<ContractProgressPaymentRule> ContractProgressPaymentRule { get; set; }
        public virtual ICollection<ContractRecurringPaymentRule> ContractRecurringPaymentRule { get; set; }
        public virtual ICollection<Service> Service { get; set; }
    }
}
