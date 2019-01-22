using System;
using System.Collections.Generic;

namespace SysCont_Repository.Entity
{
    public partial class Purchase
    {
        public Purchase()
        {
            InventoryIncome = new HashSet<InventoryIncome>();
            PurchaseInvoice = new HashSet<PurchaseInvoice>();
            PurchaseItem = new HashSet<PurchaseItem>();
        }

        public Guid Id { get; set; }
        public DateTime Date { get; set; }
        public long? Sequential { get; set; }
        public Guid PurchaseStatusId { get; set; }
        public decimal? Subtotal { get; set; }
        public decimal? Total { get; set; }
        public Guid SupplierId { get; set; }
        public Guid CompanyPlaceId { get; set; }
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

        public virtual CompanyPlaceEntity CompanyPlace { get; set; }
        public virtual Employee Employee { get; set; }
        public virtual PurchaseStatus PurchaseStatus { get; set; }
        public virtual Sale Sale { get; set; }
        public virtual Supplier Supplier { get; set; }
        public virtual ICollection<InventoryIncome> InventoryIncome { get; set; }
        public virtual ICollection<PurchaseInvoice> PurchaseInvoice { get; set; }
        public virtual ICollection<PurchaseItem> PurchaseItem { get; set; }
    }
}
