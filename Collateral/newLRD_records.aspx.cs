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
    public partial class newLRD_records : System.Web.UI.Page
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
            }
            if (!IsPostBack)
            {
                string fullUsername = User.Identity.Name;
                int index_domain = fullUsername.IndexOf("AIB\\");
                string username = fullUsername.Substring(fullUsername.IndexOf("\\") + 1);
                if (Session["Loan"] != null)
                {
                    addLbl.Text = "Update LDR Record";
                    Button2.Text = "UPDATE";
                    txtCompleteDate.Enabled = false;

                    //txt2ndverifier.Text = Session["Users"].ToString();
                    //txtCompleteDate.TextMode = TextBoxMode.Date;
                    ////addLbl.Text = "Edit LDR Record";
                    Session["id"].ToString();
                    txtRecDate.TextMode = TextBoxMode.SingleLine;
                    txtRecDate.Text = Session["rd"].ToString();

                    txtCompanyName.Text = Session["company"].ToString();
                    txtAppNo.Text = Session["AppNo"].ToString();
                    drop_down_facility_type.SelectedValue = Session["FacType"].ToString();
                    txtDocrRec.Text = Session["DocType"].ToString();
                    txtEnterby.Text = Session["EnterBy"].ToString();
                    txt2ndverifier.Text = Session["2ndVerifier"].ToString();
                    txtCompleteDate.TextMode = TextBoxMode.SingleLine;
                    txtCompleteDate.Text = Session["ComDate"].ToString();
                    txtRemark.Text = Session["Remark"].ToString();

                }
                else
                {
                    txtEnterby.Text = username;
                }
            }

        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void txtBorrower_TextChanged(object sender, EventArgs e)
        {

        }

        protected void ResetBtn_Click(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string fullUsername = User.Identity.Name;
            int index_domain = fullUsername.IndexOf("AIB\\");
            string username = fullUsername.Substring(fullUsername.IndexOf("\\") + 1);
            if (Page.IsValid)
            {
                if (Button2.Text == "ADD")
                {

                    string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;

                    using (SqlConnection sqlCon = new SqlConnection(connectionString))

                    using (SqlCommand cmd = new SqlCommand("SELECT * FROM LoanReg_tbl_insert WHERE ApprovalNumber = @ApprovalNumber", sqlCon))
                    {

                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            sqlCon.Open();
                            cmd.Parameters.AddWithValue("@ApprovalNumber", this.txtAppNo.Text.Trim());
                            DataSet ds = new DataSet();
                            da.Fill(ds);
                            if (ds.Tables[0].Rows.Count > 0)
                            {
                                this.lblMessage.Text = "sorry, you'er not able to insert deplicate Approval Number!";
                            }
                            else
                            {
                                using (SqlConnection sqlCon2 = new SqlConnection(connectionString))

                                    sqlCon2.Open();
                                string query = "INSERT INTO[dbo].[LoanReg_tbl_insert] " + // temp table for insertion
                                " (" + "[Received Date]" +
                                " ,[Company Name]" +
                                ",[ApprovalNumber]" + 
                                ",[Facility Type]" + 
                                " ,[Document Received]" + 
                                ",[Enter By]" +
                                // " ,[Second Verifier]" +
                                //" ,[Completion Date]" +
                                ",[Remark]" + 
                                " ,[Inserted By]" +
                                ")" +
                                " VALUES" + 
                                "(" + 
                                "@rd," + 
                                "@cn," + 
                                "@an," +
                                "@ft," +
                                "@dr," + 
                                "@eb," +
                                // "@sv," +
                                // "@cd," +
                                "@rem," +
                                "@InsertedBy)";
                                SqlCommand sqlcmd = new SqlCommand(query, sqlCon);
                                sqlcmd.Parameters.AddWithValue("@rd", txtRecDate.Text);
                                sqlcmd.Parameters.AddWithValue("@cn", txtCompanyName.Text);
                                sqlcmd.Parameters.AddWithValue("@an", txtAppNo.Text);
                                sqlcmd.Parameters.AddWithValue("@ft", drop_down_facility_type.SelectedValue);
                                sqlcmd.Parameters.AddWithValue("@dr", txtDocrRec.Text);
                                sqlcmd.Parameters.AddWithValue("@eb", txtEnterby.Text);
                                // sqlcmd.Parameters.AddWithValue("@sv", txt2ndverifier.Text);
                                // sqlcmd.Parameters.AddWithValue("@cd", txtCompleteDate.Text);
                                sqlcmd.Parameters.AddWithValue("@rem", txtRemark.Text);
                                sqlcmd.Parameters.AddWithValue("@InsertedBy", username);
                                sqlcmd.ExecuteNonQuery();
                                msg.Visible = true;
                                msg.Text = "Inserted to inserted pending table!<br />It needs your admin approval!";
                                msg.ForeColor = System.Drawing.Color.Green;
                                // Session.Remove("acgf_id");
                                sqlCon.Close();
                            }
                        } // end of adding new acgf Record
                    }

                }
                else // it means update interface is shown now
                {
                    string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                    using (SqlConnection sqlCon = new SqlConnection(connectionString))
                    {
                        sqlCon.Open();
                        string query = "INSERT INTO[dbo].[LoanReg_tbl_Update] " + // temp table for insertion
                        "(id," + 
                        "[Received Date]" +
                        ",[Company Name]" + 
                        ",[Approval Number]" +
                        ",[Facility Type]" + 
                        ",[Document Received]" + 
                        ",[Enter By]" + 
                        ",[Second Verifier]" + 
                        ",[Completion Date]" + 
                        ",[Remark]" + 
                        ",[Inserted By]" + 
                        ",[Updated By]" + 
                        ")" + 
                        " VALUES" + 
                        "(" + 
                        "@id," + 
                        "@rd," + 
                        "@cn," + 
                        "@an," + 
                        "@ft," +
                        "@dr," + 
                        "@eb," + 
                        "@sv," +
                        "@cd," + 
                        "@rem," + 
                        "@ib," +
                        "@ub)";

                        SqlCommand sqlcmd = new SqlCommand(query, sqlCon);
                        sqlcmd.Parameters.AddWithValue("@id", Session["id"].ToString());
                        sqlcmd.Parameters.AddWithValue("@rd", txtRecDate.Text);
                        sqlcmd.Parameters.AddWithValue("@cn", txtCompanyName.Text);
                        sqlcmd.Parameters.AddWithValue("@an", txtAppNo.Text);
                        sqlcmd.Parameters.AddWithValue("@ft", drop_down_facility_type.SelectedValue);
                        sqlcmd.Parameters.AddWithValue("@dr", txtDocrRec.Text);
                        sqlcmd.Parameters.AddWithValue("@eb", txtEnterby.Text);
                        sqlcmd.Parameters.AddWithValue("@sv", txt2ndverifier.Text);
                        sqlcmd.Parameters.AddWithValue("@cd", txtCompleteDate.Text);
                        sqlcmd.Parameters.AddWithValue("@rem", txtRemark.Text);
                        sqlcmd.Parameters.AddWithValue("ib", username);
                        sqlcmd.Parameters.AddWithValue("@ub", username);
                        sqlcmd.ExecuteNonQuery();
                        msg.Visible = true;
                        msg.Text = "Inserted to updated pending table!<br />It needs your admin approval!";
                        msg.ForeColor = System.Drawing.Color.Green;
                        Session.Remove("Loan");
                        sqlCon.Close();
                    }
                }
                //end of else}

            }
        }
        protected void txtRecDate_TextChanged(object sender, EventArgs e)
        {
            msg.Visible = false;
        }

        protected void txt2ndverifier_TextChanged(object sender, EventArgs e)
        {

        }
    }
}