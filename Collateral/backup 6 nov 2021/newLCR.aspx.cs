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
    public partial class newLCR : System.Web.UI.Page
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
                if (Session["lcr_id"] != null)
                {

                    //string LoanStatus;

                    subBtn.Text = " Update ";
                    addLbl.Text = "UPDATE LCR RECORD";

                    //--------------------------------------------------------------
                    // Session["id"].ToString();                                    
                    txtCname.Text = Session["cm"].ToString();                       
                    txtDueDate.Text = Session["duedate"].ToString();                
                    txtAppName.Text = Session["appname"].ToString();                
                    DropDownList1.SelectedValue = Session["constus"].ToString();   
                    txtDoD.Text = Session["dod"].ToString();                             
                    txtRemark.Text = Session["remark"].ToString();                  
                    txtCondition.Text = Session["conds"].ToString();                
                    //LoanStatus = Session["LS"].ToString();                        
                                                                                    
                    //DropDownList1.SelectedValue = LoanStatus;                     
                    //listCurrency.SelectedValue = currency;                        



                    //txtRemark.Text = Session["Remark"].ToString();

                    //Session["InsertedBy"].ToString();


                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
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
                        string query = "INSERT INTO[dbo].[LCR_insert] " + // temp table for insertion
                          " (" +
                          "[Customer Name]" +
                          " ,[Approval Name]" +
                           ",[Date of Disbursement]" +
                       ",[Conditions]" +
                      ",[Due Date]" +
                       ",[Condition Status]" +
                      " ,[Remark]" +
                       ",[Inserted By]" +
                        ")" +
                        " VALUES" +
                        "(" +
                        "@cm," +
                        "@appname," +
                        "@dod," +
                        "@conds," +
                        "@duedate," +
                        "@constus," +
                        "@remark," +
                        "@is)";


                        SqlCommand sqlcmd = new SqlCommand(query, sqlCon2);
                        sqlcmd.Parameters.AddWithValue("@cm", txtCname.Text);
                        sqlcmd.Parameters.AddWithValue("@appname", txtAppName.Text);
                        sqlcmd.Parameters.AddWithValue("@dod", txtDoD.Text);
                        sqlcmd.Parameters.AddWithValue("@conds", txtCondition.Text);
                        sqlcmd.Parameters.AddWithValue("@duedate", txtDueDate.Text);
                        sqlcmd.Parameters.AddWithValue("@constus", DropDownList1.SelectedValue);
                        sqlcmd.Parameters.AddWithValue("@remark", txtRemark.Text);
                        sqlcmd.Parameters.AddWithValue("@is", username);





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
                        string query = "INSERT INTO [dbo].[LCR_update]" +
                      "(id" +
                      ",[Customer Name]" +
                      ",[Due Date]" +
                       ",[Approval Name]" +
                       ",[Condition Status]" +
                      ",[Date of Disbursement]" +
                       ",[Remark]" +
                      " ,[Conditions]" +
                       //",[Inserted By]" +
                       ",[Updated By]" +
                        ")" +
                        " VALUES" +
                        "(" +
                        "@id," +
                        "@cm," +
                        "@duedate," +
                        "@appname," +
                        "@constus," +
                        "@dod," +
                        "@remark," +
                        "@conds," +
                        //"@is," +
                        "@ub)";

                        SqlCommand sqlcmd = new SqlCommand(query, sqlConn);
                        sqlcmd.Parameters.AddWithValue("@id", Session["id"].ToString());
                        sqlcmd.Parameters.AddWithValue("@cm", txtCname.Text);
                        sqlcmd.Parameters.AddWithValue("@duedate", txtDueDate.Text);
                        sqlcmd.Parameters.AddWithValue("@appname", txtAppName.Text);
                        sqlcmd.Parameters.AddWithValue("@constus", DropDownList1.SelectedValue);
                        sqlcmd.Parameters.AddWithValue("@dod", txtDoD.Text);
                        sqlcmd.Parameters.AddWithValue("@remark", txtRemark.Text);
                        sqlcmd.Parameters.AddWithValue("@conds", txtCondition.Text);
                        //sqlcmd.Parameters.AddWithValue("@is", Session["InsertedBy"].ToString());
                        sqlcmd.Parameters.AddWithValue("ub", username);

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

        protected void ResetBtn_Click(object sender, EventArgs e)
        {

        }


    }
}