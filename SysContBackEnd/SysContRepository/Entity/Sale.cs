using System;
using System.Collections.Generic;

namespace SysCont_Repository.Entity
{
    public partial class Sale
    {
        public Sale()
        {
            Contract = new HashSet<Contract>();
            Purchase = new HashSet<Purchase>();
            SaleInvoice = new HashSet<SaleInvoice>();
            SaleItem = new HashSet<SaleItem>();
        }

        public Guid Id { get; set; }
        public DateTime Date { get; set; }
        public long? Number { get; set; }
        public decimal? Discount { get; set; }
        public decimal? Subtotal { get; set; }
        public decimal? Total { get; set; }
        public decimal? Tip { get; set; }
        public string Comments { get; set; }
        public Guid CustomerId { get; set; }
        public Guid? BusinessOpportunityId { get; set; }
        public Guid? CampaignId { get; set; }
        public Guid? SalePlaceId { get; set; }
        public int RowStatus { get; set; }
        public bool Locked { get; set; }
        public bool Required { get; set; }
        public Guid? EmployeeId { get; set; }
        public Guid? CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public Guid? ModifiedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public string Picture { get; set; }

        public virtual Customer Customer { get; set; }
        public virtual Employee Employee { get; set; }
        public virtual SalePlace SalePlace { get; set; }
        public virtual ICollection<Contract> Contract { get; set; }
        public virtual ICollection<Purchase> Purchase { get; set; }
        public virtual ICollection<SaleInvoice> SaleInvoice { get; set; }
        public virtual ICollection<SaleItem> SaleItem { get; set; }
    }
}
