using System;
using System.Collections.Generic;

namespace SysCont_Repository.Entity
{
    public partial class Module
    {
        public Guid Id { get; set; }
        public string Name { get; set; }
        public string Color { get; set; }
        public string Icon { get; set; }
        public string HomePage { get; set; }
        public int RowStatus { get; set; }
        public bool Locked { get; set; }
        public Guid? CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public Guid? ModifiedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
    }
}
