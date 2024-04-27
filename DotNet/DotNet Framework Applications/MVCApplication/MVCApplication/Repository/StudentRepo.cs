using MVCApplication.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;

namespace MVCApplication.Repository
{


    public class StudentRepo
    {

        private SqlConnection con;

        private void Connection()
        {
           string constr = ConfigurationManager.ConnectionStrings["TestApp"].ToString();
            con = new SqlConnection(constr);
        }

        public bool AddStudent(StudentModel objstudent) 
        {
            Connection();
            SqlCommand com = new SqlCommand("Sp_InsertStudent", con);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@S_Id", objstudent.S_Id);
            com.Parameters.AddWithValue("@S_Name", objstudent.S_Name);
            com.Parameters.AddWithValue("@S_Age", objstudent.S_Age);
            com.Parameters.AddWithValue("@S_Email", objstudent.S_Email);

            con.Open();
            int i = com.ExecuteNonQuery();
            con.Close();
            if(i >= 1)
            {
                return true;
            }
            else
            {
                return false;
            }

        }


        public List<StudentModel> GetStudents()
        {
            Connection();
            List<StudentModel> studentlist = new List<StudentModel>();


            SqlCommand com = new SqlCommand("Sp_GetStudentDetails", con);
            com.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter sda = new SqlDataAdapter(com);
            DataTable dt = new DataTable();

            con.Open();
            sda.Fill(dt);
            con.Close();

            foreach(DataRow dr in dt.Rows )
            {
                studentlist.Add(

                    new StudentModel
                    {
                        S_Id = Convert.ToInt32(dr["S_Id"]),
                        S_Name = Convert.ToString(dr["S_Name"]),
                        S_Age = Convert.ToInt32(dr["S_Age"]),
                        S_Email = Convert.ToString(dr["S_Email"])
                    }
                    );
            }

            return studentlist;
        }


        public bool Updatetudent(StudentModel objstudent)
        {
            Connection();
            SqlCommand com = new SqlCommand("Sp_UpdateStudent", con);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@S_Id", objstudent.S_Id);
            com.Parameters.AddWithValue("@S_Name", objstudent.S_Name);
            com.Parameters.AddWithValue("@S_Age", objstudent.S_Age);
            com.Parameters.AddWithValue("@S_Email", objstudent.S_Email);

            con.Open();
            int i = com.ExecuteNonQuery();
            con.Close();
            if (i >= 1)
            {
                return true;
            }
            else
            {
                return false;
            }

        }

        public bool DeleteStudent(int id)
        {
            Connection();
            SqlCommand com = new SqlCommand("Sp_StudentDeleteByID", con);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@S_Id", id);

            con.Open();

            int i = com.ExecuteNonQuery();
            con.Close();
            if (i >= 1)
            {
                return true;
            }
            else
            {
                return false;
            }



        }

        public bool GetStudentByID(int id)
        {
            Connection();
            SqlCommand com = new SqlCommand("Sp_GetStudentDetailsByID", con);
            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@S_Id", id);

            con.Open();

            int i = com.ExecuteNonQuery();
            con.Close();
            if (i >= 1)
            {
                return true;
            }
            else
            {
                return false;
            }



        }
    }
}