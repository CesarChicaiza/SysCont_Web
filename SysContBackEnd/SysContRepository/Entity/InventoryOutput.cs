using System;
using System.Collections.Generic;

namespace SysCont_Repository.Entity
{
    public partial class InventoryOutput
    {
        public InventoryOutput()
        {
            Inventory = new HashSet<Inventory>();
            InventoryOutputDetail = new HashSet<InventoryOutputDetail>();
            RemissionGuide = new HashSet<RemissionGuide>();
        }

        public Guid Id { get; set; }
        public DateTime TransactionDate { get; set; }
        public long? Sequential { get; set; }
        public Guid? SaleInvoiceId { get; set; }
        public Guid WarehouseId { get; set; }
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
        public virtual Warehouse Warehouse { get; set; }
        public virtual ICollection<Inventory> Inventory { get; set; }
        public virtual ICollection<InventoryOutputDetail> InventoryOutputDetail { get; set; }
        public virtual ICollection<RemissionGuide> RemissionGuide { get; set; }
    }
}
