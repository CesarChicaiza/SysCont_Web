using System;
using System.Collections.Generic;

namespace SysCont_Repository.Entity
{
    public partial class EmployeeParent
    {
        public Guid Id { get; set; }
        public Guid EmployeeId { get; set; }
        public Guid? ParentId { get; set; }
        public int RowStatus { get; set; }
        public bool Locked { get; set; }
        public bool Required { get; set; }
        public Guid? EmployeeId1 { get; set; }
        public Guid? CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public Guid? ModifiedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public string Picture { get; set; }

        public virtual Employee Employee { get; set; }
        public virtual Employee EmployeeId1Navigation { get; set; }
        public virtual Employee Parent { get; set; }
    }
}
