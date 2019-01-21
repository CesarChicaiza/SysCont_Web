using System;
using System.Collections.Generic;

namespace SysCont_Repository.Entity
{
    public partial class Inventory
    {
        public Inventory()
        {
            InventoryOutputDetailInventory = new HashSet<InventoryOutputDetailInventory>();
            InventoryTransferDetailInventory = new HashSet<InventoryTransferDetailInventory>();
        }

        public Guid Id { get; set; }
        public string BusinessItemVariationName { get; set; }
        public DateTime AdmissionDate { get; set; }
        public Guid BusinessItemVariationId { get; set; }
        public decimal? Cost { get; set; }
        public decimal? SalePrice { get; set; }
        public Guid InventoryIncomeId { get; set; }
        public Guid? InventoryOutputId { get; set; }
        public Guid WarehouseId { get; set; }
        public Guid? ManufactureId { get; set; }
        public Guid? SaleInvoiceId { get; set; }
        public string Serial { get; set; }
        public string Location { get; set; }
        public DateTime? ExpirationDate { get; set; }
        public Guid InventoryStatusId { get; set; }
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
        public virtual InventoryIncome InventoryIncome { get; set; }
        public virtual InventoryOutput InventoryOutput { get; set; }
        public virtual InventoryStatus InventoryStatus { get; set; }
        public virtual Manufacture Manufacture { get; set; }
        public virtual SaleInvoice SaleInvoice { get; set; }
        public virtual Warehouse Warehouse { get; set; }
        public virtual ICollection<InventoryOutputDetailInventory> InventoryOutputDetailInventory { get; set; }
        public virtual ICollection<InventoryTransferDetailInventory> InventoryTransferDetailInventory { get; set; }
    }
}
