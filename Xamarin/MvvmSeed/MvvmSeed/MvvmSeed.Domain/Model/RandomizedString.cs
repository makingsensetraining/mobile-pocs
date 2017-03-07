using System;
using System.ComponentModel.DataAnnotations;

namespace MvvmSeed.Domain.Model
{
    public class RandomizedString
    {
        public const long DefaultRandomizedStringPrimaryKey = 1;

        [Key]
        public long Id { get; set; }

        public string LastTransformationValue { get; set; }

        public int SampleTransformationCount { get; set; }

        public DateTimeOffset LastTransformationTimestamp { get; set; }
    }
}
