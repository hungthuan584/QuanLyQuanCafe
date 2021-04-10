using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyQuanCafe.DAO
{
    public class DataProvider
    {
        private static DataProvider instance;
        
        public static DataProvider Instance
        {
            get
            {
                if (instance == null) instance = new DataProvider();
                return instance;
            }

            set
            {
                instance = value;
            }
        }

        private DataProvider() {}

        private string connectionStr = "Data Source=.\\sqlexpress;Initial Catalog=QuanLyQuanCafe;Integrated Security=True";
        public DataTable ExecuteQuery(string query,object[] parameter = null)
        {
            DataTable data = new DataTable();
     
            /* 1. Tạo kết nối */
            using (SqlConnection connection = new SqlConnection(connectionStr))
            { 
                connection.Open();
                /* 2. Thực thi câu lệnh */
                SqlCommand command = new SqlCommand(query, connection);
                /* 3. Phân rã dữ liệu */
                
                if(parameter != null)
                {
                    string[] listPara = query.Split(' ');
                    int i = 0;

                    foreach (string item in listPara)
                    {
                        if (item.Contains('@'))
                        {
                            command.Parameters.AddWithValue(item, parameter[i]);
                            i++;
                        }
                    }
                }

                SqlDataAdapter adapter = new SqlDataAdapter(command);

                adapter.Fill(data);

                connection.Close();
            }
            return data;
        }


        public int ExecuteNonQuery(string query, object[] parameter = null)
        {
            int data = 0;

            /* 1. Tạo kết nối */
            using (SqlConnection connection = new SqlConnection(connectionStr))
            {
                connection.Open();
                /* 2. Thực thi câu lệnh */
                SqlCommand command = new SqlCommand(query, connection);
                /* 3. Phân rã dữ liệu */

                if (parameter != null)
                {
                    string[] listPara = query.Split(' ');
                    int i = 0;

                    foreach (string item in listPara)
                    {
                        if (item.Contains('@'))
                        {
                            command.Parameters.AddWithValue(item, parameter[i]);
                            i++;
                        }
                    }
                }

                data = command.ExecuteNonQuery();

                connection.Close();
            }
            return data;
        }


        public object ExecuteScalar(string query, object[] parameter = null)
        {
            object data = 0;

            /* 1. Tạo kết nối */
            using (SqlConnection connection = new SqlConnection(connectionStr))
            {
                connection.Open();
                /* 2. Thực thi câu lệnh */
                SqlCommand command = new SqlCommand(query, connection);
                /* 3. Phân rã dữ liệu */

                if (parameter != null)
                {
                    string[] listPara = query.Split(' ');
                    int i = 0;

                    foreach (string item in listPara)
                    {
                        if (item.Contains('@'))
                        {
                            command.Parameters.AddWithValue(item, parameter[i]);
                            i++;
                        }
                    }
                }

                data = command.ExecuteScalar();

                connection.Close();
            }
            return data;
        }

        
    }
}
