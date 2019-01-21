using System;
using System.Collections.Generic;

namespace SysCont_Repository.Entity
{
    public partial class ContractProgressPaymentRule
    {
        public ContractProgressPaymentRule()
        {
            SaleInvoiceProgressProcess = new HashSet<SaleInvoiceProgressProcess>();
        }

        public Guid Id { get; set; }
        public decimal AdvancePercentage { get; set; }
        public decimal InvoicePercentage { get; set; }
        public Guid ContractId { get; set; }
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
        public virtual ICollection<SaleInvoiceProgressProcess> SaleInvoiceProgressProcess { get; set; }
    }
}
