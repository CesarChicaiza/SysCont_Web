using System;
using System.Collections.Generic;

namespace SysCont_Repository.Entity
{
    public partial class Campaign
    {
        public Campaign()
        {
            BusinessOpportunity = new HashSet<BusinessOpportunity>();
            CampaignMassEmail = new HashSet<CampaignMassEmail>();
            Customer = new HashSet<Customer>();
        }

        public Guid Id { get; set; }
        public string Name { get; set; }
        public DateTime? FromDate { get; set; }
        public DateTime? ToDate { get; set; }
        public Guid? CampaignTypeId { get; set; }
        public int RowStatus { get; set; }
        public bool Locked { get; set; }
        public bool Required { get; set; }
        public Guid? EmployeeId { get; set; }
        public Guid? CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public Guid? ModifiedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public string Picture { get; set; }

        public virtual CampaignType CampaignType { get; set; }
        public virtual ICollection<BusinessOpportunity> BusinessOpportunity { get; set; }
        public virtual ICollection<CampaignMassEmail> CampaignMassEmail { get; set; }
        public virtual ICollection<Customer> Customer { get; set; }
    }
}
