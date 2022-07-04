using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Collateral
{
    public partial class under_ntc_add : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void subBtn_Click(object sender, EventArgs e)
        {
            string fullUsername = User.Identity.Name;
            int index_domain = fullUsername.IndexOf("AIB\\");
            string username = fullUsername.Substring(fullUsername.IndexOf("\\") + 1);
            if (Page.IsValid)
            {
                if (subBtn.Text == "ADD")
                {

                    string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                    using (SqlConnection sqlCon2 = new SqlConnection(connectionString))
                    {
                        sqlCon2.Open();
                        string query = "INSERT INTO [dbo].[UNR_Insert] " + // temp table for insertion
                        " (" +
                          "[Group Name]" +
                          ",[Respective Name]" +
                          ",[Approval Number]" +
                          ",[Facility Type]" +
                          ",[Facility Amount]" +
                          ",[Currency]" +
                          ",[Expire Date]" +
                          ",[Received]" +
                          ",[Status] " +
                          ",[Inserted By]" +
                        ")" +
                        " VALUES" +
                        "(" +
                          "@Gname," +
                          "@Rname," +
                          "@Appno," +
                          "@FacilityType," +
                          "@FacilityAmount," +
                          "@Ccy," +
                          "@Expdate," +
                          "@Received," +
                          "@Status," +
                          "@insby)";
                        string dValue = string.Format("{0:dd-MM-yyyy}", txtexpdate.Text);
                        SqlCommand sqlcmd = new SqlCommand(query, sqlCon2);
                        sqlcmd.Parameters.AddWithValue("@Gname", txtgroupname.SelectedValue);
                        sqlcmd.Parameters.AddWithValue("@Rname", txtrespct_name.Text);
                        sqlcmd.Parameters.AddWithValue("@Appno", txtapprno.Text);
                        sqlcmd.Parameters.AddWithValue("@FacilityType", txtFacilityType.Text);
                        sqlcmd.Parameters.AddWithValue("@FacilityAmount", txtfacilityamount.Text);
                        sqlcmd.Parameters.AddWithValue("@Ccy", txtcurrncy.SelectedValue);
                        sqlcmd.Parameters.AddWithValue("@Expdate", dValue);
                        sqlcmd.Parameters.AddWithValue("@Received", txtreceive.Text);
                        sqlcmd.Parameters.AddWithValue("@Status", txtstatus.SelectedValue);
                        sqlcmd.Parameters.AddWithValue("@insby", username);

                        sqlcmd.ExecuteNonQuery();
                        msg.Visible = true;
                        msg.Text = "Inserted to pending table!<br />It needs your admin approval!";
                        msg.ForeColor = System.Drawing.Color.Green;
                        Session.Remove("bid");
                        sqlCon2.Close();

                        //==========================================
                    }
                } // end of adding new WAK Record

            }

        }
    }
}