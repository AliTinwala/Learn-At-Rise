using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StringBuilderEx
{
    class Program
    {
        static void Main(string[] args)
        {
            StringBuilder s = new StringBuilder("Hello" ,  5);

            s.Append("Sunita");
            s.AppendLine("Hi Sunita!");
            s.Append("Thakkar");
            Console.WriteLine(s);

            StringBuilder s2 = new StringBuilder("Hi How are you?");
            s2.AppendFormat("{0:c}", "Sunita");
            Console.WriteLine(s2);

            StringBuilder s3 = new StringBuilder("Hello ", 20);
            s3.Insert(6, "Sunu");
            Console.WriteLine(s3);
            StringBuilder s4 = new StringBuilder("HiSunita", 20);
            s4.Remove(5,3);
            Console.WriteLine(s4);
            StringBuilder s5 = new StringBuilder("HiSunitaHi", 40);
            s5.Replace("Hi" ,"Thakkar");
            Console.WriteLine(s5);

            Console.Read();
        }
    }
}
