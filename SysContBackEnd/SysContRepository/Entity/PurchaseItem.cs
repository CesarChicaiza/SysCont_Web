using System;
using System.Collections.Generic;

namespace SysCont_Repository.Entity
{
    public partial class PurchaseItem
    {
        public Guid Id { get; set; }
        public string BusinessItemVariationName { get; set; }
        public decimal Quantity { get; set; }
        public decimal? UnitDiscount { get; set; }
        public decimal? UnitPrice { get; set; }
        public decimal? TotalPrice { get; set; }
        public Guid PurchaseId { get; set; }
        public Guid BusinessItemVariationId { get; set; }
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
        public virtual Purchase Purchase { get; set; }
    }
}
