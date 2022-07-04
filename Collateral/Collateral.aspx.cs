using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Collateral_int
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string fullUsername = User.Identity.Name;
            int index_domain = fullUsername.IndexOf("AIB\\");
            string username = fullUsername.Substring(fullUsername.IndexOf("\\") + 1);

            //Code to secure URL Security
            if (!IsPostBack)
            {
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

                 if (Access_role == "Supper Admin")
                {
                    LinkButton28.Visible = true;
                    LinkButton25.Visible = true;
                    LinkButton22.Visible = true;
                    LinkButton19.Visible = true;
                    LinkButton17.Visible = true;
                    LinkButton14.Visible = true;
                    LinkButton8.Visible = true;
                    LinkButton6.Visible = true;
                    LinkButton5.Visible = true;
                    LinkButton31.Visible = true;
                    LinkButton35.Enabled = false;
                    LinkButton36.Enabled = false;
                    LinkButton37.Visible = true;
                    LinkButton32.Enabled = false;
                    LinkButton33.Enabled = false;
                    LinkButton34.Enabled = true;
                    LinkButton32.Enabled = true;
                    LinkButton35.Enabled = true;
                    LinkButton29.Enabled = true;
                    LinkButton30.Enabled = false;
                    LinkButton27.Enabled = false;
                    LinkButton24.Enabled = false;
                    LinkButton21.Enabled = false;
                    LinkButton18.Enabled = false;
                    LinkButton16.Enabled = false;
                    LinkButton13.Enabled = false;
                    LinkButton9.Enabled = false;
                    LinkButton7.Enabled = false;
                    LinkButton10.Enabled = false;
                    Newuser.Visible = true;

                }
                
                 else if (Access_role == "Users")
                {
                    //Server.Transfer("register.aspx");
                    LinkButton28.Enabled = false;
                    LinkButton25.Enabled = false;
                    LinkButton22.Enabled = false;
                    LinkButton19.Enabled = false;
                    LinkButton17.Enabled = false;
                    LinkButton14.Enabled = false;
                    LinkButton8.Enabled = false;
                    LinkButton6.Enabled = false;
                    LinkButton5.Enabled = false;
                    LinkButton31.Enabled = false;
                    LinkButton34.Enabled = false;
                    LinkButton37.Enabled = false;
                    Newuser.Visible = false;

                }
                else if (Access_role == "Admin")
                {
                    LinkButton28.Visible = true;
                    LinkButton25.Visible = true;
                    LinkButton22.Visible = true;
                    LinkButton19.Visible = true;
                    LinkButton17.Visible = true;
                    LinkButton14.Visible = true;
                    LinkButton8.Visible = true;
                    LinkButton6.Visible = true;
                    LinkButton5.Visible = true;
                    LinkButton31.Visible = true;
                    LinkButton35.Enabled = false;
                    LinkButton36.Enabled = false;
                    LinkButton37.Visible = true;
                    LinkButton32.Enabled = false;
                    LinkButton33.Enabled = false;
                    LinkButton34.Enabled = true;
                    LinkButton32.Enabled = true;
                    LinkButton35.Enabled = true;
                    LinkButton29.Enabled = true;
                    LinkButton30.Enabled = false;
                    LinkButton27.Enabled = false;
                    LinkButton24.Enabled = false;
                    LinkButton21.Enabled = false;
                    LinkButton18.Enabled = false;
                    LinkButton16.Enabled = false;
                    LinkButton13.Enabled = false;
                    LinkButton9.Enabled = false;
                    LinkButton7.Enabled = false;
                    LinkButton10.Enabled = false;
                    Newuser.Visible = false;

                }
            }


            string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();
                string RowCounter = "SELECT COUNT(*) FROM Loanadder_tbl3";
                SqlCommand cmd = new SqlCommand(RowCounter, sqlCon);
                double counter = Convert.ToUInt32(cmd.ExecuteScalar());
                sqlCon.Close();
            }

            //end of using

            //-----------------------Count Pledge Pending Records-----------------------------------

            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();
                string RowCounter = "SELECT count(*) FROM [Wak_update_temp]";
                SqlCommand cmd = new SqlCommand(RowCounter, sqlCon);
                double counter = Convert.ToUInt32(cmd.ExecuteScalar());
                //VaultLblForUpdate.Text = counter.ToString();
                sqlCon.Close();
            } //end of using

            using (SqlConnection sqlCon = new SqlConnection(connectionString))
            {
                sqlCon.Open();
                string RowCounter = "SELECT count(*) FROM [RTD_Pending_Update]";
                SqlCommand cmd = new SqlCommand(RowCounter, sqlCon);
                double counter = Convert.ToUInt32(cmd.ExecuteScalar());
                //DeedsLblForUpdate.Text = counter.ToString();
                sqlCon.Close();
            } //end of using
        }

        protected void Newuser_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("register.aspx");
        }

        protected void LinkButton18_Click(object sender, EventArgs e)
        {

        }

        protected void signout_Click1(object sender, ImageClickEventArgs e)
        {

            Session.Abandon();
            Session.Contents.RemoveAll();
            Response.Redirect("signout.aspx");

        }


    }
}