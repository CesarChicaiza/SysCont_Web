using System;
using System.Collections.Generic;

namespace SysCont_Repository.Entity
{
    public partial class BusinessItem
    {
        public BusinessItem()
        {
            BusinessItemDiscount = new HashSet<BusinessItemDiscount>();
            BusinessItemVariation = new HashSet<BusinessItemVariation>();
        }

        public Guid Id { get; set; }
        public string Name { get; set; }
        public string ShortDescription { get; set; }
        public string FullDescription { get; set; }
        public string Code { get; set; }
        public bool? EcommercePublished { get; set; }
        public bool? EcommerceShowOnHomePage { get; set; }
        public bool CanBuy { get; set; }
        public bool CanSell { get; set; }
        public bool CanManufacture { get; set; }
        public bool CanConsume { get; set; }
        public Guid BusinessItemCategoryId { get; set; }
        public Guid BusinessItemTypeId { get; set; }
        public Guid BusinessItemClassId { get; set; }
        public string Warranty { get; set; }
        public int RowStatus { get; set; }
        public bool Locked { get; set; }
        public bool Required { get; set; }
        public Guid? EmployeeId { get; set; }
        public Guid? CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public Guid? ModifiedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public string Picture { get; set; }

        public virtual BusinessItemCategory BusinessItemCategory { get; set; }
        public virtual BusinessItemClass BusinessItemClass { get; set; }
        public virtual BusinessItemType BusinessItemType { get; set; }
        public virtual ICollection<BusinessItemDiscount> BusinessItemDiscount { get; set; }
        public virtual ICollection<BusinessItemVariation> BusinessItemVariation { get; set; }
    }
}
