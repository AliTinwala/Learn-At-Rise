﻿using Microsoft.EntityFrameworkCore;

namespace Rise2024.Data
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options): base(options)
        {
            
        }
        public DbSet<Book> Books { get; set; }
        public DbSet<Price> Price { get; set; }

    }
}
