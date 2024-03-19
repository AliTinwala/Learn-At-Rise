using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dynamicvariable
{
    class Program
    {
        static void Main(string[] args)
        {
            dynamic dmValue = 100; //int
            Console.WriteLine("Value : {0} , Type: {1}", dmValue, dmValue.GetType());
            dmValue = "Hello Sunita"; // string
            Console.WriteLine("Value : {0} , Type: {1}", dmValue, dmValue.GetType());
            dmValue = true; // bool
            Console.WriteLine("Value : {0} , Type: {1}", dmValue, dmValue.GetType());
            dmValue = DateTime.Now; // datetime 
            Console.WriteLine("Value : {0} , Type: {1}", dmValue, dmValue.GetType());
            Console.Read();




        }
    }
}
