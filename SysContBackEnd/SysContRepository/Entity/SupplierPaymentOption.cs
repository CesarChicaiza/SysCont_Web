using System;
using System.Collections.Generic;

namespace SysCont_Repository.Entity
{
    public partial class SupplierPaymentOption
    {
        public SupplierPaymentOption()
        {
            PurchaseInvoicePayment = new HashSet<PurchaseInvoicePayment>();
        }

        public Guid Id { get; set; }
        public string OwnerLegalId { get; set; }
        public string OwnerName { get; set; }
        public string Number { get; set; }
        public DateTime? ExpirationDate { get; set; }
        public Guid? BankId { get; set; }
        public Guid? PaymentSubtypeId { get; set; }
        public Guid SupplierId { get; set; }
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
        public virtual PaymentSubtype PaymentSubtype { get; set; }
        public virtual Supplier Supplier { get; set; }
        public virtual ICollection<PurchaseInvoicePayment> PurchaseInvoicePayment { get; set; }
    }
}
