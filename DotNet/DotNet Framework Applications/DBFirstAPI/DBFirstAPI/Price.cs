using System;
using System.Collections.Generic;

namespace DBFirstAPI
{
    public partial class Price
    {
        public Price()
        {
            Books = new HashSet<Book>();
        }

        public int Id { get; set; }
        public int Amount { get; set; }

        public virtual ICollection<Book> Books { get; set; }
    }
}
