using System;
using System.Collections.Generic;

namespace SysCont_Repository.Entity
{
    public partial class InventoryTransfer
    {
        public InventoryTransfer()
        {
            InventoryIncome = new HashSet<InventoryIncome>();
            InventoryTransferDetail = new HashSet<InventoryTransferDetail>();
            RemissionGuide = new HashSet<RemissionGuide>();
        }

        public Guid Id { get; set; }
        public long? Sequential { get; set; }
        public DateTime? OutputDate { get; set; }
        public Guid OriginEmployeeId { get; set; }
        public Guid DestinyEmployeeId { get; set; }
        public Guid OriginWarehouseId { get; set; }
        public Guid DestinyWareHouseId { get; set; }
        public Guid InventoryTransferReasonId { get; set; }
        public Guid InventoryTransferStatusId { get; set; }
        public int RowStatus { get; set; }
        public bool Locked { get; set; }
        public bool Required { get; set; }
        public Guid? EmployeeId { get; set; }
        public Guid? CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public Guid? ModifiedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public string Picture { get; set; }

        public virtual Employee DestinyEmployee { get; set; }
        public virtual Warehouse DestinyWareHouse { get; set; }
        public virtual InventoryTransferReason InventoryTransferReason { get; set; }
        public virtual InventoryTransferStatus InventoryTransferStatus { get; set; }
        public virtual Employee OriginEmployee { get; set; }
        public virtual Warehouse OriginWarehouse { get; set; }
        public virtual ICollection<InventoryIncome> InventoryIncome { get; set; }
        public virtual ICollection<InventoryTransferDetail> InventoryTransferDetail { get; set; }
        public virtual ICollection<RemissionGuide> RemissionGuide { get; set; }
    }
}
