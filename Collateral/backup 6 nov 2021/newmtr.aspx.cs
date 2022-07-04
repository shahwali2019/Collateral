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
    public partial class newmtr : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            string fullUsername = User.Identity.Name;
            int index_domain = fullUsername.IndexOf("AIB\\");
            string username = fullUsername.Substring(fullUsername.IndexOf("\\") + 1);
            if (Page.IsValid)
            {
                if (SaveBtn.Text == "SAVE")
                {
                    string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                    using (SqlConnection sqlCon = new SqlConnection(connectionString))
                    {
                        sqlCon.Open();
                        string query = "INSERT INTO [dbo].[mtr_insert]" +
               "(" +
               "[Client Name]" +
               ",[Memo Ref]" +
               ",[Debit Account]" +
               ",[Credit Account]" +
               ",[Transaction Code]" +
               ",[Memo Submission]" +
               ",[Amount]" +
               ",[Currency]" +
               ",[Heading]" +
               ",[Transaction Detail]" +
               ",[Booding Date]" +
               ",[Value Date]" +
               ",[Status]" +
               ",[Remark]" +
               ",[InsertedBy]" +
               ")" +
                "VALUES" +
               "(" +
               "@val2," +
               "@val3," +
               "@val4," +
               "@val5," +
               "@val6," +
               "@val7," +
               "@val8," +
               "@val9," +
               "@val10," +
               "@val11," +
               "@val12," +
               "@val13," +
               "@val14," +
               "@val15," +
               "@val16" +
               ")";
                        SqlCommand sqlcmd = new SqlCommand(query, sqlCon);
                        // sqlcmd.Parameters.AddWithValue("@val1",txtClient.Text);
                        sqlcmd.Parameters.AddWithValue("@val2", txtclientn.Text);
                        sqlcmd.Parameters.AddWithValue("@val3", txtMemoR.Text);
                        sqlcmd.Parameters.AddWithValue("@val4", txtDAc.Text);
                        sqlcmd.Parameters.AddWithValue("@val5", txtCAcc.Text);
                        sqlcmd.Parameters.AddWithValue("@val6", txtTransactionC.Text);
                        sqlcmd.Parameters.AddWithValue("@val7", txtMemoS.Text);
                        sqlcmd.Parameters.AddWithValue("@val8", txtAmoun.Text);
                        sqlcmd.Parameters.AddWithValue("@val9", DropDownList1.SelectedValue);
                        sqlcmd.Parameters.AddWithValue("@val10", txtheadg.Text);
                        sqlcmd.Parameters.AddWithValue("@val11", txtTranDetails.Text);
                        sqlcmd.Parameters.AddWithValue("@val12", txtBookingDate.Text);
                        sqlcmd.Parameters.AddWithValue("@val13", txtValueDate.Text);
                        sqlcmd.Parameters.AddWithValue("@val14", statusList.SelectedValue);
                        sqlcmd.Parameters.AddWithValue("@val15", txtRemark.Text);
                        sqlcmd.Parameters.AddWithValue("@val16", username);
                        sqlcmd.ExecuteNonQuery();
                        //msg.Visible = true;
                        //msg.Text = "Inserted to inserted pending table!<br />It needs your admin approval!";
                        //msg.ForeColor = System.Drawing.Color.Green;
                        sqlCon.Close();
                    }
                }

            }

            //END OF ADD ACTION
            if (SaveBtn.Text == "Update")
            //else
            {
                string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                using (SqlConnection sqlCon = new SqlConnection(connectionString))
                {
                    sqlCon.Open();
                    string query = "INSERT INTO [dbo].[mtr_update]" +
           "(" +
               "id," +
               "[Client Name]" +
               ",[Memo Ref]" +
               ",[Debit Account]" +
               ",[Credit Account]" +
               ",[Transaction Code]" +
               ",[Memo Submission]" +
               ",[Amount]" +
               ",[Currency]" +
               ",[Heading]" +
               ",[Transaction Detail]" +
               ",[Booding Date]" +
               ",[Value Date]" +
               ",[Status]" +
               ",[Remark]" +
               ",[InsertedBy]" +
           ")" +
            "VALUES" +
           "(" +
           "@val1," +
           "@val2," +
           "@val3," +
           "@val4," +
           "@val5," +
           "@val6," +
           "@val7," +
           "@val8," +
           "@val9," +
           "@val10," +
           "@val11," +
           "@val12," +
           "@val13," +
           "@val14," +
           "@val15," +
           "@val16" +
           ")";
                    SqlCommand sqlcmd = new SqlCommand(query, sqlCon);
                    sqlcmd.Parameters.AddWithValue("@val1", Session["id"].ToString());
                    sqlcmd.Parameters.AddWithValue("@val2", txtclientn.Text);
                    sqlcmd.Parameters.AddWithValue("@val3", txtMemoR.Text);
                    sqlcmd.Parameters.AddWithValue("@val4", txtDAc.Text);
                    sqlcmd.Parameters.AddWithValue("@val5", txtCAcc.Text);
                    sqlcmd.Parameters.AddWithValue("@val6", txtTransactionC.Text);
                    sqlcmd.Parameters.AddWithValue("@val7", txtMemoS.Text);
                    sqlcmd.Parameters.AddWithValue("@val8", txtAmoun.Text);
                    sqlcmd.Parameters.AddWithValue("@val9", DropDownList1.SelectedValue);
                    sqlcmd.Parameters.AddWithValue("@val10", txtheadg.Text);
                    sqlcmd.Parameters.AddWithValue("@val11", txtTranDetails.Text);
                    sqlcmd.Parameters.AddWithValue("@val12", txtBookingDate.Text);
                    sqlcmd.Parameters.AddWithValue("@val13", txtValueDate.Text);
                    sqlcmd.Parameters.AddWithValue("@val14", statusList.SelectedValue);
                    sqlcmd.Parameters.AddWithValue("@val15", txtRemark.Text);
                    sqlcmd.Parameters.AddWithValue("@val16", username);
                    //sqlcmd.Parameters.AddWithValue("@val32", Session["IB"].ToString());
                    //sqlcmd.Parameters.AddWithValue("@val33", Session["Users"].ToString());
                    sqlcmd.ExecuteNonQuery();
                    //msg.Visible = true;
                    //msg.Text = "Inserted to update pending table!<br />It needs your admin approval!";
                    //msg.ForeColor = System.Drawing.Color.ForestGreen;
                    sqlCon.Close();
                }
            }

        } // end of page valid
    }
}