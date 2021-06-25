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
    public partial class UPDATE_PERS : Form
    {
        public static MySqlConnection connection = new MySqlConnection("server = 127.0.0.1; uid=root;pwd=1337;database=human_resources_department");

        private int id;
        public UPDATE_PERS(MySqlConnection update_connection, int id)
        {
            InitializeComponent();

            connection = update_connection;

            this.id = id;
        }

        private void save_btn_Click(object sender, EventArgs e)
        {
            MySqlCommand updateEmployeesCommand = new MySqlCommand("UPDATE vacation JOIN employees ON vacation.idemployees = employees.idemployees SET full_name=@full_name, type_of_vacation=@type_of_vacation, vacation_start_date=@vacation_start_date, number_of_vacation_days=@number_of_vacation_days, basis_of_vacation=@basis_of_vacation WHERE idvacation=@id", connection);

            updateEmployeesCommand.Parameters.AddWithValue("id", id);
            updateEmployeesCommand.Parameters.AddWithValue("full_name", FIO_employee_textBox.Text);
            updateEmployeesCommand.Parameters.AddWithValue("type_of_vacation", VacationType_textBox.Text);
            updateEmployeesCommand.Parameters.AddWithValue("vacation_start_date", StartDate.Text);
            updateEmployeesCommand.Parameters.AddWithValue("number_of_vacation_days", NumberDays_textBox.Text);
            updateEmployeesCommand.Parameters.AddWithValue("basis_of_vacation", Basis_textBox.Text);            

            try
            {
                updateEmployeesCommand.ExecuteNonQuery();
                Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Ошибка!", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void cancel_bth_Click(object sender, EventArgs e)
        {
            Close();
        }
    }
}
