using SysCont_Repository.Entity.Catalogs;
using System;
using System.Collections.Generic;

namespace SysCont_Repository.Entity
{
    public partial class BusinessItemVariation
    {
        public BusinessItemVariation()
        {
            BusinessItemVariationDiscount = new HashSet<BusinessItemVariationDiscount>();
            BusinessOpportunityItem = new HashSet<BusinessOpportunityItem>();
            Inventory = new HashSet<Inventory>();
            InventoryIncomeDetail = new HashSet<InventoryIncomeDetail>();
            InventoryOutputDetail = new HashSet<InventoryOutputDetail>();
            InventoryTransferDetail = new HashSet<InventoryTransferDetail>();
            Manufacture = new HashSet<Manufacture>();
            ManufactureItem = new HashSet<ManufactureItem>();
            PurchaseInvoiceLine = new HashSet<PurchaseInvoiceLine>();
            PurchaseItem = new HashSet<PurchaseItem>();
            RemissionGuideLine = new HashSet<RemissionGuideLine>();
            SaleInvoiceLine = new HashSet<SaleInvoiceLine>();
            SaleItem = new HashSet<SaleItem>();
        }

        public Guid Id { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }
        public string ShortDescription { get; set; }
        public string FullDescription { get; set; }
        public string Code { get; set; }
        public bool? EcommercePublished { get; set; }
        public bool? EcommerceShowOnHomePage { get; set; }
        public decimal Stock { get; set; }
        public Guid BusinessItemId { get; set; }
        public Guid? UnitOfMeasureId { get; set; }
        public int RowStatus { get; set; }
        public bool Locked { get; set; }
        public bool Required { get; set; }
        public Guid? EmployeeId { get; set; }
        public Guid? CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public Guid? ModifiedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public string Picture { get; set; }

        public virtual BusinessItem BusinessItem { get; set; }
        public virtual UnitOfMeasureEntity UnitOfMeasure { get; set; }
        public virtual ICollection<BusinessItemVariationDiscount> BusinessItemVariationDiscount { get; set; }
        public virtual ICollection<BusinessOpportunityItem> BusinessOpportunityItem { get; set; }
        public virtual ICollection<Inventory> Inventory { get; set; }
        public virtual ICollection<InventoryIncomeDetail> InventoryIncomeDetail { get; set; }
        public virtual ICollection<InventoryOutputDetail> InventoryOutputDetail { get; set; }
        public virtual ICollection<InventoryTransferDetail> InventoryTransferDetail { get; set; }
        public virtual ICollection<Manufacture> Manufacture { get; set; }
        public virtual ICollection<ManufactureItem> ManufactureItem { get; set; }
        public virtual ICollection<PurchaseInvoiceLine> PurchaseInvoiceLine { get; set; }
        public virtual ICollection<PurchaseItem> PurchaseItem { get; set; }
        public virtual ICollection<RemissionGuideLine> RemissionGuideLine { get; set; }
        public virtual ICollection<SaleInvoiceLine> SaleInvoiceLine { get; set; }
        public virtual ICollection<SaleItem> SaleItem { get; set; }
    }
}
