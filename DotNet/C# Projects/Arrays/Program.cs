using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Array
{
    class Program
    {
        static void Main(string[] args)
        {
            int[] arr = { 1, 2, 3, 4, 5 };

            foreach (int i in arr)
            {
                Console.WriteLine(i);
            }
            Console.Read();
        }
    }
}
