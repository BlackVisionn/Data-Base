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
        int type; // если true то таблица с сотрудниками, если false с личными данными
        public Form1()
        {
            InitializeComponent();
        }
        public static MySqlConnection connection = new MySqlConnection("server = 127.0.0.1; uid=root;pwd=1337;database=human_resources_department");

        public async void Form1_Load()
        {

            // Открытие подключения БД
            if (!(connection != null && connection.State != ConnectionState.Closed))
            connection.Open();
            if (type == 1)
            {
                DataBase.Columns.Clear();
                // Показать сетку
                DataBase.GridLines = true;

                // Выделение целой строки при нажатии
                DataBase.FullRowSelect = true;

                DataBase.View = View.Details;

                DataBase.Columns.Add("Id_сотрудника");
                DataBase.Columns.Add("ФИО");
                DataBase.Columns.Add("Пол");
                DataBase.Columns.Add("Стаж работы");
                DataBase.Columns.Add("Домашний адрес");
                DataBase.Columns.Add("Номер телефона");
                DataBase.Columns.Add("Табельный номер");

                DataBase.Columns[0].Width = 110;
                DataBase.Columns[1].Width = 150;
                DataBase.Columns[2].Width = 50;
                DataBase.Columns[3].Width = 110;
                DataBase.Columns[4].Width = 135;
                DataBase.Columns[5].Width = 135;
                DataBase.Columns[6].Width = 150;

                LoadData();
            }
            else if (type == 2)
            {
                DataBase.Columns.Clear();
                // Показать сетку
                DataBase.GridLines = true;

                // Выделение целой строки при нажатии
                DataBase.FullRowSelect = true;

                DataBase.View = View.Details;

                DataBase.Columns.Add("Id_отпуска");
                DataBase.Columns.Add("ФИО Сотрудника");
                DataBase.Columns.Add("Тип отпуска");
                DataBase.Columns.Add("Дата начала отпуска");
                DataBase.Columns.Add("Количество дней отпуска");
                DataBase.Columns.Add("Основания отпуска");

                DataBase.Columns[0].Width = 90;
                DataBase.Columns[1].Width = 150;
                DataBase.Columns[2].Width = 95;
                DataBase.Columns[3].Width = 155;
                DataBase.Columns[4].Width = 185;
                DataBase.Columns[5].Width = 155;                

                LoadData();
            }
            else if (type == 3)
            {
                DataBase.Columns.Clear();
                // Показать сетку
                DataBase.GridLines = true;

                // Выделение целой строки при нажатии
                DataBase.FullRowSelect = true;

                DataBase.View = View.Details;

                DataBase.Columns.Add("Организация");
                DataBase.Columns.Add("Средняя заработная плата");                

                DataBase.Columns[0].Width = 100;
                DataBase.Columns[1].Width = 200;
                

                LoadData();
            }
            else if (type == 4)
            {
                DataBase.Columns.Clear();
                // Показать сетку
                DataBase.GridLines = true;

                // Выделение целой строки при нажатии
                DataBase.FullRowSelect = true;

                DataBase.View = View.Details;

                DataBase.Columns.Add("ФИО Сотрудника");
                DataBase.Columns.Add("Дата начала отпуска");
                DataBase.Columns.Add("Количество дней отпуска");

                DataBase.Columns[0].Width = 150;
                DataBase.Columns[1].Width = 180;
                DataBase.Columns[2].Width = 200;


                LoadData();
            }

        }


        private void Form1_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (connection != null && connection.State != ConnectionState.Closed)
                connection.Close();
        }

        // Загрузить данные из БД
        public void LoadData()
        {
            if (type == 1)
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
            else if (type == 2)
            {
                MySqlDataReader sqlReader = null;

                MySqlCommand getPersonalDataCommand = new MySqlCommand("SELECT idvacation, full_name, type_of_vacation, vacation_start_date, number_of_vacation_days, basis_of_vacation FROM vacation JOIN employees ON vacation.idemployees = employees.idemployees;", connection);

                try
                {
                    sqlReader = getPersonalDataCommand.ExecuteReader();

                    while (sqlReader.Read())
                    {
                        ListViewItem item = new ListViewItem(new string[] {
                        Convert.ToString(sqlReader["idvacation"]),
                        Convert.ToString(sqlReader["full_name"]),
                        Convert.ToString(sqlReader["type_of_vacation"]),
                        Convert.ToString(sqlReader["vacation_start_date"]),
                        Convert.ToString(sqlReader["number_of_vacation_days"]),
                        Convert.ToString(sqlReader["basis_of_vacation"])
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
            else if (type == 3)
            {
                MySqlDataReader sqlReader = null;

                MySqlCommand getAvgSalaryCommand = new MySqlCommand("SELECT name_of_organization, AVG (salary) AS avg_salary FROM position_to_organization JOIN organizationn ON position_to_organization.idorganization = organizationn.idorganization GROUP BY name_of_organization;", connection);

                try
                {
                    sqlReader = getAvgSalaryCommand.ExecuteReader();

                    while (sqlReader.Read())
                    {
                        ListViewItem item = new ListViewItem(new string[] {
                        Convert.ToString(sqlReader["name_of_organization"]),
                        Convert.ToString(sqlReader["avg_salary"])
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
            else if (type == 4)
            {
                MySqlDataReader sqlReader = null;

                MySqlCommand getVacationEmployeesCommand = new MySqlCommand("SELECT full_name, vacation_start_date, number_of_vacation_days FROM employees JOIN vacation ON employees.idemployees = vacation.idemployees WHERE type_of_vacation IS NOT NULL ORDER BY number_of_vacation_days DESC;", connection);

                try
                {
                    sqlReader = getVacationEmployeesCommand.ExecuteReader();

                    while (sqlReader.Read())
                    {
                        ListViewItem item = new ListViewItem(new string[] {
                        Convert.ToString(sqlReader["full_name"]),
                        Convert.ToString(sqlReader["vacation_start_date"]),
                        Convert.ToString(sqlReader["number_of_vacation_days"])
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
        }  


        private void Insert_StripButton_Click(object sender, EventArgs e)
        {
            if (type == 1)
            {
                INSERT insert = new INSERT(connection);
                insert.Show();
            }
            else if(type == 2)
            {
                INSERT_PERS insert_pers = new INSERT_PERS(connection);
                insert_pers.Show();
            }
            
        }

        private void Update_StripButton_Click(object sender, EventArgs e)
        {
            if (type == 1)
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
            
            else if(type == 2)
            {
                if (DataBase.SelectedItems.Count > 0)
                {

                    UPDATE_PERS update_pers = new UPDATE_PERS(connection, Convert.ToInt32(DataBase.SelectedItems[0].SubItems[0].Text));

                    update_pers.Show();
                }
                else
                {
                    MessageBox.Show("Ни одна строка не была выделена!", "Ошибка!", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
            
        }

        private void Delete_StripButton_Click(object sender, EventArgs e)
        {
            if(type == 1)
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
            else if (type == 2)
            {
                if (DataBase.SelectedItems.Count > 0)
                {
                    DialogResult res = MessageBox.Show("Вы действительно хотите удалить эту строку?", "Удаление строки", MessageBoxButtons.YesNo, MessageBoxIcon.Exclamation);

                    switch (res)
                    {
                        case DialogResult.Yes:

                            MySqlCommand deleteVacationCommand = new MySqlCommand("DELETE FROM vacation WHERE idvacation = @id", connection);

                            deleteVacationCommand.Parameters.AddWithValue("id", Convert.ToInt32(DataBase.SelectedItems[0].SubItems[0].Text));

                            try
                            {
                                deleteVacationCommand.ExecuteNonQuery();
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
            
        }

        private void Update_DB_Click(object sender, EventArgs e)
        {
            DataBase.Items.Clear();
            LoadData();
        }

        private void Show_Employees_Click(object sender, EventArgs e)
        {
            DataBase.Items.Clear();

            type = 1;

            avg_salary.Enabled = true;
            employees_vacation.Enabled = true;
            Show_Employees.Enabled = false;
            Show_Vacations.Enabled = true;
            Insert_StripButton.Enabled = true;
            Update_StripButton.Enabled = true;
            Delete_StripButton.Enabled = true;
            Update_DB.Enabled = true;

            Form1_Load();
        }

        private void Show_Vacations_Click(object sender, EventArgs e)
        {
            DataBase.Items.Clear();

            type = 2;

            avg_salary.Enabled = true;
            employees_vacation.Enabled = true;
            Show_Employees.Enabled = true;
            Show_Vacations.Enabled = false;
            Insert_StripButton.Enabled = true;
            Update_StripButton.Enabled = true;
            Delete_StripButton.Enabled = true;
            Update_DB.Enabled = true;

            Form1_Load();
        }

        private void avg_salary_Click(object sender, EventArgs e)
        {
            DataBase.Items.Clear();

            type = 3;

            avg_salary.Enabled = false;
            employees_vacation.Enabled = true;
            Show_Employees.Enabled = true;
            Show_Vacations.Enabled = true;
            Insert_StripButton.Enabled = false;
            Update_StripButton.Enabled = false;
            Delete_StripButton.Enabled = false;
            Update_DB.Enabled = false;

            Form1_Load();
        }

        private void employees_vacation_Click(object sender, EventArgs e)
        {
            DataBase.Items.Clear();

            type = 4;
                        
            avg_salary.Enabled = true;
            employees_vacation.Enabled = false;
            Show_Employees.Enabled = true;
            Show_Vacations.Enabled = true;
            Insert_StripButton.Enabled = false;
            Update_StripButton.Enabled = false;
            Delete_StripButton.Enabled = false;
            Update_DB.Enabled = false;

            Form1_Load();
        }
    }
}
