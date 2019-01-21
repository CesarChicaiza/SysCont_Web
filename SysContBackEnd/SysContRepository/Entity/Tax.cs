using System;
using System.Collections.Generic;

namespace SysCont_Repository.Entity
{
    public partial class Tax
    {
        public Tax()
        {
            PurchaseInvoiceLineTax = new HashSet<PurchaseInvoiceLineTax>();
            PurchaseInvoiceTax = new HashSet<PurchaseInvoiceTax>();
            SaleInvoiceLineTax = new HashSet<SaleInvoiceLineTax>();
            SaleInvoiceTax = new HashSet<SaleInvoiceTax>();
            TaxBusinessItemClass = new HashSet<TaxBusinessItemClass>();
            TaxCustomerClass = new HashSet<TaxCustomerClass>();
            TaxSupplierClass = new HashSet<TaxSupplierClass>();
        }

        public Guid Id { get; set; }
        public string Code { get; set; }
        public string PercentageCode { get; set; }
        public string Name { get; set; }
        public decimal Percentage { get; set; }
        public Guid TaxTypeId { get; set; }
        public int RowStatus { get; set; }
        public bool Locked { get; set; }
        public bool Required { get; set; }
        public Guid? EmployeeId { get; set; }
        public Guid? CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public Guid? ModifiedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public string Picture { get; set; }

        public virtual TaxType TaxType { get; set; }
        public virtual ICollection<PurchaseInvoiceLineTax> PurchaseInvoiceLineTax { get; set; }
        public virtual ICollection<PurchaseInvoiceTax> PurchaseInvoiceTax { get; set; }
        public virtual ICollection<SaleInvoiceLineTax> SaleInvoiceLineTax { get; set; }
        public virtual ICollection<SaleInvoiceTax> SaleInvoiceTax { get; set; }
        public virtual ICollection<TaxBusinessItemClass> TaxBusinessItemClass { get; set; }
        public virtual ICollection<TaxCustomerClass> TaxCustomerClass { get; set; }
        public virtual ICollection<TaxSupplierClass> TaxSupplierClass { get; set; }
    }
}
