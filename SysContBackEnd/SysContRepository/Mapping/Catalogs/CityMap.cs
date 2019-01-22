using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SysCont_Repository.Entity.Catalogs;
using System;
using System.Collections.Generic;
using System.Text;

namespace SysCont_Repository.Mapping.Catalogs
{
    public class CityMap : IEntityTypeConfiguration<CityEntity>
    {
        public void Configure(EntityTypeBuilder<CityEntity> builder)
        {
            builder.ToTable("City")
                .HasKey(c => c.Id);
        }
    }
}
