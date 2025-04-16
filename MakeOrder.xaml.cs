using MySql.Data.MySqlClient;
using System.Data;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media.Imaging;

namespace CarMarket
{
    /// <summary>
    /// Логика взаимодействия для MakeOrder.xaml
    /// </summary>
    public partial class MakeOrder : UserControl
    {
        public MakeOrder()
        {
            InitializeComponent();
            LoadData();
        }

        private void Back_Click(object sender, RoutedEventArgs e)
        {
            Content = null;
        }
        DataView dataView;
        DataBase db = new();
        public void LoadData()
        {
            dataView = db.ExecuteQuery("SELECT name FROM car.mark");

            var names = new List<string>();
            foreach (DataRowView row in dataView)
            {
                names.Add(row["name"].ToString());
            }

            Mark.ItemsSource = names;
        }

        private void Image_TextChanged(object sender, TextChangedEventArgs e)
        {
            try
            {
                if (Image.Text != null)
                {
                    var bitmapImage = new BitmapImage();
                    bitmapImage.BeginInit();
                    bitmapImage.UriSource = new Uri(Image.Text, UriKind.Absolute);
                    bitmapImage.CacheOption = BitmapCacheOption.OnLoad;
                    bitmapImage.EndInit();

                    ImageCar.Source = bitmapImage;
                }
            }
            catch { }
        }

        private void Add_Click(object sender, RoutedEventArgs e)
        {
            if (!string.IsNullOrEmpty(Mark.Text) & !string.IsNullOrEmpty(Model.Text) & !string.IsNullOrEmpty(Year.Text)
                & !string.IsNullOrEmpty(Fuel.Text) & !string.IsNullOrEmpty(Transmission.Text) & !string.IsNullOrEmpty(Engine.Text)
                & !string.IsNullOrEmpty(Power.Text) & !string.IsNullOrEmpty(Price.Text) & !string.IsNullOrEmpty(Image.Text))
            {
                string insertSql = "CALL insert_showcars(@mark, @model, @year, @fuel, @transmission, @engine, @power, @price, @image);";

                var parameters = new MySqlParameter[]
                {
                new MySqlParameter("@mark", Mark.Text),
                new MySqlParameter("@model", Model.Text),
                new MySqlParameter("@year", Year.Text),
                new MySqlParameter("@fuel", Fuel.Text),
                new MySqlParameter("@transmission", Transmission.Text),
                new MySqlParameter("@engine", Engine.Text),
                new MySqlParameter("@power", Power.Text),
                new MySqlParameter("@price", Price.Text),
                new MySqlParameter("@image", Image.Text),
                };

                int rowsAffected = db.ExecuteNonQuery(insertSql, parameters);

                if (rowsAffected > 0)
                {
                    MessageBox.Show("Данные добавленны!");
                    Content = null;
                }
                else
                    MessageBox.Show("Не удалось добавить!");
            }
            else MessageBox.Show("Заполните все поля!");
        }
    }
}
