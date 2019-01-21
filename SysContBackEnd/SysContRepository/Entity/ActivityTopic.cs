using System;
using System.Collections.Generic;

namespace SysCont_Repository.Entity
{
    public partial class ActivityTopic
    {
        public ActivityTopic()
        {
            ActivityTask = new HashSet<ActivityTask>();
        }

        public Guid Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public bool? Accomplished { get; set; }
        public bool? Successful { get; set; }
        public string Comments { get; set; }
        public Guid? ActivityId { get; set; }
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
        public virtual ICollection<ActivityTask> ActivityTask { get; set; }
    }
}
