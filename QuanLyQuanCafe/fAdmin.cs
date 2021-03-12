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
    public partial class fAdmin : Form
    {
        public fAdmin()
        {
            InitializeComponent();
            loadAccountList();
            loadFoodList();
        }

        void loadAccountList()
        {
            string query = "SELECT * FROM Account";

            dtgvAccount.DataSource = DataProvider.Instance.ExecuteQuery(query,new object[] {"staff_1"});
        }

        void loadFoodList()
        {
            string query = "SELECT * FROM FOOD";

            dtgvFood.DataSource = DataProvider.Instance.ExecuteQuery(query);
        }

        private void dtpkToDay_ValueChanged(object sender, EventArgs e)
        {

        }

        private void btnAddFood_Click(object sender, EventArgs e)
        {

        }

        private void label5_Click(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void dtgvAccount_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
