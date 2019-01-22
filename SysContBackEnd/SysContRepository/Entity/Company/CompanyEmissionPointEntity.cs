using SysCont_Repository.Entity.Company;
using System;
using System.Collections.Generic;

namespace SysCont_Repository.Entity
{
    public partial class CompanyEmissionPointEntity:EntityBase
    {
        public CompanyEmissionPointEntity()
        {
            /*RemissionGuide = new HashSet<RemissionGuide>();
            RetentionVoucher = new HashSet<RetentionVoucher>();
            SaleInvoice = new HashSet<SaleInvoice>();*/
        }

        public string Code { get; set; }
        public string Name { get; set; }
        public long InvoiceSequential { get; set; }
        public long RemissionGuideSequential { get; set; }
        public long RetentionVoucherSequential { get; set; }
        public Guid CompanyPlaceId { get; set; }

        public virtual CompanyPlaceEntity CompanyPlace { get; set; }
        /*public virtual ICollection<RemissionGuide> RemissionGuide { get; set; }
        public virtual ICollection<RetentionVoucher> RetentionVoucher { get; set; }
        public virtual ICollection<SaleInvoice> SaleInvoice { get; set; }*/
    }
}
