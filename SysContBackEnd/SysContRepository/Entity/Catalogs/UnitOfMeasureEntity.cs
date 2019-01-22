using System;
using System.Collections.Generic;

namespace SysCont_Repository.Entity.Catalogs
{
    public partial class UnitOfMeasureEntity:EntityBase
    {
        public UnitOfMeasureEntity()
        {
            /*BusinessItemVariation = new HashSet<BusinessItemVariation>();
            Manufacture = new HashSet<Manufacture>();*/
        }

        public string Name { get; set; }
        public string Abbreviation { get; set; }

        /*public virtual ICollection<BusinessItemVariation> BusinessItemVariation { get; set; }
        public virtual ICollection<Manufacture> Manufacture { get; set; }*/
    }
}
