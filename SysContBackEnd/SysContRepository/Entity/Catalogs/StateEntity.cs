using System;
using SysCont_Framework.DataAccess;
using System.Collections.Generic;

namespace SysCont_Repository.Entity.Catalogs
{
    public partial class StateEntity:EntityBase
    {
        public StateEntity()
        {
            //City = new HashSet<CityEntity>();
        }

        public string Name { get; set; }
        public Guid? CountryId { get; set; }
      
        public virtual CountryEntity Country { get; set; }
        //public virtual ICollection<CityEntity> City { get; set; }
    }
}
