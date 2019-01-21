using System;
using System.Collections.Generic;

namespace SysCont_Repository.Entity
{
    public partial class CustomerSegments
    {
        public CustomerSegments()
        {
            MassiveEmail = new HashSet<MassiveEmail>();
        }

        public Guid Id { get; set; }
        public string Name { get; set; }
        public decimal? Ammount { get; set; }
        public DateTime? Date { get; set; }
        public string GenderList { get; set; }
        public string CitiesList { get; set; }
        public string LanguagesList { get; set; }
        public string OpportunityStateList { get; set; }
        public string ContractStateList { get; set; }
        public int RowStatus { get; set; }
        public bool Locked { get; set; }
        public bool Required { get; set; }
        public Guid? EmployeeId { get; set; }
        public Guid? CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public Guid? ModifiedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public string Picture { get; set; }

        public virtual ICollection<MassiveEmail> MassiveEmail { get; set; }
    }
}
