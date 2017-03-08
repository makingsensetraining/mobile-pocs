using MvvmSeed.Application.Data;
using MvvmSeed.Domain.Services;
using Realms;
using System;
using System.Linq;

namespace MvvmSeed.Application.Services
{
    /// <summary>
    /// Simple implementation of <see cref="IStringRandomizerService"/> that stores randomization info on a local database (Realm)
    /// </summary>
    public class StringRandomizerService : IStringRandomizerService
    {
        //TODO - When attempting to write UTs for this service, found out I couldn't because Realm class doesn't implement an interface/virtual methods. 
        // Evalute alternatives (weaving Realm class, Moq alternatives, abstract Realm into ILocalStorage, etc)
        private readonly Realm _realmDb;

        public StringRandomizerService(Realm realmDb)
        {
            _realmDb = realmDb;
        }

        public string RandomizeString(string input)
        {
            var random = new Random();
            var randomizedString = new string(input.ToCharArray().OrderBy(s => random.Next(2) % 2 == 0).ToArray());

            var lastRandomizedString = _realmDb.Find<RandomizedStringEntity>(RandomizedStringEntity.DefaultRandomizedStringPrimaryKey) ?? new RandomizedStringEntity { Id = RandomizedStringEntity.DefaultRandomizedStringPrimaryKey };

            //TODO - Concurrency tests when writing to DB
            using (var transaction = _realmDb.BeginWrite())
            {
                lastRandomizedString.LastTransformationTimestamp = DateTimeOffset.UtcNow;
                lastRandomizedString.SampleTransformationCount++;
                lastRandomizedString.LastTransformationValue = randomizedString;
                _realmDb.Add(lastRandomizedString, update: true);
                transaction.Commit();
            }
            return randomizedString;
        }

        public DateTimeOffset LastRandomizationTimestamp => GetLastEntryFromDatabse()?.LastTransformationTimestamp ?? DateTimeOffset.MinValue;

        public int RandomizationsCount => GetLastEntryFromDatabse()?.SampleTransformationCount ?? 0;

        public string LastRandomizedValue => GetLastEntryFromDatabse()?.LastTransformationValue ?? "Hello World!";

        private RandomizedStringEntity GetLastEntryFromDatabse()
        {
            return _realmDb.Find<RandomizedStringEntity>(RandomizedStringEntity.DefaultRandomizedStringPrimaryKey);
        }
    }
}
