using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using WebApp.Infrastructure.Mapping;
using WebApp.Models;

namespace WebApp.Infrastructure
{
    public class ImdbContext : DbContext
    {
        public ImdbContext(DbContextOptions<ImdbContext> options) : base(options)
        {
        }

        public DbSet<Reviewer> Reviewers { get; set; }
        public DbSet<MovieReview> MovieReviews { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.ApplyConfiguration(new ReviewerMap());
            modelBuilder.ApplyConfiguration(new MovieReviewMap());
        }
    }
}
