using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SysCont_Repository.Entity.Catalogs;
using System;
using System.Collections.Generic;
using System.Text;

namespace SysCont_Repository.Mapping.Catalogs
{
    public class LegalIdTypeMap : IEntityTypeConfiguration<LegalIdTypEntity>
    {
        public void Configure(EntityTypeBuilder<LegalIdTypEntity> builder)
        {
            builder.ToTable("LegalIdType")
               .HasKey(c => c.Id);
        }
    }
}
