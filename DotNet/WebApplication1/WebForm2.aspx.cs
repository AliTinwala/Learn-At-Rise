using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;

namespace WebApplication1
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GridView1.Visible = true;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string strcon = ConfigurationManager.ConnectionStrings["databaseconnection"].ConnectionString;

            MessageBox.Show("Button Click");

            using (SqlConnection connection = new SqlConnection(strcon))
            {
                //Create a SqlDataAdapter for the Suppliers table.
                SqlDataAdapter adapter = new SqlDataAdapter();

                // A table mapping names the DataTable.
                adapter.TableMappings.Add("Table", "Customer");

                // Open the connection.
                connection.Open();
                MessageBox.Show("The SqlConnection is open.");

                // Create a SqlCommand to retrieve Suppliers data.
                SqlCommand command = new SqlCommand("SELECT * FROM dbo.customer;", connection);
                command.CommandType = CommandType.Text;

                // Set the SqlDataAdapter's SelectCommand.
                adapter.SelectCommand = command;

                // Fill the DataSet.
                DataSet dataSet = new DataSet("Customer");
                adapter.Fill(dataSet);

                GridView1.DataSource = dataSet;
                GridView1.DataBind();

                // Close the connection.
                connection.Close();
                MessageBox.Show("The SqlConnection is closed.");

            }
        }
    }
}