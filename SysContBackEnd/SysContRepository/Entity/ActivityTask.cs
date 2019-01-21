using System;
using System.Collections.Generic;

namespace SysCont_Repository.Entity
{
    public partial class ActivityTask
    {
        public Guid Id { get; set; }
        public string Description { get; set; }
        public DateTime? DueDate { get; set; }
        public string Responsible { get; set; }
        public bool? Done { get; set; }
        public Guid? ActivityTopicId { get; set; }
        public int RowStatus { get; set; }
        public bool Locked { get; set; }
        public bool Required { get; set; }
        public Guid? EmployeeId { get; set; }
        public Guid? CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public Guid? ModifiedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public string Picture { get; set; }

        public virtual ActivityTopic ActivityTopic { get; set; }
    }
}
