using System;
using System.Collections.Generic;

namespace SysCont_Repository.Entity
{
    public partial class MassiveEmail
    {
        public Guid Id { get; set; }
        public string Name { get; set; }
        public Guid CustomerSegmentsId { get; set; }
        public Guid MassiveEmailStateId { get; set; }
        public string Subject { get; set; }
        public string Title { get; set; }
        public string Image { get; set; }
        public string Text { get; set; }
        public string Signature { get; set; }
        public DateTime? SendDate { get; set; }
        public int? Received { get; set; }
        public int? Read { get; set; }
        public int? Opened { get; set; }
        public int? Rejected { get; set; }
        public int RowStatus { get; set; }
        public bool Locked { get; set; }
        public bool Required { get; set; }
        public Guid? EmployeeId { get; set; }
        public Guid? CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public Guid? ModifiedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public string Picture { get; set; }

        public virtual CustomerSegments CustomerSegments { get; set; }
        public virtual MassiveEmailState MassiveEmailState { get; set; }
    }
}
