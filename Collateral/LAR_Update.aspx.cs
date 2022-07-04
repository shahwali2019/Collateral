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
    public partial class LAR_Update : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string fullUsername = User.Identity.Name;
                int index_domain = fullUsername.IndexOf("AIB\\");
                string username = fullUsername.Substring(fullUsername.IndexOf("\\") + 1);
                string qry = string.Empty;
                qry = "select Access_role from [userMng] where username='" + username + "'";
                string strConnString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;

                SqlConnection con = new SqlConnection(strConnString);
                con.Open();
                SqlCommand cd = new SqlCommand(qry, con);

                string Access_role = Convert.ToString(cd.ExecuteScalar());

                if (string.IsNullOrEmpty(Access_role))
                {
                    Response.Redirect("NotAuthorize.aspx?ReturnPath=" + Server.UrlEncode(Request.Url.AbsoluteUri));
                }
                //----------------------------------------------
                if (Session["olds_id"] != null)
                {

                    updBtn.Text = "update";
                    addLbl.Text = "UPDATE LAR RECORD";

                    //--------------------------------------------------------------   note should add from database           
                    Session["Id"].ToString();
                    txtdate.Text = Session["txtdate"].ToString();
                    txtBorrower.Text = Session["txtBorrower"].ToString();
                    txtCaseNo.Text = Session["txtCaseNo"].ToString();
                    txtFacilityTypeList.Text = Session["txtFacilityTypeList"].ToString();
                    txtfacilityevent.Text = Session["txtfacilityevent"].ToString();
                    txtDropDownListCurrency.SelectedValue = Session["txtDropDownListCurrency"].ToString();
                    txtfamount.Text = Session["txtfamount"].ToString();
                    txtHOCCApprovalDate.Text = Session["txtHOCCApprovalDate"].ToString();
                    txtceo.SelectedValue = Session["txtceo"].ToString();
                    txtcfo.SelectedValue = Session["txtcfo"].ToString();
                    txtBODRequirement.SelectedValue = Session["txtBODRequirement"].ToString();
                    txtBoDApprovalDate.Text = Session["txtBoDApprovalDate"].ToString();
                    txtbodcharman.Text = Session["txtLutfullahRahmat"].ToString();
                    txtbod1.Text = Session["txtHamidullahMohib"].ToString();
                    txtbod2.Text = Session["txtHugoMinderhod"].ToString();
                    txtbod3.Text = Session["txtRS"].ToString();
                    txtbod4.Text = Session["txtSS"].ToString();
                    txtbod5.Text = Session["txtMT"].ToString();
                    txtbod6.Text = Session["txtAS"].ToString();
                    txtFacilityStatus.SelectedValue = Session["txtFacilityStatus"].ToString();
                    txtRemarks.Text = Session["txtRemarks"].ToString();

                }

            }
        }

        protected void updBtn_Click(object sender, EventArgs e)
        {
            string fullUsername = User.Identity.Name;
            int index_domain = fullUsername.IndexOf("AIB\\");
            string username = fullUsername.Substring(fullUsername.IndexOf("\\") + 1);
            if (Page.IsValid)
            {

                string connectionStringg = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                using (SqlConnection sqlConn = new SqlConnection(connectionStringg))
                using (SqlConnection sqlConn1 = new SqlConnection(connectionStringg))
                {
                    sqlConn.Open();
                    string query = "INSERT INTO [dbo].[LAR_update]" +
                        "(" +
                        "Id," +
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
                          ",[Updated By]" +
                        ")" +
                        " VALUES" +
                        "(" +
                        "@id," +
                          "@txtdate," +
                          "@txtBorrower," +
                          "@txtCaseNo," +
                          "@txtFacilityTypeList," +
                          "@txtfacilityevent," +
                          "@txtDropDownListCurrency," +
                          "@txtfamount," +
                          "@txtHOCCApprovalDate," +
                          "@txtceo," +
                          "@txtcfo," +
                          "@txtBODRequirement," +
                          "@txtBoDApprovalDate," +
                          "@txtLutfullahRahmat," +
                          "@txtHamidullahMohib," +
                          "@txtHugoMinderhod," +
                          "@txtRS," +
                          "@txtSS," +
                          "@txtMT," +
                          "@txtAS," +
                          "@txtFacilityStatus," +
                          "@txtRemarks," +
                        "@up_by); " +
                        "INSERT INTO [dbo].[LAR_update1]" +
                        "(" +
                        "Id," +
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
                          ",[Updated By]" +
                        ")" +
                        " VALUES" +
                        "(" +
                        "@id," +
                          "@txtdate," +
                          "@txtBorrower," +
                          "@txtCaseNo," +
                          "@txtFacilityTypeList," +
                          "@txtfacilityevent," +
                          "@txtDropDownListCurrency," +
                          "@txtfamount," +
                          "@txtHOCCApprovalDate," +
                          "@txtceo," +
                          "@txtcfo," +
                          "@txtBODRequirement," +
                          "@txtBoDApprovalDate," +
                          "@txtLutfullahRahmat," +
                          "@txtHamidullahMohib," +
                          "@txtHugoMinderhod," +
                          "@txtRS," +
                          "@txtSS," +
                          "@txtMT," +
                          "@txtAS," +
                          "@txtFacilityStatus," +
                          "@txtRemarks," +
                        "@up_by)";
                    SqlCommand sqlcmd = new SqlCommand(query, sqlConn);
                    sqlcmd.Parameters.AddWithValue("@id", Session["Id"].ToString());
                    sqlcmd.Parameters.AddWithValue("@txtdate", txtdate.Text);
                    sqlcmd.Parameters.AddWithValue("@txtBorrower", txtBorrower.Text);
                    sqlcmd.Parameters.AddWithValue("@txtCaseNo", txtCaseNo.Text);
                    sqlcmd.Parameters.AddWithValue("@txtFacilityTypeList", txtFacilityTypeList.Text);
                    sqlcmd.Parameters.AddWithValue("@txtfacilityevent", txtfacilityevent.Text);
                    sqlcmd.Parameters.AddWithValue("@txtDropDownListCurrency", txtDropDownListCurrency.SelectedValue);
                    sqlcmd.Parameters.AddWithValue("@txtfamount", txtfamount.Text);
                    sqlcmd.Parameters.AddWithValue("@txtHOCCApprovalDate", txtHOCCApprovalDate.Text);
                    sqlcmd.Parameters.AddWithValue("@txtceo", txtceo.SelectedValue);
                    sqlcmd.Parameters.AddWithValue("@txtcfo", txtcfo.SelectedValue);
                    sqlcmd.Parameters.AddWithValue("@txtBODRequirement", txtBODRequirement.SelectedValue);
                    sqlcmd.Parameters.AddWithValue("@txtBoDApprovalDate", txtBoDApprovalDate.Text);
                    sqlcmd.Parameters.AddWithValue("@txtLutfullahRahmat", txtbodcharman.Text);
                    sqlcmd.Parameters.AddWithValue("@txtHamidullahMohib", txtbod1.Text);
                    sqlcmd.Parameters.AddWithValue("@txtHugoMinderhod", txtbod2.Text);
                    sqlcmd.Parameters.AddWithValue("@txtRS", txtbod3.Text);
                    sqlcmd.Parameters.AddWithValue("@txtSS", txtbod4.Text);
                    sqlcmd.Parameters.AddWithValue("@txtMT", txtbod5.Text);
                    sqlcmd.Parameters.AddWithValue("@txtAS", txtbod6.Text);
                    sqlcmd.Parameters.AddWithValue("@txtFacilityStatus", txtFacilityStatus.SelectedValue);
                    sqlcmd.Parameters.AddWithValue("@txtRemarks", txtRemarks.Text);
                    sqlcmd.Parameters.AddWithValue("@up_by", username);
                    //sqlCmd.ExecuteNonQuery();
                    sqlcmd.ExecuteNonQuery();
                    sqlConn.Close();
                    sqlConn.Dispose();

                }
                msg.Visible = true;
                msg.Text = "The record updated. <br/> It needs your admin approval.";
                msg.ForeColor = System.Drawing.Color.Green;

            } 
            
            //END OF ELSE
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