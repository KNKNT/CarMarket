using MySql.Data.MySqlClient;
using System.Windows;

namespace CarMarket.LoginPage
{
    class Auth
    {
        DataBase db = new DataBase();

        public bool Login(string login, string password)
        {
            string sql = "SELECT * FROM users WHERE login = @login AND pass = @password";
            MySqlParameter[] parameters = {
                new MySqlParameter("@login", login),
                new MySqlParameter("@password", password)
            };

            var result = db.ExecuteQuery(sql, parameters);

            if (result.Count > 0)
            {
                MessageBox.Show("Вход выполнен успешно!");

                Session.Id= Convert.ToInt32(result[0]["user_id"].ToString());
                Session.FirstName= result[0]["first_name"].ToString();
                Session.MidName= result[0]["mid_name"].ToString();
                Session.LastName= result[0]["last_name"].ToString();
                Session.Phone= result[0]["phone"].ToString();
                Session.Login= result[0]["login"].ToString();
                Session.Password= result[0]["pass"].ToString();
                Session.Rules= result[0]["rules"].ToString();

                return true;
            }
            else
            {
                MessageBox.Show("Неверное имя пользователя или пароль");
                return false;
            }
        }

        public bool Register(string login, string password, string firstName, string lastName, string phone)
        {
            try
            {
                string checkUserSql = "SELECT * FROM car.users WHERE login = @login OR phone = @phone";
                MySqlParameter[] checkParams = {
                    new MySqlParameter("@login", login),
                    new MySqlParameter("@phone", phone)
                };

                var existingUsers = db.ExecuteQuery(checkUserSql, checkParams);
                if (existingUsers.Count > 0)
                {
                    MessageBox.Show("Пользователь с таким именем или email уже существует");
                    return false;
                }

                string insertSql = @"INSERT INTO car.users (first_name, last_name, phone, login, pass, rules) 
                                    VALUES (@first_name, @last_name, @phone, @login, @pass, 'Пользователь')";

                MySqlParameter[] insertParams = {
                    new MySqlParameter("@first_name", firstName),
                    new MySqlParameter("@last_name", lastName),
                    new MySqlParameter("@phone", phone),
                    new MySqlParameter("@login", login),
                    new MySqlParameter("@pass", password),
                };

                int rowsAffected = db.ExecuteNonQuery(insertSql, insertParams);

                return rowsAffected > 0;
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка при регистрации: {ex.Message}");
                return false;
            }
        }
    }
}
