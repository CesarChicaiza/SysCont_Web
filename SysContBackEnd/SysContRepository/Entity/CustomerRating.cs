using SysCont_Repository.Entity.Sales.Customer;
using System;
using System.Collections.Generic;

namespace SysCont_Repository.Entity
{
    public partial class CustomerRating
    {
        public CustomerRating()
        {
            BusinessItemDiscount = new HashSet<BusinessItemDiscount>();
            BusinessItemVariationDiscount = new HashSet<BusinessItemVariationDiscount>();
            Customer = new HashSet<CustomerEntity>();
        }

        public Guid Id { get; set; }
        public string Name { get; set; }
        public int RowStatus { get; set; }
        public bool Locked { get; set; }
        public bool Required { get; set; }
        public Guid? EmployeeId { get; set; }
        public Guid? CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public Guid? ModifiedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public string Picture { get; set; }

        public virtual ICollection<BusinessItemDiscount> BusinessItemDiscount { get; set; }
        public virtual ICollection<BusinessItemVariationDiscount> BusinessItemVariationDiscount { get; set; }
        public virtual ICollection<CustomerEntity> Customer { get; set; }
    }
}
