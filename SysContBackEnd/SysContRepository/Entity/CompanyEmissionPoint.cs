using System;
using System.Collections.Generic;

namespace SysCont_Repository.Entity
{
    public partial class CompanyEmissionPoint
    {
        public CompanyEmissionPoint()
        {
            Employee = new HashSet<Employee>();
            RemissionGuide = new HashSet<RemissionGuide>();
            RetentionVoucher = new HashSet<RetentionVoucher>();
            SaleInvoice = new HashSet<SaleInvoice>();
        }

        public Guid Id { get; set; }
        public string Code { get; set; }
        public string Name { get; set; }
        public long InvoiceSequential { get; set; }
        public long RemissionGuideSequential { get; set; }
        public long RetentionVoucherSequential { get; set; }
        public Guid CompanyPlaceId { get; set; }
        public int RowStatus { get; set; }
        public bool Locked { get; set; }
        public bool Required { get; set; }
        public Guid? EmployeeId { get; set; }
        public Guid? CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public Guid? ModifiedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public string Picture { get; set; }

        public virtual CompanyPlace CompanyPlace { get; set; }
        public virtual ICollection<Employee> Employee { get; set; }
        public virtual ICollection<RemissionGuide> RemissionGuide { get; set; }
        public virtual ICollection<RetentionVoucher> RetentionVoucher { get; set; }
        public virtual ICollection<SaleInvoice> SaleInvoice { get; set; }
    }
}
