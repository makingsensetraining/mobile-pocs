using Microsoft.EntityFrameworkCore;

namespace MvvmSeed.Domain.Model
{
    public class LocalStorageContext : DbContext
    {
        private readonly string _databasePath;

        public LocalStorageContext(DbContextOptions optionsBuilder) : base(optionsBuilder) { }

        public LocalStorageContext(string databasePath)
        {
            _databasePath = databasePath;
        }

        public DbSet<RandomizedString> RandomizedStrings { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!string.IsNullOrEmpty(_databasePath))
                optionsBuilder.UseSqlite($"Filename={_databasePath}");
        }
    }
}
