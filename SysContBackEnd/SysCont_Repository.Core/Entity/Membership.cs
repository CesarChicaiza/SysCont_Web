using SysCont_Framework.DataAccess;
using System;
using System.Collections.Generic;
using System.Text;

namespace SysCont_Repository.Core.Entity
{
    public class Membership: EntityBase
    {
        public string Name { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string Email { get; set; }
        public bool IsApproved { get; set; }
        public bool IsLockedOut { get; set; }
        public DateTime? LastLoginDate { get; set; }
        public DateTime? LastPasswordChangedDate { get; set; }
        public DateTime? LastLockoutDate { get; set; }
        public int FailedPasswordAttemptCount { get; set; }
        public string ResetPasswordToken { get; set; }
        public DateTime? TokenExpirationDate { get; set; }

        public virtual ICollection<CompanyAllocation> CompanyAllocations { get; set; }

    }
}
