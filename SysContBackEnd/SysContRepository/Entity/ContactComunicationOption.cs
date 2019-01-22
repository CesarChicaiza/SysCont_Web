﻿using System;
using System.Collections.Generic;

namespace SysCont_Repository.Entity
{
    public partial class ContactComunicationOption
    {
        public Guid Id { get; set; }
        public bool IsValid { get; set; }
        public string Value { get; set; }
        public Guid? CommunicationOptionTypeId { get; set; }
        public Guid? ContactId { get; set; }
        public int RowStatus { get; set; }
        public bool Locked { get; set; }
        public bool Required { get; set; }
        public Guid? EmployeeId { get; set; }
        public Guid? CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public Guid? ModifiedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public string Picture { get; set; }

        public virtual CommunicationOptionType CommunicationOptionType { get; set; }
        public virtual Contact Contact { get; set; }
    }
}