using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;


namespace CarMarket.LoginPage
{
    public partial class Registration : UserControl
    {
        public Registration()
        {
            InitializeComponent();
        }
        Auth Auth = new Auth();
        private void Login_MouseDown(object sender, MouseButtonEventArgs e)
        {
            Content = null;
        }

        private void RegistrationButton_Click(object sender, RoutedEventArgs e)
        {
            if (Login.Text == "" | Password.Password == "" | FirstName.Text == "" | LastName.Text == "" | Phone.Text == "")
            {
                MessageBox.Show("Поля не должны быть пустыми");
                return;
            }
            bool registered = Auth.Register(Login.Text, Password.Password, FirstName.Text, LastName.Text, Phone.Text);

            if (registered)
            {
                MessageBox.Show("Пользователь зарегистрирован");
                Content = null;
            } else
                MessageBox.Show("Ошибка при регистрации");
        }
    }
}
