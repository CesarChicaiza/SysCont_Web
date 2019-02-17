using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SysCont_Repository.Core.Entity;
using System;
using System.Collections.Generic;
using System.Text;

namespace SysCont_Repository.Core.Mapping
{
    public class CompanyAllocationMap : IEntityTypeConfiguration<CompanyAllocation>
    {
        public void Configure(EntityTypeBuilder<CompanyAllocation> builder)
        {
            builder.ToTable("CompanyAllocation")
                .HasKey(c => c.Id);
        }
    }
}
