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
    public partial class INSERT_PERS : Form
    {
        
        public INSERT_PERS(MySqlConnection insert_connection)
        {            
            InitializeComponent();

            connection = insert_connection;
        }
        public static MySqlConnection connection = new MySqlConnection("server = 127.0.0.1; uid=root;pwd=1337;database=human_resources_department");

        private void save_btn_Click(object sender, EventArgs e)
        {
            MySqlCommand insertVacationCommand = new MySqlCommand("INSERT INTO vacation (type_of_vacation, vacation_start_date, number_of_vacation_days, basis_of_vacation, idemployees) VALUES(@type_of_vacation, @vacation_start_date, @number_of_vacation_days, @basis_of_vacation, @idemployees);", connection);


            insertVacationCommand.Parameters.AddWithValue("type_of_vacation", VacationType_textBox.Text);
            insertVacationCommand.Parameters.AddWithValue("vacation_start_date", StartDate.Text);
            insertVacationCommand.Parameters.AddWithValue("number_of_vacation_days", NumberDays_textBox.Text);
            insertVacationCommand.Parameters.AddWithValue("basis_of_vacation", Basis_textBox.Text);
            insertVacationCommand.Parameters.AddWithValue("idemployees", FIO_employee_textBox.Text);

            try
            {
                insertVacationCommand.ExecuteNonQuery();                

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
