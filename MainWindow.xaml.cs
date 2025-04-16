using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

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
        }

        private void MarksButton_Click(object sender, RoutedEventArgs e)
        {
            NavigationFrame.Content = new Mark();
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
            NavigationFrame.Content = new Deal();
        }

        private void MakeOrder_Click(object sender, RoutedEventArgs e)
        {
            NavigationFrame.Content = new MakeOrder();
        }
    }
}