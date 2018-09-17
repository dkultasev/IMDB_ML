using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using WebApp.Models;

namespace WebApp.Infrastructure.Mapping
{
    public class ReviewerMap : IEntityTypeConfiguration<Reviewer>
    {
        public void Configure(EntityTypeBuilder<Reviewer> builder)
        {
            builder.ToTable("CustomReviewer");
            builder.HasKey(x => x.Id);
            builder.Property(x => x.Id).HasColumnName("CustomReviewerId").IsRequired();
            builder.Property(x => x.Name).HasColumnName("CustomReviewerName").IsRequired();
        }
    }
}
