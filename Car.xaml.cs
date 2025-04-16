using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
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
    /// Логика взаимодействия для Car.xaml
    /// </summary>
    public partial class Car : UserControl
    {
        public Car()
        {
            InitializeComponent();
            LoadData();
            SetupSearchColumns();
        }

        private void Back_Click(object sender, RoutedEventArgs e)
        {
            Content = null;
        }

        private void LoadData()
        {
            DataBase db = new DataBase();
            dataView = db.ExecuteQuery("SELECT * FROM car.showcarsnew;");
            dataGrid.ItemsSource = dataView;
        }

        DataView dataView;

        private void Filter_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Search();
        }

        private void Value_TextChanged(object sender, TextChangedEventArgs e)
        {
            Search();
        }

        private void SetupSearchColumns()
        {
            Filter.Items.Clear();

            foreach (DataGridColumn column in dataGrid.Columns)
            {
                if (column is DataGridTextColumn textColumn)
                {
                    Filter.Items.Add(textColumn.Header.ToString());
                }
            }

            Filter.SelectedIndex = 0;
        }

        private void Search()
        {
            if (Filter.SelectedItem == null || string.IsNullOrEmpty(Value.Text))
            {
                dataView.RowFilter = "";
                return;
            }

            string? selectedHeader = Filter.SelectedItem.ToString();

            var column = dataGrid.Columns
                .OfType<DataGridTextColumn>()
                .FirstOrDefault(c => c.Header.ToString() == selectedHeader);

            if (column == null)
                return;

            var binding = (Binding)column.Binding;
            string columnName = binding.Path.Path;
            string searchText = Value.Text;

            dataView.RowFilter = $"CONVERT([{columnName}], 'System.String') LIKE '%{searchText.Replace("'", "''")}%'";
        }

        private void Buy_Click(object sender, RoutedEventArgs e)
        {
            var button = sender as Button;

            if (button?.DataContext is DataRowView rowView)
            { 
                int id = Convert.ToInt32(rowView[0]);
                string? mark = rowView[1].ToString();
                string? model = rowView[2].ToString();
                int year = Convert.ToInt32(rowView[3]);
                string? fuel = rowView[4].ToString();
                string? transmission = rowView[5].ToString();
                string? engine = rowView[6].ToString();
                string? power = rowView[7].ToString();
                int price = Convert.ToInt32(rowView[8]);
                string? image = rowView[9].ToString();


                Content = new Order(id, mark, model, year, fuel, transmission, engine, power, price, image);
            }
        }
    }
}
