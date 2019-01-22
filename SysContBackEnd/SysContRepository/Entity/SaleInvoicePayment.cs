﻿using System;
using System.Collections.Generic;

namespace SysCont_Repository.Entity
{
    public partial class SaleInvoicePayment
    {
        public Guid Id { get; set; }
        public DateTime Date { get; set; }
        public string OwnerLegalId { get; set; }
        public string OwnerName { get; set; }
        public DateTime? ExpirationDate { get; set; }
        public string BankCode { get; set; }
        public string BankName { get; set; }
        public string Number { get; set; }
        public string CustomerLegalId { get; set; }
        public string CustomerName { get; set; }
        public bool AutomaticDebit { get; set; }
        public decimal Amount { get; set; }
        public bool Confirmed { get; set; }
        public string Comment { get; set; }
        public Guid SaleInvoiceId { get; set; }
        public Guid? CustomerPaymentOptionId { get; set; }
        public int RowStatus { get; set; }
        public bool Locked { get; set; }
        public bool Required { get; set; }
        public Guid? EmployeeId { get; set; }
        public Guid? CreatedBy { get; set; }
        public DateTime? CreatedDate { get; set; }
        public Guid? ModifiedBy { get; set; }
        public DateTime? ModifiedDate { get; set; }
        public string Picture { get; set; }

        public virtual CustomerPaymentOption CustomerPaymentOption { get; set; }
        public virtual SaleInvoice SaleInvoice { get; set; }
    }
}