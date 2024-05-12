using System;
using System.Collections.Generic;

namespace DBFirstAPI
{
    public partial class Book
    {
        public int Id { get; set; }
        public string Title { get; set; } = null!;
        public string Description { get; set; } = null!;
        public string NumOfPage { get; set; } = null!;
        public int PriceId { get; set; }

        public virtual Price Price { get; set; } = null!;
    }
}
