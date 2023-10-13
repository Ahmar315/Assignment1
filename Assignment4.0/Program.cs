using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;

namespace ConsoleApp5
{
    class Program
    {
        static void Main(string[] args)
        {

            string connectionString = "Server=cmdlhrdb01;Database=5070_DB;Trusted_Connection=True;";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // 1. Execute Stored Procedure to Get All Employees
                using (SqlCommand command = new SqlCommand("GetAllStudents", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        Console.WriteLine($"ID: {reader["ID"]}, FirstName: {reader["FirstName"]}, LastName: {reader["LastName"]}, CourseID: {reader["CourseID"]},Age: {reader["Age"]}");
                    }
                    connection.Close();
                }
               

                // 2. Execute Stored Procedure to Add an Employee
                using (SqlCommand command = new SqlCommand("AddStudents", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@FirstName", "Hamza");
                    command.Parameters.AddWithValue("@LastName", "Khan");
                    command.Parameters.AddWithValue("@Age", 23);
                    command.Parameters.AddWithValue("@CourseID", 13);
                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                }

                // 3. Execute Stored Procedure to Update an Employee's Age
                using (SqlCommand command = new SqlCommand("UpdateStudents", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@ID", 9);
                    command.Parameters.AddWithValue("@NewAge", 22);
                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                }

                // 4. Execute Stored Procedure to Delete an Employee
                using (SqlCommand command = new SqlCommand("DeleteStudent", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@ID", 3);
                    connection.Open();
                    command.ExecuteNonQuery();
                    connection.Close();
                }

                // 5. Execute Stored Procedure to list the names of students who are not enrolled in any course
                using (SqlCommand command = new SqlCommand("StudentsNotEnrolled", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        Console.WriteLine($"FirstName: {reader["FirstName"]}, LastName: {reader["LastName"]}");
                    }
                    connection.Close();

                }

                // 6. Execute Stored Procedure to print most popular course 
                using (SqlCommand command = new SqlCommand("PopularCase", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        Console.WriteLine($"NoOfCourse: {reader["NoOfCourse"]}, CourseName: {reader["CourseName"]}");
                    }
                    connection.Close();
                }

                // 7. Execute Stored Procedure to list students who are older than the average age 
                using (SqlCommand command = new SqlCommand("GreaterThanAvgAge", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        Console.WriteLine($"FirstName {reader["FirstName"]}, LastName {reader["LastName"]}, Age {reader["Age"]}");
                    }
                    connection.Close();
                }

                // 8. Execute Stored Procedure to List the courses that have no students enrolled in them
                using (SqlCommand command = new SqlCommand("CourseNotEnrolled", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        Console.WriteLine($"CourseName {reader["CourseName"]}");
                    }
                    connection.Close();
                }

                // 10.  Execute Stored Procedure For each course, list the youngest and oldest student
                using (SqlCommand command = new SqlCommand("YongAndOld", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        Console.WriteLine($"youngest {reader["youngest"]}, oldest {reader["oldest"]}, CourseName {reader["CourseName"]}");
                    }
                    connection.Close();
                }

            }
            Console.ReadLine();
        }
    }
}
