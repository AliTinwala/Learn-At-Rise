using System;

namespace EscapeSequence
{
    internal class Program
    {
        static void Main(string[] args)
        {
            string s1 = "Hello\nMom";
            Console.WriteLine(s1);
            string s2 = "C:\\Documents\\Files.cs";
            Console.WriteLine(s2);
            string s3 = "I am A \" Trainee SoftwareDeveloper\".";
            Console.WriteLine(s3);
            string s4 = @"Heello\nSunita";
            Console.WriteLine(s4);
            string s5 = @"C:\Documents\file.cs";
            Console.WriteLine(s5);
            string s6 = @"I am a ""Trainee SoftwareDeveloper"".";
            Console.WriteLine(s6);
            Console.Read();
        }
    }
}
