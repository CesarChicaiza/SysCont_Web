using System;
using System.Collections.Generic;

namespace SysCont_Repository.Entity
{
    public partial class ContactAddress
    {
        public Guid Id { get; set; }
        public string Address { get; set; }
        public string PostalCode { get; set; }
        public string Reference { get; set; }
        public string Coordinates { get; set; }
        public Guid? CityId { get; set; }
        public Guid? AddressTypeId { get; set; }
        public Guid? ContactId { get; set; }
        public int RowStatus { get; set; }
        public bool Locked { get; set; }
        public bool Required { get; set; }
        public Guid? EmployeeId { get; set; }
        public Guid? CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public Guid? ModifiedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public string Picture { get; set; }

        public virtual AddressType AddressType { get; set; }
        public virtual CityEntity City { get; set; }
        public virtual Contact Contact { get; set; }
    }
}
