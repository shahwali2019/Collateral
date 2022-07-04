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

                 if (Access_role == "4")
                {
                    Server.Transfer("register.aspx");
                    Newuser.Visible = true;
                    
                }
                
                 else if (Access_role == "2"  || Access_role == "3")
                {
                    //Server.Transfer("register.aspx");
                    LinkButton28.Visible = false;
                    LinkButton25.Visible = false;
                    LinkButton22.Visible = false;
                    LinkButton19.Visible = false;
                    LinkButton17.Visible = false;
                    LinkButton14.Visible = false;
                    LinkButton8.Visible = false;
                    LinkButton6.Visible = false;
                    LinkButton5.Visible = false;
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