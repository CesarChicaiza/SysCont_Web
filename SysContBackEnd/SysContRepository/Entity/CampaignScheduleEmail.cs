using System;
using System.Collections.Generic;

namespace SysCont_Repository.Entity
{
    public partial class CampaignScheduleEmail
    {
        public CampaignScheduleEmail()
        {
            CampaignMassEmail = new HashSet<CampaignMassEmail>();
        }

        public Guid Id { get; set; }
        public DateTime? Since { get; set; }
        public DateTime? To { get; set; }
        public int? Status { get; set; }
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

        public virtual ICollection<CampaignMassEmail> CampaignMassEmail { get; set; }
    }
}
