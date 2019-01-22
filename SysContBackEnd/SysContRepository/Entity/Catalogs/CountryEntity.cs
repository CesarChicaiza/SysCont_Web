using System;
using System.Collections.Generic;

namespace SysCont_Repository.Entity.Catalogs
{
    public partial class CountryEntity:EntityBase
    {
        public CountryEntity()
        {
            /*Bank = new HashSet<Bank>();
            State = new HashSet<StateEntity>();*/
        }

        public string Name { get; set; }
        
        /*public virtual ICollection<Bank> Bank { get; set; }
        public virtual ICollection<StateEntity> State { get; set; }*/
    }
}
