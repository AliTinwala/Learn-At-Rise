using System;
using Class_Lib_Ext_Method;

namespace Extension_Method
{
    public static class XX
    {
        public static void NewMethod(this Class1 ob)
        {
            Console.WriteLine("Hello I m extended method");
        }
    }
    internal class Program
    {
        static void Main(string[] args)
        {
            Class1 ob = new Class1();
            Console.WriteLine(ob.Display());
            Console.WriteLine(ob.Print());
            ob.NewMethod();
            Console.ReadKey();
        }
    }
}
