using System;
using System.Collections.Generic;

namespace SysCont_Repository.Entity
{
    public partial class ActivityParticipant
    {
        public Guid Id { get; set; }
        public bool? Mandatory { get; set; }
        public Guid? ActivityId { get; set; }
        public Guid? EntityId { get; set; }
        public Guid? ExternalId { get; set; }
        public bool? Attendance { get; set; }
        public int RowStatus { get; set; }
        public bool Locked { get; set; }
        public bool Required { get; set; }
        public Guid? EmployeeId { get; set; }
        public Guid? CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public Guid? ModifiedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public string Picture { get; set; }

        public virtual Activity Activity { get; set; }
    }
}
