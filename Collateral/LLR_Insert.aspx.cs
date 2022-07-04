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
    public partial class LLR_Insert : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void subBtn_Click(object sender, EventArgs e)
        {


            int c1 = Convert.ToInt32(txtchrg_off_amt_orginal_curr.Text);
            int c2 = Convert.ToInt32(txtchrg_off_amt_convert_usd.Text);

             var c = (double)c1 / c2;
            txtchrg_off_amt_convert_usd.Text = c.ToString();


            //---------------------------------------------------

            string loan_disbrs_date = string.Format("{0:dd-MM-yyyy}", txtloan_dis_date.Text);
            string d1 = string.Format("{0:dd-MM-yyyy}", txtdbfl_date.Text);
            string d2 = string.Format("{0:dd-MM-yyyy}", txtchrg_off_date.Text);


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
                        string query = "INSERT INTO [dbo].[LoanDetail_Insert] " + // temp table for insertion
                        " (" +
                          " [BorrowerName]" +
                          ",[AccountNumber]" +
                          ",[Currency]" +
                          ",[Loan Number]" +
                          ",[Facility Type]" +
                          ",[Loan Disbursement Date]" +
                          ",[Disbursed Amount]" +
                          ",[Interest Stoped On]" +
                          ",[Doubtful Date]" +
                          ",[Charge off Date]" +
                          ",[Charge off Amount Original Currency]" +
                          ",[Charge off Amount Converted to USD]" +
                          ",[Inserted By]" +
                        ")" +
                        " VALUES" +
                        "(" +
                          "@1," +
                          "@2," +
                          "@3," +
                          "@4," +
                          "@5," +
                          "@6," +
                          "@7," +
                          "@8," +
                          "@9," +
                          "@10," +
                          "@11," +
                          "@12," +
                          "@insby)";

                        SqlCommand sqlcmd = new SqlCommand(query, sqlCon2);
                        sqlcmd.Parameters.AddWithValue("@1", txtborrname.Text);
                        sqlcmd.Parameters.AddWithValue("@2", txtacc_no.Text);
                        sqlcmd.Parameters.AddWithValue("@3", txtcurr.SelectedValue);
                        sqlcmd.Parameters.AddWithValue("@4", txtloan_no.Text);
                        sqlcmd.Parameters.AddWithValue("@5", txtFacilityTypeList.Text);
                        sqlcmd.Parameters.AddWithValue("@6", loan_disbrs_date);
                        sqlcmd.Parameters.AddWithValue("@7", txtdisbs_amount.Text);
                        sqlcmd.Parameters.AddWithValue("@8", txtintsrt_stpon.Text);
                        sqlcmd.Parameters.AddWithValue("@9", d1);
                        sqlcmd.Parameters.AddWithValue("@10", d2);
                        sqlcmd.Parameters.AddWithValue("@11", c1);
                        sqlcmd.Parameters.AddWithValue("@12", c);
                        sqlcmd.Parameters.AddWithValue("@insby", username);

                        sqlcmd.ExecuteNonQuery();
                        msg.Visible = true;
                        msg.Text = "Inserted to pending table!<br />It needs your admin approval!";
                        msg.ForeColor = System.Drawing.Color.Green;
                        Session.Remove("bid");
                        sqlCon2.Close();
                        //-------------------------------------
                    }
                } // end of adding new WAK Record

            }


        }
    }
}