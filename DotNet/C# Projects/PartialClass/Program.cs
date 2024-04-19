using System;

namespace PartialClass
{
    internal class Program
    {
        partial class A
        {
            public void show()
            {
                Console.WriteLine("Partial class 1");
            }

        }

        partial class A
        {
            public void print()
            {
                Console.WriteLine("Partial class 2");
            }
        }

        static void Main(string[] args)
        {
            A a = new A();
            a.show();
            a.print();
            Console.ReadKey();

        }
    }
}
