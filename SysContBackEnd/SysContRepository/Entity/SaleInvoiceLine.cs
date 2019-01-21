using System;
using System.Collections.Generic;

namespace SysCont_Repository.Entity
{
    public partial class SaleInvoiceLine
    {
        public SaleInvoiceLine()
        {
            SaleInvoiceLineTax = new HashSet<SaleInvoiceLineTax>();
            Service = new HashSet<Service>();
        }

        public Guid Id { get; set; }
        public string Code1 { get; set; }
        public string Code2 { get; set; }
        public string Description { get; set; }
        public decimal Quantity { get; set; }
        public decimal UnitPrice { get; set; }
        public decimal UnitDiscount { get; set; }
        public decimal TotalPrice { get; set; }
        public Guid BusinessItemVariationId { get; set; }
        public Guid SaleInvoiceId { get; set; }
        public int RowStatus { get; set; }
        public bool Locked { get; set; }
        public bool Required { get; set; }
        public Guid? EmployeeId { get; set; }
        public Guid? CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public Guid? ModifiedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public string Picture { get; set; }

        public virtual BusinessItemVariation BusinessItemVariation { get; set; }
        public virtual SaleInvoice SaleInvoice { get; set; }
        public virtual ICollection<SaleInvoiceLineTax> SaleInvoiceLineTax { get; set; }
        public virtual ICollection<Service> Service { get; set; }
    }
}
