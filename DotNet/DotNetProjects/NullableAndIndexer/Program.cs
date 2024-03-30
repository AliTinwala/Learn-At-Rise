using System;
using System.Runtime.Intrinsics.Arm;

namespace NullableAndIndexer
{
    internal class Program
    {
        class Student
        {
            private int[] marks = new int[100];
            public int this[int i]
            {
                get { return marks[i];  }
                set { marks[i] = value; }
            }
        }
        static void Main(string[] args)
        {
            double? pi = 3.14;
            char? letter = 'a';

            int m2 = 10;
            int m = m2;


            int? b = null;
            if (b.HasValue) 
            {
                Console.WriteLine($"b is {b.Value}");
            }
            else 
            {
                Console.WriteLine("b does not have a value");
            }


            // null-coalescing operator ??

            int? c = null;
            int d = c ?? -1;
            Console.WriteLine($"d is {d}");

            int? a = 1;
            int? e = null;

            Console.WriteLine(Nullable.Compare( a, e ));

            Student s1 = new Student();
            s1[0] = 70;
            s1[1] = 80;
            for(int i= 0; i < 2; i++)
            {
                Console.WriteLine(s1[i]);
            }
            Console.ReadKey();
        }
    }
}
