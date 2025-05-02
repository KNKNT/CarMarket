using MySql.Data.MySqlClient;
using MySqlX.XDevAPI;
using System.Data;
using System.Windows;
using System.Windows.Input;


namespace CarMarket.LoginPage
{
    /// <summary>
    /// Логика взаимодействия для Login.xaml
    /// </summary>
    public partial class Login : Window
    {
        public Login()
        {
            InitializeComponent();
        }

        Auth Auth = new Auth();
        public int id;

        private void Window_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            MainWindow mainWindow = new MainWindow();
            mainWindow.Show();
        }

        private void Registration_MouseDown(object sender, MouseButtonEventArgs e)
        {
            NavigationFrame.Content = new Registration();
        }
        private void LoginButton_Click(object sender, RoutedEventArgs e)
        {
            string login = LoginBox.Text;
            string password = PasswordBox.Password;

            if (login == "" | password == "") { MessageBox.Show("Поля не должны быть пустыми"); return; }

            bool enter = Auth.Login(login, password);

            if (enter) 
                this.Close();
        }
    }
}
