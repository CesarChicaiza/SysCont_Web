using System;
using System.Collections.Generic;

namespace SysCont_Repository.Entity
{
    public partial class BusinessOpportunity
    {
        public BusinessOpportunity()
        {
            BusinessOpportunityItem = new HashSet<BusinessOpportunityItem>();
        }

        public Guid Id { get; set; }
        public DateTime Date { get; set; }
        public DateTime DateClosing { get; set; }
        public long? Number { get; set; }
        public string Description { get; set; }
        public decimal? Discount { get; set; }
        public decimal? Subtotal { get; set; }
        public decimal? Total { get; set; }
        public Guid? BusinessOpportunityStateId { get; set; }
        public Guid? BusinessOpportunityLossReasonId { get; set; }
        public string ImplementationTime { get; set; }
        public string Comments { get; set; }
        public Guid CustomerId { get; set; }
        public Guid? CampaignId { get; set; }
        public Guid? SourceChannelId { get; set; }
        public Guid? CustomerContactId { get; set; }
        public int RowStatus { get; set; }
        public bool Locked { get; set; }
        public bool Required { get; set; }
        public Guid? EmployeeId { get; set; }
        public Guid? CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public Guid? ModifiedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public string Picture { get; set; }

        public virtual BusinessOpportunityLossReason BusinessOpportunityLossReason { get; set; }
        public virtual BusinessOpportunityState BusinessOpportunityState { get; set; }
        public virtual Campaign Campaign { get; set; }
        public virtual Customer Customer { get; set; }
        public virtual CustomerContact CustomerContact { get; set; }
        public virtual Employee Employee { get; set; }
        public virtual SourceChannel SourceChannel { get; set; }
        public virtual ICollection<BusinessOpportunityItem> BusinessOpportunityItem { get; set; }
    }
}
