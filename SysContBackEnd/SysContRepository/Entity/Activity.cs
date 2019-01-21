using System;
using System.Collections.Generic;

namespace SysCont_Repository.Entity
{
    public partial class Activity
    {
        public Activity()
        {
            ActivityParticipant = new HashSet<ActivityParticipant>();
            ActivityTopic = new HashSet<ActivityTopic>();
        }

        public Guid Id { get; set; }
        public string Subject { get; set; }
        public DateTime? ScheduleDateFrom { get; set; }
        public DateTime? ScheduleDateTo { get; set; }
        public DateTime? RealDateFrom { get; set; }
        public DateTime? RealDateTo { get; set; }
        public string Place { get; set; }
        public Guid? ActivityStatusId { get; set; }
        public Guid? ActivityPriorityId { get; set; }
        public Guid? ActivityTypeId { get; set; }
        public Guid? ActivityPlaceTypeId { get; set; }
        public Guid? EntityId { get; set; }
        public Guid? ExternalId { get; set; }
        public string ExternalName { get; set; }
        public string Comments { get; set; }
        public int RowStatus { get; set; }
        public bool Locked { get; set; }
        public bool Required { get; set; }
        public Guid? EmployeeId { get; set; }
        public Guid? CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public Guid? ModifiedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public string Picture { get; set; }

        public virtual ActivityPlaceType ActivityPlaceType { get; set; }
        public virtual ActivityPriority ActivityPriority { get; set; }
        public virtual ActivityStatus ActivityStatus { get; set; }
        public virtual ActivityType ActivityType { get; set; }
        public virtual ICollection<ActivityParticipant> ActivityParticipant { get; set; }
        public virtual ICollection<ActivityTopic> ActivityTopic { get; set; }
    }
}
