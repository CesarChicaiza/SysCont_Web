using System;
using System.Collections.Generic;
using System.Text;

namespace SysCont_Framework.DataAccess
{
    public class EntityBase
    {
        public Guid Id { get; set; }
        public DataRowStatus RowStatus { get; set; }
        public bool Locked { get; set; }
        public bool Required { get; set; }
        public Guid? EmployeeId { get; set; }
        public Guid? CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public Guid? ModifiedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public string Picture { get; set; }
    }
}
