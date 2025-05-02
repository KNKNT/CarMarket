using System.Data;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using MySql.Data.MySqlClient;


namespace CarMarket
{
    /// <summary>
    /// Логика взаимодействия для Mark.xaml
    /// </summary>
    public partial class Mark : UserControl
    {
        public Mark(bool AllowAdd)
        {
            InitializeComponent();
            LoadData();
            SetupSearchColumns();

            if (!AllowAdd)
            {
                AddMark.Visibility = Visibility.Collapsed;
                tablePanek.SetValue(Grid.ColumnProperty, 0);
                tablePanek.SetValue(Grid.ColumnSpanProperty, 2);
            }

        }

        DataBase db = new DataBase();
        DataView dataView;
        int Mark_id;

        private void Back_Click(object sender, RoutedEventArgs e)
        {
            Content = null;
        }

  
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

        private void dataGrid_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            
            if (!(dataGrid.SelectedItem is DataRowView selectedRow))
            {
                Name.Text = "";
                Country.Text = "";
                Year.Text = "";
                Mark_id = 0;
                return;
            }

            Mark_id = Convert.ToInt32(selectedRow[0]);
            Name.Text = selectedRow[1].ToString();
            Country.Text = selectedRow[2].ToString();
            Year.Text = selectedRow[3].ToString();
        }

        public void LoadData()
        {
            dataView = db.ExecuteQuery("SELECT * FROM mark");
            dataGrid.ItemsSource = dataView;
        }

        private void DeleteButton_Click(object sender, RoutedEventArgs e)
        {
            if (dataGrid.SelectedItem == null)
            {
                MessageBox.Show("Выберите строку для удаления");
                return;
            }

            string deleteSql = "DELETE FROM mark WHERE Mark_id = @id";

            var parameters = new MySqlParameter[]
            {
                new MySqlParameter("@id", Mark_id)
            };

            try
            {
                int deletedRows = db.ExecuteNonQuery(deleteSql, parameters);

                if (deletedRows > 0)
                {
                    MessageBox.Show("Запись удалена!");
                    LoadData();
                    Content = null;
                }
                else
                {
                    MessageBox.Show("Не удалось удалить запись");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка при удалении: {ex.Message}");
            }
        }

        private void UpdateButton_Click(object sender, RoutedEventArgs e)
        {
            if (dataGrid.SelectedItem == null)
            {
                MessageBox.Show("Выберите строку для изменения");
                return;
            }

            string updateSql = "UPDATE car.mark SET name = @name, country = @country, year = @year WHERE Mark_id = @id";

            var parameters = new MySqlParameter[]
            {
                new MySqlParameter("@name", Name.Text),
                new MySqlParameter("@country", Country.Text),
                new MySqlParameter("@year", Year.Text),
                new MySqlParameter("@id", Mark_id)
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

        private void InsertButton_Click(object sender, RoutedEventArgs e)
        {
            string insertSql = "insert into car.mark(name, country, year) VALUES (@name, @country, @year);";

            var parameters = new MySqlParameter[]
            {
                new MySqlParameter("@name", Name.Text),
                new MySqlParameter("@country", Country.Text),
                new MySqlParameter("@year", Year.Text)
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
    }
}
