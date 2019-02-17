using SysCont_Repository.Entity.Sales.Customer;
using System;
using System.Collections.Generic;

namespace SysCont_Repository.Entity
{
    public partial class Service
    {
        public Service()
        {
            ServiceComment = new HashSet<ServiceComment>();
        }

        public Guid Id { get; set; }
        public long? Number { get; set; }
        public Guid ServiceTypeId { get; set; }
        public DateTime? RequestDate { get; set; }
        public DateTime? ResolutionDate { get; set; }
        public string Problem { get; set; }
        public string Resolution { get; set; }
        public Guid ServiceStatusId { get; set; }
        public Guid? ContractId { get; set; }
        public Guid ServicePriorityId { get; set; }
        public Guid CustomerId { get; set; }
        public Guid? ContactId { get; set; }
        public Guid? SaleInvoiceLineId { get; set; }
        public int RowStatus { get; set; }
        public bool Locked { get; set; }
        public bool Required { get; set; }
        public Guid? EmployeeId { get; set; }
        public Guid? CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public Guid? ModifiedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public string Picture { get; set; }

        public virtual Contact Contact { get; set; }
        public virtual Contract Contract { get; set; }
        public virtual CustomerEntity Customer { get; set; }
        public virtual Employee Employee { get; set; }
        public virtual SaleInvoiceLine SaleInvoiceLine { get; set; }
        public virtual ServicePriority ServicePriority { get; set; }
        public virtual ServiceStatus ServiceStatus { get; set; }
        public virtual ServiceType ServiceType { get; set; }
        public virtual ICollection<ServiceComment> ServiceComment { get; set; }
    }
}
