namespace Rise2024.Data
{
    public class Price
    {
        public int Id { get; set; }
        public int Amount { get; set; }
        public ICollection<Book> Books { get; set; }
    }
}
