using Classes;
using System;
using System.Numerics;
using System.Security.Cryptography;

Console.WriteLine("Odd numbers");
A a = new A(1, 3, 5, 7, 9, 11, 13);
Console.WriteLine("Even numbers");
a = new A(2, 4, 6, 8, 10, 12);
int[][] m2 = new int[2][];
m2[0] = new int[2];
m2[1] = new int[4];
for (int i = 0; i < 2; i++)
{
    Console.WriteLine("Enter " + (i+1) + "th row");
    for (int j = 0; j < m2[i].Length; j++)
    {

        m2[i][j] = Convert.ToInt32(Console.ReadLine());
    }
}
for (int i = 0; i < 2; i++)
{
    for (int j = 0; j < m2[i].Length; j++)
    {
        Console.Write(m2[i][j]);
        Console.WriteLine();
    }
}
Console.Read();

namespace Classes
{

    class A
    {
        int i;
        public A()
        {
            i = 0;
        }

        public A(params int[] a)
        {
            i = 1;

            foreach (int j in a)
            {
                Console.WriteLine(j);
            }
        }
        public A(A b)
        {
            this.i = b.i;
        }
    }
}
