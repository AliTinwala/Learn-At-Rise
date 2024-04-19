using System;

namespace DynamicVariable
{
    internal class Program
    {
        static void Main(string[] args)
        {
            dynamic dmValue = 100; //int
            Console.WriteLine("Value : {0} , Type: {1}", dmValue, dmValue.GetType());
            dmValue = "Hello Ali"; // string
            Console.WriteLine("Value : {0} , Type: {1}", dmValue, dmValue.GetType());
            dmValue = true; // bool
            Console.WriteLine("Value : {0} , Type: {1}", dmValue, dmValue.GetType());
            dmValue = DateTime.Now; // datetime 
            Console.WriteLine("Value : {0} , Type: {1}", dmValue, dmValue.GetType());
            Console.Read();
        }
    }
}
