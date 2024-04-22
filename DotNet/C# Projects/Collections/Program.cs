using System;
using System.Collections.Generic;
using System.Linq;

namespace Collections
{

    internal class Program
    {
        static void Main(string[] args)
        {
            List<int> l1 = new List<int> { };
            l1.Add(1);
            l1.Add(2);
            l1.Add(3);

            foreach(int i in l1) { Console.WriteLine(i); }
            Console.ReadLine();
        }
    }
}
