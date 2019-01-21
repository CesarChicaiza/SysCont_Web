using System;
using System.Collections.Generic;

namespace SysCont_Repository.Entity
{
    public partial class CompanyPlace
    {
        public CompanyPlace()
        {
            CompanyEmissionPoint = new HashSet<CompanyEmissionPoint>();
            Employee = new HashSet<Employee>();
            Factory = new HashSet<Factory>();
            Purchase = new HashSet<Purchase>();
            Warehouse = new HashSet<Warehouse>();
        }

        public Guid Id { get; set; }
        public string Code { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        public string Phone { get; set; }
        public Guid? CompanyId { get; set; }
        public Guid? CityId { get; set; }
        public int RowStatus { get; set; }
        public bool Locked { get; set; }
        public bool Required { get; set; }
        public Guid? EmployeeId { get; set; }
        public Guid? CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public Guid? ModifiedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public string Picture { get; set; }

        public virtual City City { get; set; }
        public virtual Company Company { get; set; }
        public virtual ICollection<CompanyEmissionPoint> CompanyEmissionPoint { get; set; }
        public virtual ICollection<Employee> Employee { get; set; }
        public virtual ICollection<Factory> Factory { get; set; }
        public virtual ICollection<Purchase> Purchase { get; set; }
        public virtual ICollection<Warehouse> Warehouse { get; set; }
    }
}
