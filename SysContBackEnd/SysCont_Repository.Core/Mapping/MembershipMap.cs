using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SysCont_Repository.Core.Entity;
using System;
using System.Collections.Generic;
using System.Text;

namespace SysCont_Repository.Core.Mapping
{
    public class MembershipMap : IEntityTypeConfiguration<Membership>
    {
        public void Configure(EntityTypeBuilder<Membership> builder)
        {
            builder.ToTable("Membership")
                .HasKey(m => m.Id);
        }
    }
}
