using System.Windows;
using System.Windows.Controls;
using System.Windows.Documents;
using System.Windows.Media.Imaging;

namespace CarMarket
{
    /// <summary>
    /// Логика взаимодействия для Order.xaml
    /// </summary>
    public partial class Order : UserControl
    {
        public Order(int id, string mark, string model, int year, 
                    string fuel, string transmission, string engine,
                    string power, int pirce, string image)
        {
            InitializeComponent();

            _id = id;
            _price = pirce;
            Mark.Inlines.Add(new Run(" " + mark) { FontWeight = FontWeights.Bold});
            Model.Inlines.Add(new Run(" " + model) { FontWeight = FontWeights.Bold});
            Year.Inlines.Add(new Run(" " + year) { FontWeight = FontWeights.Bold});
            Fuel.Inlines.Add(new Run(" " + fuel) { FontWeight = FontWeights.Bold});
            Transmission.Inlines.Add(new Run(" " + transmission) { FontWeight = FontWeights.Bold});
            Engine.Inlines.Add(new Run(" " + engine) { FontWeight = FontWeights.Bold});
            Power.Inlines.Add(new Run(" " + power) { FontWeight = FontWeights.Bold});

            Price.Text = pirce.ToString() + " ₽";

            var bitmapImage = new BitmapImage();
            bitmapImage.BeginInit();
            bitmapImage.UriSource = new Uri(image, UriKind.Absolute);
            bitmapImage.CacheOption = BitmapCacheOption.OnLoad;
            bitmapImage.EndInit();

            ImageCar.Source = bitmapImage;
        }
        int _id;
        int _price;
        private void Back_Click(object sender, RoutedEventArgs e)
        {
            Content = new Car();
        }
        DataBase db = new DataBase();
        private void Button_Click(object sender, RoutedEventArgs e)
        {
            string insertSql = $"INSERT INTO car.deal (user_id, arrival_id, price, date_end) VALUES ({Session.Id}, {_id} , {_price}, curdate());";

           

            int rowsAffected = db.ExecuteNonQuery(insertSql);

            if (rowsAffected > 0)
            {
                MessageBox.Show("Данные добавленны!");
                Content = null;
            }
            else
                MessageBox.Show("Не удалось добавить!");
        }
    }
}
