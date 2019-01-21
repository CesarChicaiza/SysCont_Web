using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace SysCont_Repository.Entity
{
    public partial class SysCont_CompanyContext : DbContext
    {
        public SysCont_CompanyContext()
        {
        }

        public SysCont_CompanyContext(DbContextOptions<SysCont_CompanyContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Account> Account { get; set; }
        public virtual DbSet<AccountType> AccountType { get; set; }
        public virtual DbSet<Activity> Activity { get; set; }
        public virtual DbSet<ActivityParticipant> ActivityParticipant { get; set; }
        public virtual DbSet<ActivityPlaceType> ActivityPlaceType { get; set; }
        public virtual DbSet<ActivityPriority> ActivityPriority { get; set; }
        public virtual DbSet<ActivityStatus> ActivityStatus { get; set; }
        public virtual DbSet<ActivityTask> ActivityTask { get; set; }
        public virtual DbSet<ActivityTopic> ActivityTopic { get; set; }
        public virtual DbSet<ActivityType> ActivityType { get; set; }
        public virtual DbSet<AddressType> AddressType { get; set; }
        public virtual DbSet<Bank> Bank { get; set; }
        public virtual DbSet<BankAccount> BankAccount { get; set; }
        public virtual DbSet<BankAccountMovement> BankAccountMovement { get; set; }
        public virtual DbSet<BankAccountMovementType> BankAccountMovementType { get; set; }
        public virtual DbSet<BankAccountType> BankAccountType { get; set; }
        public virtual DbSet<BusinessItem> BusinessItem { get; set; }
        public virtual DbSet<BusinessItemCategory> BusinessItemCategory { get; set; }
        public virtual DbSet<BusinessItemClass> BusinessItemClass { get; set; }
        public virtual DbSet<BusinessItemDiscount> BusinessItemDiscount { get; set; }
        public virtual DbSet<BusinessItemPromotion> BusinessItemPromotion { get; set; }
        public virtual DbSet<BusinessItemType> BusinessItemType { get; set; }
        public virtual DbSet<BusinessItemVariation> BusinessItemVariation { get; set; }
        public virtual DbSet<BusinessItemVariationDiscount> BusinessItemVariationDiscount { get; set; }
        public virtual DbSet<BusinessOpportunity> BusinessOpportunity { get; set; }
        public virtual DbSet<BusinessOpportunityItem> BusinessOpportunityItem { get; set; }
        public virtual DbSet<BusinessOpportunityLossReason> BusinessOpportunityLossReason { get; set; }
        public virtual DbSet<BusinessOpportunityState> BusinessOpportunityState { get; set; }
        public virtual DbSet<Campaign> Campaign { get; set; }
        public virtual DbSet<CampaignMassEmail> CampaignMassEmail { get; set; }
        public virtual DbSet<CampaignScheduleEmail> CampaignScheduleEmail { get; set; }
        public virtual DbSet<CampaignSegment> CampaignSegment { get; set; }
        public virtual DbSet<CampaignType> CampaignType { get; set; }
        public virtual DbSet<City> City { get; set; }
        public virtual DbSet<CommunicationOptionType> CommunicationOptionType { get; set; }
        public virtual DbSet<Company> Company { get; set; }
        public virtual DbSet<CompanyEmissionPoint> CompanyEmissionPoint { get; set; }
        public virtual DbSet<CompanyPlace> CompanyPlace { get; set; }
        public virtual DbSet<Contact> Contact { get; set; }
        public virtual DbSet<ContactAddress> ContactAddress { get; set; }
        public virtual DbSet<ContactComunicationOption> ContactComunicationOption { get; set; }
        public virtual DbSet<ContactDepartment> ContactDepartment { get; set; }
        public virtual DbSet<ContactRating> ContactRating { get; set; }
        public virtual DbSet<Contract> Contract { get; set; }
        public virtual DbSet<ContractEndReason> ContractEndReason { get; set; }
        public virtual DbSet<ContractProgressPaymentRule> ContractProgressPaymentRule { get; set; }
        public virtual DbSet<ContractRecurrenceType> ContractRecurrenceType { get; set; }
        public virtual DbSet<ContractRecurringPaymentRule> ContractRecurringPaymentRule { get; set; }
        public virtual DbSet<ContractStatus> ContractStatus { get; set; }
        public virtual DbSet<ContractType> ContractType { get; set; }
        public virtual DbSet<ContractTypeSection> ContractTypeSection { get; set; }
        public virtual DbSet<Country> Country { get; set; }
        public virtual DbSet<Currency> Currency { get; set; }
        public virtual DbSet<Customer> Customer { get; set; }
        public virtual DbSet<CustomerAddress> CustomerAddress { get; set; }
        public virtual DbSet<CustomerClass> CustomerClass { get; set; }
        public virtual DbSet<CustomerComunicationOption> CustomerComunicationOption { get; set; }
        public virtual DbSet<CustomerContact> CustomerContact { get; set; }
        public virtual DbSet<CustomerLabel> CustomerLabel { get; set; }
        public virtual DbSet<CustomerPaymentOption> CustomerPaymentOption { get; set; }
        public virtual DbSet<CustomerRating> CustomerRating { get; set; }
        public virtual DbSet<CustomerRelationshipType> CustomerRelationshipType { get; set; }
        public virtual DbSet<CustomerSegments> CustomerSegments { get; set; }
        public virtual DbSet<CustomerType> CustomerType { get; set; }
        public virtual DbSet<Driver> Driver { get; set; }
        public virtual DbSet<Employee> Employee { get; set; }
        public virtual DbSet<EmployeeParent> EmployeeParent { get; set; }
        public virtual DbSet<Factory> Factory { get; set; }
        public virtual DbSet<Gender> Gender { get; set; }
        public virtual DbSet<Industry> Industry { get; set; }
        public virtual DbSet<Inventory> Inventory { get; set; }
        public virtual DbSet<InventoryIncome> InventoryIncome { get; set; }
        public virtual DbSet<InventoryIncomeDetail> InventoryIncomeDetail { get; set; }
        public virtual DbSet<InventoryOutput> InventoryOutput { get; set; }
        public virtual DbSet<InventoryOutputDetail> InventoryOutputDetail { get; set; }
        public virtual DbSet<InventoryOutputDetailInventory> InventoryOutputDetailInventory { get; set; }
        public virtual DbSet<InventoryStatus> InventoryStatus { get; set; }
        public virtual DbSet<InventoryTransfer> InventoryTransfer { get; set; }
        public virtual DbSet<InventoryTransferDetail> InventoryTransferDetail { get; set; }
        public virtual DbSet<InventoryTransferDetailInventory> InventoryTransferDetailInventory { get; set; }
        public virtual DbSet<InventoryTransferReason> InventoryTransferReason { get; set; }
        public virtual DbSet<InventoryTransferStatus> InventoryTransferStatus { get; set; }
        public virtual DbSet<Language> Language { get; set; }
        public virtual DbSet<LegalIdType> LegalIdType { get; set; }
        public virtual DbSet<Manufacture> Manufacture { get; set; }
        public virtual DbSet<ManufactureItem> ManufactureItem { get; set; }
        public virtual DbSet<ManufactureStatus> ManufactureStatus { get; set; }
        public virtual DbSet<MassiveEmail> MassiveEmail { get; set; }
        public virtual DbSet<MassiveEmailState> MassiveEmailState { get; set; }
        public virtual DbSet<Module> Module { get; set; }
        public virtual DbSet<Ocupation> Ocupation { get; set; }
        public virtual DbSet<PaymentSubtype> PaymentSubtype { get; set; }
        public virtual DbSet<PaymentType> PaymentType { get; set; }
        public virtual DbSet<Permission> Permission { get; set; }
        public virtual DbSet<Product> Product { get; set; }
        public virtual DbSet<Purchase> Purchase { get; set; }
        public virtual DbSet<PurchaseInvoice> PurchaseInvoice { get; set; }
        public virtual DbSet<PurchaseInvoiceLine> PurchaseInvoiceLine { get; set; }
        public virtual DbSet<PurchaseInvoiceLineTax> PurchaseInvoiceLineTax { get; set; }
        public virtual DbSet<PurchaseInvoicePayment> PurchaseInvoicePayment { get; set; }
        public virtual DbSet<PurchaseInvoiceTax> PurchaseInvoiceTax { get; set; }
        public virtual DbSet<PurchaseItem> PurchaseItem { get; set; }
        public virtual DbSet<PurchaseStatus> PurchaseStatus { get; set; }
        public virtual DbSet<RemissionGuide> RemissionGuide { get; set; }
        public virtual DbSet<RemissionGuideLine> RemissionGuideLine { get; set; }
        public virtual DbSet<RetentionVoucher> RetentionVoucher { get; set; }
        public virtual DbSet<RetentionVoucherLine> RetentionVoucherLine { get; set; }
        public virtual DbSet<Role> Role { get; set; }
        public virtual DbSet<RoleAction> RoleAction { get; set; }
        public virtual DbSet<Sale> Sale { get; set; }
        public virtual DbSet<SaleInvoice> SaleInvoice { get; set; }
        public virtual DbSet<SaleInvoiceLine> SaleInvoiceLine { get; set; }
        public virtual DbSet<SaleInvoiceLineTax> SaleInvoiceLineTax { get; set; }
        public virtual DbSet<SaleInvoicePayment> SaleInvoicePayment { get; set; }
        public virtual DbSet<SaleInvoiceProgressProcess> SaleInvoiceProgressProcess { get; set; }
        public virtual DbSet<SaleInvoiceRecurrentProcess> SaleInvoiceRecurrentProcess { get; set; }
        public virtual DbSet<SaleInvoiceTax> SaleInvoiceTax { get; set; }
        public virtual DbSet<SaleItem> SaleItem { get; set; }
        public virtual DbSet<SalePlace> SalePlace { get; set; }
        public virtual DbSet<Salutation> Salutation { get; set; }
        public virtual DbSet<Service> Service { get; set; }
        public virtual DbSet<ServiceComment> ServiceComment { get; set; }
        public virtual DbSet<ServicePriority> ServicePriority { get; set; }
        public virtual DbSet<ServiceStatus> ServiceStatus { get; set; }
        public virtual DbSet<ServiceType> ServiceType { get; set; }
        public virtual DbSet<SourceChannel> SourceChannel { get; set; }
        public virtual DbSet<State> State { get; set; }
        public virtual DbSet<Supplier> Supplier { get; set; }
        public virtual DbSet<SupplierClass> SupplierClass { get; set; }
        public virtual DbSet<SupplierPaymentOption> SupplierPaymentOption { get; set; }
        public virtual DbSet<Tax> Tax { get; set; }
        public virtual DbSet<TaxBusinessItemClass> TaxBusinessItemClass { get; set; }
        public virtual DbSet<TaxCustomerClass> TaxCustomerClass { get; set; }
        public virtual DbSet<TaxRetention> TaxRetention { get; set; }
        public virtual DbSet<TaxRetentionType> TaxRetentionType { get; set; }
        public virtual DbSet<TaxSupplierClass> TaxSupplierClass { get; set; }
        public virtual DbSet<TaxType> TaxType { get; set; }
        public virtual DbSet<Territory> Territory { get; set; }
        public virtual DbSet<UnitOfMeasure> UnitOfMeasure { get; set; }
        public virtual DbSet<Warehouse> Warehouse { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseSqlServer("Server=CESAR\\SQLEXPRESS;Database=SysCont_Company;Trusted_Connection=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.HasAnnotation("ProductVersion", "2.2.1-servicing-10028");

            modelBuilder.Entity<Account>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();
            });

            modelBuilder.Entity<AccountType>(entity =>
            {
                entity.ToTable("Account_Type");

                entity.Property(e => e.Id).ValueGeneratedNever();
            });

            modelBuilder.Entity<Activity>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.ActivityPlaceTypeId).HasColumnName("Activity_PlaceType_Id");

                entity.Property(e => e.ActivityPriorityId).HasColumnName("Activity_Priority_Id");

                entity.Property(e => e.ActivityStatusId).HasColumnName("Activity_Status_Id");

                entity.Property(e => e.ActivityTypeId).HasColumnName("Activity_Type_Id");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.EntityId).HasColumnName("Entity_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.RealDateFrom).HasColumnType("datetime");

                entity.Property(e => e.RealDateTo).HasColumnType("datetime");

                entity.Property(e => e.ScheduleDateFrom).HasColumnType("datetime");

                entity.Property(e => e.ScheduleDateTo).HasColumnType("datetime");

                entity.Property(e => e.Subject).HasMaxLength(500);

                entity.HasOne(d => d.ActivityPlaceType)
                    .WithMany(p => p.Activity)
                    .HasForeignKey(d => d.ActivityPlaceTypeId)
                    .HasConstraintName("FK_Activity_PlaceType");

                entity.HasOne(d => d.ActivityPriority)
                    .WithMany(p => p.Activity)
                    .HasForeignKey(d => d.ActivityPriorityId)
                    .HasConstraintName("FK_Activity_Priority");

                entity.HasOne(d => d.ActivityStatus)
                    .WithMany(p => p.Activity)
                    .HasForeignKey(d => d.ActivityStatusId)
                    .HasConstraintName("FK_Activity_Status");

                entity.HasOne(d => d.ActivityType)
                    .WithMany(p => p.Activity)
                    .HasForeignKey(d => d.ActivityTypeId)
                    .HasConstraintName("FK_Activity_Type");
            });

            modelBuilder.Entity<ActivityParticipant>(entity =>
            {
                entity.ToTable("Activity_Participant");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.ActivityId).HasColumnName("Activity_Id");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.EntityId).HasColumnName("Entity_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.HasOne(d => d.Activity)
                    .WithMany(p => p.ActivityParticipant)
                    .HasForeignKey(d => d.ActivityId)
                    .HasConstraintName("FK_ActivityParticipant_Activity");
            });

            modelBuilder.Entity<ActivityPlaceType>(entity =>
            {
                entity.ToTable("Activity_PlaceType");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");
            });

            modelBuilder.Entity<ActivityPriority>(entity =>
            {
                entity.ToTable("Activity_Priority");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(500);

                entity.HasOne(d => d.Employee)
                    .WithMany(p => p.ActivityPriority)
                    .HasForeignKey(d => d.EmployeeId)
                    .HasConstraintName("FK_ActivityPriority_Employee");
            });

            modelBuilder.Entity<ActivityStatus>(entity =>
            {
                entity.ToTable("Activity_Status");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name).HasMaxLength(500);

                entity.HasOne(d => d.Employee)
                    .WithMany(p => p.ActivityStatus)
                    .HasForeignKey(d => d.EmployeeId)
                    .HasConstraintName("FK_ActivityStatus_Employee");
            });

            modelBuilder.Entity<ActivityTask>(entity =>
            {
                entity.ToTable("Activity_Task");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.ActivityTopicId).HasColumnName("Activity_Topic_Id");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.DueDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.HasOne(d => d.ActivityTopic)
                    .WithMany(p => p.ActivityTask)
                    .HasForeignKey(d => d.ActivityTopicId)
                    .HasConstraintName("FK_ActivityTask_Activity");
            });

            modelBuilder.Entity<ActivityTopic>(entity =>
            {
                entity.ToTable("Activity_Topic");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.ActivityId).HasColumnName("Activity_Id");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.HasOne(d => d.Activity)
                    .WithMany(p => p.ActivityTopic)
                    .HasForeignKey(d => d.ActivityId)
                    .HasConstraintName("FK_ActivityTopic_Topic");
            });

            modelBuilder.Entity<ActivityType>(entity =>
            {
                entity.ToTable("Activity_Type");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name).HasMaxLength(200);
            });

            modelBuilder.Entity<AddressType>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name).HasMaxLength(500);
            });

            modelBuilder.Entity<Bank>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.Code).HasMaxLength(500);

                entity.Property(e => e.CountryId).HasColumnName("Country_Id");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name).HasMaxLength(500);

                entity.HasOne(d => d.Country)
                    .WithMany(p => p.Bank)
                    .HasForeignKey(d => d.CountryId)
                    .HasConstraintName("FK_Bank_Country");
            });

            modelBuilder.Entity<BankAccount>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.BankAccountTypeId).HasColumnName("BankAccount_Type_Id");

                entity.Property(e => e.BankId).HasColumnName("Bank_Id");

                entity.Property(e => e.CompanyId).HasColumnName("Company_Id");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Number)
                    .IsRequired()
                    .HasMaxLength(2000);

                entity.Property(e => e.Total).HasColumnType("decimal(18, 2)");

                entity.HasOne(d => d.BankAccountType)
                    .WithMany(p => p.BankAccount)
                    .HasForeignKey(d => d.BankAccountTypeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_BankAccount_BankAccountType");

                entity.HasOne(d => d.Bank)
                    .WithMany(p => p.BankAccount)
                    .HasForeignKey(d => d.BankId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_BankAccount_Bank");

                entity.HasOne(d => d.Company)
                    .WithMany(p => p.BankAccount)
                    .HasForeignKey(d => d.CompanyId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_BankAccount_Company");
            });

            modelBuilder.Entity<BankAccountMovement>(entity =>
            {
                entity.ToTable("BankAccount_Movement");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.Amount).HasColumnType("decimal(18, 2)");

                entity.Property(e => e.BankAccountId).HasColumnName("BankAccount_Id");

                entity.Property(e => e.BankAccountMovementTypeId).HasColumnName("BankAccount_Movement_Type_Id");

                entity.Property(e => e.BankId).HasColumnName("Bank_Id");

                entity.Property(e => e.CheckNumber).HasMaxLength(500);

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.ResponsibleEmployeeId).HasColumnName("ResponsibleEmployee_Id");

                entity.Property(e => e.TransactionDate).HasColumnType("date");

                entity.Property(e => e.VoucherNumber).HasMaxLength(500);

                entity.HasOne(d => d.BankAccount)
                    .WithMany(p => p.BankAccountMovement)
                    .HasForeignKey(d => d.BankAccountId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_BankAccountMovement_BankAccount");

                entity.HasOne(d => d.BankAccountMovementType)
                    .WithMany(p => p.BankAccountMovement)
                    .HasForeignKey(d => d.BankAccountMovementTypeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_BankAccountMovement_BankAccountMovement");

                entity.HasOne(d => d.Bank)
                    .WithMany(p => p.BankAccountMovement)
                    .HasForeignKey(d => d.BankId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_BankAccountMovement_Bank");

                entity.HasOne(d => d.ResponsibleEmployee)
                    .WithMany(p => p.BankAccountMovement)
                    .HasForeignKey(d => d.ResponsibleEmployeeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_BankAccountMovement_Employee");
            });

            modelBuilder.Entity<BankAccountMovementType>(entity =>
            {
                entity.ToTable("BankAccount_Movement_Type");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name).HasMaxLength(150);
            });

            modelBuilder.Entity<BankAccountType>(entity =>
            {
                entity.ToTable("BankAccount_Type");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name).HasMaxLength(150);
            });

            modelBuilder.Entity<BusinessItem>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.BusinessItemCategoryId).HasColumnName("BusinessItem_Category_Id");

                entity.Property(e => e.BusinessItemClassId).HasColumnName("BusinessItem_Class_Id");

                entity.Property(e => e.BusinessItemTypeId).HasColumnName("BusinessItem_Type_Id");

                entity.Property(e => e.Code).HasMaxLength(300);

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name).HasMaxLength(300);

                entity.HasOne(d => d.BusinessItemCategory)
                    .WithMany(p => p.BusinessItem)
                    .HasForeignKey(d => d.BusinessItemCategoryId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_BusinessItem_Category");

                entity.HasOne(d => d.BusinessItemClass)
                    .WithMany(p => p.BusinessItem)
                    .HasForeignKey(d => d.BusinessItemClassId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_BusinessItem_Class");

                entity.HasOne(d => d.BusinessItemType)
                    .WithMany(p => p.BusinessItem)
                    .HasForeignKey(d => d.BusinessItemTypeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_BusinessItem_Type");
            });

            modelBuilder.Entity<BusinessItemCategory>(entity =>
            {
                entity.ToTable("BusinessItem_Category");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name).HasMaxLength(300);
            });

            modelBuilder.Entity<BusinessItemClass>(entity =>
            {
                entity.ToTable("BusinessItem_Class");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(500)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<BusinessItemDiscount>(entity =>
            {
                entity.ToTable("BusinessItem_Discount");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.BusinessItemId).HasColumnName("BusinessItem_Id");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.CustomerRatingId).HasColumnName("Customer_Rating_Id");

                entity.Property(e => e.Discount).HasColumnType("decimal(18, 5)");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.HasOne(d => d.BusinessItem)
                    .WithMany(p => p.BusinessItemDiscount)
                    .HasForeignKey(d => d.BusinessItemId)
                    .HasConstraintName("FK_BusinessItemDiscount_BusinessItem");

                entity.HasOne(d => d.CustomerRating)
                    .WithMany(p => p.BusinessItemDiscount)
                    .HasForeignKey(d => d.CustomerRatingId)
                    .HasConstraintName("FK_BusinessItemDiscount_CustomerRating");
            });

            modelBuilder.Entity<BusinessItemPromotion>(entity =>
            {
                entity.ToTable("BusinessItem_Promotion");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.DiscountPercentage).HasColumnType("decimal(18, 5)");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.End).HasColumnType("datetime");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.QuantityGift).HasColumnType("decimal(18, 5)");

                entity.Property(e => e.QuantityRequired).HasColumnType("decimal(18, 5)");

                entity.Property(e => e.Start).HasColumnType("datetime");
            });

            modelBuilder.Entity<BusinessItemType>(entity =>
            {
                entity.ToTable("BusinessItem_Type");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name).HasMaxLength(200);
            });

            modelBuilder.Entity<BusinessItemVariation>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.BusinessItemId).HasColumnName("BusinessItem_Id");

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(300);

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(300);

                entity.Property(e => e.Price).HasColumnType("decimal(18, 5)");

                entity.Property(e => e.Stock).HasColumnType("decimal(18, 5)");

                entity.Property(e => e.UnitOfMeasureId).HasColumnName("UnitOfMeasure_Id");

                entity.HasOne(d => d.BusinessItem)
                    .WithMany(p => p.BusinessItemVariation)
                    .HasForeignKey(d => d.BusinessItemId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_BusinessItemVariation_BusinessItem");

                entity.HasOne(d => d.UnitOfMeasure)
                    .WithMany(p => p.BusinessItemVariation)
                    .HasForeignKey(d => d.UnitOfMeasureId)
                    .HasConstraintName("FK_BusinessItem_UnitOfMeasure");
            });

            modelBuilder.Entity<BusinessItemVariationDiscount>(entity =>
            {
                entity.ToTable("BusinessItemVariation_Discount");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.BusinessItemVariationId).HasColumnName("BusinessItemVariation_Id");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.CustomerRatingId).HasColumnName("Customer_Rating_Id");

                entity.Property(e => e.Discount).HasColumnType("decimal(18, 5)");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.HasOne(d => d.BusinessItemVariation)
                    .WithMany(p => p.BusinessItemVariationDiscount)
                    .HasForeignKey(d => d.BusinessItemVariationId)
                    .HasConstraintName("FK_BusinessItemVariationDiscount_BusinessItemVariation");

                entity.HasOne(d => d.CustomerRating)
                    .WithMany(p => p.BusinessItemVariationDiscount)
                    .HasForeignKey(d => d.CustomerRatingId)
                    .HasConstraintName("FK_BusinessItemVariationDiscount_CustomerRating");
            });

            modelBuilder.Entity<BusinessOpportunity>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.BusinessOpportunityLossReasonId).HasColumnName("BusinessOpportunity_LossReason_Id");

                entity.Property(e => e.BusinessOpportunityStateId).HasColumnName("BusinessOpportunity_State_Id");

                entity.Property(e => e.CampaignId).HasColumnName("Campaign_Id");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.CustomerContactId).HasColumnName("Customer_Contact_Id");

                entity.Property(e => e.CustomerId).HasColumnName("Customer_Id");

                entity.Property(e => e.Date).HasColumnType("datetime");

                entity.Property(e => e.DateClosing).HasColumnType("datetime");

                entity.Property(e => e.Description)
                    .IsRequired()
                    .HasMaxLength(500)
                    .HasDefaultValueSql("('')");

                entity.Property(e => e.Discount).HasColumnType("decimal(18, 5)");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.SourceChannelId).HasColumnName("SourceChannel_Id");

                entity.Property(e => e.Subtotal).HasColumnType("decimal(18, 5)");

                entity.Property(e => e.Total).HasColumnType("decimal(18, 5)");

                entity.HasOne(d => d.BusinessOpportunityLossReason)
                    .WithMany(p => p.BusinessOpportunity)
                    .HasForeignKey(d => d.BusinessOpportunityLossReasonId)
                    .HasConstraintName("FK_BusinessOpportunity_LossReason_Id");

                entity.HasOne(d => d.BusinessOpportunityState)
                    .WithMany(p => p.BusinessOpportunity)
                    .HasForeignKey(d => d.BusinessOpportunityStateId)
                    .HasConstraintName("FK_BusinessOpportunity_State_Id");

                entity.HasOne(d => d.Campaign)
                    .WithMany(p => p.BusinessOpportunity)
                    .HasForeignKey(d => d.CampaignId)
                    .HasConstraintName("FK_BusinessOpportunity_Campaign");

                entity.HasOne(d => d.CustomerContact)
                    .WithMany(p => p.BusinessOpportunity)
                    .HasForeignKey(d => d.CustomerContactId)
                    .HasConstraintName("FK_BusinessOpportunity_Customer_Contact");

                entity.HasOne(d => d.Customer)
                    .WithMany(p => p.BusinessOpportunity)
                    .HasForeignKey(d => d.CustomerId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_BusinessOpportunity_Customer");

                entity.HasOne(d => d.Employee)
                    .WithMany(p => p.BusinessOpportunity)
                    .HasForeignKey(d => d.EmployeeId)
                    .HasConstraintName("FK_BusinessOpportunity_Employee_Id");

                entity.HasOne(d => d.SourceChannel)
                    .WithMany(p => p.BusinessOpportunity)
                    .HasForeignKey(d => d.SourceChannelId)
                    .HasConstraintName("FK_BusinessOpportunity_SourceChannel_Id");
            });

            modelBuilder.Entity<BusinessOpportunityItem>(entity =>
            {
                entity.ToTable("BusinessOpportunity_Item");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.BusinessItemVariationId).HasColumnName("BusinessItemVariation_Id");

                entity.Property(e => e.BusinessOpportunityId).HasColumnName("BusinessOpportunity_Id");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.CustomerUnitDiscountPercentage).HasColumnType("decimal(18, 5)");

                entity.Property(e => e.DiscountedUnitPrice).HasColumnType("decimal(18, 5)");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Quantity).HasColumnType("decimal(18, 5)");

                entity.Property(e => e.SaleUnitDiscountPercentage).HasColumnType("decimal(18, 5)");

                entity.Property(e => e.TotalPrice).HasColumnType("decimal(18, 5)");

                entity.Property(e => e.TotalUnitDiscountAmount).HasColumnType("decimal(18, 5)");

                entity.Property(e => e.TotalUnitDiscountPercentage).HasColumnType("decimal(18, 5)");

                entity.Property(e => e.UnitPrice).HasColumnType("decimal(18, 5)");

                entity.HasOne(d => d.BusinessItemVariation)
                    .WithMany(p => p.BusinessOpportunityItem)
                    .HasForeignKey(d => d.BusinessItemVariationId)
                    .HasConstraintName("FK_BusinessOpportunityItem_BusinessItemVariation");

                entity.HasOne(d => d.BusinessOpportunity)
                    .WithMany(p => p.BusinessOpportunityItem)
                    .HasForeignKey(d => d.BusinessOpportunityId)
                    .HasConstraintName("FK_BusinessOpportunityItem_BusinessOpportunity");
            });

            modelBuilder.Entity<BusinessOpportunityLossReason>(entity =>
            {
                entity.ToTable("BusinessOpportunity_LossReason");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name).HasMaxLength(500);
            });

            modelBuilder.Entity<BusinessOpportunityState>(entity =>
            {
                entity.ToTable("BusinessOpportunity_State");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name).HasMaxLength(500);
            });

            modelBuilder.Entity<Campaign>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CampaignTypeId).HasColumnName("Campaign_Type_Id");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.FromDate).HasColumnType("datetime");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name).HasMaxLength(300);

                entity.Property(e => e.ToDate).HasColumnType("datetime");

                entity.HasOne(d => d.CampaignType)
                    .WithMany(p => p.Campaign)
                    .HasForeignKey(d => d.CampaignTypeId)
                    .HasConstraintName("FK_Campaign_CampaignType");
            });

            modelBuilder.Entity<CampaignMassEmail>(entity =>
            {
                entity.ToTable("Campaign_MassEmail");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CampaignId).HasColumnName("Campaign_Id");

                entity.Property(e => e.CampaignScheduleEmailId).HasColumnName("Campaign_ScheduleEmail_Id");

                entity.Property(e => e.CampaignSegmentId).HasColumnName("Campaign_Segment_Id");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.Date).HasColumnType("datetime");

                entity.Property(e => e.EmailTemplateId).HasColumnName("Email_Template_Id");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Total).HasColumnType("datetime");

                entity.HasOne(d => d.Campaign)
                    .WithMany(p => p.CampaignMassEmail)
                    .HasForeignKey(d => d.CampaignId)
                    .HasConstraintName("FK_CampaignMassEmail_Campaign");

                entity.HasOne(d => d.CampaignScheduleEmail)
                    .WithMany(p => p.CampaignMassEmail)
                    .HasForeignKey(d => d.CampaignScheduleEmailId)
                    .HasConstraintName("FK_CampaignMassEmail_CampaignScheduleEmail");

                entity.HasOne(d => d.CampaignSegment)
                    .WithMany(p => p.CampaignMassEmail)
                    .HasForeignKey(d => d.CampaignSegmentId)
                    .HasConstraintName("FK_CampaignMassEmail_Segment");
            });

            modelBuilder.Entity<CampaignScheduleEmail>(entity =>
            {
                entity.ToTable("Campaign_ScheduleEmail");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CampaignId).HasColumnName("Campaign_Id");

                entity.Property(e => e.CampaignScheduleEmailId).HasColumnName("Campaign_ScheduleEmail_Id");

                entity.Property(e => e.CampaignSegmentId).HasColumnName("Campaign_Segment_Id");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmailTemplateId).HasColumnName("Email_Template_Id");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Since).HasColumnType("datetime");

                entity.Property(e => e.To).HasColumnType("datetime");
            });

            modelBuilder.Entity<CampaignSegment>(entity =>
            {
                entity.ToTable("Campaign_Segment");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.EntityId).HasColumnName("Entity_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name).HasMaxLength(50);
            });

            modelBuilder.Entity<CampaignType>(entity =>
            {
                entity.ToTable("Campaign_Type");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name).HasMaxLength(500);
            });

            modelBuilder.Entity<City>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name).HasMaxLength(500);

                entity.Property(e => e.StateId).HasColumnName("State_Id");

                entity.HasOne(d => d.Employee)
                    .WithMany(p => p.City)
                    .HasForeignKey(d => d.EmployeeId)
                    .HasConstraintName("FK_City_Employee");

                entity.HasOne(d => d.State)
                    .WithMany(p => p.City)
                    .HasForeignKey(d => d.StateId)
                    .HasConstraintName("FK_City_State");
            });

            modelBuilder.Entity<CommunicationOptionType>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name).HasMaxLength(500);
            });

            modelBuilder.Entity<Company>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.AccountingRequired)
                    .IsRequired()
                    .HasMaxLength(500);

                entity.Property(e => e.Address)
                    .IsRequired()
                    .HasMaxLength(2000);

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.CurrencyCode).HasMaxLength(500);

                entity.Property(e => e.CurrencyId).HasColumnName("Currency_Id");

                entity.Property(e => e.CurrencyName).HasMaxLength(500);

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.Host).HasMaxLength(300);

                entity.Property(e => e.LegalId).HasMaxLength(50);

                entity.Property(e => e.MainActivity)
                    .IsRequired()
                    .HasDefaultValueSql("('')");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name1)
                    .IsRequired()
                    .HasMaxLength(2000);

                entity.Property(e => e.Name2)
                    .IsRequired()
                    .HasMaxLength(2000);

                entity.Property(e => e.Phone)
                    .IsRequired()
                    .HasMaxLength(200);

                entity.Property(e => e.SignatureKey).HasMaxLength(500);

                entity.Property(e => e.SignatureName).HasMaxLength(500);

                entity.Property(e => e.SmtpEnableSsl).HasDefaultValueSql("((0))");

                entity.Property(e => e.SmtpHost).HasMaxLength(500);

                entity.Property(e => e.SpecialContributor).HasMaxLength(500);

                entity.Property(e => e.TaxPayerId)
                    .IsRequired()
                    .HasMaxLength(100);

                entity.Property(e => e.WebSite).HasMaxLength(500);

                entity.HasOne(d => d.Currency)
                    .WithMany(p => p.Company)
                    .HasForeignKey(d => d.CurrencyId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Company_Currency");
            });

            modelBuilder.Entity<CompanyEmissionPoint>(entity =>
            {
                entity.ToTable("Company_EmissionPoint");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(2000);

                entity.Property(e => e.CompanyPlaceId).HasColumnName("Company_Place_Id");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(2000);

                entity.HasOne(d => d.CompanyPlace)
                    .WithMany(p => p.CompanyEmissionPoint)
                    .HasForeignKey(d => d.CompanyPlaceId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Company_EmissionPoint_CompanyPlace");
            });

            modelBuilder.Entity<CompanyPlace>(entity =>
            {
                entity.ToTable("Company_Place");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CityId).HasColumnName("City_Id");

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(2000);

                entity.Property(e => e.CompanyId).HasColumnName("Company_Id");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(2000);

                entity.Property(e => e.Phone).HasMaxLength(500);

                entity.HasOne(d => d.City)
                    .WithMany(p => p.CompanyPlace)
                    .HasForeignKey(d => d.CityId)
                    .HasConstraintName("FK_CompanyPlace_City");

                entity.HasOne(d => d.Company)
                    .WithMany(p => p.CompanyPlace)
                    .HasForeignKey(d => d.CompanyId)
                    .HasConstraintName("FK_CompanyPlace_Company");
            });

            modelBuilder.Entity<Contact>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.Birth).HasColumnType("datetime");

                entity.Property(e => e.ContactRatingId).HasColumnName("Contact_Rating_Id");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.Description).IsUnicode(false);

                entity.Property(e => e.DoNotSms).HasColumnName("DoNotSMS");

                entity.Property(e => e.Email).HasMaxLength(1000);

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.FirstName).HasMaxLength(300);

                entity.Property(e => e.GenderId).HasColumnName("Gender_Id");

                entity.Property(e => e.LanguageId).HasColumnName("Language_Id");

                entity.Property(e => e.LastActivity).HasColumnType("datetime");

                entity.Property(e => e.LastName).HasMaxLength(300);

                entity.Property(e => e.LegalId).HasMaxLength(50);

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.OcupationId).HasColumnName("Ocupation_Id");

                entity.Property(e => e.Phone1).HasMaxLength(1000);

                entity.Property(e => e.Phone2).HasMaxLength(1000);

                entity.Property(e => e.Phone3).HasMaxLength(1000);

                entity.Property(e => e.SalutationId).HasColumnName("Salutation_Id");

                entity.Property(e => e.SourceChannelId).HasColumnName("SourceChannel_Id");

                entity.HasOne(d => d.ContactRating)
                    .WithMany(p => p.Contact)
                    .HasForeignKey(d => d.ContactRatingId)
                    .HasConstraintName("FK_Contact_Rating");

                entity.HasOne(d => d.Gender)
                    .WithMany(p => p.Contact)
                    .HasForeignKey(d => d.GenderId)
                    .HasConstraintName("FK_Contact_Gender");

                entity.HasOne(d => d.Language)
                    .WithMany(p => p.Contact)
                    .HasForeignKey(d => d.LanguageId)
                    .HasConstraintName("FK_Contact_Language");

                entity.HasOne(d => d.Ocupation)
                    .WithMany(p => p.Contact)
                    .HasForeignKey(d => d.OcupationId)
                    .HasConstraintName("FK_Contact_Ocupation");

                entity.HasOne(d => d.Salutation)
                    .WithMany(p => p.Contact)
                    .HasForeignKey(d => d.SalutationId)
                    .HasConstraintName("FK_Contact_Salutation");

                entity.HasOne(d => d.SourceChannel)
                    .WithMany(p => p.Contact)
                    .HasForeignKey(d => d.SourceChannelId)
                    .HasConstraintName("FK_Contact_Source");
            });

            modelBuilder.Entity<ContactAddress>(entity =>
            {
                entity.ToTable("Contact_Address");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.Address)
                    .IsRequired()
                    .HasMaxLength(500);

                entity.Property(e => e.AddressTypeId).HasColumnName("AddressType_Id");

                entity.Property(e => e.CityId).HasColumnName("City_Id");

                entity.Property(e => e.ContactId).HasColumnName("Contact_Id");

                entity.Property(e => e.Coordinates).HasMaxLength(100);

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.PostalCode).HasMaxLength(50);

                entity.Property(e => e.Reference).HasMaxLength(50);

                entity.HasOne(d => d.AddressType)
                    .WithMany(p => p.ContactAddress)
                    .HasForeignKey(d => d.AddressTypeId)
                    .HasConstraintName("FK_Contact_Address_AddressType");

                entity.HasOne(d => d.City)
                    .WithMany(p => p.ContactAddress)
                    .HasForeignKey(d => d.CityId)
                    .HasConstraintName("FK_Contact_Address_City");

                entity.HasOne(d => d.Contact)
                    .WithMany(p => p.ContactAddress)
                    .HasForeignKey(d => d.ContactId)
                    .HasConstraintName("FK_Contact_Address_Contact");
            });

            modelBuilder.Entity<ContactComunicationOption>(entity =>
            {
                entity.ToTable("Contact_ComunicationOption");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CommunicationOptionTypeId).HasColumnName("CommunicationOptionType_Id");

                entity.Property(e => e.ContactId).HasColumnName("Contact_Id");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Value).HasMaxLength(300);

                entity.HasOne(d => d.CommunicationOptionType)
                    .WithMany(p => p.ContactComunicationOption)
                    .HasForeignKey(d => d.CommunicationOptionTypeId)
                    .HasConstraintName("FK_Contact_ComunicationOption_ComunicationOptionType");

                entity.HasOne(d => d.Contact)
                    .WithMany(p => p.ContactComunicationOption)
                    .HasForeignKey(d => d.ContactId)
                    .HasConstraintName("FK_Contact_ComunicationOption_Contact");
            });

            modelBuilder.Entity<ContactDepartment>(entity =>
            {
                entity.ToTable("Contact_Department");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name).HasMaxLength(500);
            });

            modelBuilder.Entity<ContactRating>(entity =>
            {
                entity.ToTable("Contact_Rating");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name).HasMaxLength(500);
            });

            modelBuilder.Entity<Contract>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.ContractEndReasonId).HasColumnName("Contract_EndReason_Id");

                entity.Property(e => e.ContractStatusId).HasColumnName("Contract_Status_Id");

                entity.Property(e => e.ContractTypeId).HasColumnName("Contract_Type_Id");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.PhysicalNumber).HasMaxLength(100);

                entity.Property(e => e.RealEnd).HasColumnType("date");

                entity.Property(e => e.SaleId).HasColumnName("Sale_Id");

                entity.Property(e => e.SignCompanyName).HasMaxLength(500);

                entity.Property(e => e.SignCustomerName).HasMaxLength(500);

                entity.Property(e => e.SigningDate).HasColumnType("date");

                entity.Property(e => e.ValidityEnd).HasColumnType("date");

                entity.Property(e => e.ValidityStart).HasColumnType("date");

                entity.HasOne(d => d.ContractEndReason)
                    .WithMany(p => p.Contract)
                    .HasForeignKey(d => d.ContractEndReasonId)
                    .HasConstraintName("FK_Contract_EndReason");

                entity.HasOne(d => d.ContractStatus)
                    .WithMany(p => p.Contract)
                    .HasForeignKey(d => d.ContractStatusId)
                    .HasConstraintName("FK_Contract_Status");

                entity.HasOne(d => d.ContractType)
                    .WithMany(p => p.Contract)
                    .HasForeignKey(d => d.ContractTypeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Contract_Type");

                entity.HasOne(d => d.Sale)
                    .WithMany(p => p.Contract)
                    .HasForeignKey(d => d.SaleId)
                    .HasConstraintName("FK_Contract_Sale");
            });

            modelBuilder.Entity<ContractEndReason>(entity =>
            {
                entity.ToTable("Contract_EndReason");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(1000);
            });

            modelBuilder.Entity<ContractProgressPaymentRule>(entity =>
            {
                entity.ToTable("Contract_ProgressPaymentRule");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.AdvancePercentage).HasColumnType("decimal(4, 2)");

                entity.Property(e => e.ContractId).HasColumnName("Contract_Id");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.InvoicePercentage).HasColumnType("decimal(4, 2)");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.HasOne(d => d.Contract)
                    .WithMany(p => p.ContractProgressPaymentRule)
                    .HasForeignKey(d => d.ContractId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Contract_ProgressPaymentRule");
            });

            modelBuilder.Entity<ContractRecurrenceType>(entity =>
            {
                entity.ToTable("Contract_RecurrenceType");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(250);
            });

            modelBuilder.Entity<ContractRecurringPaymentRule>(entity =>
            {
                entity.ToTable("Contract_RecurringPaymentRule");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.ContractId).HasColumnName("Contract_Id");

                entity.Property(e => e.ContractRecurrenceTypeId).HasColumnName("Contract_RecurrenceType_Id");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.CustomerPaymentOptionId).HasColumnName("Customer_PaymentOption_Id");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.End).HasColumnType("date");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Start).HasColumnType("date");

                entity.HasOne(d => d.Contract)
                    .WithMany(p => p.ContractRecurringPaymentRule)
                    .HasForeignKey(d => d.ContractId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Contract_RecurringPaymentRule");

                entity.HasOne(d => d.ContractRecurrenceType)
                    .WithMany(p => p.ContractRecurringPaymentRule)
                    .HasForeignKey(d => d.ContractRecurrenceTypeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Contract_RecurringPaymentRule_Type");

                entity.HasOne(d => d.CustomerPaymentOption)
                    .WithMany(p => p.ContractRecurringPaymentRule)
                    .HasForeignKey(d => d.CustomerPaymentOptionId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Contract_RecurringPaymentRule_CustomerPaymentOption");
            });

            modelBuilder.Entity<ContractStatus>(entity =>
            {
                entity.ToTable("Contract_Status");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(500);
            });

            modelBuilder.Entity<ContractType>(entity =>
            {
                entity.ToTable("Contract_Type");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name).HasMaxLength(500);
            });

            modelBuilder.Entity<ContractTypeSection>(entity =>
            {
                entity.ToTable("Contract_TypeSection");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.ContractTypeId).HasColumnName("Contract_Type_Id");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.HasOne(d => d.ContractType)
                    .WithMany(p => p.ContractTypeSection)
                    .HasForeignKey(d => d.ContractTypeId)
                    .HasConstraintName("FK_ContractSecion_Type");
            });

            modelBuilder.Entity<Country>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name).HasMaxLength(500);

                entity.HasOne(d => d.Employee)
                    .WithMany(p => p.Country)
                    .HasForeignKey(d => d.EmployeeId)
                    .HasConstraintName("FK_Country_Employee");
            });

            modelBuilder.Entity<Currency>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<Customer>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.Birth).HasColumnType("datetime");

                entity.Property(e => e.CampaignId).HasColumnName("Campaign_Id");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.CustomerClassId).HasColumnName("Customer_Class_Id");

                entity.Property(e => e.CustomerRatingId).HasColumnName("Customer_Rating_Id");

                entity.Property(e => e.CustomerRelationshipTypeId).HasColumnName("Customer_RelationshipType_Id");

                entity.Property(e => e.CustomerTypeId).HasColumnName("Customer_Type_Id");

                entity.Property(e => e.Description).IsUnicode(false);

                entity.Property(e => e.DoNotSms).HasColumnName("DoNotSMS");

                entity.Property(e => e.Email).HasMaxLength(1000);

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.GenderId).HasColumnName("Gender_Id");

                entity.Property(e => e.IndustryId).HasColumnName("Industry_Id");

                entity.Property(e => e.LanguageId).HasColumnName("Language_Id");

                entity.Property(e => e.LastActivity).HasColumnType("datetime");

                entity.Property(e => e.LegalId).HasMaxLength(50);

                entity.Property(e => e.LegalIdTypeId).HasColumnName("LegalIdType_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name1).HasMaxLength(300);

                entity.Property(e => e.Name2).HasMaxLength(300);

                entity.Property(e => e.ParentId).HasColumnName("Parent_Id");

                entity.Property(e => e.Phone1).HasMaxLength(1000);

                entity.Property(e => e.Phone2).HasMaxLength(1000);

                entity.Property(e => e.Phone3).HasMaxLength(1000);

                entity.Property(e => e.SalutationId).HasColumnName("Salutation_Id");

                entity.Property(e => e.SourceChannelId).HasColumnName("SourceChannel_Id");

                entity.Property(e => e.TerritoryId).HasColumnName("Territory_Id");

                entity.HasOne(d => d.Campaign)
                    .WithMany(p => p.Customer)
                    .HasForeignKey(d => d.CampaignId)
                    .HasConstraintName("FK_Customer_Campaign");

                entity.HasOne(d => d.CustomerClass)
                    .WithMany(p => p.Customer)
                    .HasForeignKey(d => d.CustomerClassId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Customer_Class");

                entity.HasOne(d => d.CustomerRating)
                    .WithMany(p => p.Customer)
                    .HasForeignKey(d => d.CustomerRatingId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Customer_Rating");

                entity.HasOne(d => d.CustomerRelationshipType)
                    .WithMany(p => p.Customer)
                    .HasForeignKey(d => d.CustomerRelationshipTypeId)
                    .HasConstraintName("FK_Customer_CustomerRelationship");

                entity.HasOne(d => d.CustomerType)
                    .WithMany(p => p.Customer)
                    .HasForeignKey(d => d.CustomerTypeId)
                    .HasConstraintName("FK_Customer_CustomerType");

                entity.HasOne(d => d.Employee)
                    .WithMany(p => p.Customer)
                    .HasForeignKey(d => d.EmployeeId)
                    .HasConstraintName("FK_Customer_Employee");

                entity.HasOne(d => d.Gender)
                    .WithMany(p => p.Customer)
                    .HasForeignKey(d => d.GenderId)
                    .HasConstraintName("FK_Customer_Gender");

                entity.HasOne(d => d.Industry)
                    .WithMany(p => p.Customer)
                    .HasForeignKey(d => d.IndustryId)
                    .HasConstraintName("FK_Customer_Industry");

                entity.HasOne(d => d.Language)
                    .WithMany(p => p.Customer)
                    .HasForeignKey(d => d.LanguageId)
                    .HasConstraintName("FK_Customer_Language");

                entity.HasOne(d => d.LegalIdType)
                    .WithMany(p => p.Customer)
                    .HasForeignKey(d => d.LegalIdTypeId)
                    .HasConstraintName("FK_Customer_LegalIdType");

                entity.HasOne(d => d.Parent)
                    .WithMany(p => p.InverseParent)
                    .HasForeignKey(d => d.ParentId)
                    .HasConstraintName("FK_Customer_Customer");

                entity.HasOne(d => d.Salutation)
                    .WithMany(p => p.Customer)
                    .HasForeignKey(d => d.SalutationId)
                    .HasConstraintName("FK_Customer_Salutation");

                entity.HasOne(d => d.SourceChannel)
                    .WithMany(p => p.Customer)
                    .HasForeignKey(d => d.SourceChannelId)
                    .HasConstraintName("FK_Customer_SourceChannel");

                entity.HasOne(d => d.Territory)
                    .WithMany(p => p.Customer)
                    .HasForeignKey(d => d.TerritoryId)
                    .HasConstraintName("FK_Customer_Territory");
            });

            modelBuilder.Entity<CustomerAddress>(entity =>
            {
                entity.ToTable("Customer_Address");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.Address)
                    .IsRequired()
                    .HasMaxLength(500);

                entity.Property(e => e.AddressTypeId).HasColumnName("AddressType_Id");

                entity.Property(e => e.CityId).HasColumnName("City_Id");

                entity.Property(e => e.Coordinates).HasMaxLength(100);

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.CustomerId).HasColumnName("Customer_Id");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.PostalCode).HasMaxLength(50);

                entity.HasOne(d => d.AddressType)
                    .WithMany(p => p.CustomerAddress)
                    .HasForeignKey(d => d.AddressTypeId)
                    .HasConstraintName("FK_AddressType_Id");

                entity.HasOne(d => d.City)
                    .WithMany(p => p.CustomerAddress)
                    .HasForeignKey(d => d.CityId)
                    .HasConstraintName("FK_Customer_Address_City");

                entity.HasOne(d => d.Customer)
                    .WithMany(p => p.CustomerAddress)
                    .HasForeignKey(d => d.CustomerId)
                    .HasConstraintName("FK_Customer_Address_Customer");
            });

            modelBuilder.Entity<CustomerClass>(entity =>
            {
                entity.ToTable("Customer_Class");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(500)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<CustomerComunicationOption>(entity =>
            {
                entity.ToTable("Customer_ComunicationOption");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CommunicationOptionTypeId).HasColumnName("CommunicationOptionType_Id");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.CustomerId).HasColumnName("Customer_Id");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Value).HasMaxLength(300);

                entity.HasOne(d => d.CommunicationOptionType)
                    .WithMany(p => p.CustomerComunicationOption)
                    .HasForeignKey(d => d.CommunicationOptionTypeId)
                    .HasConstraintName("FK_Customer_ComunicationOption_CommunicationOptionType");

                entity.HasOne(d => d.Customer)
                    .WithMany(p => p.CustomerComunicationOption)
                    .HasForeignKey(d => d.CustomerId)
                    .HasConstraintName("FK_Customer_ComunicationOption_Customer");
            });

            modelBuilder.Entity<CustomerContact>(entity =>
            {
                entity.ToTable("Customer_Contact");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.ContactDepartmentId).HasColumnName("Contact_Department_Id");

                entity.Property(e => e.ContactId).HasColumnName("Contact_Id");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.CustomerId).HasColumnName("Customer_Id");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.End).HasColumnType("datetime");

                entity.Property(e => e.JobTitle).HasMaxLength(50);

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name).HasMaxLength(250);

                entity.Property(e => e.Start).HasColumnType("datetime");

                entity.HasOne(d => d.ContactDepartment)
                    .WithMany(p => p.CustomerContact)
                    .HasForeignKey(d => d.ContactDepartmentId)
                    .HasConstraintName("FK_CustomerContact_Departament_Id");

                entity.HasOne(d => d.Contact)
                    .WithMany(p => p.CustomerContact)
                    .HasForeignKey(d => d.ContactId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_CustomerContact_Contact_Id");

                entity.HasOne(d => d.Customer)
                    .WithMany(p => p.CustomerContact)
                    .HasForeignKey(d => d.CustomerId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_CustomerContact_Customer");
            });

            modelBuilder.Entity<CustomerLabel>(entity =>
            {
                entity.ToTable("Customer_Label");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.CustomerId).HasColumnName("Customer_Id");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(300);

                entity.HasOne(d => d.Customer)
                    .WithMany(p => p.CustomerLabel)
                    .HasForeignKey(d => d.CustomerId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Customer_Label_Customer");
            });

            modelBuilder.Entity<CustomerPaymentOption>(entity =>
            {
                entity.ToTable("Customer_PaymentOption");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.BankId).HasColumnName("Bank_Id");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.CustomerId).HasColumnName("Customer_Id");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ExpirationDate).HasColumnType("datetime");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Number).HasMaxLength(50);

                entity.Property(e => e.OwnerLegalId).HasMaxLength(500);

                entity.Property(e => e.OwnerName).HasMaxLength(500);

                entity.Property(e => e.PaymentSubtypeId).HasColumnName("Payment_Subtype_Id");

                entity.HasOne(d => d.Bank)
                    .WithMany(p => p.CustomerPaymentOption)
                    .HasForeignKey(d => d.BankId)
                    .HasConstraintName("FK_Customer_PaymentOption_Bank");

                entity.HasOne(d => d.Customer)
                    .WithMany(p => p.CustomerPaymentOption)
                    .HasForeignKey(d => d.CustomerId)
                    .HasConstraintName("FK_Customer_PaymentOption_Customer");

                entity.HasOne(d => d.PaymentSubtype)
                    .WithMany(p => p.CustomerPaymentOption)
                    .HasForeignKey(d => d.PaymentSubtypeId)
                    .HasConstraintName("FK_Customer_PaymentOption_Type");
            });

            modelBuilder.Entity<CustomerRating>(entity =>
            {
                entity.ToTable("Customer_Rating");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name).HasMaxLength(500);
            });

            modelBuilder.Entity<CustomerRelationshipType>(entity =>
            {
                entity.ToTable("Customer_RelationshipType");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name).HasMaxLength(500);
            });

            modelBuilder.Entity<CustomerSegments>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.Ammount)
                    .HasColumnType("decimal(18, 5)")
                    .HasDefaultValueSql("((0))");

                entity.Property(e => e.ContractStateList).HasMaxLength(1000);

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.Date).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.GenderList).HasMaxLength(500);

                entity.Property(e => e.LanguagesList).HasMaxLength(1000);

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name).HasMaxLength(500);

                entity.Property(e => e.OpportunityStateList).HasMaxLength(500);
            });

            modelBuilder.Entity<CustomerType>(entity =>
            {
                entity.ToTable("Customer_Type");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name).HasMaxLength(500);
            });

            modelBuilder.Entity<Driver>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.LegalId).HasMaxLength(50);

                entity.Property(e => e.LegalIdTypeId).HasColumnName("LegalIdType_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name).HasMaxLength(500);

                entity.Property(e => e.Phone).HasMaxLength(50);
            });

            modelBuilder.Entity<Employee>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.Appointment).HasMaxLength(200);

                entity.Property(e => e.Birth).HasColumnType("datetime");

                entity.Property(e => e.CompanyEmissionPointId).HasColumnName("Company_EmissionPoint_Id");

                entity.Property(e => e.CompanyPlaceId).HasColumnName("Company_Place_Id");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.Email).HasMaxLength(200);

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name).HasMaxLength(300);

                entity.Property(e => e.Password).HasMaxLength(200);

                entity.Property(e => e.Phone).HasMaxLength(100);

                entity.Property(e => e.RoleId).HasColumnName("Role_Id");

                entity.HasOne(d => d.CompanyEmissionPoint)
                    .WithMany(p => p.Employee)
                    .HasForeignKey(d => d.CompanyEmissionPointId)
                    .HasConstraintName("FK_Employe_CompanyPointOfSale");

                entity.HasOne(d => d.CompanyPlace)
                    .WithMany(p => p.Employee)
                    .HasForeignKey(d => d.CompanyPlaceId)
                    .HasConstraintName("FK_Employe_CompanyPlace");

                entity.HasOne(d => d.Role)
                    .WithMany(p => p.Employee)
                    .HasForeignKey(d => d.RoleId)
                    .HasConstraintName("FK_Employe_Role");
            });

            modelBuilder.Entity<EmployeeParent>(entity =>
            {
                entity.ToTable("Employee_Parent");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId1).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.HasOne(d => d.Employee)
                    .WithMany(p => p.EmployeeParentEmployee)
                    .HasForeignKey(d => d.EmployeeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_EmployeeParent_EmployeeId");

                entity.HasOne(d => d.EmployeeId1Navigation)
                    .WithMany(p => p.EmployeeParentEmployeeId1Navigation)
                    .HasForeignKey(d => d.EmployeeId1)
                    .HasConstraintName("FK_EmployeeParent_Employee");

                entity.HasOne(d => d.Parent)
                    .WithMany(p => p.EmployeeParentParent)
                    .HasForeignKey(d => d.ParentId)
                    .HasConstraintName("FK_EmployeeParent_Parent");
            });

            modelBuilder.Entity<Factory>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CompanyPlaceId).HasColumnName("Company_Place_Id");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.Description)
                    .IsRequired()
                    .HasMaxLength(2000);

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(500);

                entity.HasOne(d => d.CompanyPlace)
                    .WithMany(p => p.Factory)
                    .HasForeignKey(d => d.CompanyPlaceId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ProductionCenter_CompanyPlace");
            });

            modelBuilder.Entity<Gender>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name).HasMaxLength(500);
            });

            modelBuilder.Entity<Industry>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name).HasMaxLength(500);
            });

            modelBuilder.Entity<Inventory>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.AdmissionDate).HasColumnType("datetime");

                entity.Property(e => e.BusinessItemVariationId).HasColumnName("BusinessItemVariation_Id");

                entity.Property(e => e.BusinessItemVariationName)
                    .HasColumnName("BusinessItemVariation_Name")
                    .HasMaxLength(150);

                entity.Property(e => e.Cost).HasColumnType("decimal(18, 5)");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ExpirationDate).HasColumnType("datetime");

                entity.Property(e => e.InventoryIncomeId).HasColumnName("InventoryIncome_Id");

                entity.Property(e => e.InventoryOutputId).HasColumnName("InventoryOutput_Id");

                entity.Property(e => e.InventoryStatusId).HasColumnName("Inventory_Status_Id");

                entity.Property(e => e.Location).HasMaxLength(300);

                entity.Property(e => e.ManufactureId).HasColumnName("Manufacture_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.SaleInvoiceId).HasColumnName("SaleInvoice_Id");

                entity.Property(e => e.SalePrice).HasColumnType("decimal(18, 5)");

                entity.Property(e => e.Serial).HasMaxLength(200);

                entity.Property(e => e.WarehouseId).HasColumnName("Warehouse_Id");

                entity.HasOne(d => d.BusinessItemVariation)
                    .WithMany(p => p.Inventory)
                    .HasForeignKey(d => d.BusinessItemVariationId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Inventory_BusinessItemVariation");

                entity.HasOne(d => d.InventoryIncome)
                    .WithMany(p => p.Inventory)
                    .HasForeignKey(d => d.InventoryIncomeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Inventory_InventoryIncome");

                entity.HasOne(d => d.InventoryOutput)
                    .WithMany(p => p.Inventory)
                    .HasForeignKey(d => d.InventoryOutputId)
                    .HasConstraintName("FK_Inventory_InventoryOutput");

                entity.HasOne(d => d.InventoryStatus)
                    .WithMany(p => p.Inventory)
                    .HasForeignKey(d => d.InventoryStatusId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Inventory_InventoryStatus");

                entity.HasOne(d => d.Manufacture)
                    .WithMany(p => p.Inventory)
                    .HasForeignKey(d => d.ManufactureId)
                    .HasConstraintName("FK_Inventory_Manufacturee");

                entity.HasOne(d => d.SaleInvoice)
                    .WithMany(p => p.Inventory)
                    .HasForeignKey(d => d.SaleInvoiceId)
                    .HasConstraintName("FK_Inventory_SaleInvoice");

                entity.HasOne(d => d.Warehouse)
                    .WithMany(p => p.Inventory)
                    .HasForeignKey(d => d.WarehouseId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Inventory_Warehouse");
            });

            modelBuilder.Entity<InventoryIncome>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.InventoryTransferId).HasColumnName("InventoryTransfer_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.PurchaseId).HasColumnName("Purchase_Id");

                entity.Property(e => e.TransactionDate).HasColumnType("datetime");

                entity.Property(e => e.WarehouseId).HasColumnName("Warehouse_Id");

                entity.HasOne(d => d.InventoryTransfer)
                    .WithMany(p => p.InventoryIncome)
                    .HasForeignKey(d => d.InventoryTransferId)
                    .HasConstraintName("FK_Income_InventoryTransfer");

                entity.HasOne(d => d.Purchase)
                    .WithMany(p => p.InventoryIncome)
                    .HasForeignKey(d => d.PurchaseId)
                    .HasConstraintName("FK_Income_Purchase");

                entity.HasOne(d => d.Warehouse)
                    .WithMany(p => p.InventoryIncome)
                    .HasForeignKey(d => d.WarehouseId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Income_Warehouse");
            });

            modelBuilder.Entity<InventoryIncomeDetail>(entity =>
            {
                entity.ToTable("InventoryIncome_Detail");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.BusinessItemVariationId).HasColumnName("BusinessItemVariation_Id");

                entity.Property(e => e.BusinessItemVariationName)
                    .HasColumnName("BusinessItemVariation_Name")
                    .HasMaxLength(150);

                entity.Property(e => e.Comments).HasMaxLength(500);

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.InventoryIncomeId).HasColumnName("InventoryIncome_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Quantity).HasColumnType("decimal(18, 5)");

                entity.HasOne(d => d.BusinessItemVariation)
                    .WithMany(p => p.InventoryIncomeDetail)
                    .HasForeignKey(d => d.BusinessItemVariationId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_InventoryIncome_Detail_BusinessVariation");

                entity.HasOne(d => d.InventoryIncome)
                    .WithMany(p => p.InventoryIncomeDetail)
                    .HasForeignKey(d => d.InventoryIncomeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_InventoryIncome_Detail_InventoryIncome");
            });

            modelBuilder.Entity<InventoryOutput>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.SaleInvoiceId).HasColumnName("SaleInvoice_Id");

                entity.Property(e => e.TransactionDate).HasColumnType("datetime");

                entity.Property(e => e.WarehouseId).HasColumnName("Warehouse_Id");

                entity.HasOne(d => d.SaleInvoice)
                    .WithMany(p => p.InventoryOutput)
                    .HasForeignKey(d => d.SaleInvoiceId)
                    .HasConstraintName("FK_Output_SaleInvoice");

                entity.HasOne(d => d.Warehouse)
                    .WithMany(p => p.InventoryOutput)
                    .HasForeignKey(d => d.WarehouseId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Output_Warehouse");
            });

            modelBuilder.Entity<InventoryOutputDetail>(entity =>
            {
                entity.ToTable("InventoryOutput_Detail");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.BusinessItemVariationId).HasColumnName("BusinessItemVariation_Id");

                entity.Property(e => e.BusinessItemVariationName)
                    .HasColumnName("BusinessItemVariation_Name")
                    .HasMaxLength(150);

                entity.Property(e => e.Comments).HasMaxLength(500);

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.InventoryOutputId).HasColumnName("InventoryOutput_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Quantity).HasColumnType("decimal(18, 5)");

                entity.HasOne(d => d.BusinessItemVariation)
                    .WithMany(p => p.InventoryOutputDetail)
                    .HasForeignKey(d => d.BusinessItemVariationId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_InventoryOutput_Detail_BusinessVariation");

                entity.HasOne(d => d.InventoryOutput)
                    .WithMany(p => p.InventoryOutputDetail)
                    .HasForeignKey(d => d.InventoryOutputId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_InventoryOutput_Detail_InventoryIncome");
            });

            modelBuilder.Entity<InventoryOutputDetailInventory>(entity =>
            {
                entity.ToTable("InventoryOutputDetail_Inventory");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.BusinessItemVariationName)
                    .HasColumnName("BusinessItemVariation_Name")
                    .HasMaxLength(250);

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.InventoryId).HasColumnName("Inventory_Id");

                entity.Property(e => e.InventoryOutputDetailId).HasColumnName("InventoryOutput_Detail_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.HasOne(d => d.Inventory)
                    .WithMany(p => p.InventoryOutputDetailInventory)
                    .HasForeignKey(d => d.InventoryId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_InventoryOutputDetail_Inventory");

                entity.HasOne(d => d.InventoryOutputDetail)
                    .WithMany(p => p.InventoryOutputDetailInventory)
                    .HasForeignKey(d => d.InventoryOutputDetailId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_InventoryOutputDetail_Detail");
            });

            modelBuilder.Entity<InventoryStatus>(entity =>
            {
                entity.ToTable("Inventory_Status");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name).HasMaxLength(150);
            });

            modelBuilder.Entity<InventoryTransfer>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.DestinyEmployeeId).HasColumnName("DestinyEmployee_Id");

                entity.Property(e => e.DestinyWareHouseId).HasColumnName("DestinyWareHouse_Id");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.InventoryTransferReasonId).HasColumnName("InventoryTransfer_Reason_Id");

                entity.Property(e => e.InventoryTransferStatusId).HasColumnName("InventoryTransfer_Status_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.OriginEmployeeId).HasColumnName("OriginEmployee_Id");

                entity.Property(e => e.OriginWarehouseId).HasColumnName("OriginWarehouse_Id");

                entity.Property(e => e.OutputDate).HasColumnType("datetime");

                entity.HasOne(d => d.DestinyEmployee)
                    .WithMany(p => p.InventoryTransferDestinyEmployee)
                    .HasForeignKey(d => d.DestinyEmployeeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_InventoryTransfer_DestinyEmployee");

                entity.HasOne(d => d.DestinyWareHouse)
                    .WithMany(p => p.InventoryTransferDestinyWareHouse)
                    .HasForeignKey(d => d.DestinyWareHouseId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_InventoryTransfer_DestinyWarehouse");

                entity.HasOne(d => d.InventoryTransferReason)
                    .WithMany(p => p.InventoryTransfer)
                    .HasForeignKey(d => d.InventoryTransferReasonId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_InventoryTransfer_Reason");

                entity.HasOne(d => d.InventoryTransferStatus)
                    .WithMany(p => p.InventoryTransfer)
                    .HasForeignKey(d => d.InventoryTransferStatusId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_InventoryTransfer_Status");

                entity.HasOne(d => d.OriginEmployee)
                    .WithMany(p => p.InventoryTransferOriginEmployee)
                    .HasForeignKey(d => d.OriginEmployeeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_InventoryTransfer_OriginEmployee");

                entity.HasOne(d => d.OriginWarehouse)
                    .WithMany(p => p.InventoryTransferOriginWarehouse)
                    .HasForeignKey(d => d.OriginWarehouseId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_InventoryTransfer_OriginWarehouse");
            });

            modelBuilder.Entity<InventoryTransferDetail>(entity =>
            {
                entity.ToTable("InventoryTransfer_Detail");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.BusinessItemVariationId).HasColumnName("BusinessItemVariation_Id");

                entity.Property(e => e.BusinessItemVariationName)
                    .HasColumnName("BusinessItemVariation_Name")
                    .HasMaxLength(250);

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.InventoryTransferId).HasColumnName("InventoryTransfer_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Quantity).HasColumnType("decimal(18, 5)");

                entity.HasOne(d => d.BusinessItemVariation)
                    .WithMany(p => p.InventoryTransferDetail)
                    .HasForeignKey(d => d.BusinessItemVariationId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_InventoryTransfer_Detail_BusinessItemVariation");

                entity.HasOne(d => d.InventoryTransfer)
                    .WithMany(p => p.InventoryTransferDetail)
                    .HasForeignKey(d => d.InventoryTransferId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_InventoryTransfer_Detail_InventoryTransfer");
            });

            modelBuilder.Entity<InventoryTransferDetailInventory>(entity =>
            {
                entity.ToTable("InventoryTransferDetail_Inventory");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.BusinessItemVariationName)
                    .HasColumnName("BusinessItemVariation_Name")
                    .HasMaxLength(250);

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.InventoryId).HasColumnName("Inventory_Id");

                entity.Property(e => e.InventoryTransferDetailId).HasColumnName("InventoryTransfer_Detail_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.HasOne(d => d.Inventory)
                    .WithMany(p => p.InventoryTransferDetailInventory)
                    .HasForeignKey(d => d.InventoryId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_InventoryTransferDetail_Inventory");

                entity.HasOne(d => d.InventoryTransferDetail)
                    .WithMany(p => p.InventoryTransferDetailInventory)
                    .HasForeignKey(d => d.InventoryTransferDetailId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_InventoryTransferDetail_Detail");
            });

            modelBuilder.Entity<InventoryTransferReason>(entity =>
            {
                entity.ToTable("InventoryTransfer_Reason");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name).HasMaxLength(150);
            });

            modelBuilder.Entity<InventoryTransferStatus>(entity =>
            {
                entity.ToTable("InventoryTransfer_Status");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name).HasMaxLength(150);
            });

            modelBuilder.Entity<Language>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name).HasMaxLength(509);
            });

            modelBuilder.Entity<LegalIdType>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.Code).HasMaxLength(10);

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name).HasMaxLength(50);
            });

            modelBuilder.Entity<Manufacture>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.BusinessItemVariationId).HasColumnName("BusinessItemVariation_Id");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.Date).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.EndDate).HasColumnType("datetime");

                entity.Property(e => e.FactoryId).HasColumnName("Factory_Id");

                entity.Property(e => e.ManufactureStatusId).HasColumnName("Manufacture_Status_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.ProjectId).HasColumnName("Project_Id");

                entity.Property(e => e.Quantity).HasColumnType("decimal(18, 5)");

                entity.Property(e => e.ResponsableEmployeeId).HasColumnName("ResponsableEmployee_Id");

                entity.Property(e => e.StartDate).HasColumnType("datetime");

                entity.Property(e => e.UnitOfMeasureId).HasColumnName("UnitOfMeasure_Id");

                entity.Property(e => e.WarehouseId).HasColumnName("Warehouse_Id");

                entity.HasOne(d => d.BusinessItemVariation)
                    .WithMany(p => p.Manufacture)
                    .HasForeignKey(d => d.BusinessItemVariationId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Manufacture_BusinessItemVariation");

                entity.HasOne(d => d.Factory)
                    .WithMany(p => p.Manufacture)
                    .HasForeignKey(d => d.FactoryId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Manufacture_ProductionCenter");

                entity.HasOne(d => d.ManufactureStatus)
                    .WithMany(p => p.Manufacture)
                    .HasForeignKey(d => d.ManufactureStatusId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Manufacture_ManufactureStatus");

                entity.HasOne(d => d.UnitOfMeasure)
                    .WithMany(p => p.Manufacture)
                    .HasForeignKey(d => d.UnitOfMeasureId)
                    .HasConstraintName("FK_Manufacture_UnitOfMeasure");

                entity.HasOne(d => d.Warehouse)
                    .WithMany(p => p.Manufacture)
                    .HasForeignKey(d => d.WarehouseId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Manufacture_ProvisionWarehouse");
            });

            modelBuilder.Entity<ManufactureItem>(entity =>
            {
                entity.ToTable("Manufacture_Item");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.BusinessItemVariationId).HasColumnName("BusinessItemVariation_Id");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ManufactureId).HasColumnName("Manufacture_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name).HasMaxLength(200);

                entity.Property(e => e.Quantity).HasColumnType("decimal(18, 2)");

                entity.HasOne(d => d.BusinessItemVariation)
                    .WithMany(p => p.ManufactureItem)
                    .HasForeignKey(d => d.BusinessItemVariationId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ManufactureItem_BusinessItemVariation");

                entity.HasOne(d => d.Manufacture)
                    .WithMany(p => p.ManufactureItem)
                    .HasForeignKey(d => d.ManufactureId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ManufactureItem_Manufacture");
            });

            modelBuilder.Entity<ManufactureStatus>(entity =>
            {
                entity.ToTable("Manufacture_Status");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name).IsRequired();
            });

            modelBuilder.Entity<MassiveEmail>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.CustomerSegmentsId).HasColumnName("CustomerSegments_Id");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.MassiveEmailStateId).HasColumnName("MassiveEmail_State_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name).HasMaxLength(500);

                entity.Property(e => e.Opened).HasDefaultValueSql("((0))");

                entity.Property(e => e.Read).HasDefaultValueSql("((0))");

                entity.Property(e => e.Received).HasDefaultValueSql("((0))");

                entity.Property(e => e.Rejected).HasDefaultValueSql("((0))");

                entity.Property(e => e.SendDate).HasColumnType("datetime");

                entity.Property(e => e.Signature).HasMaxLength(500);

                entity.Property(e => e.Subject).HasMaxLength(500);

                entity.Property(e => e.Text).HasMaxLength(1000);

                entity.Property(e => e.Title).HasMaxLength(500);

                entity.HasOne(d => d.CustomerSegments)
                    .WithMany(p => p.MassiveEmail)
                    .HasForeignKey(d => d.CustomerSegmentsId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_MassiveEmail_CustomerSegments");

                entity.HasOne(d => d.MassiveEmailState)
                    .WithMany(p => p.MassiveEmail)
                    .HasForeignKey(d => d.MassiveEmailStateId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_MassiveEmail_MassiveEmail_State");
            });

            modelBuilder.Entity<MassiveEmailState>(entity =>
            {
                entity.ToTable("MassiveEmail_State");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name).HasMaxLength(500);
            });

            modelBuilder.Entity<Module>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.Color).HasMaxLength(25);

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.Icon).HasMaxLength(50);

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50);
            });

            modelBuilder.Entity<Ocupation>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name).HasMaxLength(509);
            });

            modelBuilder.Entity<PaymentSubtype>(entity =>
            {
                entity.ToTable("Payment_Subtype");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name).HasMaxLength(500);

                entity.Property(e => e.PaymentTypeId).HasColumnName("Payment_Type_Id");

                entity.HasOne(d => d.PaymentType)
                    .WithMany(p => p.PaymentSubtype)
                    .HasForeignKey(d => d.PaymentTypeId)
                    .HasConstraintName("FK_Payment_Subtype_Type");
            });

            modelBuilder.Entity<PaymentType>(entity =>
            {
                entity.ToTable("Payment_Type");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.Code).HasMaxLength(5);

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name).HasMaxLength(500);
            });

            modelBuilder.Entity<Permission>(entity =>
            {
                entity.HasIndex(e => new { e.EntityId, e.RoleId })
                    .HasName("UC_Entity_Role")
                    .IsUnique();

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.EntityId).HasColumnName("Entity_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.RoleId).HasColumnName("Role_Id");

                entity.HasOne(d => d.Role)
                    .WithMany(p => p.Permission)
                    .HasForeignKey(d => d.RoleId)
                    .HasConstraintName("FK_RolePermission_Role");
            });

            modelBuilder.Entity<Product>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();
            });

            modelBuilder.Entity<Purchase>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CompanyPlaceId).HasColumnName("Company_Place_Id");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.Date).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.PurchaseStatusId).HasColumnName("Purchase_Status_Id");

                entity.Property(e => e.SaleId).HasColumnName("Sale_Id");

                entity.Property(e => e.Subtotal).HasColumnType("decimal(18, 5)");

                entity.Property(e => e.SupplierId).HasColumnName("Supplier_Id");

                entity.Property(e => e.Total).HasColumnType("decimal(18, 5)");

                entity.HasOne(d => d.CompanyPlace)
                    .WithMany(p => p.Purchase)
                    .HasForeignKey(d => d.CompanyPlaceId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Purchase_CompanyPlace");

                entity.HasOne(d => d.Employee)
                    .WithMany(p => p.Purchase)
                    .HasForeignKey(d => d.EmployeeId)
                    .HasConstraintName("FK_Purchase_Employee_Id");

                entity.HasOne(d => d.PurchaseStatus)
                    .WithMany(p => p.Purchase)
                    .HasForeignKey(d => d.PurchaseStatusId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Purchase_PurchaseStatus");

                entity.HasOne(d => d.Sale)
                    .WithMany(p => p.Purchase)
                    .HasForeignKey(d => d.SaleId)
                    .HasConstraintName("FK_Purchase_Sale");

                entity.HasOne(d => d.Supplier)
                    .WithMany(p => p.Purchase)
                    .HasForeignKey(d => d.SupplierId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Purchase_Supplier");
            });

            modelBuilder.Entity<PurchaseInvoice>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.Batch).HasMaxLength(100);

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.Date).HasColumnType("date");

                entity.Property(e => e.DiscountAmount).HasColumnType("decimal(18, 5)");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.PurchaseId).HasColumnName("Purchase_Id");

                entity.Property(e => e.TaxAmount).HasColumnType("decimal(18, 5)");

                entity.Property(e => e.TipAmount).HasColumnType("decimal(18, 5)");

                entity.Property(e => e.TotalAmount).HasColumnType("decimal(18, 5)");

                entity.Property(e => e.TotalAmountWithoutTaxes).HasColumnType("decimal(18, 5)");

                entity.HasOne(d => d.Purchase)
                    .WithMany(p => p.PurchaseInvoice)
                    .HasForeignKey(d => d.PurchaseId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PurchaseInvoice_Purchase");
            });

            modelBuilder.Entity<PurchaseInvoiceLine>(entity =>
            {
                entity.ToTable("PurchaseInvoice_Line");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.BusinessItemVariationId).HasColumnName("BusinessItemVariation_Id");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.PurchaseInvoiceId).HasColumnName("PurchaseInvoice_Id");

                entity.Property(e => e.Quantity).HasColumnType("decimal(18, 5)");

                entity.Property(e => e.TotalPrice).HasColumnType("decimal(18, 5)");

                entity.Property(e => e.UnitDiscount).HasColumnType("decimal(18, 5)");

                entity.Property(e => e.UnitPrice).HasColumnType("decimal(18, 5)");

                entity.HasOne(d => d.BusinessItemVariation)
                    .WithMany(p => p.PurchaseInvoiceLine)
                    .HasForeignKey(d => d.BusinessItemVariationId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PurchaseInvoice_Line_BusinessItemVariation");

                entity.HasOne(d => d.PurchaseInvoice)
                    .WithMany(p => p.PurchaseInvoiceLine)
                    .HasForeignKey(d => d.PurchaseInvoiceId)
                    .HasConstraintName("FK_PurchaseInvoice_Line");
            });

            modelBuilder.Entity<PurchaseInvoiceLineTax>(entity =>
            {
                entity.ToTable("PurchaseInvoice_LineTax");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(20);

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(2000);

                entity.Property(e => e.Percentage).HasColumnType("decimal(18, 5)");

                entity.Property(e => e.PercentageCode)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.PurchaseInvoiceLineId).HasColumnName("PurchaseInvoice_Line_Id");

                entity.Property(e => e.TaxAmount).HasColumnType("decimal(18, 5)");

                entity.Property(e => e.TaxId).HasColumnName("Tax_Id");

                entity.Property(e => e.TaxableAmount).HasColumnType("decimal(18, 5)");

                entity.HasOne(d => d.PurchaseInvoiceLine)
                    .WithMany(p => p.PurchaseInvoiceLineTax)
                    .HasForeignKey(d => d.PurchaseInvoiceLineId)
                    .HasConstraintName("FK_PurchaseInvoice_LineTax_Line");

                entity.HasOne(d => d.Tax)
                    .WithMany(p => p.PurchaseInvoiceLineTax)
                    .HasForeignKey(d => d.TaxId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PurchaseInvoice_LineTax_Tax");
            });

            modelBuilder.Entity<PurchaseInvoicePayment>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.Amount).HasColumnType("decimal(18, 5)");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.Date).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ExpirationDate).HasColumnType("date");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.PurchaseInvoiceId).HasColumnName("PurchaseInvoice_Id");

                entity.Property(e => e.SupplierPaymentOptionId).HasColumnName("Supplier_PaymentOption_Id");

                entity.HasOne(d => d.PurchaseInvoice)
                    .WithMany(p => p.PurchaseInvoicePayment)
                    .HasForeignKey(d => d.PurchaseInvoiceId)
                    .HasConstraintName("FK_PurchaseInvoicePayment_PurchaseInvoice");

                entity.HasOne(d => d.SupplierPaymentOption)
                    .WithMany(p => p.PurchaseInvoicePayment)
                    .HasForeignKey(d => d.SupplierPaymentOptionId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PurchaseInvoicePayment_CustomerPaymentOption");
            });

            modelBuilder.Entity<PurchaseInvoiceTax>(entity =>
            {
                entity.ToTable("PurchaseInvoice_Tax");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(20);

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(2000);

                entity.Property(e => e.Percentage).HasColumnType("decimal(18, 5)");

                entity.Property(e => e.PercentageCode)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.PurchaseInvoiceId).HasColumnName("PurchaseInvoice_Id");

                entity.Property(e => e.TaxAmount).HasColumnType("decimal(18, 5)");

                entity.Property(e => e.TaxId).HasColumnName("Tax_Id");

                entity.Property(e => e.TaxableAmount).HasColumnType("decimal(18, 5)");

                entity.HasOne(d => d.PurchaseInvoice)
                    .WithMany(p => p.PurchaseInvoiceTax)
                    .HasForeignKey(d => d.PurchaseInvoiceId)
                    .HasConstraintName("FK_PurchaseTax_PurchaseInvoice");

                entity.HasOne(d => d.Tax)
                    .WithMany(p => p.PurchaseInvoiceTax)
                    .HasForeignKey(d => d.TaxId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PurchaseTax_Tax");
            });

            modelBuilder.Entity<PurchaseItem>(entity =>
            {
                entity.ToTable("Purchase_Item");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.BusinessItemVariationId).HasColumnName("BusinessItemVariation_Id");

                entity.Property(e => e.BusinessItemVariationName)
                    .HasColumnName("BusinessItemVariation_Name")
                    .HasMaxLength(100);

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.PurchaseId).HasColumnName("Purchase_Id");

                entity.Property(e => e.Quantity).HasColumnType("decimal(18, 5)");

                entity.Property(e => e.TotalPrice).HasColumnType("decimal(18, 5)");

                entity.Property(e => e.UnitDiscount).HasColumnType("decimal(18, 5)");

                entity.Property(e => e.UnitPrice).HasColumnType("decimal(18, 5)");

                entity.HasOne(d => d.BusinessItemVariation)
                    .WithMany(p => p.PurchaseItem)
                    .HasForeignKey(d => d.BusinessItemVariationId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PurchaseItem_Material");

                entity.HasOne(d => d.Purchase)
                    .WithMany(p => p.PurchaseItem)
                    .HasForeignKey(d => d.PurchaseId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_PurchaseItem_Purchase");
            });

            modelBuilder.Entity<PurchaseStatus>(entity =>
            {
                entity.ToTable("Purchase_Status");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name).HasMaxLength(150);
            });

            modelBuilder.Entity<RemissionGuide>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.ArriveDate).HasColumnType("date");

                entity.Property(e => e.AuthorizationDate).HasColumnType("date");

                entity.Property(e => e.Batch).HasMaxLength(100);

                entity.Property(e => e.CompanyAccountingRequired).HasMaxLength(100);

                entity.Property(e => e.CompanyEmissionPointId).HasColumnName("Company_EmissionPoint_Id");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.Date).HasColumnType("date");

                entity.Property(e => e.DepartureDate).HasColumnType("date");

                entity.Property(e => e.DocumentNumber)
                    .IsRequired()
                    .HasComputedColumnSql("(concat(isnull([CompanyPlaceCode],''),'-',isnull([CompanyPointOfSaleCode],''),'-',isnull([Number],'')))");

                entity.Property(e => e.DriverId).HasColumnName("Driver_Id");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.InventoryOutputId).HasColumnName("InventoryOutput_Id");

                entity.Property(e => e.InventoryTransferId).HasColumnName("InventoryTransfer_Id");

                entity.Property(e => e.KeyAccess).HasMaxLength(50);

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.VehiculeId).HasMaxLength(50);

                entity.Property(e => e.VoucherStatus).HasMaxLength(50);

                entity.HasOne(d => d.CompanyEmissionPoint)
                    .WithMany(p => p.RemissionGuide)
                    .HasForeignKey(d => d.CompanyEmissionPointId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_RemissionGuide_Company_EmissionPoint");

                entity.HasOne(d => d.Driver)
                    .WithMany(p => p.RemissionGuide)
                    .HasForeignKey(d => d.DriverId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_RemissionGuide_Driver");

                entity.HasOne(d => d.InventoryOutput)
                    .WithMany(p => p.RemissionGuide)
                    .HasForeignKey(d => d.InventoryOutputId)
                    .HasConstraintName("FK_RemissionGuide_InventoryOutput");

                entity.HasOne(d => d.InventoryTransfer)
                    .WithMany(p => p.RemissionGuide)
                    .HasForeignKey(d => d.InventoryTransferId)
                    .HasConstraintName("FK_RemissionGuide_InventoryTransfer");
            });

            modelBuilder.Entity<RemissionGuideLine>(entity =>
            {
                entity.ToTable("RemissionGuide_Line");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.BusinessItemVariationId).HasColumnName("BusinessItemVariation_Id");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Quantity).HasColumnType("decimal(18, 5)");

                entity.Property(e => e.RemissionGuideId).HasColumnName("RemissionGuide_Id");

                entity.HasOne(d => d.BusinessItemVariation)
                    .WithMany(p => p.RemissionGuideLine)
                    .HasForeignKey(d => d.BusinessItemVariationId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_RemissionGuide_Line_BusinessItem");

                entity.HasOne(d => d.RemissionGuide)
                    .WithMany(p => p.RemissionGuideLine)
                    .HasForeignKey(d => d.RemissionGuideId)
                    .HasConstraintName("FK_RemissionGuide_Line");
            });

            modelBuilder.Entity<RetentionVoucher>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.AuthorizationDate).HasColumnType("date");

                entity.Property(e => e.CompanyAccountingRequired).HasMaxLength(100);

                entity.Property(e => e.CompanyEmissionPointId).HasColumnName("Company_EmissionPoint_Id");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.Date).HasColumnType("date");

                entity.Property(e => e.DocumentNumber)
                    .IsRequired()
                    .HasComputedColumnSql("(concat(isnull([CompanyPlaceCode],''),'-',isnull([CompanyPointOfSaleCode],''),'-',isnull([Number],'')))");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.KeyAccess).HasMaxLength(50);

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.PurchaseInvoiceId).HasColumnName("PurchaseInvoice_Id");

                entity.Property(e => e.VoucherStatus).HasMaxLength(50);

                entity.HasOne(d => d.CompanyEmissionPoint)
                    .WithMany(p => p.RetentionVoucher)
                    .HasForeignKey(d => d.CompanyEmissionPointId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_RetentionVoucher_Company_EmissionPoint");

                entity.HasOne(d => d.PurchaseInvoice)
                    .WithMany(p => p.RetentionVoucher)
                    .HasForeignKey(d => d.PurchaseInvoiceId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_RemissionGuide_PurchaseInvoice");
            });

            modelBuilder.Entity<RetentionVoucherLine>(entity =>
            {
                entity.ToTable("RetentionVoucher_Line");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmissionDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Number).HasMaxLength(200);

                entity.Property(e => e.RetentionVoucherId).HasColumnName("RetentionVoucher_Id");

                entity.Property(e => e.TaxAmount).HasColumnType("decimal(18, 5)");

                entity.Property(e => e.TaxPorcentage).HasColumnType("decimal(18, 5)");

                entity.Property(e => e.TaxRetentionId).HasColumnName("Tax_Retention_Id");

                entity.Property(e => e.TotalTaxAmount).HasColumnType("decimal(18, 5)");

                entity.HasOne(d => d.RetentionVoucher)
                    .WithMany(p => p.RetentionVoucherLine)
                    .HasForeignKey(d => d.RetentionVoucherId)
                    .HasConstraintName("FK_RetentionVoucher_Line");

                entity.HasOne(d => d.TaxRetention)
                    .WithMany(p => p.RetentionVoucherLine)
                    .HasForeignKey(d => d.TaxRetentionId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_RetentionVoucher_Line_TaxRetention");
            });

            modelBuilder.Entity<Role>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.HomePage).HasMaxLength(500);

                entity.Property(e => e.IsDefault).HasDefaultValueSql("((0))");

                entity.Property(e => e.IsMain).HasDefaultValueSql("((0))");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(256);
            });

            modelBuilder.Entity<RoleAction>(entity =>
            {
                entity.ToTable("Role_Action");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.ActionId).HasColumnName("Action_Id");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.RoleId).HasColumnName("Role_Id");

                entity.Property(e => e.RoleName)
                    .IsRequired()
                    .HasColumnName("Role_Name")
                    .HasMaxLength(256);
            });

            modelBuilder.Entity<Sale>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.BusinessOpportunityId).HasColumnName("BusinessOpportunity_Id");

                entity.Property(e => e.CampaignId).HasColumnName("Campaign_Id");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.CustomerId).HasColumnName("Customer_Id");

                entity.Property(e => e.Date).HasColumnType("datetime");

                entity.Property(e => e.Discount).HasColumnType("decimal(18, 5)");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.SalePlaceId).HasColumnName("Sale_Place_Id");

                entity.Property(e => e.Subtotal).HasColumnType("decimal(18, 5)");

                entity.Property(e => e.Tip).HasColumnType("decimal(18, 5)");

                entity.Property(e => e.Total).HasColumnType("decimal(18, 5)");

                entity.HasOne(d => d.Customer)
                    .WithMany(p => p.Sale)
                    .HasForeignKey(d => d.CustomerId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Sales_Customer");

                entity.HasOne(d => d.Employee)
                    .WithMany(p => p.Sale)
                    .HasForeignKey(d => d.EmployeeId)
                    .HasConstraintName("FK_Sale_Employee_Id");

                entity.HasOne(d => d.SalePlace)
                    .WithMany(p => p.Sale)
                    .HasForeignKey(d => d.SalePlaceId)
                    .HasConstraintName("FK_Sale_Sale_Place");
            });

            modelBuilder.Entity<SaleInvoice>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.AuthorizationDate).HasColumnType("date");

                entity.Property(e => e.Batch).HasMaxLength(100);

                entity.Property(e => e.CompanyAccountingRequired).HasMaxLength(100);

                entity.Property(e => e.CompanyEmissionPointId).HasColumnName("Company_EmissionPoint_Id");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.Date).HasColumnType("date");

                entity.Property(e => e.DiscountAmount).HasColumnType("decimal(18, 5)");

                entity.Property(e => e.DocumentNumber)
                    .IsRequired()
                    .HasComputedColumnSql("(concat(isnull([CompanyPlaceCode],''),'-',isnull([CompanyPointOfSaleCode],''),'-',isnull([Number],'')))");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.KeyAccess).HasMaxLength(50);

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.SaleId).HasColumnName("Sale_Id");

                entity.Property(e => e.SaleInvoiceRecurrentProcessId).HasColumnName("SaleInvoice_RecurrentProcess_Id");

                entity.Property(e => e.TaxAmount).HasColumnType("decimal(18, 5)");

                entity.Property(e => e.TipAmount).HasColumnType("decimal(18, 5)");

                entity.Property(e => e.TotalAmount).HasColumnType("decimal(18, 5)");

                entity.Property(e => e.TotalAmountWithoutTaxes).HasColumnType("decimal(18, 5)");

                entity.Property(e => e.VoucherStatus).HasMaxLength(50);

                entity.HasOne(d => d.CompanyEmissionPoint)
                    .WithMany(p => p.SaleInvoice)
                    .HasForeignKey(d => d.CompanyEmissionPointId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_SaleInvoice_Company_EmissionPoint");

                entity.HasOne(d => d.Sale)
                    .WithMany(p => p.SaleInvoice)
                    .HasForeignKey(d => d.SaleId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_SaleInvoice_Sale");

                entity.HasOne(d => d.SaleInvoiceRecurrentProcess)
                    .WithMany(p => p.SaleInvoice)
                    .HasForeignKey(d => d.SaleInvoiceRecurrentProcessId)
                    .OnDelete(DeleteBehavior.Cascade)
                    .HasConstraintName("FK_SaleInvoice_RecurrentProcess");
            });

            modelBuilder.Entity<SaleInvoiceLine>(entity =>
            {
                entity.ToTable("SaleInvoice_Line");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.BusinessItemVariationId).HasColumnName("BusinessItemVariation_Id");

                entity.Property(e => e.Code1).IsRequired();

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.Description).IsRequired();

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Quantity).HasColumnType("decimal(18, 5)");

                entity.Property(e => e.SaleInvoiceId).HasColumnName("SaleInvoice_Id");

                entity.Property(e => e.TotalPrice).HasColumnType("decimal(18, 5)");

                entity.Property(e => e.UnitDiscount).HasColumnType("decimal(18, 5)");

                entity.Property(e => e.UnitPrice).HasColumnType("decimal(18, 5)");

                entity.HasOne(d => d.BusinessItemVariation)
                    .WithMany(p => p.SaleInvoiceLine)
                    .HasForeignKey(d => d.BusinessItemVariationId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_SaleInvoice_Line_BusinessItem");

                entity.HasOne(d => d.SaleInvoice)
                    .WithMany(p => p.SaleInvoiceLine)
                    .HasForeignKey(d => d.SaleInvoiceId)
                    .HasConstraintName("FK_SaleInvoice_Line");
            });

            modelBuilder.Entity<SaleInvoiceLineTax>(entity =>
            {
                entity.ToTable("SaleInvoice_LineTax");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(20);

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(2000);

                entity.Property(e => e.Percentage).HasColumnType("decimal(18, 5)");

                entity.Property(e => e.PercentageCode)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.SaleInvoiceLineId).HasColumnName("SaleInvoice_Line_Id");

                entity.Property(e => e.TaxAmount).HasColumnType("decimal(18, 5)");

                entity.Property(e => e.TaxId).HasColumnName("Tax_Id");

                entity.Property(e => e.TaxableAmount).HasColumnType("decimal(18, 5)");

                entity.HasOne(d => d.SaleInvoiceLine)
                    .WithMany(p => p.SaleInvoiceLineTax)
                    .HasForeignKey(d => d.SaleInvoiceLineId)
                    .HasConstraintName("FK_SaleInvoice_LineTax_Line");

                entity.HasOne(d => d.Tax)
                    .WithMany(p => p.SaleInvoiceLineTax)
                    .HasForeignKey(d => d.TaxId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_SaleInvoice_LineTax_Tax");
            });

            modelBuilder.Entity<SaleInvoicePayment>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.Amount).HasColumnType("decimal(18, 5)");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.CustomerPaymentOptionId).HasColumnName("Customer_PaymentOption_Id");

                entity.Property(e => e.Date).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ExpirationDate).HasColumnType("date");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.SaleInvoiceId).HasColumnName("SaleInvoice_Id");

                entity.HasOne(d => d.CustomerPaymentOption)
                    .WithMany(p => p.SaleInvoicePayment)
                    .HasForeignKey(d => d.CustomerPaymentOptionId)
                    .HasConstraintName("FK_SaleInvoicePayment_CustomerPaymentOption");

                entity.HasOne(d => d.SaleInvoice)
                    .WithMany(p => p.SaleInvoicePayment)
                    .HasForeignKey(d => d.SaleInvoiceId)
                    .HasConstraintName("FK_SaleInvoicePayment_SaleInvoice");
            });

            modelBuilder.Entity<SaleInvoiceProgressProcess>(entity =>
            {
                entity.ToTable("SaleInvoice_ProgressProcess");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.ContractProgressPaymentRuleId).HasColumnName("Contract_ProgressPaymentRule_Id");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.HasOne(d => d.ContractProgressPaymentRule)
                    .WithMany(p => p.SaleInvoiceProgressProcess)
                    .HasForeignKey(d => d.ContractProgressPaymentRuleId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_SaleInvoice_ProgressProcess");
            });

            modelBuilder.Entity<SaleInvoiceRecurrentProcess>(entity =>
            {
                entity.ToTable("SaleInvoice_RecurrentProcess");

                entity.HasIndex(e => new { e.Year, e.Month })
                    .HasName("UQ__SaleInvo__FB142A42339ABD8D")
                    .IsUnique();

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");
            });

            modelBuilder.Entity<SaleInvoiceTax>(entity =>
            {
                entity.ToTable("SaleInvoice_Tax");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(20);

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(2000);

                entity.Property(e => e.Percentage).HasColumnType("decimal(18, 5)");

                entity.Property(e => e.PercentageCode)
                    .IsRequired()
                    .HasMaxLength(50);

                entity.Property(e => e.SaleInvoiceId).HasColumnName("SaleInvoice_Id");

                entity.Property(e => e.TaxAmount).HasColumnType("decimal(18, 5)");

                entity.Property(e => e.TaxId).HasColumnName("Tax_Id");

                entity.Property(e => e.TaxableAmount).HasColumnType("decimal(18, 5)");

                entity.HasOne(d => d.SaleInvoice)
                    .WithMany(p => p.SaleInvoiceTax)
                    .HasForeignKey(d => d.SaleInvoiceId)
                    .HasConstraintName("FK_SaleInvoiceTax_SaleInvoice");

                entity.HasOne(d => d.Tax)
                    .WithMany(p => p.SaleInvoiceTax)
                    .HasForeignKey(d => d.TaxId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_SaleInvoiceTax_Tax");
            });

            modelBuilder.Entity<SaleItem>(entity =>
            {
                entity.ToTable("Sale_Item");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.BusinessItemVariationId).HasColumnName("BusinessItemVariation_Id");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.CustomerUnitDiscountPercentage)
                    .HasColumnType("decimal(18, 5)")
                    .HasDefaultValueSql("((0))");

                entity.Property(e => e.DiscountedUnitPrice)
                    .HasColumnType("decimal(18, 5)")
                    .HasDefaultValueSql("((0))");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Quantity).HasColumnType("decimal(18, 5)");

                entity.Property(e => e.SaleId).HasColumnName("Sale_Id");

                entity.Property(e => e.SaleUnitDiscountPercentage)
                    .HasColumnType("decimal(18, 5)")
                    .HasDefaultValueSql("((0))");

                entity.Property(e => e.TotalPrice)
                    .HasColumnType("decimal(18, 5)")
                    .HasDefaultValueSql("((0))");

                entity.Property(e => e.TotalUnitDiscountAmount)
                    .HasColumnType("decimal(18, 5)")
                    .HasDefaultValueSql("((0))");

                entity.Property(e => e.TotalUnitDiscountPercentage)
                    .HasColumnType("decimal(18, 5)")
                    .HasDefaultValueSql("((0))");

                entity.Property(e => e.UnitPrice)
                    .HasColumnType("decimal(18, 5)")
                    .HasDefaultValueSql("((0))");

                entity.HasOne(d => d.BusinessItemVariation)
                    .WithMany(p => p.SaleItem)
                    .HasForeignKey(d => d.BusinessItemVariationId)
                    .HasConstraintName("FK_SaleItem_BusinessItemVariation");

                entity.HasOne(d => d.Sale)
                    .WithMany(p => p.SaleItem)
                    .HasForeignKey(d => d.SaleId)
                    .HasConstraintName("FK_SaleItem_Sale");
            });

            modelBuilder.Entity<SalePlace>(entity =>
            {
                entity.ToTable("Sale_Place");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name).HasMaxLength(500);
            });

            modelBuilder.Entity<Salutation>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name).HasMaxLength(500);
            });

            modelBuilder.Entity<Service>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.ContactId).HasColumnName("Contact_Id");

                entity.Property(e => e.ContractId).HasColumnName("Contract_Id");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.CustomerId).HasColumnName("Customer_Id");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Problem).HasMaxLength(2000);

                entity.Property(e => e.RequestDate).HasColumnType("datetime");

                entity.Property(e => e.Resolution).HasMaxLength(2000);

                entity.Property(e => e.ResolutionDate).HasColumnType("datetime");

                entity.Property(e => e.SaleInvoiceLineId).HasColumnName("SaleInvoice_Line_Id");

                entity.Property(e => e.ServicePriorityId).HasColumnName("Service_Priority_Id");

                entity.Property(e => e.ServiceStatusId).HasColumnName("Service_Status_Id");

                entity.Property(e => e.ServiceTypeId).HasColumnName("Service_Type_Id");

                entity.HasOne(d => d.Contact)
                    .WithMany(p => p.Service)
                    .HasForeignKey(d => d.ContactId)
                    .HasConstraintName("FK_Service_Contact");

                entity.HasOne(d => d.Contract)
                    .WithMany(p => p.Service)
                    .HasForeignKey(d => d.ContractId)
                    .HasConstraintName("FK_Service_Contract");

                entity.HasOne(d => d.Customer)
                    .WithMany(p => p.Service)
                    .HasForeignKey(d => d.CustomerId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Service_Customer");

                entity.HasOne(d => d.Employee)
                    .WithMany(p => p.Service)
                    .HasForeignKey(d => d.EmployeeId)
                    .HasConstraintName("FK_Service_Employee");

                entity.HasOne(d => d.SaleInvoiceLine)
                    .WithMany(p => p.Service)
                    .HasForeignKey(d => d.SaleInvoiceLineId)
                    .HasConstraintName("FK_Service_SaleInvoice_Line");

                entity.HasOne(d => d.ServicePriority)
                    .WithMany(p => p.Service)
                    .HasForeignKey(d => d.ServicePriorityId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Service_Priority");

                entity.HasOne(d => d.ServiceStatus)
                    .WithMany(p => p.Service)
                    .HasForeignKey(d => d.ServiceStatusId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Service_Status");

                entity.HasOne(d => d.ServiceType)
                    .WithMany(p => p.Service)
                    .HasForeignKey(d => d.ServiceTypeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Service_Service_Type");
            });

            modelBuilder.Entity<ServiceComment>(entity =>
            {
                entity.ToTable("Service_Comment");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.Date).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.ServiceId).HasColumnName("Service_Id");

                entity.Property(e => e.Text).HasMaxLength(1000);

                entity.HasOne(d => d.Employee)
                    .WithMany(p => p.ServiceComment)
                    .HasForeignKey(d => d.EmployeeId)
                    .HasConstraintName("FK_ServiceComment_Employee");

                entity.HasOne(d => d.Service)
                    .WithMany(p => p.ServiceComment)
                    .HasForeignKey(d => d.ServiceId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_ServiceComment_Service");
            });

            modelBuilder.Entity<ServicePriority>(entity =>
            {
                entity.ToTable("Service_Priority");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name).HasMaxLength(500);
            });

            modelBuilder.Entity<ServiceStatus>(entity =>
            {
                entity.ToTable("Service_Status");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name).HasMaxLength(500);
            });

            modelBuilder.Entity<ServiceType>(entity =>
            {
                entity.ToTable("Service_Type");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name).HasMaxLength(500);
            });

            modelBuilder.Entity<SourceChannel>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name).HasMaxLength(500);
            });

            modelBuilder.Entity<State>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CountryId).HasColumnName("Country_Id");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name).HasMaxLength(500);

                entity.HasOne(d => d.Country)
                    .WithMany(p => p.State)
                    .HasForeignKey(d => d.CountryId)
                    .HasConstraintName("FK_State_Country");
            });

            modelBuilder.Entity<Supplier>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.Address).HasMaxLength(500);

                entity.Property(e => e.Code).HasMaxLength(500);

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.Email).HasMaxLength(200);

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.LegalId).HasMaxLength(50);

                entity.Property(e => e.LegalIdTypeId).HasColumnName("LegalIdType_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name1).HasMaxLength(500);

                entity.Property(e => e.Name2).HasMaxLength(500);

                entity.Property(e => e.Phone).HasMaxLength(50);
            });

            modelBuilder.Entity<SupplierClass>(entity =>
            {
                entity.ToTable("Supplier_Class");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(500)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<SupplierPaymentOption>(entity =>
            {
                entity.ToTable("Supplier_PaymentOption");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.BankId).HasColumnName("Bank_Id");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ExpirationDate).HasColumnType("datetime");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Number).HasMaxLength(50);

                entity.Property(e => e.OwnerLegalId).HasMaxLength(500);

                entity.Property(e => e.OwnerName).HasMaxLength(500);

                entity.Property(e => e.PaymentSubtypeId).HasColumnName("Payment_Subtype_Id");

                entity.Property(e => e.SupplierId).HasColumnName("Supplier_Id");

                entity.HasOne(d => d.Bank)
                    .WithMany(p => p.SupplierPaymentOption)
                    .HasForeignKey(d => d.BankId)
                    .HasConstraintName("FK_Supplier_PaymentOption_Bank");

                entity.HasOne(d => d.PaymentSubtype)
                    .WithMany(p => p.SupplierPaymentOption)
                    .HasForeignKey(d => d.PaymentSubtypeId)
                    .HasConstraintName("FK_Supplier_PaymentOption_Type");

                entity.HasOne(d => d.Supplier)
                    .WithMany(p => p.SupplierPaymentOption)
                    .HasForeignKey(d => d.SupplierId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Supplier_PaymentOption_Supplier");
            });

            modelBuilder.Entity<Tax>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(500)
                    .IsUnicode(false);

                entity.Property(e => e.Percentage).HasColumnType("decimal(18, 5)");

                entity.Property(e => e.PercentageCode)
                    .IsRequired()
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.TaxTypeId).HasColumnName("Tax_Type_Id");

                entity.HasOne(d => d.TaxType)
                    .WithMany(p => p.Tax)
                    .HasForeignKey(d => d.TaxTypeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Tax_TaxType");
            });

            modelBuilder.Entity<TaxBusinessItemClass>(entity =>
            {
                entity.ToTable("Tax_BusinessItemClass");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.BusinessItemClassId).HasColumnName("BusinessItem_Class_Id");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.TaxId).HasColumnName("Tax_Id");

                entity.HasOne(d => d.BusinessItemClass)
                    .WithMany(p => p.TaxBusinessItemClass)
                    .HasForeignKey(d => d.BusinessItemClassId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Tax_BusinessItem_BusinessItem");

                entity.HasOne(d => d.Tax)
                    .WithMany(p => p.TaxBusinessItemClass)
                    .HasForeignKey(d => d.TaxId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Tax_BusinessItem_Tax");
            });

            modelBuilder.Entity<TaxCustomerClass>(entity =>
            {
                entity.ToTable("Tax_CustomerClass");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.CustomerClassId).HasColumnName("Customer_Class_Id");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.TaxId).HasColumnName("Tax_Id");

                entity.HasOne(d => d.CustomerClass)
                    .WithMany(p => p.TaxCustomerClass)
                    .HasForeignKey(d => d.CustomerClassId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Tax_CustomerClass_CustomerClass");

                entity.HasOne(d => d.Tax)
                    .WithMany(p => p.TaxCustomerClass)
                    .HasForeignKey(d => d.TaxId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Tax_CustomerClass_Tax");
            });

            modelBuilder.Entity<TaxRetention>(entity =>
            {
                entity.ToTable("Tax_Retention");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(500)
                    .IsUnicode(false);

                entity.Property(e => e.Percentage).HasColumnType("decimal(18, 5)");

                entity.Property(e => e.TaxRetentionTypeId).HasColumnName("Tax_RetentionType_Id");

                entity.HasOne(d => d.TaxRetentionType)
                    .WithMany(p => p.TaxRetention)
                    .HasForeignKey(d => d.TaxRetentionTypeId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Tax_RetentionType");
            });

            modelBuilder.Entity<TaxRetentionType>(entity =>
            {
                entity.ToTable("Tax_RetentionType");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(5);

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(100)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<TaxSupplierClass>(entity =>
            {
                entity.ToTable("Tax_SupplierClass");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.SupplierClassId).HasColumnName("Supplier_Class_Id");

                entity.Property(e => e.TaxId).HasColumnName("Tax_Id");

                entity.HasOne(d => d.SupplierClass)
                    .WithMany(p => p.TaxSupplierClass)
                    .HasForeignKey(d => d.SupplierClassId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Tax_SupplierClass_SupplierClass");

                entity.HasOne(d => d.Tax)
                    .WithMany(p => p.TaxSupplierClass)
                    .HasForeignKey(d => d.TaxId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Tax_SupplierClass_Tax");
            });

            modelBuilder.Entity<TaxType>(entity =>
            {
                entity.ToTable("Tax_Type");

                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.Code)
                    .IsRequired()
                    .HasMaxLength(5);

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(500)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Territory>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(1000);
            });

            modelBuilder.Entity<UnitOfMeasure>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.Abbreviation)
                    .IsRequired()
                    .HasMaxLength(25);

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(200);
            });

            modelBuilder.Entity<Warehouse>(entity =>
            {
                entity.Property(e => e.Id).ValueGeneratedNever();

                entity.Property(e => e.CompanyPlaceId).HasColumnName("Company_Place_Id");

                entity.Property(e => e.CreatedDate).HasColumnType("datetime");

                entity.Property(e => e.Description)
                    .IsRequired()
                    .HasMaxLength(2000);

                entity.Property(e => e.EmployeeId).HasColumnName("Employee_Id");

                entity.Property(e => e.ModifiedDate).HasColumnType("datetime");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(500);

                entity.HasOne(d => d.CompanyPlace)
                    .WithMany(p => p.Warehouse)
                    .HasForeignKey(d => d.CompanyPlaceId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_WarehouseMaterials_CompanyPlace");
            });
        }
    }
}
