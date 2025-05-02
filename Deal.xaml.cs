using System.Data;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;

namespace CarMarket
{
    /// <summary>
    /// Логика взаимодействия для Deal.xaml
    /// </summary>
    public partial class Deal : UserControl
    {
        public Deal(bool AllowBackButton)
        {
            InitializeComponent();
            LoadData();
            SetupSearchColumns();

            if(!AllowBackButton)
                Back.Visibility = Visibility.Collapsed;
        }
        private void Back_Click(object sender, RoutedEventArgs e)
        {
            Content = null;
        }
        private void LoadData()
        {
            DataBase db = new DataBase();
            
            if (Session.Rules == "Администратор")
                dataView = db.ExecuteQuery($"SELECT * FROM car.showdeals");
            else
                dataView = db.ExecuteQuery($"SELECT * FROM car.showdeals WHERE user_id = {Session.Id}");
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
    }
}
