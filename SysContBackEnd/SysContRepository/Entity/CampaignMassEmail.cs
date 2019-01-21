using System;
using System.Collections.Generic;

namespace SysCont_Repository.Entity
{
    public partial class CampaignMassEmail
    {
        public Guid Id { get; set; }
        public DateTime? Total { get; set; }
        public DateTime? Date { get; set; }
        public int? Opens { get; set; }
        public int? Clicks { get; set; }
        public int? Rebounds { get; set; }
        public int? Delivers { get; set; }
        public bool? Active { get; set; }
        public Guid? EmailTemplateId { get; set; }
        public Guid? CampaignScheduleEmailId { get; set; }
        public Guid? CampaignId { get; set; }
        public Guid? CampaignSegmentId { get; set; }
        public int RowStatus { get; set; }
        public bool Locked { get; set; }
        public bool Required { get; set; }
        public Guid? EmployeeId { get; set; }
        public Guid? CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public Guid? ModifiedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public string Picture { get; set; }

        public virtual Campaign Campaign { get; set; }
        public virtual CampaignScheduleEmail CampaignScheduleEmail { get; set; }
        public virtual CampaignSegment CampaignSegment { get; set; }
    }
}
