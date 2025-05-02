using System.Windows;

namespace CarMarket
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();

            int id = Session.Id;
            if (id == 0 )
            {
                profile.Visibility = Visibility.Collapsed;
                MakeOrder.Visibility = Visibility.Collapsed;
                ShowDrivers.Visibility = Visibility.Collapsed;
                ShowUsers.Visibility = Visibility.Collapsed;
                ShowDeals.Visibility = Visibility.Collapsed;
            }
            else if ((Session.Rules == "Пользователь") | (Session.Rules == "Водитель"))
            {
                login.Visibility = Visibility.Collapsed;
                MakeOrder.Visibility = Visibility.Collapsed;
                ShowDrivers.Visibility = Visibility.Collapsed;
                ShowUsers.Visibility = Visibility.Collapsed;
            } 
            else if (Session.Rules == "Администратор")
            {
                login.Visibility = Visibility.Collapsed;
            }
        }

        private void MarksButton_Click(object sender, RoutedEventArgs e)
        {
            
            NavigationFrame.Content = new Mark(Session.Rules == "Администратор");
        }

        private void AutoButton_Click(object sender, RoutedEventArgs e)
        {
            NavigationFrame.Content = new Car();
        }

        private void ShowDrivers_Click(object sender, RoutedEventArgs e)
        {
            NavigationFrame.Content = new Driver();
        }

        private void ShowUsers_Click(object sender, RoutedEventArgs e)
        {
            NavigationFrame.Content = new Users();
        }

        private void ShowDeals_Click(object sender, RoutedEventArgs e)
        {
            NavigationFrame.Content = new Deal(true);
        }

        private void MakeOrder_Click(object sender, RoutedEventArgs e)
        {
            NavigationFrame.Content = new MakeOrder();
        }

        private void login_Click(object sender, RoutedEventArgs e)
        {
            LoginPage.Login login = new LoginPage.Login();
            login.Show();
            this.Close();

        }

        private void profile_Click(object sender, RoutedEventArgs e)
        {
            NavigationFrame.Content = new ProfilePage();
        }
    }
}