using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SysCont_Repository.Entity.Catalogs;
using System;
using System.Collections.Generic;
using System.Text;

namespace SysCont_Repository.Mapping.Catalogs
{
    public class UnitOfMeasureMap : IEntityTypeConfiguration<UnitOfMeasureEntity>
    {
        public void Configure(EntityTypeBuilder<UnitOfMeasureEntity> builder)
        {
            builder.ToTable("UnitOfMeasure")
                .HasKey(c => c.Id);
        }
    }
}
