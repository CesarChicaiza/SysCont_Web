using System;
using System.Collections.Generic;

namespace SysCont_Repository.Entity
{
    public partial class Contact
    {
        public Contact()
        {
            ContactAddress = new HashSet<ContactAddress>();
            ContactComunicationOption = new HashSet<ContactComunicationOption>();
            CustomerContact = new HashSet<CustomerContact>();
            Service = new HashSet<Service>();
        }

        public Guid Id { get; set; }
        public string LegalId { get; set; }
        public string Photo { get; set; }
        public Guid? SalutationId { get; set; }
        public Guid? GenderId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public DateTime? Birth { get; set; }
        public string Email { get; set; }
        public string Phone1 { get; set; }
        public string Phone2 { get; set; }
        public string Phone3 { get; set; }
        public bool? DoNotCall { get; set; }
        public bool? DoNotEmail { get; set; }
        public bool? DoNotSms { get; set; }
        public DateTime? LastActivity { get; set; }
        public string Description { get; set; }
        public Guid? OcupationId { get; set; }
        public Guid? SourceChannelId { get; set; }
        public Guid? ContactRatingId { get; set; }
        public Guid? LanguageId { get; set; }
        public int RowStatus { get; set; }
        public bool Locked { get; set; }
        public bool Required { get; set; }
        public Guid? EmployeeId { get; set; }
        public Guid? CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public Guid? ModifiedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public string Picture { get; set; }

        public virtual ContactRating ContactRating { get; set; }
        public virtual Gender Gender { get; set; }
        public virtual Language Language { get; set; }
        public virtual Ocupation Ocupation { get; set; }
        public virtual Salutation Salutation { get; set; }
        public virtual SourceChannel SourceChannel { get; set; }
        public virtual ICollection<ContactAddress> ContactAddress { get; set; }
        public virtual ICollection<ContactComunicationOption> ContactComunicationOption { get; set; }
        public virtual ICollection<CustomerContact> CustomerContact { get; set; }
        public virtual ICollection<Service> Service { get; set; }
    }
}
