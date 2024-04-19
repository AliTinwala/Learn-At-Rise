using System;
using Protected_Internal;

namespace Protected_Internal_Inherited
{
    public class prot_int_inh : prot_int
    {
        public void show()
        {
            //Console.WriteLine(base.id);
            
            //Public accessible
            Console.WriteLine(base.name);
            
            //Protected accessible
            Console.WriteLine(base.mbno);
            
            //Internal not accessible
            //Console.WriteLine(base.age);
            
            //Protected Internal accessible
            Console.WriteLine(base.gender);
        }
    }
    internal class Program
    {
        static void Main(string[] args)
        {
            prot_int_inh p1 = new prot_int_inh();
            p1.show();
        }
    }
}
