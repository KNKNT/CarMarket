using MySql.Data.MySqlClient;
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

        private void Window_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            MainWindow mainWindow = new MainWindow(id);
            mainWindow.Show();
        }


        private void Registration_MouseDown(object sender, MouseButtonEventArgs e)
        {
            NavigationFrame.Content = new Registration();
        }
        int id = 0;
        private void LoginButton_Click(object sender, RoutedEventArgs e)
        {
            string login = LoginBox.Text;
            string password = PasswordBox.Text;

            if (login == "" | password == "") { MessageBox.Show("Поля не должны быть пустыми"); return; }

            id = Auth.Login(login, password);

            if (id == -1) return;
            
            this.Close();
        }
    }
}
