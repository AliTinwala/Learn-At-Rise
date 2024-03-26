using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Structure
{
    public struct student
    {
        public int studentid;
        public string StudentName;
    }
    //new stucture
    public struct Rectangle
    {
        public int width, height;
        //constructor
        public Rectangle(int W, int h)
        {
            width = W;
            height = h;
        }
        // method
        public void Areaofrectangle()
        {
            Console.WriteLine("AreaofRectangle is: " + width * height);
        }
        internal class Program
        {
            static void Main(string[] args)
            {
                student s = new student();
                s.studentid = 1;
                s.StudentName = "Sunita";
                Console.WriteLine("StudentId is: " + s.studentid);
                Console.WriteLine("Student Name Is:" + s.StudentName);
                Rectangle r = new Rectangle(10, 12);
                r.Areaofrectangle();
                Console.Read();
            }
        }
    }
}
