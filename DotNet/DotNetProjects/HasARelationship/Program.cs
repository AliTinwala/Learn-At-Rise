using System;

namespace HasARelationship
{
    internal class Program
    {
        class A
        {
            public int i,j;

            public A()
            {
                i = 10; 
                j = 20;
            }
        }
        class B
        {
            protected int k, m;
            A a = new A();
            public B(int i,int j,A a1)
            {
                this.k = i;
                this.m = j;
                this.a = a1;
            }
            public void print()
            {
                Console.WriteLine(k+" "+m+" "+a.i+" "+a.j);
            }
        }
        static void Main(string[] args)
        {
            A a = new A();
            B b1 = new B(30,40,a);
            b1.print();
        }
    }
}
