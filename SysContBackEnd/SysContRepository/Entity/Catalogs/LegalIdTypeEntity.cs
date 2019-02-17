using System;
using System.Collections.Generic;
using SysCont_Framework.DataAccess;

namespace SysCont_Repository.Entity.Catalogs
{
    public partial class LegalIdTypEntity:EntityBase
    {
        public LegalIdTypEntity()
        {
            //Customer = new HashSet<Customer>();
        }

        public string Code { get; set; }
        public string Name { get; set; }

        //public virtual ICollection<Customer> Customer { get; set; }
    }
}
