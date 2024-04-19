using System;

namespace Overhidden
{
    internal class Program
    {
        class A
        {
            protected int i;

            public virtual void show()
            {
                Console.WriteLine("Class A method");
            }
        }
        class B:A
        {
            public override void show()
            {
                Console.WriteLine("Class B method");
            }
        }
        class C : B
        {
            public new void show()
            {
                Console.WriteLine("Class C method");
            }
        }
        static void Main(string[] args)
        {
            A a = new B();
            a.show();
            a = new C();
            a.show();
            Console.ReadKey();
        }
    }
}
