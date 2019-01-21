using System;
using System.Collections.Generic;

namespace SysCont_Repository.Entity
{
    public partial class City
    {
        public City()
        {
            CompanyPlace = new HashSet<CompanyPlace>();
            ContactAddress = new HashSet<ContactAddress>();
            CustomerAddress = new HashSet<CustomerAddress>();
        }

        public Guid Id { get; set; }
        public string Name { get; set; }
        public Guid? StateId { get; set; }
        public int RowStatus { get; set; }
        public bool Locked { get; set; }
        public bool Required { get; set; }
        public Guid? EmployeeId { get; set; }
        public Guid? CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public Guid? ModifiedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public string Picture { get; set; }

        public virtual Employee Employee { get; set; }
        public virtual State State { get; set; }
        public virtual ICollection<CompanyPlace> CompanyPlace { get; set; }
        public virtual ICollection<ContactAddress> ContactAddress { get; set; }
        public virtual ICollection<CustomerAddress> CustomerAddress { get; set; }
    }
}
