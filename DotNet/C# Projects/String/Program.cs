using System;

namespace String
{
    internal class Program
    {
        static void Main(string[] args)
        {
            string s1 = "Hello";
            char[] ch = { 'A', 'b', 'c', 'd' };
            string s2 = new string(ch);
            string s3 = "C#";
            string s4 = "Hello";
            string s5 = string.Copy(s1);
            string s6 = "Hello Sunu, How Are you?";
            char[] ch2 = new char[15];
            s6.CopyTo(6, ch2, 0, 12);
            string s7 = string.Format("{0:D}", DateTime.Now);
            int index = s1.IndexOf('e');
            string s8 = s3.Insert(2, "_");
            bool b1 = s1.IsNormalized();
            string s9 = s1.Normalize();
            string s10 = " ";
            bool b2 = string.IsNullOrEmpty(s10);
            bool b3 = string.IsNullOrEmpty(s4);
            bool b4 = string.IsNullOrWhiteSpace(s10);
            int index2 = s4.LastIndexOf("l");
            string s11 = s1.Remove(2);
            string s12 = s1.Replace('h', '0');
            string s13 = s1.Substring(5);
            int a = 123;
            string s15 = s1.ToString();
            string s14 = a.ToString();
            string s16 = s1.Trim();



            Console.WriteLine(s1);
            Console.WriteLine(s2);
            Console.WriteLine(string.Compare(s1, s3));
            Console.WriteLine(string.Compare(s1, s4)); //  compare two string 
            Console.WriteLine(string.CompareOrdinal(s1, s3));
            Console.WriteLine(string.CompareOrdinal(s1, s4));// Compare ordinal
            Console.WriteLine(s1.CompareTo(s4));
            Console.WriteLine(s1.CompareTo(s3)); // compareto
            Console.WriteLine(string.Concat(s1, s3)); //concate
            Console.WriteLine(s1.Contains(s4));
            Console.WriteLine(s1.Contains(s3));//Contains
            Console.WriteLine(s5);
            Console.WriteLine(ch2);
            Console.WriteLine(s1.Equals(s4));//Equals
            Console.WriteLine(s7);
            Console.WriteLine(s4.GetHashCode());
            Console.WriteLine(s1.GetType());
            Console.WriteLine(s1.GetEnumerator());
            Console.WriteLine(s3.GetTypeCode());
            Console.WriteLine(index);
            Console.WriteLine(s8);
            Console.WriteLine(b1);
            Console.WriteLine(s9);
            Console.WriteLine(b2);
            Console.WriteLine(b3);
            Console.WriteLine(b4);
            Console.WriteLine(index2);
            Console.WriteLine(s11);
            Console.WriteLine(s12);
            Console.WriteLine(s13);
            Console.WriteLine(s14);
            Console.WriteLine(s15);
            Console.WriteLine(s16);



            Console.ReadKey();
        }
    }
}
