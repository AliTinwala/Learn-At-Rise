using System;
using System.Text;

namespace StringBuilderEX
{
    internal class Program
    {
        static void Main(string[] args)
        {
            StringBuilder s = new StringBuilder("Hello", 5);

            s.Append("Ali");
            s.AppendLine("Hi Ali!");
            s.Append("Ali");
            Console.WriteLine(s);

            StringBuilder s2 = new StringBuilder("Hi How are you?");
            s2.AppendFormat("{0:c}", "Ali");
            Console.WriteLine(s2);

            StringBuilder s3 = new StringBuilder("Hello ", 20);
            s3.Insert(6, "Ali");
            Console.WriteLine(s3);
            StringBuilder s4 = new StringBuilder("HiAli", 20);
            s4.Remove(1, 3);
            Console.WriteLine(s4);
            StringBuilder s5 = new StringBuilder("HiAliHi", 40);
            s5.Replace("Hi", "Tinwala");
            Console.WriteLine(s5);

            Console.Read();
        }
    }
}
