using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using SysCont_Repository.Entity;
using System;
using System.Collections.Generic;
using System.Text;

namespace SysCont_Repository.Mapping.Catalogs
{
    public class PaymentTypeMap : IEntityTypeConfiguration<PaymentTypeEntity>
    {
        public void Configure(EntityTypeBuilder<PaymentTypeEntity> builder)
        {
            builder.ToTable("Payment_Type")
               .HasKey(c => c.Id);
        }
    }
}
