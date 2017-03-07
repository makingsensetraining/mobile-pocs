using Microsoft.EntityFrameworkCore;

namespace MvvmSeed.Domain.Model
{
    public class LocalStorageContext : DbContext
    {
        public DbSet<RandomizedString> RandomizedStrings { get; set; }

        private string DatabasePath { get; set; }

        public LocalStorageContext() { }

        public LocalStorageContext(string databasePath)
        {
            DatabasePath = databasePath;
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlite($"Filename={DatabasePath}");
        }
    }
}
