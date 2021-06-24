using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data;
using MySql.Data;
using MySql.Data.MySqlClient;

namespace Human_Resources_Department_DB
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        public static MySqlConnection connection = new MySqlConnection("server = 127.0.0.1; uid=root;pwd=1337;database=human_resources_department");

        public async void Form1_Load(object sender, EventArgs e)
        {

            // Открытие подключения БД
            connection.Open();

            // Показать сетку
            DataBase.GridLines = true;

            // Выделение целой строки при нажатии
            DataBase.FullRowSelect = true;

            DataBase.View = View.Details;

            DataBase.Columns.Add("Id_employees");
            DataBase.Columns.Add("Full Name");
            DataBase.Columns.Add("Gender");
            DataBase.Columns.Add("Experience");
            DataBase.Columns.Add("Home Address");
            DataBase.Columns.Add("Phine Number");
            DataBase.Columns.Add("Personnel Number");

            LoadData();
        }


        private void Form1_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (connection != null && connection.State != ConnectionState.Closed)
                connection.Close();
        }

        public void LoadData()
        {

            MySqlDataReader sqlReader = null;

            MySqlCommand getEmployeeCommand = new MySqlCommand("SELECT idemployees, full_name, gender, work_experience, home_address, phone_number, personnel_number FROM employees;", connection);

            try
            {
                sqlReader = getEmployeeCommand.ExecuteReader();

                while (sqlReader.Read())
                {
                    ListViewItem item = new ListViewItem(new string[] {
                        Convert.ToString(sqlReader["idemployees"]),
                        Convert.ToString(sqlReader["full_name"]),
                        Convert.ToString(sqlReader["gender"]),
                        Convert.ToString(sqlReader["work_experience"]),
                        Convert.ToString(sqlReader["home_address"]),
                        Convert.ToString(sqlReader["phone_number"]),
                        Convert.ToString(sqlReader["personnel_number"])
                    });

                    DataBase.Items.Add(item);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Ошибка!", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            finally
            {
                if (sqlReader != null && !sqlReader.IsClosed)
                {
                    sqlReader.Close();
                }
            }
        }    

        private void Insert_StripButton_Click(object sender, EventArgs e)
        {
            INSERT insert = new INSERT(connection);
            insert.Show();
        }

        private void Update_StripButton_Click(object sender, EventArgs e)
        {
            if (DataBase.SelectedItems.Count > 0)
            {

                UPDATE update = new UPDATE(connection, Convert.ToInt32(DataBase.SelectedItems[0].SubItems[0].Text));

                update.Show();
            }
            else
            {
                MessageBox.Show("Ни одна строка не была выделена!", "Ошибка!", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void Delete_StripButton_Click(object sender, EventArgs e)
        {
            if (DataBase.SelectedItems.Count > 0)
            {
                DialogResult res = MessageBox.Show("Вы действительно хотите удалить эту строку?", "Удаление строки", MessageBoxButtons.YesNo, MessageBoxIcon.Exclamation);

                switch (res)
                {
                    case DialogResult.Yes:

                        MySqlCommand deleteEmployeesCommand = new MySqlCommand("DELETE FROM employees WHERE idemployees = @id", connection);

                        deleteEmployeesCommand.Parameters.AddWithValue("id", Convert.ToInt32(DataBase.SelectedItems[0].SubItems[0].Text));

                        try
                        {
                            deleteEmployeesCommand.ExecuteNonQuery();
                        }
                        catch (Exception ex)
                        {
                            MessageBox.Show(ex.Message, "Ошибка!", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        }

                        break;
                }
            }
            else
            {
                MessageBox.Show("Ни одна строка не была выделена!", "Ошибка!", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void Update_DB_Click(object sender, EventArgs e)
        {
            DataBase.Items.Clear();
            LoadData();
        }
    }
}
