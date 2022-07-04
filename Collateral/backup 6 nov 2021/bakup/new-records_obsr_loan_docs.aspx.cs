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

                if (Access_role == null)
                {
                    Response.Redirect("Loging.aspx");
                    Session.Remove("loading");
                }


                //----------------------------------------------
                if (Session["olds_id"] != null)
                {

                    //string LoanStatus;

                    subBtn.Text = " Update ";                                                     
                    addLbl.Text = "UPDATE OLDs RECORD";

                    //--------------------------------------------------------------   note should add from database           
                    //Session["id"].ToString();
                    txtdchkdate.Text = Session["dcd"].ToString();
                    txtBorrower.Text = Session["borr"].ToString();
                    txtCaseNumber.Text = Session["cno"].ToString();
                    txtFacilityTypeList.SelectedValue = Session["ftype"].ToString();
                    txtDropDownListCurrency.SelectedValue = Session["curr"].ToString();
                    txtfamount.Text = Session["famount"].ToString();
                    txtchecklistcusttype.SelectedValue = Session["cust_type"].ToString();

                    txtiniobseerv.Text = Session["ini_observ"].ToString();
                    txtstasobsr.SelectedValue = Session["outs_observ"].ToString();
                    txtoutstnobr.Text = Session["stat_obsrv"].ToString();
                    txtchecklistsfacility.SelectedValue = Session["stat_faci"].ToString();
                    txtRemark.Text = Session["remarks"].ToString();





                    //LoanStatus = Session["LS"].ToString();                                      

                    //DropDownList1.SelectedValue = LoanStatus;                                   
                    //listCurrency.SelectedValue = currency;                                      



                    //txtRemark.Text = Session["Remark"].ToString();                              

                    //Session["InsertedBy"].ToString();                                           


                }
            }
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
                        "@cno," +
                        "@fctp," +
                        "@curr," +
                        "@fcamount," +
                        "@custp," +
                        "@initialobsr," +
                        "@outsobsr,"  +
                        "@statusobsr," +
                        "@StatusFc,"   +
                        "@1stcheck,"  +
                        "@remark)";


                        SqlCommand sqlcmd = new SqlCommand(query, sqlCon2);
                        sqlcmd.Parameters.AddWithValue("@dcd", txtdchkdate.Text);
                        sqlcmd.Parameters.AddWithValue("@borr", txtBorrower.Text);
                        sqlcmd.Parameters.AddWithValue("@cno", txtCaseNumber.Text);
                        sqlcmd.Parameters.AddWithValue("@fctp", txtFacilityTypeList.SelectedValue);
                        sqlcmd.Parameters.AddWithValue("@curr", txtDropDownListCurrency.SelectedValue);
                        sqlcmd.Parameters.AddWithValue("@fcamount", txtfamount.Text);
                        sqlcmd.Parameters.AddWithValue("@custp", txtchecklistcusttype.SelectedValue);
                        sqlcmd.Parameters.AddWithValue("@initialobsr", txtiniobseerv.Text);
                        sqlcmd.Parameters.AddWithValue("@outsobsr", txtstasobsr.SelectedValue);
                        sqlcmd.Parameters.AddWithValue("@statusobsr", txtoutstnobr.Text);
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
                }// end of adding new WAK Record

                else
                {


                    string connectionStringg = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                    using (SqlConnection sqlConn = new SqlConnection(connectionStringg))
                    {
                        sqlConn.Open();
                        string query = "INSERT INTO [dbo].[OLDs_Update]" +
                      "([Document checking date]" +
                     ",[Borrower]" +
                     ",[Case Number]" +
                     ",[Facility type]" +
                     ",[Currency]" +
                     ",[Facility amount]" +
                     ",[Customers type]" +
                     ",[initial observations]" +
                     ",[Outstanding observations]" +
                     ",[Status of Observation]" +
                     ",[Status of Facility]" +
                     ",[Remarks]" +
                     ",[Updated By]" +
                        ")" +
                        " VALUES" +
                        "(" +
                        //"@id," +
                        "@dcd," +
                        "@borr," +
                        "@cno," +
                        "@ftype," +
                        "@curr," +
                        "@famount," +
                        "@cust_type," +
                        "@ini_observ," +
                        "@outs_observ," +
                        "@stat_obsrv," +
                        "@stat_faci," +
                        "@remarks," +
                        "@up_by)";

                        SqlCommand sqlcmd = new SqlCommand(query, sqlConn);
                        //sqlcmd.Parameters.AddWithValue("@id", Session["id"].ToString());
                        sqlcmd.Parameters.AddWithValue("@dcd", txtdchkdate.Text);
                        sqlcmd.Parameters.AddWithValue("@borr", txtBorrower.Text);
                        sqlcmd.Parameters.AddWithValue("@cno", txtCaseNumber.Text);
                        sqlcmd.Parameters.AddWithValue("@ftype", txtFacilityTypeList.SelectedValue);
                        sqlcmd.Parameters.AddWithValue("@curr", txtDropDownListCurrency.SelectedValue);
                        sqlcmd.Parameters.AddWithValue("@famount", txtfamount.Text);

                        sqlcmd.Parameters.AddWithValue("@cust_type", txtchecklistcusttype.SelectedValue);
                        sqlcmd.Parameters.AddWithValue("@ini_observ", txtiniobseerv.Text);
                        sqlcmd.Parameters.AddWithValue("@outs_observ", txtstasobsr.SelectedValue);
                        sqlcmd.Parameters.AddWithValue("@stat_obsrv", txtoutstnobr.Text);
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

            }
        }
    }
}