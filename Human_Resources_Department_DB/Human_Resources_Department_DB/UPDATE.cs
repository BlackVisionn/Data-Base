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
    public partial class UPDATE : Form
    {        
        public static MySqlConnection connection = new MySqlConnection("server = 127.0.0.1; uid=root;pwd=1337;database=human_resources_department");

        private int id;

        public UPDATE(MySqlConnection update_connection, int id)
        {            
            InitializeComponent();

            connection = update_connection;

            this.id = id;
        }

        private void UPDATE_Load(object sender, EventArgs e)
        {            
            MySqlDataReader sqlReader = null;

            MySqlCommand getEmployeesInfoCommand = new MySqlCommand("SELECT full_name, gender, work_experience, home_address, phone_number, personnel_number FROM employees WHERE idemployees=@id;", connection);

            getEmployeesInfoCommand.Parameters.AddWithValue("id", id);            
            try
            {
                sqlReader = getEmployeesInfoCommand.ExecuteReader();

                while (sqlReader.Read())
                {
                    FIO_textBox.Text = Convert.ToString(sqlReader["full_name"]);
                    Gender_comboBox.Text = Convert.ToString(sqlReader["gender"]);
                    Experience_textBox.Text = Convert.ToString(sqlReader["work_experience"]);
                    Address_textBox.Text = Convert.ToString(sqlReader["home_address"]);
                    Phone_textBox.Text = Convert.ToString(sqlReader["phone_number"]);
                    Number_textBox.Text = Convert.ToString(sqlReader["personnel_number"]);                    
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
        private void update_btn_Click(object sender, EventArgs e)
        {           
            MySqlCommand updateEmployeesCommand = new MySqlCommand("UPDATE employees SET full_name=@full_name, gender=@gender, work_experience=@work_experience, home_address=@home_address, phone_number=@phone_number, personnel_number=@personnel_number WHERE idemployees=@id", connection);

            updateEmployeesCommand.Parameters.AddWithValue("id", id);
            updateEmployeesCommand.Parameters.AddWithValue("full_name", FIO_textBox.Text);
            updateEmployeesCommand.Parameters.AddWithValue("gender", Gender_comboBox.Text);
            updateEmployeesCommand.Parameters.AddWithValue("work_experience", Experience_textBox.Text);
            updateEmployeesCommand.Parameters.AddWithValue("home_address", Address_textBox.Text);
            updateEmployeesCommand.Parameters.AddWithValue("phone_number", Phone_textBox.Text);
            updateEmployeesCommand.Parameters.AddWithValue("personnel_number", Number_textBox.Text);

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

