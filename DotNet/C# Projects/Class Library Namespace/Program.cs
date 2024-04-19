using System;
using Class_Library;

namespace Class_Library_Namespace
{
    class class_lib: Class1
    {
        public void show()
        {
            //Cannot access private
            //Console.WriteLine(base.id);

            //Can access public
            Console.WriteLine(base.name);
            
            //Can access protected
            Console.WriteLine(base.mbno);
            
            //Cannot access internal
            //Console.WriteLine(base.age);
            
            //Can access protected internal
            Console.WriteLine(base.gender);
        }
    }
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World!");
        }
    }
}
