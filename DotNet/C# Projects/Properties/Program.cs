using System;

namespace Properties
{
    internal class Program
    {
        class A
        {
            int i;
            const double pi = 3.14;
            static double j;

            public A()
            {

            }
            public A(int k) : this()
            {
                this.i = k;
            }
            public double J
            {
                get { return j; }
                set { j = value; }
            }
            public double show()
            {
                return j;
            }
        }
        static class B
        {
            readonly public static int j;
            public static int k;
            const double pi = 3.14;

            static B()
            {
                j = 10;
                k = 12;
            }
            public static int J
            {
                get { return j; }
            }

            public static int K
            {
                set { k = value; }
            }
            public static void print()
            {
                Console.WriteLine(j + " " + k);
            }
            public static void printOut(out int k)
            {
                Console.WriteLine("Out Variable Method");
                k = 25;
                Console.WriteLine(j + " " + k);
                //Console.WriteLine(pi);
            }
            public static void printRef(ref int l)
            {
                Console.WriteLine("Ref Variable Method");
                k = l;
                Console.WriteLine(j + " " + k);
                //Console.WriteLine(pi);
            }
        }

        interface C
        {

        }
        static void Main(string[] args)
        {
            A a = new A();
            //Console.WriteLine(B.j);
            //Console.WriteLine("Hello World!");
            //Console.WriteLine("--- Class A ---");
            //Console.Write("Enter value of i: ");
            //a.J = Convert.ToDouble(Console.ReadLine());
            //Console.WriteLine("Value of i is: " + a.J);
            Console.WriteLine("--- Class B ---");
            //B.print();
            B.printOut(out int k);
            B.k = 30;
            B.printRef(ref B.k);
        }
    }
}
