using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Type_Conversion
{
    class Program
    {
        static void Main(string[] args)
        {
            double d = 45.23;
            int i;
            int s = 612;
            int num1 = 0;
            int num2 = 1;
            double dbl = 88.1;
            string str = "11.11";



            i = (int)d; // explicittype conversion
            d = Convert.ToDouble(s);
            Console.WriteLine(i);
            //implicit type casting
            Console.WriteLine(s.ToString());
            Console.WriteLine(Convert.ToBoolean(num1));
            Console.WriteLine(Convert.ToBoolean(num2));
            Console.WriteLine(Convert.ToDouble(str));
            Console.WriteLine(Convert.ToString(dbl));
          
            Console.Read();
        }
    }
}
