using System;
using System.Collections.Generic;

namespace SysCont_Repository.Entity
{
    public partial class Warehouse
    {
        public Warehouse()
        {
            Inventory = new HashSet<Inventory>();
            InventoryIncome = new HashSet<InventoryIncome>();
            InventoryOutput = new HashSet<InventoryOutput>();
            InventoryTransferDestinyWareHouse = new HashSet<InventoryTransfer>();
            InventoryTransferOriginWarehouse = new HashSet<InventoryTransfer>();
            Manufacture = new HashSet<Manufacture>();
        }

        public Guid Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public Guid CompanyPlaceId { get; set; }
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
        public virtual ICollection<Inventory> Inventory { get; set; }
        public virtual ICollection<InventoryIncome> InventoryIncome { get; set; }
        public virtual ICollection<InventoryOutput> InventoryOutput { get; set; }
        public virtual ICollection<InventoryTransfer> InventoryTransferDestinyWareHouse { get; set; }
        public virtual ICollection<InventoryTransfer> InventoryTransferOriginWarehouse { get; set; }
        public virtual ICollection<Manufacture> Manufacture { get; set; }
    }
}
