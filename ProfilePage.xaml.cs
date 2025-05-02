using MySql.Data.MySqlClient;
using System.Windows;
using System.Windows.Controls;

namespace CarMarket
{
    /// <summary>
    /// Логика взаимодействия для ProfilePage.xaml
    /// </summary>
    public partial class ProfilePage : UserControl
    {
        public ProfilePage()
        {
            InitializeComponent();

            Deals.Content = new Deal(false);

            Fio.Text = Session.LastName + " " + Session.FirstName + " " + Session.MidName;
            Rules.Text = Session.Rules;

            FirstName.Text = Session.FirstName;
            LastName.Text = Session.LastName;
            MidName.Text = Session.MidName;
            Phone.Text = Session.Phone;   
            
            Login.Text = Session.Login;
        }

        DataBase db = new();
        private void Save_Click(object sender, RoutedEventArgs e)
        {
            if ((FirstName.Text == Session.FirstName) & (LastName.Text == Session.LastName) & (MidName.Text == Session.MidName) & (Phone.Text == Session.Phone))
            {
                MessageBox.Show("Нечего сохранять");
            }
            else
            {
                string updateSql = "UPDATE car.users SET first_name = @first_name, last_name = @last_name, mid_name = @mid_name, phone = @phone WHERE user_id = @user_id";

                var parameters = new MySqlParameter[]
                {
                new MySqlParameter("@first_name", FirstName.Text),
                new MySqlParameter("@last_name", LastName.Text),
                new MySqlParameter("@mid_name", MidName.Text),
                new MySqlParameter("@phone", Phone.Text),
                new MySqlParameter("@user_id", Session.Id)
                };

                int updatedRows = db.ExecuteNonQuery(updateSql, parameters);

                if (updatedRows > 0)
                {
                    MessageBox.Show("Данные обновлены!");
                    Content = null;
                }
                else
                    MessageBox.Show("Не удалось изменить!");
            }
        }

        private void SavePass_Click(object sender, RoutedEventArgs e)
        {
            if (Key.Text == "admin")
            {
                if (OldPassword.Password == NewPassword.Password)
                {
                    string updateSql = "UPDATE car.users SET pass = @pass WHERE user_id = @user_id";

                    var parameters = new MySqlParameter[]
                    {
                        new MySqlParameter("@pass", NewPassword.Password),
                        new MySqlParameter("@user_id", Session.Id)
                    };

                    int updatedRows = db.ExecuteNonQuery(updateSql, parameters);

                    if (updatedRows > 0)
                    {
                        MessageBox.Show("Данные обновлены!");
                        Content = null;
                    }
                    else
                        MessageBox.Show("Не удалось изменить!");
                }
                else
                {
                    MessageBox.Show("Пароли не совпадают");
                }
            }
            else
                MessageBox.Show("Уточните ключ у администратора");
        }

        private void Back_Click(object sender, RoutedEventArgs e)
        {
            Content = null;
        }

        private void Leave_Click(object sender, RoutedEventArgs e)
        {
            Session.Id = 0;
            LoginPage.Login login = new LoginPage.Login();
            login.Show();

            Window parentWindow = Window.GetWindow(this);
            parentWindow?.Close();

        }
    }
}
