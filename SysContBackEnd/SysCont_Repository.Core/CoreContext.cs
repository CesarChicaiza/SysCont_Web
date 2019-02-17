using Microsoft.EntityFrameworkCore;
using SysCont_Repository.Core.Entity;
using SysCont_Repository.Core.Mapping;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Text;

namespace SysCont_Repository.Core
{
    public class CoreContext: DbContext
    {
        public CoreContext()
        {

        }

        public CoreContext(DbContextOptions<CoreContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Membership> Memberships { get; set; }
        public virtual DbSet<Company> Companies { get; set; }
        public virtual DbSet<CompanyAllocation> CompanyAllocations { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseSqlServer(ConfigurationManager.ConnectionStrings["CoreDB"].ToString());
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            modelBuilder.ApplyConfiguration(new MembershipMap());
            modelBuilder.ApplyConfiguration(new CompanyMap());
            modelBuilder.ApplyConfiguration(new CompanyAllocationMap());
        }
    }
}
