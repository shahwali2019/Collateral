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
    public partial class Insert_LAR : System.Web.UI.Page
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
                        string query = "INSERT INTO [dbo].[LAR_Insert] " + // temp table for insertion
                        " (" +
                          "[Disbursementdate]" +
                          ",[Borrower]" +
                          ",[CaseNumber]" +
                          ",[FacilityType]" +
                          ",[facilityevent]" +
                          ",[Ccy]" +
                          ",[FacilityAmount]" +
                          ",[HOCCApprovalDate]" +
                          ",[CEO]" +
                          ",[CFO]" +
                          ",[BODRequirement]" +
                          ",[BoDApprovalDate]" +
                          ",[LutfullahRahmat]" +
                          ",[HamidullahMohib]" +
                          ",[HugoMinderhod]" +
                          ",[RS]" +
                          ",[SS]" +
                          ",[MT]" +
                          ",[AS]" +
                          ",[FacilityStatus]" +
                          ",[Remarks]" +
                          ",[Inserted By]" +
                        ")" +
                        " VALUES" +
                        "(" +
                          "@Disbursementdate," +
                          "@Borrower," +
                          "@CaseNumber," +
                          "@FacilityType," +
                          "@facilityevent," +
                          "@Ccy," +
                          "@FacilityAmount," +
                          "@HOCCApprovalDate," +
                          "@CEO," +
                          "@CFO," +
                          "@BODRequirement,"+
                          "@BoDApprovalDate," +
                          "@LutfullahRahmat," +
                          "@HamidullahMohib," +
                          "@HugoMinderhod," +
                          "@RS," +
                          "@SS," +
                          "@MT," +
                          "@AS," +
                          "@FacilityStatus,"+
                          "@Remarks," +
                          "@insby)";
                        string dValue = string.Format("{0:dd-MM-yyyy}", txtdate.Text);
                        SqlCommand sqlcmd = new SqlCommand(query, sqlCon2);
                        sqlcmd.Parameters.AddWithValue("@Disbursementdate", dValue);
                        sqlcmd.Parameters.AddWithValue("@Borrower", txtBorrower.Text);
                        sqlcmd.Parameters.AddWithValue("@CaseNumber", txtCaseNo.Text);
                        sqlcmd.Parameters.AddWithValue("@FacilityType", txtFacilityTypeList.Text);
                        sqlcmd.Parameters.AddWithValue("@facilityevent", txtfacilityevent.Text);
                        sqlcmd.Parameters.AddWithValue("@Ccy", txtDropDownListCurrency.SelectedValue);
                        sqlcmd.Parameters.AddWithValue("@FacilityAmount", txtfamount.Text);
                        sqlcmd.Parameters.AddWithValue("@HOCCApprovalDate", txtHOCCApprovalDate.Text);
                        sqlcmd.Parameters.AddWithValue("@CEO", txtceo.SelectedValue);
                        sqlcmd.Parameters.AddWithValue("@CFO", txtcfo.SelectedValue);
                        sqlcmd.Parameters.AddWithValue("@BODRequirement", txtBODRequirement.SelectedValue);
                        sqlcmd.Parameters.AddWithValue("@BoDApprovalDate", txtBoDApprovalDate.Text);
                        sqlcmd.Parameters.AddWithValue("@LutfullahRahmat", txtbodcharman.Text);
                        sqlcmd.Parameters.AddWithValue("@HamidullahMohib", txtbod1.Text);
                        sqlcmd.Parameters.AddWithValue("@HugoMinderhod", txtbod2.Text);
                        sqlcmd.Parameters.AddWithValue("@RS", txtbod3.Text);
                        sqlcmd.Parameters.AddWithValue("@SS", txtbod4.Text);
                        sqlcmd.Parameters.AddWithValue("@MT", txtbod5.Text);
                        sqlcmd.Parameters.AddWithValue("@AS", txtbod6.Text);
                        sqlcmd.Parameters.AddWithValue("@FacilityStatus", txtFacilityStatus.SelectedValue);
                        sqlcmd.Parameters.AddWithValue("@Remarks", txtRemarks.Text);
                        sqlcmd.Parameters.AddWithValue("@insby", username);

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
            //txtdchkdate.Text = string.Empty;
            //txtBorrower.Text = string.Empty;
            //txtdeprt.SelectedValue = string.Empty;
            //txtCaseNumber.Text = string.Empty;
            //txtFacilityTypeList.Text = string.Empty;
            //txtDropDownListCurrency.SelectedValue = string.Empty;
            //txtfamount.Text = string.Empty;
            //txtchecklistcusttype.SelectedValue = string.Empty;
            //txtiniobseerv.Text = string.Empty;
            //txtstasobsr.SelectedValue = string.Empty;
            //txtoutstnobr.Text = string.Empty;
            //txtchecklistsfacility.SelectedValue = string.Empty;
            //txtRemark.Text = string.Empty;

        }

        protected void txtBODRequirement_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (txtBODRequirement.SelectedItem.Value == "YES")
            {
                bodc.Visible = true;
                bod1.Visible = true;
                bod2.Visible = true;
                bod3.Visible = true;
            }
            else
            {
                bodc.Visible = false;
                bod1.Visible = false;
                bod2.Visible = false;
                bod3.Visible = false;
            }

        }
    }
}