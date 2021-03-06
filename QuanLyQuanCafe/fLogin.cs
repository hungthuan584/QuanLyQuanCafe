using QuanLyQuanCafe.DAO;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyQuanCafe
{
    public partial class fLogin : Form
    {
        public fLogin()
        {
            InitializeComponent();
        }

        bool Login(string userName, string passWord)
        {

            return AccountDAO.Instance.Login(userName,passWord);
        }

        private void btnLogin_Click(object sender, EventArgs e)
        {
            string userName = txbUsername.Text;
            string passWord = txbPassword.Text; 
            if (Login(userName, passWord))
            {
                fTableManager f = new fTableManager();
                this.Hide();
                f.ShowDialog();
                this.Show();
            }
            else
            {
                MessageBox.Show("Sai tên tài khoản hoặc mật khẩu!");
            }
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void fLogin_Load(object sender, EventArgs e)
        {

        }
    }
}
