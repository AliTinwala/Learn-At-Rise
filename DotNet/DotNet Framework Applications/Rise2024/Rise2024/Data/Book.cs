namespace Rise2024.Data
{
    public class Book
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string NumOfPage { get; set; }
        public int priceId { get; set; }
        public Price Price { get; set; }
    }
}
