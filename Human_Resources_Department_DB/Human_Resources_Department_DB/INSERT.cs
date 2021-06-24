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
    public partial class INSERT : Form
    {

        public static MySqlConnection connection = new MySqlConnection("server = 127.0.0.1; uid=root;pwd=1337;database=human_resources_department");

        public INSERT(MySqlConnection insert_connection)
        {
            InitializeComponent();

            connection = insert_connection;
        }        

        private void cancel_bth_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void insert_btn_Click(object sender, EventArgs e)
        {
            MySqlCommand insertEmployeesCommand = new MySqlCommand("INSERT INTO employees(full_name, gender, work_experience, home_address, phone_number, personnel_number) VALUES(@full_name, @gender, @work_experience, @home_address, @phone_number, @personnel_number);", connection);

            insertEmployeesCommand.Parameters.AddWithValue("full_name", FIO_textBox.Text);
            insertEmployeesCommand.Parameters.AddWithValue("gender", Gender_comboBox.Text);
            insertEmployeesCommand.Parameters.AddWithValue("work_experience", Experience_textBox.Text);
            insertEmployeesCommand.Parameters.AddWithValue("home_address", Address_textBox.Text);
            insertEmployeesCommand.Parameters.AddWithValue("phone_number", Phone_textBox.Text);
            insertEmployeesCommand.Parameters.AddWithValue("personnel_number", Number_textBox.Text);

            try
            {
                insertEmployeesCommand.ExecuteNonQuery();               

                Close();

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Ошибка!", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}
