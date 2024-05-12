using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace DBFirstAPI
{
    public partial class Rise2024Context : DbContext
    {
        public Rise2024Context()
        {
        }

        public Rise2024Context(DbContextOptions<Rise2024Context> options)
            : base(options)
        {
        }

        public virtual DbSet<Book> Books { get; set; } = null!;
        public virtual DbSet<Price> Prices { get; set; } = null!;

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
                optionsBuilder.UseSqlServer("Name=ConnectionStrings:Default");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Book>(entity =>
            {
                entity.HasIndex(e => e.PriceId, "IX_Books_priceId");

                entity.Property(e => e.PriceId).HasColumnName("priceId");

                entity.HasOne(d => d.Price)
                    .WithMany(p => p.Books)
                    .HasForeignKey(d => d.PriceId);
            });

            modelBuilder.Entity<Price>(entity =>
            {
                entity.ToTable("Price");
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
