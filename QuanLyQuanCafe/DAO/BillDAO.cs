using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyQuanCafe.DAO
{
    public class BillDAO
    {
        private static BillDAO instance;

        public static BillDAO Instance
        {
            get
            {
                if (instance == null) instance = new BillDAO();
                return BillDAO.instance;
            }
        }

        private BillDAO() { }
        public int Get_idBillBy_idTable(int id)
        {
            return (int)DataProvider.Instance.ExecuteScalar("");
        }
    }
}
