using System;
using System.Collections.Generic;

namespace SysCont_Repository.Entity
{
    public partial class Supplier
    {
        public Supplier()
        {
            Purchase = new HashSet<Purchase>();
            SupplierPaymentOption = new HashSet<SupplierPaymentOption>();
        }

        public Guid Id { get; set; }
        public string Name1 { get; set; }
        public string Name2 { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public string Address { get; set; }
        public string Code { get; set; }
        public Guid? LegalIdTypeId { get; set; }
        public string LegalId { get; set; }
        public int RowStatus { get; set; }
        public bool Locked { get; set; }
        public bool Required { get; set; }
        public Guid? EmployeeId { get; set; }
        public Guid? CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public Guid? ModifiedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public string Picture { get; set; }

        public virtual ICollection<Purchase> Purchase { get; set; }
        public virtual ICollection<SupplierPaymentOption> SupplierPaymentOption { get; set; }
    }
}
