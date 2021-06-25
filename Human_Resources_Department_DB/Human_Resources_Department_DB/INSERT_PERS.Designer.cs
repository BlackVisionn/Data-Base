
namespace Human_Resources_Department_DB
{
    partial class INSERT_PERS
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.VacationType_textBox = new System.Windows.Forms.TextBox();
            this.StartDate = new System.Windows.Forms.DateTimePicker();
            this.Basis_textBox = new System.Windows.Forms.TextBox();
            this.NumberDays_textBox = new System.Windows.Forms.TextBox();
            this.Basis_label = new System.Windows.Forms.Label();
            this.NumberDays_label = new System.Windows.Forms.Label();
            this.StartDate_label = new System.Windows.Forms.Label();
            this.VacationType_label = new System.Windows.Forms.Label();
            this.save_btn = new System.Windows.Forms.Button();
            this.cancel_bth = new System.Windows.Forms.Button();
            this.FIO_employee_textBox = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // VacationType_textBox
            // 
            this.VacationType_textBox.Location = new System.Drawing.Point(100, 57);
            this.VacationType_textBox.Name = "VacationType_textBox";
            this.VacationType_textBox.Size = new System.Drawing.Size(265, 20);
            this.VacationType_textBox.TabIndex = 86;
            // 
            // StartDate
            // 
            this.StartDate.CustomFormat = "yyyy/mm/dd";
            this.StartDate.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.StartDate.Location = new System.Drawing.Point(152, 95);
            this.StartDate.Name = "StartDate";
            this.StartDate.Size = new System.Drawing.Size(200, 20);
            this.StartDate.TabIndex = 85;
            // 
            // Basis_textBox
            // 
            this.Basis_textBox.Location = new System.Drawing.Point(135, 163);
            this.Basis_textBox.Name = "Basis_textBox";
            this.Basis_textBox.Size = new System.Drawing.Size(265, 20);
            this.Basis_textBox.TabIndex = 83;
            // 
            // NumberDays_textBox
            // 
            this.NumberDays_textBox.Location = new System.Drawing.Point(165, 128);
            this.NumberDays_textBox.Name = "NumberDays_textBox";
            this.NumberDays_textBox.Size = new System.Drawing.Size(265, 20);
            this.NumberDays_textBox.TabIndex = 82;
            // 
            // Basis_label
            // 
            this.Basis_label.AutoSize = true;
            this.Basis_label.Location = new System.Drawing.Point(23, 170);
            this.Basis_label.Name = "Basis_label";
            this.Basis_label.Size = new System.Drawing.Size(106, 13);
            this.Basis_label.TabIndex = 81;
            this.Basis_label.Text = "Основания отпуска";
            // 
            // NumberDays_label
            // 
            this.NumberDays_label.AutoSize = true;
            this.NumberDays_label.Location = new System.Drawing.Point(23, 135);
            this.NumberDays_label.Name = "NumberDays_label";
            this.NumberDays_label.Size = new System.Drawing.Size(136, 13);
            this.NumberDays_label.TabIndex = 80;
            this.NumberDays_label.Text = "Количество дней отпуска";
            // 
            // StartDate_label
            // 
            this.StartDate_label.AutoSize = true;
            this.StartDate_label.Location = new System.Drawing.Point(23, 102);
            this.StartDate_label.Name = "StartDate_label";
            this.StartDate_label.Size = new System.Drawing.Size(114, 13);
            this.StartDate_label.TabIndex = 79;
            this.StartDate_label.Text = "Дата начала отпуска";
            // 
            // VacationType_label
            // 
            this.VacationType_label.Location = new System.Drawing.Point(23, 60);
            this.VacationType_label.Name = "VacationType_label";
            this.VacationType_label.Size = new System.Drawing.Size(100, 23);
            this.VacationType_label.TabIndex = 84;
            this.VacationType_label.Text = "Тип отпуска";
            // 
            // save_btn
            // 
            this.save_btn.Location = new System.Drawing.Point(128, 237);
            this.save_btn.Name = "save_btn";
            this.save_btn.Size = new System.Drawing.Size(84, 33);
            this.save_btn.TabIndex = 78;
            this.save_btn.Text = "Добавить";
            this.save_btn.UseVisualStyleBackColor = true;
            this.save_btn.Click += new System.EventHandler(this.save_btn_Click);
            // 
            // cancel_bth
            // 
            this.cancel_bth.Location = new System.Drawing.Point(218, 237);
            this.cancel_bth.Name = "cancel_bth";
            this.cancel_bth.Size = new System.Drawing.Size(87, 33);
            this.cancel_bth.TabIndex = 77;
            this.cancel_bth.Text = "Отмена";
            this.cancel_bth.UseVisualStyleBackColor = true;
            this.cancel_bth.Click += new System.EventHandler(this.cancel_bth_Click);
            // 
            // FIO_employee_textBox
            // 
            this.FIO_employee_textBox.Location = new System.Drawing.Point(123, 27);
            this.FIO_employee_textBox.Name = "FIO_employee_textBox";
            this.FIO_employee_textBox.Size = new System.Drawing.Size(265, 20);
            this.FIO_employee_textBox.TabIndex = 76;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(23, 30);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(96, 13);
            this.label1.TabIndex = 75;
            this.label1.Text = "ФИО Сотрудника";
            // 
            // INSERT_PERS
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(480, 346);
            this.Controls.Add(this.VacationType_textBox);
            this.Controls.Add(this.StartDate);
            this.Controls.Add(this.Basis_textBox);
            this.Controls.Add(this.NumberDays_textBox);
            this.Controls.Add(this.Basis_label);
            this.Controls.Add(this.NumberDays_label);
            this.Controls.Add(this.StartDate_label);
            this.Controls.Add(this.VacationType_label);
            this.Controls.Add(this.save_btn);
            this.Controls.Add(this.cancel_bth);
            this.Controls.Add(this.FIO_employee_textBox);
            this.Controls.Add(this.label1);
            this.Name = "INSERT_PERS";
            this.Text = "Добавить отпуск сотруднику";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox VacationType_textBox;
        private System.Windows.Forms.DateTimePicker StartDate;
        private System.Windows.Forms.TextBox Basis_textBox;
        private System.Windows.Forms.TextBox NumberDays_textBox;
        private System.Windows.Forms.Label Basis_label;
        private System.Windows.Forms.Label NumberDays_label;
        private System.Windows.Forms.Label StartDate_label;
        private System.Windows.Forms.Label VacationType_label;
        private System.Windows.Forms.Button save_btn;
        private System.Windows.Forms.Button cancel_bth;
        private System.Windows.Forms.TextBox FIO_employee_textBox;
        private System.Windows.Forms.Label label1;
    }
}