using System;
using System.Collections.Generic;

namespace SysCont_Repository.Entity
{
    public partial class Driver
    {
        public Driver()
        {
            RemissionGuide = new HashSet<RemissionGuide>();
        }

        public Guid Id { get; set; }
        public string Name { get; set; }
        public string Phone { get; set; }
        public Guid? LegalIdTypeId { get; set; }
        public string LegalId { get; set; }
        public int RowStatus { get; set; }
        public bool Locked { get; set; }
        public bool Required { get; set; }
        public Guid? EmployeeId { get; set; }
        public Guid? CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public Guid? ModifiedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public string Picture { get; set; }

        public virtual ICollection<RemissionGuide> RemissionGuide { get; set; }
    }
}
