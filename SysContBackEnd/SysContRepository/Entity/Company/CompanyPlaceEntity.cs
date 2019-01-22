using SysCont_Repository.Entity.Catalogs;
using System;
using System.Collections.Generic;

namespace SysCont_Repository.Entity.Company
{
    public partial class CompanyPlaceEntity:EntityBase
    {
        public CompanyPlaceEntity()
        {
            /*CompanyEmissionPoint = new HashSet<CompanyEmissionPointEntity>();
            Employee = new HashSet<Employee>();
            Factory = new HashSet<Factory>();
            Purchase = new HashSet<Purchase>();
            Warehouse = new HashSet<Warehouse>();*/
        }

        public string Code { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        public string Phone { get; set; }
        public Guid? CompanyId { get; set; }
        public Guid? CityId { get; set; }

        public virtual CityEntity City { get; set; }
        public virtual CompanyEntity Company { get; set; }
        /*public virtual ICollection<CompanyEmissionPointEntity> CompanyEmissionPoint { get; set; }
        public virtual ICollection<Factory> Factory { get; set; }
        public virtual ICollection<Purchase> Purchase { get; set; }
        public virtual ICollection<Warehouse> Warehouse { get; set; }*/
    }
}
