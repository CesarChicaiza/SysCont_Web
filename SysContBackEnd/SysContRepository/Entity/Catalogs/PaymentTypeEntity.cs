using System;
using System.Collections.Generic;

namespace SysCont_Repository.Entity
{
    public partial class PaymentTypeEntity:EntityBase
    {
        public PaymentTypeEntity()
        {
            //PaymentSubtype = new HashSet<PaymentSubtype>();
        }

        public string Name { get; set; }
        public string Code { get; set; }
        
        //public virtual ICollection<PaymentSubtype> PaymentSubtype { get; set; }
    }
}
