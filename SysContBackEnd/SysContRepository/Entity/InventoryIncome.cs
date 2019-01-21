using System;
using System.Collections.Generic;

namespace SysCont_Repository.Entity
{
    public partial class InventoryIncome
    {
        public InventoryIncome()
        {
            Inventory = new HashSet<Inventory>();
            InventoryIncomeDetail = new HashSet<InventoryIncomeDetail>();
        }

        public Guid Id { get; set; }
        public DateTime TransactionDate { get; set; }
        public long? Sequential { get; set; }
        public Guid? PurchaseId { get; set; }
        public Guid? InventoryTransferId { get; set; }
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

        public virtual InventoryTransfer InventoryTransfer { get; set; }
        public virtual Purchase Purchase { get; set; }
        public virtual Warehouse Warehouse { get; set; }
        public virtual ICollection<Inventory> Inventory { get; set; }
        public virtual ICollection<InventoryIncomeDetail> InventoryIncomeDetail { get; set; }
    }
}
