using System;
using System.Collections.Generic;

namespace SysCont_Repository.Entity
{
    public partial class RemissionGuide
    {
        public RemissionGuide()
        {
            RemissionGuideLine = new HashSet<RemissionGuideLine>();
        }

        public Guid Id { get; set; }
        public string Batch { get; set; }
        public DateTime Date { get; set; }
        public DateTime? AuthorizationDate { get; set; }
        public string CompanyLegalId { get; set; }
        public string CompanyName1 { get; set; }
        public string CompanyName2 { get; set; }
        public string CompanyTaxPayerId { get; set; }
        public string CompanyAddress { get; set; }
        public string CompanyPhone { get; set; }
        public string CompanyAccountingRequired { get; set; }
        public string CompanyPlaceCode { get; set; }
        public string CompanyPlaceAddress { get; set; }
        public string CompanyPlacePhone { get; set; }
        public string CompanyPointOfSaleCode { get; set; }
        public Guid DriverId { get; set; }
        public string DepartureAddress { get; set; }
        public DateTime DepartureDate { get; set; }
        public DateTime? ArriveDate { get; set; }
        public string VehiculeId { get; set; }
        public string Number { get; set; }
        public string DocumentNumber { get; set; }
        public string ReceiverName { get; set; }
        public string ReceiverLegalId { get; set; }
        public string ReceiverBillingAddress { get; set; }
        public string TransferReason { get; set; }
        public string Informative1 { get; set; }
        public string Informative2 { get; set; }
        public string Informative3 { get; set; }
        public string Informative4 { get; set; }
        public string Informative5 { get; set; }
        public string Informative6 { get; set; }
        public string Informative7 { get; set; }
        public string Informative8 { get; set; }
        public string Informative9 { get; set; }
        public string Informative10 { get; set; }
        public Guid? InventoryTransferId { get; set; }
        public Guid? InventoryOutputId { get; set; }
        public Guid CompanyEmissionPointId { get; set; }
        public string Xml { get; set; }
        public string KeyAccess { get; set; }
        public string VoucherStatus { get; set; }
        public string VoucherMessages { get; set; }
        public int RowStatus { get; set; }
        public bool Locked { get; set; }
        public bool Required { get; set; }
        public Guid? EmployeeId { get; set; }
        public Guid? CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public Guid? ModifiedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public string Picture { get; set; }

        public virtual CompanyEmissionPoint CompanyEmissionPoint { get; set; }
        public virtual Driver Driver { get; set; }
        public virtual InventoryOutput InventoryOutput { get; set; }
        public virtual InventoryTransfer InventoryTransfer { get; set; }
        public virtual ICollection<RemissionGuideLine> RemissionGuideLine { get; set; }
    }
}
