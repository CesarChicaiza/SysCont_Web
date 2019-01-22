using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SysCont_Repository.Entity.Catalogs;
using System;
using System.Collections.Generic;
using System.Text;

namespace SysCont_Repository.Mapping.Catalogs
{
    public class StateMap : IEntityTypeConfiguration<StateEntity>
    {
        public void Configure(EntityTypeBuilder<StateEntity> builder)
        {
            builder.ToTable("State")
                .HasKey(c => c.Id);
        }
    }
}
