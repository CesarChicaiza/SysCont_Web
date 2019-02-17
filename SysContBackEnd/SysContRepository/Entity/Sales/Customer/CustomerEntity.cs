using SysCont_Repository.Entity.Catalogs;
using SysCont_Repository.Entity.Sales.Sale;
using System;
using System.Collections.Generic;

namespace SysCont_Repository.Entity.Sales.Customer
{
    public partial class CustomerEntity
    {
        public CustomerEntity()
        {
            BusinessOpportunity = new HashSet<BusinessOpportunity>();
            CustomerAddress = new HashSet<CustomerAddress>();
            CustomerComunicationOption = new HashSet<CustomerComunicationOption>();
            CustomerContact = new HashSet<CustomerContact>();
            CustomerLabel = new HashSet<CustomerLabel>();
            CustomerPaymentOption = new HashSet<CustomerPaymentOption>();
            InverseParent = new HashSet<CustomerEntity>();
            Sale = new HashSet<SaleEntity>();
            Service = new HashSet<Service>();
        }

        public Guid Id { get; set; }
        public Guid? ParentId { get; set; }
        public Guid? LegalIdTypeId { get; set; }
        public string LegalId { get; set; }
        public string Photo { get; set; }
        public Guid? SalutationId { get; set; }
        public Guid? GenderId { get; set; }
        public string Name1 { get; set; }
        public string Name2 { get; set; }
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
        public Guid? TerritoryId { get; set; }
        public Guid? IndustryId { get; set; }
        public Guid? CustomerTypeId { get; set; }
        public Guid? CustomerRelationshipTypeId { get; set; }
        public Guid? SourceChannelId { get; set; }
        public Guid? CampaignId { get; set; }
        public Guid? LanguageId { get; set; }
        public Guid CustomerRatingId { get; set; }
        public Guid CustomerClassId { get; set; }
        public int RowStatus { get; set; }
        public bool Locked { get; set; }
        public bool Required { get; set; }
        public Guid? EmployeeId { get; set; }
        public Guid? CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public Guid? ModifiedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public string Picture { get; set; }

        public virtual Campaign Campaign { get; set; }
        public virtual CustomerClass CustomerClass { get; set; }
        public virtual CustomerRating CustomerRating { get; set; }
        public virtual CustomerRelationshipType CustomerRelationshipType { get; set; }
        public virtual CustomerType CustomerType { get; set; }
        public virtual Employee Employee { get; set; }
        public virtual Gender Gender { get; set; }
        public virtual Industry Industry { get; set; }
        public virtual Language Language { get; set; }
        public virtual LegalIdTypEntity LegalIdType { get; set; }
        public virtual CustomerEntity Parent { get; set; }
        public virtual Salutation Salutation { get; set; }
        public virtual SourceChannel SourceChannel { get; set; }
        public virtual Territory Territory { get; set; }
        public virtual ICollection<BusinessOpportunity> BusinessOpportunity { get; set; }
        public virtual ICollection<CustomerAddress> CustomerAddress { get; set; }
        public virtual ICollection<CustomerComunicationOption> CustomerComunicationOption { get; set; }
        public virtual ICollection<CustomerContact> CustomerContact { get; set; }
        public virtual ICollection<CustomerLabel> CustomerLabel { get; set; }
        public virtual ICollection<CustomerPaymentOption> CustomerPaymentOption { get; set; }
        public virtual ICollection<CustomerEntity> InverseParent { get; set; }
        public virtual ICollection<SaleEntity> Sale { get; set; }
        public virtual ICollection<Service> Service { get; set; }
    }
}
