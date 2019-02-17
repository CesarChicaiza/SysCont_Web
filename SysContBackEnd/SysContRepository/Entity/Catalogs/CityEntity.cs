using SysCont_Framework.DataAccess;
using System;
using System.Collections.Generic;

namespace SysCont_Repository.Entity.Catalogs
{
    public partial class CityEntity:EntityBase
    {
        public CityEntity()
        {
            /*CompanyPlace = new HashSet<CompanyPlaceEntity>();
            ContactAddress = new HashSet<ContactAddress>();
            CustomerAddress = new HashSet<CustomerAddress>();*/
        }

        public string Name { get; set; }
        public Guid? StateId { get; set; }
        
        public virtual StateEntity State { get; set; }
        /*public virtual ICollection<CompanyPlaceEntity> CompanyPlace { get; set; }
        public virtual ICollection<ContactAddress> ContactAddress { get; set; }
        public virtual ICollection<CustomerAddress> CustomerAddress { get; set; }*/
    }
}
