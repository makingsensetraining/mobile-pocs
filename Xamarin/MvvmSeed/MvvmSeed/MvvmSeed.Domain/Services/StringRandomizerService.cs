using System;
using System.Linq;
using MvvmSeed.Domain.Model;

namespace MvvmSeed.Domain.Services
{
    /// <summary>
    /// Simple implementation of <see cref="IStringRandomizerService"/> that stores randomization info on a local database (Realm)
    /// </summary>
    public class StringRandomizerService : IStringRandomizerService
    {
        private readonly LocalStorageContext _dbContext;

        public StringRandomizerService(LocalStorageContext dbContext)
        {
            _dbContext = dbContext;
        }

        public string RandomizeString(string input)
        {
            var random = new Random();
            var randomizedString = new string(input.ToCharArray().OrderBy(s => random.Next(2) % 2 == 0).ToArray());

            var lastRandomizedString = GetLastEntyFromDb() ?? new RandomizedString();
            lastRandomizedString.LastTransformationTimestamp = DateTimeOffset.UtcNow;
            lastRandomizedString.RandomizationCount++;
            lastRandomizedString.LastTransformationValue = randomizedString;
            if (lastRandomizedString.Id == 0)
                _dbContext.Add(lastRandomizedString);

            _dbContext.SaveChanges();
            return randomizedString;
        }

        public DateTimeOffset LastRandomizationTimestamp => GetLastEntyFromDb()?.LastTransformationTimestamp ??  DateTimeOffset.MinValue;

        public int RandomizationsCount => GetLastEntyFromDb()?.RandomizationCount ?? 0;

        public string LastRandomizedValue => GetLastEntyFromDb()?.LastTransformationValue ?? "Hello World!";

        private RandomizedString GetLastEntyFromDb() => _dbContext.RandomizedStrings.FirstOrDefault();

    }
}