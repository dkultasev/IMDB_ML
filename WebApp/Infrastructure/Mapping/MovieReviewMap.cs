using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using WebApp.Models;

namespace WebApp.Infrastructure.Mapping
{
    public class MovieReviewMap : IEntityTypeConfiguration<MovieReview>
    {
        public void Configure(EntityTypeBuilder<MovieReview> builder)
        {
            builder.ToTable("UserTitleRating");
            builder.HasKey(x => new {x.UserId, x.TitleId});
            builder.Property(x => x.UserId).IsRequired().HasColumnName("CustomReviewerId");
            builder.Property(x => x.TitleId).IsRequired();
            builder.Property(x => x.Rating).IsRequired().HasColumnType("decimal(4, 2)");
            builder.Property(x => x.RatingDate).IsRequired().HasColumnName("RatingDtime");

        }
    }
}
