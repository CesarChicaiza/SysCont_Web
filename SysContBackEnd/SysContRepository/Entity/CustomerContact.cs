using SysCont_Repository.Entity.Sales.Customer;
using System;
using System.Collections.Generic;

namespace SysCont_Repository.Entity
{
    public partial class CustomerContact
    {
        public CustomerContact()
        {
            BusinessOpportunity = new HashSet<BusinessOpportunity>();
        }

        public Guid Id { get; set; }
        public Guid? ContactDepartmentId { get; set; }
        public string JobTitle { get; set; }
        public string Name { get; set; }
        public bool? Influencer { get; set; }
        public bool? DecisionMaker { get; set; }
        public DateTime? Start { get; set; }
        public DateTime? End { get; set; }
        public bool Main { get; set; }
        public Guid CustomerId { get; set; }
        public Guid ContactId { get; set; }
        public int RowStatus { get; set; }
        public bool Locked { get; set; }
        public bool Required { get; set; }
        public Guid? EmployeeId { get; set; }
        public Guid? CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public Guid? ModifiedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public string Picture { get; set; }

        public virtual Contact Contact { get; set; }
        public virtual ContactDepartment ContactDepartment { get; set; }
        public virtual CustomerEntity Customer { get; set; }
        public virtual ICollection<BusinessOpportunity> BusinessOpportunity { get; set; }
    }
}
