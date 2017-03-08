using System;
using Realms;

namespace MvvmSeed.Application.Data
{
    public class RandomizedStringEntity : RealmObject
    {
        public const long DefaultRandomizedStringPrimaryKey = 1;

        [PrimaryKey]
        public long Id { get; set; }

        public string LastTransformationValue { get; set; }

        public int SampleTransformationCount { get; set; }

        public DateTimeOffset LastTransformationTimestamp { get; set; }
    }
}
