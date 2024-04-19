using System;

namespace Protected_Internal
{
    public class prot_int
    {
        private int id = 1;
        public string name = "Ali";
        protected string mbno = "9099076397";
        internal int age = 27;
        protected internal char gender = 'M';

    }
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World!");
        }
    }
}
