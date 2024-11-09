using Asp.net_Web_application_Web_Form_and_Mssql.Model;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

namespace Asp.net_Web_application_Web_Form_and_Mssql
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.ListEmployees();
                
            }
        }
        protected void ImportXMLAndDisplayData(object sender, EventArgs e)
        {
            string xmlFilePath = Server.MapPath("~/App_Data/employees.xml"); // Path to your XML file
            List<Employee> employees = ParseXmlFile(xmlFilePath);
            InsertEmployeesIntoDatabase(employees);

            this.ListEmployees();
        }

        private List<Employee> ParseXmlFile(string filePath)
        {
            List<Employee> employeeList = new List<Employee>();

            XmlDocument xmlDoc = new XmlDocument();
            xmlDoc.Load(filePath);

            XmlNodeList nodeList = xmlDoc.SelectNodes("/employees/employee");

            foreach (XmlNode node in nodeList)
            {
                Employee employee = new Employee
                {
                    //ID = int.Parse(node.SelectSingleNode("ID").InnerText),
                    FirstName = node.SelectSingleNode("FirstName").InnerText,
                    LastName = node.SelectSingleNode("LastName").InnerText,
                    Division = node.SelectSingleNode("Division").InnerText,
                    Building = node.SelectSingleNode("Building").InnerText,
                    Title = node.SelectSingleNode("Title").InnerText,
                    Room = node.SelectSingleNode("Room").InnerText
                };
                employeeList.Add(employee);
            }

            return employeeList;
        }
  
        private void InsertEmployeesIntoDatabase(List<Employee> employees)
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                foreach (var employee in employees)
                {
                    string query = "INSERT INTO Employees (FirstName, LastName,Division,Building,Title,Room) VALUES (@FirstName, @LastName,@Division,@Building,@Title,@Room)";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@FirstName", employee.FirstName);
                        cmd.Parameters.AddWithValue("@LastName", employee.LastName);
                        cmd.Parameters.AddWithValue("@Division", employee.Division);
                        cmd.Parameters.AddWithValue("@Building", employee.Building);
                        cmd.Parameters.AddWithValue("@Title", employee.Title);
                        cmd.Parameters.AddWithValue("@Room", employee.Room);
                        cmd.ExecuteNonQuery();
                    }
                }
            }
        }
        private void ListEmployees()
        {
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            string query = "SELECT * FROM Employees";
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter(query, con))
                {
                    using (DataTable dt = new DataTable())
                    {
                        sda.Fill(dt);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                    }
                }
            }
        }
        protected void SearchEmployee(object sender, EventArgs e)
        {

            string textBoxValue = EmpID.Text.Trim();

            if (string.IsNullOrEmpty(textBoxValue))
            {
                textBoxValue = "";
                this.ListEmployees();
            }

            if (!int.TryParse(textBoxValue, out int empID))
            {
                return;
            }

            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            string query = "SELECT * FROM Employees WHERE ID = @ID OR FirstName = @FirstName";

            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@ID", empID);
                    cmd.Parameters.AddWithValue("@FirstName", "%" + textBoxValue + "%");
                    con.Open();
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            GridView1.DataSource = dt;
                            GridView1.DataBind();
                        }
                    }
                }
            }
        }

        protected void InsertEmployee(object sender, EventArgs e)
        {
            string firstName = txtFirstName.Text;
            string lastName = txtLastName.Text;
            string division = txtDivision.Text;
            string building = txtBuilding.Text;
            string title = txtTitle.Text;
            string room = txtRoom.Text;
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtDivision.Text = "";
            txtBuilding.Text = "";
            txtTitle.Text = "";
            txtRoom.Text = "";
            string query = "INSERT INTO Employees VALUES(@FirstName, @LastName,@Division,@Building,@Title,@Room)";
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Parameters.AddWithValue("@FirstName", firstName);
                    cmd.Parameters.AddWithValue("@LastName", lastName);
                    cmd.Parameters.AddWithValue("@Division", division);
                    cmd.Parameters.AddWithValue("@Building", building);
                    cmd.Parameters.AddWithValue("@Title", title);
                    cmd.Parameters.AddWithValue("@Room", room);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            this.ListEmployees();
        }
        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            this.ListEmployees();
        }
        protected void UpdateEmployeeRecord(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];
            int ID = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            string firstName = (row.FindControl("txtFirstName") as TextBox).Text;
            string lastName = (row.FindControl("txtLastName") as TextBox).Text;
            string division = (row.FindControl("txtDivision") as TextBox).Text;
            string building = (row.FindControl("txtBuilding") as TextBox).Text;
            string title = (row.FindControl("txtTitle") as TextBox).Text;
            string room = (row.FindControl("txtRoom") as TextBox).Text;
            string query = "UPDATE Employees SET   FirstName=@FirstName, LastName=@LastName,Division=@Division, Building=@Building,Title=@Title, Room=@Room WHERE ID=@ID";
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Parameters.AddWithValue("@ID", ID);
                    cmd.Parameters.AddWithValue("@FirstName", firstName);
                    cmd.Parameters.AddWithValue("@LastName", lastName);
                    cmd.Parameters.AddWithValue("@Division", division);
                    cmd.Parameters.AddWithValue("@Building", building);
                    cmd.Parameters.AddWithValue("@Title", title);
                    cmd.Parameters.AddWithValue("@Room", room);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            GridView1.EditIndex = -1;
            this.ListEmployees();
        }
        protected void OnRowCancelingEdit(object sender, EventArgs e)
        {
            GridView1.EditIndex = -1;
            this.ListEmployees();
        }
        protected void DeleteEmployeeRecord(object sender, GridViewDeleteEventArgs e)
        {
            int ID = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values[0]);
            string query = "DELETE FROM Employees WHERE ID=@ID";
            string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.Parameters.AddWithValue("@ID", ID);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }

            this.ListEmployees();
        }

        protected void OnPaging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            this.ListEmployees();
        }
    }
}