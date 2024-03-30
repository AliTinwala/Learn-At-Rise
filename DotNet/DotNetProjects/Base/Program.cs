using System;
using System.Runtime.InteropServices;

namespace Base
{
    internal class Program
    {
        class A
        {
            protected int i, j;

            public A() 
            { 

            }
            public A(int i, int j)
            {
                this.i = i;
                this.j = j;
            }
            public virtual void show()
            {
                Console.WriteLine("i = " + i + " j = " + j);
            }
        }
        class B: A
        {
            protected int k;
            public B()
            {

            }
            public B(int i, int j, int k): base(i, j)
            {
                this.k = k;
            }
            public override void show()
            {
                Console.WriteLine("i = " + i + " j = " + j + " k = " + k);
            }
        }
        class C: B
        {
            protected int l;

            public C()
            {

            }

            public C(int i, int j, int k, int l) : base(i, j, k)
            {
                this.l = l;
            }

            public override void show()
            {
                Console.WriteLine("i = " + i + " j = " + j + " k = " + k + " l = " + l);
            }
        }
        static void Main(string[] args)
        {
            int i, j, k, l;
            i = 10;
            j = 20;
            k = 30;
            l = 40;

            A a = new A(i,j);
            B b = new B(i,j,k);
            C c = new C(i,j,k,l);
            
            a.show();

            a = b;
            a.show();

            a = c;
            a.show();

            Console.Read();
        }
    }
}
