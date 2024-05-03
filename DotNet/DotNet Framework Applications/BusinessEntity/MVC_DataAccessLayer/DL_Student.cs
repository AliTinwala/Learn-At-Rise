using MVC_BusinessEntities;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
namespace MVC_DataAccessLayer
{
    public class DL_Student
    {
        private SqlConnection con;
        private void connection()
        {
            string constr = ConfigurationManager.ConnectionStrings["ConString"].ToString();
            con = new SqlConnection(constr);
        }
        public IEnumerable<BE_Student> Students
        {
            get
            {
                connection();
                List<BE_Student> students = new List<BE_Student> ();
                SqlCommand cmd = new SqlCommand("Sp_GetStudentDetails", con);
                cmd.CommandType = CommandType.StoredProcedure;
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    BE_Student student = new BE_Student();
                    student.S_Id = Convert.ToInt32(rdr["S_Id"]);
                    student.S_Name = rdr["S_Name"].ToString();
                    student.S_Age = Convert.ToInt32(rdr["S_Age"]);
                    student.S_Email = rdr["S_Email"].ToString();
                    students.Add(student);
                }
                return students;
            }
            set
            {

            }
        }
        
        public bool insert(BE_Student obj)
        {
            connection();
            SqlCommand cmd = new SqlCommand("Sp_InsertStudent", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("S_Id", obj.S_Id);
            cmd.Parameters.AddWithValue("@S_Name", obj.S_Name);
            cmd.Parameters.AddWithValue("@S_Age", obj.S_Age);
            cmd.Parameters.AddWithValue("@S_Email", obj.S_Email);
            con.Open();
            int i = cmd.ExecuteNonQuery();
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

        public bool update(BE_Student obj)
        {
            sconnection();
            SqlCommand cmd = new SqlCommand("Sp_UpdateStudent", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("S_Id", obj.S_Id);
            cmd.Parameters.AddWithValue("@S_Name", obj.S_Name);
            cmd.Parameters.AddWithValue("@S_Age", obj.S_Age);
            cmd.Parameters.AddWithValue("@S_Email", obj.S_Email);
            con.Open();
            int i = cmd.ExecuteNonQuery();
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

        public bool delete(int id)
        {
            connection();
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
    }
}
