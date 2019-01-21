using System;
using System.Collections.Generic;

namespace SysCont_Repository.Entity
{
    public partial class SaleInvoiceTax
    {
        public Guid Id { get; set; }
        public string Name { get; set; }
        public string Code { get; set; }
        public string PercentageCode { get; set; }
        public decimal Percentage { get; set; }
        public decimal TaxableAmount { get; set; }
        public decimal TaxAmount { get; set; }
        public Guid SaleInvoiceId { get; set; }
        public Guid TaxId { get; set; }
        public int RowStatus { get; set; }
        public bool Locked { get; set; }
        public bool Required { get; set; }
        public Guid? EmployeeId { get; set; }
        public Guid? CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public Guid? ModifiedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public string Picture { get; set; }

        public virtual SaleInvoice SaleInvoice { get; set; }
        public virtual Tax Tax { get; set; }
    }
}
