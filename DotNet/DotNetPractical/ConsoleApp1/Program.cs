using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Enum
{
    public class Program
    {

        public enum Fruits {Mango = 5 , Banana , Grapes , Orange , Apple}
        static void Main(string[] args)
        {
            int a = (int)Fruits.Apple;
            int b = (int)Fruits.Mango;

            Console.WriteLine("Apple = {0}", a);
            Console.WriteLine("Mango = {0}", b);
            Console.Read();
           

        }
    }
}
