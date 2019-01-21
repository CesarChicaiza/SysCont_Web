using System;
using System.Collections.Generic;

namespace SysCont_Repository.Entity
{
    public partial class RetentionVoucherLine
    {
        public Guid Id { get; set; }
        public string Number { get; set; }
        public DateTime? EmissionDate { get; set; }
        public decimal? TaxAmount { get; set; }
        public decimal? TaxPorcentage { get; set; }
        public decimal? TotalTaxAmount { get; set; }
        public Guid TaxRetentionId { get; set; }
        public Guid RetentionVoucherId { get; set; }
        public int RowStatus { get; set; }
        public bool Locked { get; set; }
        public bool Required { get; set; }
        public Guid? EmployeeId { get; set; }
        public Guid? CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public Guid? ModifiedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public string Picture { get; set; }

        public virtual RetentionVoucher RetentionVoucher { get; set; }
        public virtual TaxRetention TaxRetention { get; set; }
    }
}
