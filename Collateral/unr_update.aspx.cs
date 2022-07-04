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
    public partial class unr_update : System.Web.UI.Page
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

                    updateBtn.Text = "update";
                    addLbl.Text = "UPDATE UNR RECORD";

                    //--------------------------------------------------------------   note should add from database           
                    Session["Id"].ToString();
                    txtgroupname.SelectedValue = Session["txtgroupname"].ToString();
                    txtrespct_name.Text = Session["txtrespct_name"].ToString();
                    txtapprno.Text = Session["txtapprno"].ToString();
                    txtFacilityType.Text = Session["txtFacilityType"].ToString();
                    txtfacilityamount.Text = Session["txtfacilityamount"].ToString();
                    txtcurrncy.SelectedValue = Session["txtcurrncy"].ToString();
                    txtreceive.Text = Session["txtreceive"].ToString();
                    txtexpdate.Text = Session["txtexpdate"].ToString();
                    txtstatus.SelectedValue = Session["txtstatus"].ToString();


                }

            }
        }

        protected void updateBtn_Click(object sender, EventArgs e)
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
                    string query = "INSERT INTO [dbo].[UNR_Updated]" +
                        "(" +
                        "Id," +
                          "[Group Name] " +
                          ",[Respective Name] " +
                          ",[Approval Number] " +
                          ",[Facility Type] " +
                          ",[Facility Amount] " +
                          ",[Currency] " +
                          ",[Expire Date] " +
                          ",[Received] " +
                          ",[Status] " +
                          ",[Updated By]" +
                        ")" +
                        " VALUES" +
                        "(" +
                        "@id," +
                          "@txtgroupname," +
                          "@txtrespct_name," +
                          "@txtapprno," +
                          "@txtFacilityType," +
                          "@txtfacilityamount," +
                          "@txtcurrncy," +
                          "@txtexpdate," +
                          "@txtreceive," +
                          "@txtstatus," +
                        "@up_by)";
                    SqlCommand sqlcmd = new SqlCommand(query, sqlConn);
                    sqlcmd.Parameters.AddWithValue("@id", Session["Id"].ToString());
                    sqlcmd.Parameters.AddWithValue("@txtgroupname", txtgroupname.SelectedValue);
                    sqlcmd.Parameters.AddWithValue("@txtrespct_name", txtrespct_name.Text);
                    sqlcmd.Parameters.AddWithValue("@txtapprno", txtapprno.Text);
                    sqlcmd.Parameters.AddWithValue("@txtFacilityType", txtFacilityType.Text);
                    sqlcmd.Parameters.AddWithValue("@txtfacilityamount", txtfacilityamount.Text);
                    sqlcmd.Parameters.AddWithValue("@txtcurrncy", txtcurrncy.SelectedValue);
                    sqlcmd.Parameters.AddWithValue("@txtexpdate", DateTime.Parse(txtexpdate.Text));
                    sqlcmd.Parameters.AddWithValue("@txtreceive", txtreceive.Text);
                    sqlcmd.Parameters.AddWithValue("@txtstatus", txtstatus.SelectedValue);
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
        }
    }
}