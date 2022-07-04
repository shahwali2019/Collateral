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
    public partial class new_records_obsr_loan_docs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
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
                        string query = "INSERT INTO [dbo].[OLDs_insert] " + // temp table for insertion
                        " (" +
                        "[Document checking date]" + 
                        " ,[Borrower]" + 
                        " ,[Department]" +
                        " ,[Purpose of Application]" +
                        ",[Case Number]" +
                        ",[Facility type]" +
                        ",[Currency]" +
                        ",[Facility amount]" + 
                        " ,[Customers type]" + 
                        " ,[initial observations]" + 
                        " ,[Outstanding observations]" + 
                        " ,[Status of Observation]" +
                        " ,[Status of Facility]" + 
                        " ,[1st checker]" + 
                        " ,[Remarks]" +
                        ")" +
                        " VALUES" + 
                        "(" + 
                        "@dcd," + 
                        "@borr," +
                        "@dep," +
                        "@profapp," +
                        "@cno," +
                        "@fctp," + 
                        "@curr," +
                        "@fcamount," +
                        "@custp," +
                        "@initialobsr," +
                        "@outsobsr," +
                        "@statusobsr," +
                        "@StatusFc," + 
                        "@1stcheck," + 
                        "@remark)";

                        SqlCommand sqlcmd = new SqlCommand(query, sqlCon2);
                        sqlcmd.Parameters.AddWithValue("@dcd", txtdchkdate.Text);
                        sqlcmd.Parameters.AddWithValue("@borr", txtBorrower.Text);
                        sqlcmd.Parameters.AddWithValue("@dep", txtdeprt.SelectedValue);
                        sqlcmd.Parameters.AddWithValue("@profapp", txtprofapp.Text);
                        sqlcmd.Parameters.AddWithValue("@cno", txtCaseNumber.Text);
                        sqlcmd.Parameters.AddWithValue("@fctp", txtFacilityTypeList.Text);
                        sqlcmd.Parameters.AddWithValue("@curr", txtDropDownListCurrency.SelectedValue);
                        sqlcmd.Parameters.AddWithValue("@fcamount", txtfamount.Text);
                        sqlcmd.Parameters.AddWithValue("@custp", txtchecklistcusttype.SelectedValue);
                        sqlcmd.Parameters.AddWithValue("@initialobsr", txtiniobseerv.Text);
                        sqlcmd.Parameters.AddWithValue("@outsobsr", txtoutstnobr.Text);
                        sqlcmd.Parameters.AddWithValue("@statusobsr", txtstasobsr.SelectedValue);
                        sqlcmd.Parameters.AddWithValue("@StatusFc", txtchecklistsfacility.SelectedValue);
                        sqlcmd.Parameters.AddWithValue("@1stcheck", username);
                        sqlcmd.Parameters.AddWithValue("@remark", txtRemark.Text);

                        sqlcmd.ExecuteNonQuery();
                        msg.Visible = true;
                        msg.Text = "Inserted to pending table!<br />It needs your admin approval!";
                        msg.ForeColor = System.Drawing.Color.Green;
                        Session.Remove("bid");
                        sqlCon2.Close();
                        //-------------------------------------

                        //  txtClient.Text = facilityApptxt.Text = txtDrawer.Text = txtFolderNo.Text = txtExtention.Text = txtMod.Text = txtSafein.Text = txtSafeout.Text = txtRemark.Text = "";

                        //==========================================
                    }
                } // end of adding new WAK Record

            }
            txtdchkdate.Text = string.Empty;
            txtBorrower.Text = string.Empty;
            txtdeprt.SelectedValue = string.Empty;
            txtprofapp.Text = string.Empty;
            txtCaseNumber.Text = string.Empty;
            txtFacilityTypeList.Text = string.Empty;
            txtDropDownListCurrency.SelectedValue = string.Empty;
            txtfamount.Text = string.Empty;
            txtchecklistcusttype.SelectedValue = string.Empty;
            txtiniobseerv.Text = string.Empty;
            txtstasobsr.SelectedValue = string.Empty;
            txtoutstnobr.Text = string.Empty;
            txtchecklistsfacility.SelectedValue = string.Empty;
            txtRemark.Text = string.Empty;

        }

    }
}