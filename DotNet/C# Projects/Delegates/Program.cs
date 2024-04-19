using System;

namespace Delegates
{
    public delegate void calcDelegate(int x,int y);
    class myClass
    {
        
        public void add(int x,int y)
        {
            Console.WriteLine(x+y);
        }

        public void sub(int x,int y)
        {
            Console.WriteLine(x-y);
        }

        public void mul(int x,int y)
        {
            Console.WriteLine(x*y);
        }

        public void div(int x,int y) 
        {
            try
            {
                Console.WriteLine(x/y);
            }
            catch(Exception e)
            {
                Console.WriteLine(e.ToString());
            }
        }
    }
    internal class Program
    {
        static void Main(string[] args)
        {
            //Console.WriteLine("Hello World!");

            myClass c1 = new myClass();
            calcDelegate dl = c1.add;
            dl += c1.sub;
            dl += c1.mul;
            dl += c1.div;
            dl(10,6);
            Console.ReadKey();
        }
    }
}
