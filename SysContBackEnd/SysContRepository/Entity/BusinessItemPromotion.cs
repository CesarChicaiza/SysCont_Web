using System;
using System.Collections.Generic;

namespace SysCont_Repository.Entity
{
    public partial class BusinessItemPromotion
    {
        public Guid Id { get; set; }
        public DateTime? Start { get; set; }
        public DateTime? End { get; set; }
        public int? Type { get; set; }
        public decimal? QuantityRequired { get; set; }
        public decimal? DiscountPercentage { get; set; }
        public decimal? QuantityGift { get; set; }
        public int RowStatus { get; set; }
        public bool Locked { get; set; }
        public bool Required { get; set; }
        public Guid? EmployeeId { get; set; }
        public Guid? CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public Guid? ModifiedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public string Picture { get; set; }
    }
}
