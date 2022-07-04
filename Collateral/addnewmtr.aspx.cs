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
    public partial class addnewmtr : System.Web.UI.Page
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
                if (Session["mrt_id"] != null)
                {


                    Button2.Text = " Update ";
                    addLbl.Text = "UPDATE Day to Day RECORD";

                    //----------------------------------------------------/*-----------*/
                    //// Session["id"].ToString();                         


                    txtCname.Text = Session["val2"].ToString();
                    txtmemoref.Text = Session["val3"].ToString();
                    txtDaccount.Text = Session["val4"].ToString();
                    txtCaccount.Text = Session["val5"].ToString();
                    txtTC.Text = Session["val6"].ToString();
                    txtMs.Text = Session["val7"].ToString();
                    txtAmount.Text = Session["val8"].ToString();
                    DropDownList1.SelectedValue = Session["val9"].ToString();
                    txtHeading.Text = Session["val10"].ToString();
                    txtTD.Text = Session["val11"].ToString();
                    txtBD.Text = Session["val12"].ToString();
                    txtVD.Text = Session["val13"].ToString();
                    txtStatus.Text = Session["val14"].ToString();
                    txtRemark.Text = Session["val15"].ToString();





                    //Session["InsertedBy"].ToString();


                }
            }
        }

        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "edit")
            {
                txtCname.Text = e.CommandArgument.ToString();
                GridView2.Visible = false;


            }
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
                    using (SqlConnection sqlCon2 = new SqlConnection(connectionString))
                    {
                        sqlCon2.Open();
                        string query = "INSERT INTO [dbo].[mtr_insert] " + // temp table for insertion
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
                        SqlCommand sqlcmd = new SqlCommand(query, sqlCon2);
                        sqlcmd.Parameters.AddWithValue("@val2", txtCname.Text);
                        sqlcmd.Parameters.AddWithValue("@val3", txtmemoref.Text);
                        sqlcmd.Parameters.AddWithValue("@val4", txtDaccount.Text);
                        sqlcmd.Parameters.AddWithValue("@val5", txtCaccount.Text);
                        sqlcmd.Parameters.AddWithValue("@val6", txtTC.Text);
                        sqlcmd.Parameters.AddWithValue("@val7", txtMs.Text);
                        sqlcmd.Parameters.AddWithValue("@val8", txtAmount.Text);
                        sqlcmd.Parameters.AddWithValue("@val9", DropDownList1.SelectedValue);
                        sqlcmd.Parameters.AddWithValue("@val10", txtHeading.Text);
                        sqlcmd.Parameters.AddWithValue("@val11", txtTD.Text);
                        sqlcmd.Parameters.AddWithValue("@val12", txtBD.Text);
                        sqlcmd.Parameters.AddWithValue("@val13", txtVD.Text);
                        sqlcmd.Parameters.AddWithValue("@val14", txtStatus.Text);
                        sqlcmd.Parameters.AddWithValue("@val15", txtRemark.Text);
                        sqlcmd.Parameters.AddWithValue("@val16", username);
                        sqlcmd.ExecuteNonQuery();
                        msg.Visible = true;
                        msg.Text = "Inserted to pending table!<br />It needs your admin approval!";
                        msg.ForeColor = System.Drawing.Color.Green;
                        Session.Remove("bid");
                        sqlCon2.Close();
                        //-------------------------------------

                        //txtClient.Text = facilityApptxt.Text = txtDrawer.Text = txtFolderNo.Text = txtExtention.Text = txtMod.Text = txtSafein.Text = txtSafeout.Text = txtRemark.Text = "";

                        //==========================================
                    }
                }// end of adding new WAK Record

                else
                {


                    string connectionStringg = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                    using (SqlConnection sqlConn = new SqlConnection(connectionStringg))
                    {
                        sqlConn.Open();
                        string query = "INSERT INTO[dbo].[mtr_update]" +
               "(id" +
               ",[Client Name]" +
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
               ",[UpdatedBy]" +
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
               "@val16)";

                        SqlCommand sqlcmd = new SqlCommand(query, sqlConn);
                        sqlcmd.Parameters.AddWithValue("@val1", Session["id"].ToString());
                        sqlcmd.Parameters.AddWithValue("@val2", txtCname.Text);
                        sqlcmd.Parameters.AddWithValue("@val3", txtmemoref.Text);
                        sqlcmd.Parameters.AddWithValue("@val4", txtDaccount.Text);
                        sqlcmd.Parameters.AddWithValue("@val5", txtCaccount.Text);
                        sqlcmd.Parameters.AddWithValue("@val6", txtTC.Text);
                        sqlcmd.Parameters.AddWithValue("@val7", txtMs.Text);
                        sqlcmd.Parameters.AddWithValue("@val8", txtAmount.Text);
                        sqlcmd.Parameters.AddWithValue("@val9", DropDownList1.SelectedValue);
                        sqlcmd.Parameters.AddWithValue("@val10", txtHeading.Text);
                        sqlcmd.Parameters.AddWithValue("@val11", txtTD.Text);
                        sqlcmd.Parameters.AddWithValue("@val12", txtBD.Text);
                        sqlcmd.Parameters.AddWithValue("@val13", txtVD.Text);
                        sqlcmd.Parameters.AddWithValue("@val14", txtStatus.Text);
                        sqlcmd.Parameters.AddWithValue("@val15", txtRemark.Text);
                        sqlcmd.Parameters.AddWithValue("@val16", username);
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

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {

        }
    }
}