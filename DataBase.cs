using System.Data;
using MySql.Data.MySqlClient;

namespace CarMarket
{
    public class DataBase
    {
        DataTable dataTable = new DataTable();
        string connectionString = "Server=localhost;Database=car;User Id=root;Password=admin;";

        public DataView ExecuteQuery(string sql, MySqlParameter[] parameters = null)
        {

            dataTable.Clear();

            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                connection.Open();

                using (MySqlCommand command = new MySqlCommand(sql, connection))
                {
                    if (parameters != null)
                    {
                        command.Parameters.AddRange(parameters);
                    }

                    using (MySqlDataReader reader = command.ExecuteReader())
                    {
                        dataTable.Load(reader);
                    }
                }
            }
            return dataTable.DefaultView;
        }

        public int ExecuteNonQuery(string sql, MySqlParameter[] parameters = null)
        {
            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                connection.Open();
                using (MySqlCommand command = new MySqlCommand(sql, connection))
                {
                    if (parameters != null)
                    {
                        command.Parameters.AddRange(parameters);
                    }
                    return command.ExecuteNonQuery(); 
                }
            }
        }
    }
}