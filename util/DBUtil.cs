using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Configuration;
using System.Data.SqlTypes;


namespace OrderManagementsystem.util
{
    public class DBUtil
    {
        public static SqlConnection GetDBConn()
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings.Get("DefaultConnection"));
            conn.Open();
            return conn;
        }
    }
}

