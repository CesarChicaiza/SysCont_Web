using System;
using System.Collections.Generic;

namespace SysCont_Repository.Entity
{
    public partial class Permission
    {
        public Guid Id { get; set; }
        public int? Create { get; set; }
        public int? Read { get; set; }
        public int? Write { get; set; }
        public int? Delete { get; set; }
        public Guid? EntityId { get; set; }
        public Guid? RoleId { get; set; }
        public int RowStatus { get; set; }
        public bool Locked { get; set; }
        public bool Required { get; set; }
        public Guid? EmployeeId { get; set; }
        public Guid? CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public Guid? ModifiedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public string Picture { get; set; }

        public virtual Role Role { get; set; }
    }
}
