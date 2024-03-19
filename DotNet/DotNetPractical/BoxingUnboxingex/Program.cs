using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BoxingUnboxingex
{
   public class Program
    {
        static void Main(string[] args)
        {
            int num = 200; // value 

            object o = num; //Reference // boxing 

            num = 100;

            int i = (int)o; // unboxing

            Console.WriteLine("Value type Value is :" + num);
            Console.WriteLine("Referance type Value is :" + o);
            Console.WriteLine("Referance type Value for unboxing is :" + i);
            Console.ReadLine();

        }
    }
}
