using System;
using System.Collections.Generic;

namespace SysCont_Repository.Entity
{
    public partial class Role
    {
        public Role()
        {
            Employee = new HashSet<Employee>();
            Permission = new HashSet<Permission>();
        }

        public Guid Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string HomePage { get; set; }
        public bool? IsMain { get; set; }
        public bool? IsDefault { get; set; }
        public int RowStatus { get; set; }
        public bool Locked { get; set; }
        public bool Required { get; set; }
        public Guid? EmployeeId { get; set; }
        public Guid? CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public Guid? ModifiedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public string Picture { get; set; }

        public virtual ICollection<Employee> Employee { get; set; }
        public virtual ICollection<Permission> Permission { get; set; }
    }
}
