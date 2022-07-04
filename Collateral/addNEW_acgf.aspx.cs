using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Collateral_int
{
    public partial class addNEW_acgf : System.Web.UI.Page
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

                //if (Access_role == null)
                //{
                //    Response.Redirect("Loging.aspx");
                //    Session.Remove("loading");
                //}

                if (Session["acgf_id"] != null)
                {
                    addLbl.Text = "Update ACGF Record";
                    btnADD.Text = " Update ";


                    //RequiredFieldValidator1.Enabled = false;
                    //RequiredFieldValidator2.Enabled = false;
                    //RequiredFieldValidator3.Enabled = false;
                    //RequiredFieldValidator4.Enabled = false;
                    //RequiredFieldValidator5.Enabled = false;
                    //RequiredFieldValidator6.Enabled = false;
                    //RequiredFieldValidator9.Enabled = false;
                  
                    txtBorrower.Text = Session["bname"].ToString();
                    txtFAN.Text = Session["fan"].ToString();
                    drop_PC.SelectedItem.Text= Session["pc"].ToString();
                    txtLOG.Text = Session["log"].ToString();
                    txtMDF.Text = Session["MDF"].ToString();
                    txtACGFED.Text = Session["ACGF"].ToString();
                    txtGuarantee.Text = Session["GC"].ToString();
                    txtRemark.Text = Session["Remark"].ToString();
                    //Session["id"]
                    //Session["IB"]
                    // Session["AB"]
                    //Session["UB"]
                }
            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            Session.Remove("acgf_id");
            RequiredFieldValidator1.Enabled = false;
            RequiredFieldValidator2.Enabled = false;
            RequiredFieldValidator3.Enabled = false;
            RequiredFieldValidator4.Enabled = false;
            RequiredFieldValidator5.Enabled = false;
            RequiredFieldValidator6.Enabled = false;
            RequiredFieldValidator9.Enabled = false;
            Response.Redirect("Collateral.aspx");
        }


        protected void txtBorrower_TextChanged(object sender, EventArgs e)
        {
            msg.Visible = false;
        }
        protected void ResetBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect(Request.RawUrl);
            msg.Visible = false;
        }

        protected void btnADD_Click(object sender, EventArgs e)
        {
            string fullUsername = User.Identity.Name;
            int index_domain = fullUsername.IndexOf("AIB\\");
            string username = fullUsername.Substring(fullUsername.IndexOf("\\") + 1);
            if (Page.IsValid)
            {
                if (btnADD.Text == "ADD")
                {
                    string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                    using (SqlConnection sqlCon = new SqlConnection(connectionString))
                    {
                        sqlCon.Open();
                        string query = "INSERT INTO[dbo].[acgf_insert] " + // temp table for insertion
                      " (" +
                      "[Borrower Name]" +
                      " ,[Faciliy Approval No]" +
                       ",[Product Code]" +
                       ",[LOG No]" +
                      " ,[Maturity Date of Facility]" +
                       ",[ACGF Expiry Date]" +
                      " ,[Guarantee Claimed]" +
                      " ,[Remark]" +
                      " ,[InsertedBy]" +
                      ")" +
                            " VALUES" +
                            "(" +
                            "@bname," +
                            "@fan," +
                            "@pc," +
                            "@log," +
                            "@mdf," +
                            "@acfg," +
                            "@gc," +
                            "@remark," +
                            "@InsertedBy)";
                        SqlCommand sqlcmd = new SqlCommand(query, sqlCon);
                        sqlcmd.Parameters.AddWithValue("@bname", txtBorrower.Text);
                        sqlcmd.Parameters.AddWithValue("@fan", txtFAN.Text);
                        sqlcmd.Parameters.AddWithValue("@pc", drop_PC.SelectedValue);
                        sqlcmd.Parameters.AddWithValue("@log", txtLOG.Text);
                        sqlcmd.Parameters.AddWithValue("@mdf", txtMDF.Text);
                        sqlcmd.Parameters.AddWithValue("@acfg", txtACGFED.Text);
                        sqlcmd.Parameters.AddWithValue("@gc", txtGuarantee.Text);
                        sqlcmd.Parameters.AddWithValue("@remark", txtRemark.Text);
                        sqlcmd.Parameters.AddWithValue("@InsertedBy", username);
                        sqlcmd.ExecuteNonQuery();
                        msg.Visible = true;
                        msg.Text = "Inserted to inserted pending table!<br />It needs your admin approval!";
                        msg.ForeColor = System.Drawing.Color.Green;
                        // Session.Remove("acgf_id");
                        sqlCon.Close();
                    }
                }// end of adding new acgf Record

                else // it means update interface is shown now
                {

                    string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                    using (SqlConnection sqlCon = new SqlConnection(connectionString))
                    {
                        sqlCon.Open();
                        string query = "INSERT INTO[dbo].[acgf_update] " + // temp table for insertion
                      " (id," +
                      "[Borrower Name]" +
                      ",[Faciliy Approval No]" +
                      ",[Product Code]" +
                      ",[LOG No]" +
                      ",[Maturity Date of Facility]" +
                      ",[ACGF Expiry Date]" +
                      ",[Guarantee Claimed]" +
                      ",[Remark]" +
                      ",[InsertedBy]" +
                      ",[Updated By]" +
                      ")" +
                            " VALUES" +
                            "(" +
                            "@id," +
                            "@bname," +
                            "@fan," +
                            "@pc," +
                            "@log," +
                            "@mdf," +
                            "@acfg," +
                            "@gc," +
                            "@remark," +
                            "@insertedBy," +
                            "@updatedby)";

                        SqlCommand sqlcmd = new SqlCommand(query, sqlCon);
                        sqlcmd.Parameters.AddWithValue("@id", Session["id"].ToString());
                        sqlcmd.Parameters.AddWithValue("@bname", txtBorrower.Text);
                        sqlcmd.Parameters.AddWithValue("@fan", txtFAN.Text);
                        sqlcmd.Parameters.AddWithValue("@pc", drop_PC.SelectedValue);
                        sqlcmd.Parameters.AddWithValue("@log", txtLOG.Text);
                        sqlcmd.Parameters.AddWithValue("@mdf", txtMDF.Text);
                        sqlcmd.Parameters.AddWithValue("@acfg", txtACGFED.Text);
                        sqlcmd.Parameters.AddWithValue("@gc", txtGuarantee.Text);
                        sqlcmd.Parameters.AddWithValue("@remark", txtRemark.Text);
                        sqlcmd.Parameters.AddWithValue("insertedBy", Session["IB"].ToString());
                        sqlcmd.Parameters.AddWithValue("@updatedby", username);
                        sqlcmd.ExecuteNonQuery();
                        msg.Visible = true;
                        msg.Text = "Inserted to updated pending table!<br />It needs your admin approval!";
                        msg.ForeColor = System.Drawing.Color.Green;
                        Session.Remove("acgf_id");
                        sqlCon.Close();
                    }
                }
                //end of else




            }
        }
    }
}