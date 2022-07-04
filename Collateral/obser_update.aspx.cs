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
    public partial class obser_update : System.Web.UI.Page
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

                    updBtn.Text = " Update ";
                    addLbl.Text = "UPDATE OLDs RECORD";

                    //--------------------------------------------------------------   note should add from database           
                    //Session["id"].ToString();
                    txtdchkdate.Text = Session["dcd"].ToString();
                    txtBorrower.Text = Session["borr"].ToString();
                    txtdeprt.SelectedValue = Session["deprt"].ToString();
                    txtprofapp.Text = Session["profapp"].ToString();
                    txtCaseNumber.Text = Session["cno"].ToString();
                    txtFacilityTypeList.Text = Session["fctp"].ToString();
                    txtDropDownListCurrency.SelectedValue = Session["curr"].ToString();
                    txtfamount.Text = Session["fcamount"].ToString();
                    txtchecklistcusttype.SelectedValue = Session["custp"].ToString();
                    txtiniobseerv.Text = Session["initialobsr"].ToString();
                    txtoutstnobr.Text = Session["outsobsr"].ToString();
                    txtstasobsr.SelectedValue = Session["statusobsr"].ToString();
                    txtchecklistsfacility.SelectedValue = Session["StatusFc"].ToString();
                    txtRemark.Text = Session["remark"].ToString();

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
                {
                    sqlConn.Open();
                    string query = "INSERT INTO [dbo].[OLDs_Update]" + 
                        "(" + 
                        "id," + 
                        "[Document checking date]" +
                        ",[Borrower]" + 
                        ",[Department]" +
                        ",[Purpose of Application]" +
                        ",[Case Number]" + 
                        ",[Facility type]" + 
                        ",[Currency]" +
                        ",[Facility amount]" +
                        ",[Customers type]" +
                        ",[initial observations]" +
                        ",[Status of Observation]" + 
                        ",[Outstanding observations]" +
                        ",[Status of Facility]" + 
                        ",[Remarks]" +
                        ",[Updated By]" +
                        ")" +
                        " VALUES" + 
                        "(" + 
                        "@id," + 
                        "@dcd," +
                        "@borr," +
                        "@deprt," +
                        "@profapp," +
                        "@cno," + 
                        "@ftype," + 
                        "@curr," + 
                        "@famount," + 
                        "@cust_type," + 
                        "@ini_observ," + 
                        "@stat_obsrv," + 
                        "@outs_observ," + 
                        "@stat_faci," + 
                        "@remarks," + 
                        "@up_by)";

                    SqlCommand sqlcmd = new SqlCommand(query, sqlConn);
                    sqlcmd.Parameters.AddWithValue("@id", Session["id"].ToString());
                    sqlcmd.Parameters.AddWithValue("@dcd", txtdchkdate.Text);
                    sqlcmd.Parameters.AddWithValue("@borr", txtBorrower.Text);
                    sqlcmd.Parameters.AddWithValue("@deprt", txtdeprt.SelectedValue);
                    sqlcmd.Parameters.AddWithValue("@profapp", txtprofapp.Text);
                    sqlcmd.Parameters.AddWithValue("@cno", txtCaseNumber.Text);
                    sqlcmd.Parameters.AddWithValue("@ftype", txtFacilityTypeList.Text);
                    sqlcmd.Parameters.AddWithValue("@curr", txtDropDownListCurrency.SelectedValue);
                    sqlcmd.Parameters.AddWithValue("@famount", txtfamount.Text);
                    sqlcmd.Parameters.AddWithValue("@cust_type", txtchecklistcusttype.SelectedValue);
                    sqlcmd.Parameters.AddWithValue("@ini_observ", txtiniobseerv.Text);
                    sqlcmd.Parameters.AddWithValue("@stat_obsrv", txtstasobsr.SelectedValue);
                    sqlcmd.Parameters.AddWithValue("@outs_observ", txtoutstnobr.Text);
                    sqlcmd.Parameters.AddWithValue("@stat_faci", txtchecklistsfacility.SelectedValue);
                    sqlcmd.Parameters.AddWithValue("@remarks", txtRemark.Text);
                    sqlcmd.Parameters.AddWithValue("@up_by", username);
                    sqlcmd.ExecuteNonQuery();
                    sqlConn.Close();
                    sqlConn.Dispose();

                }
                msg.Visible = true;
                msg.Text = "The record updated. <br/> It needs your admin approval.";
                msg.ForeColor = System.Drawing.Color.Green;

            } //END OF ELSE
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