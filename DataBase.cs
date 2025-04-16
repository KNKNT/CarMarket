using System.Data;
using MySql.Data.MySqlClient;

namespace CarMarket
{
    public class DataBase
    {
        public DataView ExecuteQuery(string sql)
        {
            DataTable dataTable = new DataTable();

            string connectionString = "Server=localhost;Database=car;User Id=root;Password=admin;";

            using (MySqlConnection connection = new MySqlConnection(connectionString))
            {
                connection.Open();

                using (MySqlCommand command = new MySqlCommand(sql, connection))
                {
                    using (MySqlDataReader reader = command.ExecuteReader())
                    {
                        dataTable.Load(reader);
                    }
                }
            }

            return dataTable.DefaultView;
        }
    }
}