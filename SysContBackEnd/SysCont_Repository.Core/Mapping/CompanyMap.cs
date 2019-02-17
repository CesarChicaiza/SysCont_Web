using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SysCont_Repository.Core.Entity;
using System;
using System.Collections.Generic;
using System.Text;

namespace SysCont_Repository.Core.Mapping
{
    public class CompanyMap : IEntityTypeConfiguration<Company>
    {
        public void Configure(EntityTypeBuilder<Company> builder)
        {
            builder.ToTable("Company")
                .HasKey(c => c.Id);
        }
    }
}
