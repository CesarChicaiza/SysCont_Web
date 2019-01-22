using System;
using System.Collections.Generic;

namespace SysCont_Repository.Entity
{
    public partial class SaleInvoice
    {
        public SaleInvoice()
        {
            Inventory = new HashSet<Inventory>();
            InventoryOutput = new HashSet<InventoryOutput>();
            SaleInvoiceLine = new HashSet<SaleInvoiceLine>();
            SaleInvoicePayment = new HashSet<SaleInvoicePayment>();
            SaleInvoiceTax = new HashSet<SaleInvoiceTax>();
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
        public string CustomerName { get; set; }
        public string CustomerLegalIdTypeCode { get; set; }
        public string CustomerLegalId { get; set; }
        public string CustomerBillingAddress { get; set; }
        public string CustomerShippingAddress { get; set; }
        public string CustomerPhone { get; set; }
        public string CustomerEmail { get; set; }
        public string Number { get; set; }
        public string DocumentNumber { get; set; }
        public string CompanyLegalId { get; set; }
        public string CompanyName1 { get; set; }
        public string CompanyName2 { get; set; }
        public string CompanyTaxPayerId { get; set; }
        public string CompanyAddress { get; set; }
        public string CompanyPhone { get; set; }
        public string CompanyAccountingRequired { get; set; }
        public string CompanyPlaceCode { get; set; }
        public string CompanyPlaceAddress { get; set; }
        public string CompanyPlacePhone { get; set; }
        public string CompanyPointOfSaleCode { get; set; }
        public long? ContractNumber { get; set; }
        public string ContractPhysicalNumber { get; set; }
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
        public Guid SaleId { get; set; }
        public Guid? SaleInvoiceRecurrentProcessId { get; set; }
        public Guid CompanyEmissionPointId { get; set; }
        public string Xml { get; set; }
        public string KeyAccess { get; set; }
        public string VoucherStatus { get; set; }
        public string VoucherMessages { get; set; }
        public DateTime? AuthorizationDate { get; set; }
        public int RowStatus { get; set; }
        public bool Locked { get; set; }
        public bool Required { get; set; }
        public Guid? EmployeeId { get; set; }
        public Guid? CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public Guid? ModifiedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public string Picture { get; set; }

        public virtual CompanyEmissionPointEntity CompanyEmissionPoint { get; set; }
        public virtual Sale Sale { get; set; }
        public virtual SaleInvoiceRecurrentProcess SaleInvoiceRecurrentProcess { get; set; }
        public virtual ICollection<Inventory> Inventory { get; set; }
        public virtual ICollection<InventoryOutput> InventoryOutput { get; set; }
        public virtual ICollection<SaleInvoiceLine> SaleInvoiceLine { get; set; }
        public virtual ICollection<SaleInvoicePayment> SaleInvoicePayment { get; set; }
        public virtual ICollection<SaleInvoiceTax> SaleInvoiceTax { get; set; }
    }
}
