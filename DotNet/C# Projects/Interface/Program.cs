using System;

namespace Interface
{
    public interface myInterface
    {
        public abstract void Show();
    }
    public class myClass : myInterface
    {
        public void Show()
        {
            Console.WriteLine("Interface method inherited");
        }
    }
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World!");

            myClass c = new myClass();
            c.Show();

        }
    }
}
