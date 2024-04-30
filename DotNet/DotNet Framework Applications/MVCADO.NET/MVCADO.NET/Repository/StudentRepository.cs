using MVCADO.NET.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace MVCADO.NET.Repository
{
    public class StudentRepository
    {
        private SqlConnection con;

        private void connection()
        {
            string constr = ConfigurationManager.ConnectionStrings["ConString"].ToString();
            con = new SqlConnection(constr);
        }

        public bool AddStudent(StudentModel obj)
        {
            connection();
            SqlCommand cmd = new SqlCommand("Sp_InsertStudent", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
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

        public List<StudentModel> GetAllStudents()
        {
            connection();
            List<StudentModel> StudentList = new List<StudentModel>();


            SqlCommand com = new SqlCommand("Sp_GetStudentDetails", con);
            com.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable dt = new DataTable();

            con.Open();
            da.Fill(dt);
            con.Close();
            //Bind EmpModel generic list using dataRow     
            foreach (DataRow dr in dt.Rows)
            {

                StudentList.Add(

                    new StudentModel
                    {

                        S_Id = Convert.ToInt32(dr["S_Id"]),
                        S_Name = Convert.ToString(dr["S_Name"]),
                        S_Age = Convert.ToInt32(dr["S_Age"]),
                        S_Email = Convert.ToString(dr["S_Email"])

                    }
                    );
            }

            return StudentList;
        }

        public bool UpdateStudent(StudentModel obj)
        {

            connection();
            SqlCommand com = new SqlCommand("Sp_UpdateStudent", con);

            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@S_Id", obj.S_Id);
            com.Parameters.AddWithValue("@S_Name", obj.S_Name);
            com.Parameters.AddWithValue("@S_Age", obj.S_Age);
            com.Parameters.AddWithValue("@S_Email", obj.S_Email);
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

        public bool DeleteStudent(int Id)
        {

            connection();
            SqlCommand com = new SqlCommand("Sp_StudentDeleteByID", con);

            com.CommandType = CommandType.StoredProcedure;
            com.Parameters.AddWithValue("@S_Id", Id);

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