using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyQuanCafe.DTO
{
    public class Table
    {
        public Table(int id, string name, string stt)
        {
            this.IDTable = id;
            this.NameTable = name;
            this.StatusTable = stt;
        }

        public Table(DataRow row)
        {
            string a = "Trống", b = "Có người";
            this.IDTable = (int)row["idTable"];
            this.NameTable = row["nameTable"].ToString();
            int status = (int)row["statusTable"];
            if (status == 0)
            {
                this.StatusTable = a;
            }
            else this.StatusTable = b;

        }
        
        private int iDTable;
        public int IDTable
        {
            get { return iDTable; }
            set { iDTable = value; }
        }

        private string nameTable;
        public string NameTable
        {
            get { return nameTable; }
            set { nameTable = value; }
        }

        private string statusTable;
        public string StatusTable
        {
            get { return statusTable; }
            set { statusTable = value; }
        }
        
            
    }
}
