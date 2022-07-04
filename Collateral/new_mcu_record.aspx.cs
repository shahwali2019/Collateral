using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data.OracleClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Collateral_int
{
    public partial class new_mcu_record : System.Web.UI.Page
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
                if (Session["mcu_id"] != null)
                {

                    string currency,
                    LoanStatus;

                    subBtn.Text = " Updata ";
                    addLbl.Text = "UPDATE MCU RECORD";

                    //---------------------------------------------------------------
                    // Session["id"].ToString();
                    txtClient.Text = Session["cn"].ToString();

                    txtACNO.Text = Session["account"].ToString();
                    txtAppNo.Text = Session["appNo"].ToString();
                    txtDisburesment.Text = Session["Dis"].ToString();
                    txtDDM.Text = Session["DDM"].ToString();
                    txtmcudate.Text = Session["MCUD"].ToString();
                    currency = Session["cur"].ToString();
                    LoanStatus = Session["LS"].ToString();

                    listLoan.SelectedValue = LoanStatus;
                    listCurrency.SelectedValue = currency;

                    txtRemark.Text = Session["Remark"].ToString();

                    //Session["InsertedBy"].ToString();

                }
            }

        }
        protected void back_Click(object sender, ImageClickEventArgs e)
        {
            Session.Remove("mcu_id");

            Response.Redirect("mcu_record.aspx");
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
                        string query = "INSERT INTO[dbo].[mcu_tbl_insert]" +
                            "([Customre Name]" +
                            ",Currency" + 
                            ",[Account Number]" + 
                            ",[Approval Number]" + 
                            ",[[Disburesement]" + 
                            ",[Due Date of MCU]" +
                            " ,[MCU Date]" + 
                            " ,[Loan Status]" + 
                            " ,[Remark]" + 
                            ",[Inserted By]" + 
                            ")" +
                            " VALUES" + 
                            "(" + 
                            "@cm," +
                            "@currency," +
                            "@acno," +
                            "@appno," + 
                            "@dis," + 
                            "@duedate," +
                            "@mcudate," +
                            "@loanStatus," + 
                            "@remark," + 
                            "@is)";

                        SqlCommand sqlcmd = new SqlCommand(query, sqlCon2);

                        sqlcmd.Parameters.AddWithValue("@cm", txtClient.Text);
                        sqlcmd.Parameters.AddWithValue("@currency", listCurrency.SelectedValue);
                        sqlcmd.Parameters.AddWithValue("@acno", txtACNO.Text);
                        sqlcmd.Parameters.AddWithValue("@appno", txtAppNo.Text);
                        sqlcmd.Parameters.AddWithValue("@dis", txtDisburesment.Text);
                        sqlcmd.Parameters.AddWithValue("@duedate", txtDDM.Text);

                        sqlcmd.Parameters.AddWithValue("@mcudate", txtmcudate.Text);
                        sqlcmd.Parameters.AddWithValue("@loanStatus", listLoan.SelectedValue);
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
                } // end of adding new WAK Record

                else
                {

                    string connectionStringg = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                    using (SqlConnection sqlConn = new SqlConnection(connectionStringg))
                    {
                        sqlConn.Open();
                        string query = "INSERT INTO[dbo].[mcu_tbl_update]" + 
                            "(id" +
                            ",[Customre Name]" + 
                            ",Currency" +
                            ",[Account Number]" + 
                            ",[Approval Number]" +
                            ",[[Disburesement]" + 
                            ",[Due Date of MCU]" + 
                            " ,[MCU Date]" + 
                            " ,[Loan Status]" + 
                            " ,[Remark]" + 
                            ",[Inserted By]" +
                            ",[Updated By]" +
                            ")" +
                            " VALUES" + 
                            "(" + 
                            "@id," + 
                            "@cm," +
                            "@currency," + 
                            "@acno," + 
                            "@appno," + 
                            "@dis," + 
                            "@duedate," + 
                            "@mcudate," +
                            "@loanStatus," +
                            "@remark," +
                            "@is," +
                            "@ub)";

                        SqlCommand sqlcmd = new SqlCommand(query, sqlConn);
                        sqlcmd.Parameters.AddWithValue("@id", Session["id"].ToString());
                        sqlcmd.Parameters.AddWithValue("@cm", txtClient.Text);
                        sqlcmd.Parameters.AddWithValue("@currency", listCurrency.SelectedValue);
                        sqlcmd.Parameters.AddWithValue("@acno", txtACNO.Text);
                        sqlcmd.Parameters.AddWithValue("@appno", txtAppNo.Text);
                        sqlcmd.Parameters.AddWithValue("@dis", txtDisburesment.Text);
                        sqlcmd.Parameters.AddWithValue("@duedate", txtDDM.Text);
                        sqlcmd.Parameters.AddWithValue("@mcudate", txtmcudate.Text);
                        sqlcmd.Parameters.AddWithValue("@loanStatus", listLoan.SelectedValue);
                        sqlcmd.Parameters.AddWithValue("@remark", txtRemark.Text);
                        sqlcmd.Parameters.AddWithValue("@is", Session["InsertedBy"].ToString());
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

        protected void txtClient_TextChanged(object sender, EventArgs e)
        {
            msg.Visible = false;
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            //string strConnString = ConfigurationManager.ConnectionStrings["OracleCon"].ConnectionString;
            //OracleConnection con = new OracleConnection(strConnString);

            //if (con == null || con.State != ConnectionState.Open)
            //{
            //    con.Open();
            //}
            //string query = "select AC_DESC,CUST_AC_NO,CUST_NO,CCY from sttm_cust_account@fc where upper(ac_desc) LIKE  '%" + txtACNO.Text.ToUpper() + "%'";
            //OracleCommand cmd = new OracleCommand(query, con);
            //OracleDataReader dr = cmd.ExecuteReader();
            //DataTable dataTable = new DataTable();
            //dataTable.Load(dr);
            //GridView2.DataSource = dataTable;
            //GridView2.DataBind();
            //GridView2.Visible = true;

            string accountno = Request.Form["ctl00$MainContent$txtACNO"];
            OracleConnection con = new OracleConnection(OracleCon);
            OracleCommand cmd = new OracleCommand();
            // sttm_customer - nationality
            cmd.CommandText = "SELECT  c.customer_name1, ac.cust_ac_no from fccprod.sttm_cust_account ac, fccprod.sttm_customer c WHERE c.customer_no = ac.cust_no AND ac.cust_ac_no = '" + accountno + "'";
            cmd.Connection = con;
            con.Open();
            OracleDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    txtACNO.Text = dr["cust_ac_no"].ToString();
                    txtClient.Text = dr["customer_name1"].ToString();

                }
            }
            else
            {
           
                txtlbl.Text = "No Data In DataBase";
                txtlbl.Visible = true;
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "HideLabel();", true);

            }

            con.Close();
        }

        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "select")
            {
                txtACNO.Text = e.CommandArgument.ToString();
                GridView2.Visible = false;

            }

        }
    }
}