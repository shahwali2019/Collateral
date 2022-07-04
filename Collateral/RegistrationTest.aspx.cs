using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Collateral
{
    public partial class RegistrationTest : System.Web.UI.Page
    {
        static string StrCon = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            //string str = "server=Your Server Name; Initial Catalog=Your Database Name; User ID=User Id; Password=Your Password";
            SqlConnection cn = new SqlConnection(StrCon);
            SqlCommand cmd = new SqlCommand("SpMyProcedure", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", "Insert");
            cmd.Parameters.AddWithValue("@Name", txtName.Text);
            cmd.Parameters.AddWithValue("@Age", txtAge.Text);
            cmd.Parameters.AddWithValue("@Country", txtCountry.Text);
            cn.Open();
            cmd.ExecuteNonQuery();
            cn.Close();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            SqlConnection cn = new SqlConnection(StrCon);
            SqlCommand cmd = new SqlCommand("SpMyProcedure", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Action", "Update");
            cmd.Parameters.AddWithValue("@Name", txtName.Text);
            cmd.Parameters.AddWithValue("@Age", txtAge.Text);
            cmd.Parameters.AddWithValue("@Country", txtCountry.Text);
            cmd.Parameters.AddWithValue("@Id", txtId.Text);
            cn.Open();
            cmd.ExecuteNonQuery();
            cn.Close();
        }
    }
}