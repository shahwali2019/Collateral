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
    public partial class LL_Details : System.Web.UI.Page
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

                    Add.Text = "ADD";
                    addLbl.Text = "Loan Recovery RECORD";

                    //--------------------------------------------------------------   note should add from database           
                    Session["LoanID"].ToString();
                    Session["BorrowerName"].ToString(); 
                    Session["AccountNumber"].ToString();
                    //string a = Session["Charge off Amount Original Currency"].ToString();


                }

            }
        }

        protected void Add_Click(object sender, EventArgs e)
        {

                int c1 = Convert.ToInt32(txtnet_loss.Text);  // net loss
                int c2 = Convert.ToInt32(txtrecvr_amount.Text); ///Recovery Amount

                var c = c1 - c2;
                txtnet_loss.Text = c.ToString();
            
            string fullUsername = User.Identity.Name;
            int index_domain = fullUsername.IndexOf("AIB\\");
            string username = fullUsername.Substring(fullUsername.IndexOf("\\") + 1);
            if (Page.IsValid)
            {
                string dValue = string.Format("{0:dd-MM-yyyy}", txtrcovr_date.Text);
                string connectionStringg = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                using (SqlConnection sqlConn = new SqlConnection(connectionStringg))
                using (SqlConnection sqlConn1 = new SqlConnection(connectionStringg))
                {
                    sqlConn.Open();
                    string query = "INSERT INTO [dbo].[LoanRecoveryDetails_Update]" +
                        "(" +
                        "LoanID,"  +
                          "[BorrowerName] " +
                          ",[AccountNumber] " +
                          ",[Recovery Date] " +
                          ",[source Of Recovery] " +
                          ",[Recovery Amount] " +
                          ",[Expenses Occurred] " +
                          ",[Claim To be Paid] " +
                          ",[Net Loss] " +
                          ",[Updated By]" +
                        ")" +
                        " VALUES" +
                        "(" +
                        "@LoanID," +
                        "@BorrowerName," +
                        "@AccountNumber," + 
                          "@1," +
                          "@2," +
                          "@3," +
                          "@4," +
                          "@5," +
                          "@6," +
                        "@up_by)";
                    SqlCommand sqlcmd = new SqlCommand(query, sqlConn);
                    sqlcmd.Parameters.AddWithValue("@LoanID", Session["LoanID"].ToString());
                    sqlcmd.Parameters.AddWithValue("@BorrowerName", Session["BorrowerName"].ToString());
                    sqlcmd.Parameters.AddWithValue("@AccountNumber", Session["AccountNumber"].ToString());
                    sqlcmd.Parameters.AddWithValue("@1", dValue);
                    sqlcmd.Parameters.AddWithValue("@2", txtsrc_recovey.Text);
                    sqlcmd.Parameters.AddWithValue("@3", c2);
                    sqlcmd.Parameters.AddWithValue("@4", txtexp_amount.Text);
                    sqlcmd.Parameters.AddWithValue("@5", txtclm_paid.Text);
                    sqlcmd.Parameters.AddWithValue("@6", c);
                    sqlcmd.Parameters.AddWithValue("@up_by", username);
                    //sqlCmd.ExecuteNonQuery();
                    sqlcmd.ExecuteNonQuery();
                    sqlConn.Close();
                    sqlConn.Dispose();

                }
                msg.Visible = true;
                msg.Text = "The record inserted. .";
                msg.ForeColor = System.Drawing.Color.Green;

            }
        }
    }
}