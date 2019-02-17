using SysCont_Framework.DataAccess;
using System;
using System.Collections.Generic;
using System.Text;

namespace SysCont_Repository.Core.Entity
{
    public class CompanyAllocation:EntityBase
    {
        public Guid Membership_Id { get; set; }
        public Guid Company_Id { get; set; }

        public virtual Membership Membership { get; set; }
        public virtual Company Company { get; set; }
    }
}
