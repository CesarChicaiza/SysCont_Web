using System;
using System.Collections.Generic;

namespace SysCont_Repository.Entity
{
    public partial class PurchaseInvoice
    {
        public PurchaseInvoice()
        {
            PurchaseInvoiceLine = new HashSet<PurchaseInvoiceLine>();
            PurchaseInvoicePayment = new HashSet<PurchaseInvoicePayment>();
            PurchaseInvoiceTax = new HashSet<PurchaseInvoiceTax>();
            RetentionVoucher = new HashSet<RetentionVoucher>();
        }

        public Guid Id { get; set; }
        public string Batch { get; set; }
        public DateTime Date { get; set; }
        public decimal TotalAmountWithoutTaxes { get; set; }
        public decimal DiscountAmount { get; set; }
        public decimal TaxAmount { get; set; }
        public decimal TipAmount { get; set; }
        public decimal TotalAmount { get; set; }
        public string CurrencyCode { get; set; }
        public string CurrencyName { get; set; }
        public string SupplierName { get; set; }
        public string SupplierLegalIdTypeCode { get; set; }
        public string SupplierLegalId { get; set; }
        public string SupplierAddress { get; set; }
        public string SupplierPhone { get; set; }
        public string SupplierEmail { get; set; }
        public string Number { get; set; }
        public string DocumentNumber { get; set; }
        public string Informative1 { get; set; }
        public string Informative2 { get; set; }
        public string Informative3 { get; set; }
        public string Informative4 { get; set; }
        public string Informative5 { get; set; }
        public string Informative6 { get; set; }
        public string Informative7 { get; set; }
        public string Informative8 { get; set; }
        public string Informative9 { get; set; }
        public string Informative10 { get; set; }
        public string Informative11 { get; set; }
        public string Informative12 { get; set; }
        public string Informative13 { get; set; }
        public string Informative14 { get; set; }
        public string Informative15 { get; set; }
        public Guid PurchaseId { get; set; }
        public int RowStatus { get; set; }
        public bool Locked { get; set; }
        public bool Required { get; set; }
        public Guid? EmployeeId { get; set; }
        public Guid? CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public Guid? ModifiedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public string Picture { get; set; }

        public virtual Purchase Purchase { get; set; }
        public virtual ICollection<PurchaseInvoiceLine> PurchaseInvoiceLine { get; set; }
        public virtual ICollection<PurchaseInvoicePayment> PurchaseInvoicePayment { get; set; }
        public virtual ICollection<PurchaseInvoiceTax> PurchaseInvoiceTax { get; set; }
        public virtual ICollection<RetentionVoucher> RetentionVoucher { get; set; }
    }
}
