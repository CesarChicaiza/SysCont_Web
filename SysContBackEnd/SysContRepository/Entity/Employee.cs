using SysCont_Repository.Entity.Catalogs;
using SysCont_Repository.Entity.Company;
using SysCont_Repository.Entity.Sales.Customer;
using SysCont_Repository.Entity.Sales.Sale;
using System;
using System.Collections.Generic;

namespace SysCont_Repository.Entity
{
    public partial class Employee
    {
        public Employee()
        {
            ActivityPriority = new HashSet<ActivityPriority>();
            ActivityStatus = new HashSet<ActivityStatus>();
            BankAccountMovement = new HashSet<BankAccountMovement>();
            BusinessOpportunity = new HashSet<BusinessOpportunity>();
            City = new HashSet<CityEntity>();
            Country = new HashSet<CountryEntity>();
            Customer = new HashSet<CustomerEntity>();
            EmployeeParentEmployee = new HashSet<EmployeeParent>();
            EmployeeParentEmployeeId1Navigation = new HashSet<EmployeeParent>();
            EmployeeParentParent = new HashSet<EmployeeParent>();
            InventoryTransferDestinyEmployee = new HashSet<InventoryTransfer>();
            InventoryTransferOriginEmployee = new HashSet<InventoryTransfer>();
            Purchase = new HashSet<Purchase>();
            Sale = new HashSet<SaleEntity>();
            Service = new HashSet<Service>();
            ServiceComment = new HashSet<ServiceComment>();
        }

        public Guid Id { get; set; }
        public string Name { get; set; }
        public string Phone { get; set; }
        public DateTime? Birth { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string Appointment { get; set; }
        public Guid? CompanyPlaceId { get; set; }
        public Guid? CompanyEmissionPointId { get; set; }
        public Guid? RoleId { get; set; }
        public int RowStatus { get; set; }
        public bool Locked { get; set; }
        public bool Required { get; set; }
        public Guid? EmployeeId { get; set; }
        public Guid? CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public Guid? ModifiedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public string Picture { get; set; }

        public virtual CompanyEmissionPointEntity CompanyEmissionPoint { get; set; }
        public virtual CompanyPlaceEntity CompanyPlace { get; set; }
        public virtual Role Role { get; set; }
        public virtual ICollection<ActivityPriority> ActivityPriority { get; set; }
        public virtual ICollection<ActivityStatus> ActivityStatus { get; set; }
        public virtual ICollection<BankAccountMovement> BankAccountMovement { get; set; }
        public virtual ICollection<BusinessOpportunity> BusinessOpportunity { get; set; }
        public virtual ICollection<CityEntity> City { get; set; }
        public virtual ICollection<CountryEntity> Country { get; set; }
        public virtual ICollection<CustomerEntity> Customer { get; set; }
        public virtual ICollection<EmployeeParent> EmployeeParentEmployee { get; set; }
        public virtual ICollection<EmployeeParent> EmployeeParentEmployeeId1Navigation { get; set; }
        public virtual ICollection<EmployeeParent> EmployeeParentParent { get; set; }
        public virtual ICollection<InventoryTransfer> InventoryTransferDestinyEmployee { get; set; }
        public virtual ICollection<InventoryTransfer> InventoryTransferOriginEmployee { get; set; }
        public virtual ICollection<Purchase> Purchase { get; set; }
        public virtual ICollection<SaleEntity> Sale { get; set; }
        public virtual ICollection<Service> Service { get; set; }
        public virtual ICollection<ServiceComment> ServiceComment { get; set; }
    }
}
