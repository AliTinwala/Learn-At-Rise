using System;

namespace AbstractandSeal
{
    internal class Program
    {
        abstract class A
        {
            protected int i;

            public virtual void show()
            {
                Console.WriteLine("Class A method");
            }
        }
        class B : A
        {
            public sealed override void show() //Overridden methods only can be sealed
            {
                Console.WriteLine("Class B method");
            }
        }
        class C : B
        {
            // If base class method is sealed it cannot be overriden
            // 'Program.C.show()': cannot override inherited member 'Program.B.show()' because it is sealed

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
            Console.ReadLine();
        }
    }
}
