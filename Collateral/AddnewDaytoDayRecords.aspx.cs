using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.OracleClient;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Collateral
{
    public partial class AddnewDaytoDayRecords : System.Web.UI.Page
    {
        string OracleCon = "Data Source=(DESCRIPTION =" + "(ADDRESS = (PROTOCOL = TCP)(HOST = 192.168.0.56)(PORT = 1521))" + "(CONNECT_DATA =" + "(SERVER = DEDICATED)" + "(SERVICE_NAME = AIBLIVE)));" + "User Id=appuser;Password=Z__M098765;";

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
                if (Session["dod_id"] != null)
                {


                    Button2.Text = " Update ";
                    addLbl.Text = "UPDATE Day to Day RECORD";

                    //---------------------------------------------------------------
                    // Session["id"].ToString();                         
                    acc_name.Text = Session["acn"].ToString();
                    action.Text = Session["actoken"].ToString();
                    appNumber.Text = Session["appno"].ToString();
                    tfl.Text = Session["tflinfs"].ToString();
                    confirmed.Text = Session["confby"].ToString();
                    facAmt.Text = Session["famount"].ToString();
                    DoB.Text = Session["dboking"].ToString();
                    drop_down_facility_type.SelectedValue = Session["ftype"].ToString();
                    currencyList.SelectedValue = Session["currency"].ToString();
                    cmla.Text = Session["csnoofdate"].ToString();
                    txtnm_extn.Text = Session["numexten"].ToString();
                    remark.Text = Session["Remark"].ToString();





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
                if (Button2.Text == "ADD")
                {

                    string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                    using (SqlConnection sqlCon2 = new SqlConnection(connectionString))
                    {
                        sqlCon2.Open();
                        string query = "INSERT INTO [dbo].[DayToDayTbl_ins] " + // temp table for insertion
                          " (" +
                          "[Account Name]" +
                          " ,[Approval Number]" +
                           ",[Facility Type]" +
                       ",[Facility Amount]" +
                      ",[Currency]" +
                       ",[Action Taken]" +
                      " ,[TFL Instructed On]" +
                       ",[Confirmed By]" +
                       ",[Date of Boking]" +
                       ",[CMLA SignOff Date]" +
                       ",[Number of Extension Renewa]" +
                       ",[Remark]" +
                       ",[Inserted By]" +
                        ")" +
                        " VALUES" +
                        "(" +
                        "@acname," +
                        "@appno," +
                        "@ftype," +
                        "@famount," +
                        "@currency," +
                        "@atoken," +
                        "@tflinst," +
                        "@confby," +
                        "@dtboking," +
                        "@csignofdate," +
                        "@num_exten," +
                        "@remark," +
                        "@is)";


                        SqlCommand sqlcmd = new SqlCommand(query, sqlCon2);
                        sqlcmd.Parameters.AddWithValue("@acname", acc_name.Text);
                        sqlcmd.Parameters.AddWithValue("@appno", appNumber.Text);
                        sqlcmd.Parameters.AddWithValue("@ftype", drop_down_facility_type.SelectedValue);
                        sqlcmd.Parameters.AddWithValue("@famount", facAmt.Text);
                        sqlcmd.Parameters.AddWithValue("@currency", currencyList.SelectedValue);
                        sqlcmd.Parameters.AddWithValue("@atoken", action.Text);
                        sqlcmd.Parameters.AddWithValue("@tflinst", tfl.Text);
                        sqlcmd.Parameters.AddWithValue("@confby", confirmed.Text);
                        sqlcmd.Parameters.AddWithValue("@dtboking", DoB.Text);
                        sqlcmd.Parameters.AddWithValue("@csignofdate", cmla.Text);
                        sqlcmd.Parameters.AddWithValue("@num_exten", txtnm_extn.Text);
                        sqlcmd.Parameters.AddWithValue("@remark", remark.Text);
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
                        string query = "INSERT INTO[dbo].[DayToDayTbl_upd]" +
                      "(id" +
                          ",[Account Name]" +
                          " ,[Approval Number]" +
                           ",[Facility Type]" +
                       ",[Facility Amount]" +
                      ",[Currency]" +
                       ",[Action Taken]" +
                      " ,[TFL Instructed On]" +
                       ",[Confirmed By]" +
                       ",[Date of Boking]" +
                       ",[CMLA SignOff Date]" +
                       ",[Number of Extension Renewa]" +
                       ",[Remark]" +
                       //",[Inserted By]" +
                       ",[Updated By]" +
                        ")" +
                        " VALUES" +
                        "(" +
                        "@id," +
                        "@acname," +
                        "@appno," +
                        "@ftype," +
                        "@famount," +
                        "@currency," +
                        "@atoken," +
                        "@tflinst," +
                        "@confby," +
                        "@dtboking," +
                        "@csignofdate," +
                        "@num_exten," +
                        "@remark," +
                        //"@is," +
                        "@ub)";

                        SqlCommand sqlcmd = new SqlCommand(query, sqlConn);
                        sqlcmd.Parameters.AddWithValue("@id", Session["id"].ToString());
                        sqlcmd.Parameters.AddWithValue("@acname", acc_name.Text);
                        sqlcmd.Parameters.AddWithValue("@appno", appNumber.Text);
                        sqlcmd.Parameters.AddWithValue("@ftype", drop_down_facility_type.SelectedValue);
                        sqlcmd.Parameters.AddWithValue("@famount", facAmt.Text);
                        sqlcmd.Parameters.AddWithValue("@currency", currencyList.SelectedValue);
                        sqlcmd.Parameters.AddWithValue("@atoken", action.Text);
                        sqlcmd.Parameters.AddWithValue("@tflinst", tfl.Text);
                        sqlcmd.Parameters.AddWithValue("@confby", confirmed.Text);
                        sqlcmd.Parameters.AddWithValue("@dtboking", DoB.Text);
                        sqlcmd.Parameters.AddWithValue("@csignofdate", cmla.Text);
                        sqlcmd.Parameters.AddWithValue("@num_exten", txtnm_extn.Text);
                        sqlcmd.Parameters.AddWithValue("@remark", remark.Text);
                        //sqlcmd.Parameters.AddWithValue("@is", username);
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

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
        //    //string strConnString = ConfigurationManager.ConnectionStrings["OracleCon"].ConnectionString;
        //    //OracleConnection con = new OracleConnection(strConnString);

        //    //if (con == null || con.State != ConnectionState.Open)
        //    //{
        //    //    con.Open();
        //    //}
        //    //string query = "select AC_DESC,CUST_AC_NO,CUST_NO,CCY from sttm_cust_account@fc where upper(ac_desc) LIKE  '%" + acc_name.Text.ToUpper() + "%'";
        //    //OracleCommand cmd = new OracleCommand(query, con);
        //    //OracleDataReader dr = cmd.ExecuteReader();
        //    //DataTable dataTable = new DataTable();
        //    //dataTable.Load(dr);
        //    //GridView2.DataSource = dataTable;
        //    //GridView2.DataBind();
        //    //GridView2.Visible = true;
        //    string accountno = Request.Form["appNumber"];

        //    OracleConnection con = new OracleConnection(OracleCon);
        //    OracleCommand cmd = new OracleCommand();
        //    // sttm_customer - nationality
        //    cmd.CommandText = "SELECT  c.customer_name1, ac.cust_ac_no from fccprod.sttm_cust_account ac, fccprod.sttm_customer c WHERE c.customer_no = ac.cust_no AND ac.cust_ac_no = '" + accountno + "'";
        //    cmd.Connection = con;
        //    con.Open();
        //    OracleDataReader dr = cmd.ExecuteReader();
        //    if (dr.HasRows)
        //    {
        //        while (dr.Read())
        //        {
        //            appNumber.Text = dr["cust_ac_no"].ToString();
        //            acc_name.Text = dr["customer_name1"].ToString();

        //        }
        //    }
        //    else
        //    {
        //        //Response.Write("No Data In DataBase");
        //        txtlbl.Text = "No Data In DataBase";
        //        txtlbl.Visible = true;
        //        ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);

        //    }

        //    con.Close();
        }
    

        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "edit")
            {
                acc_name.Text = e.CommandArgument.ToString();
                GridView2.Visible = false;


            }
        }
    }
}