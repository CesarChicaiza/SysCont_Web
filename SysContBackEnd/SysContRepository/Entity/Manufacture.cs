using System;
using System.Collections.Generic;

namespace SysCont_Repository.Entity
{
    public partial class Manufacture
    {
        public Manufacture()
        {
            Inventory = new HashSet<Inventory>();
            ManufactureItem = new HashSet<ManufactureItem>();
        }

        public Guid Id { get; set; }
        public Guid BusinessItemVariationId { get; set; }
        public decimal Quantity { get; set; }
        public Guid? UnitOfMeasureId { get; set; }
        public long? Batch { get; set; }
        public DateTime? Date { get; set; }
        public DateTime? StartDate { get; set; }
        public DateTime? EndDate { get; set; }
        public Guid WarehouseId { get; set; }
        public Guid ProjectId { get; set; }
        public Guid ResponsableEmployeeId { get; set; }
        public Guid ManufactureStatusId { get; set; }
        public Guid FactoryId { get; set; }
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
        public virtual Factory Factory { get; set; }
        public virtual ManufactureStatus ManufactureStatus { get; set; }
        public virtual UnitOfMeasureEntity UnitOfMeasure { get; set; }
        public virtual Warehouse Warehouse { get; set; }
        public virtual ICollection<Inventory> Inventory { get; set; }
        public virtual ICollection<ManufactureItem> ManufactureItem { get; set; }
    }
}
