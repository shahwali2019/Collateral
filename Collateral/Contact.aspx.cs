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
    public partial class Contact : Page
    {
        static string StrCon = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            string fullUsername = User.Identity.Name;
            int index_domain = fullUsername.IndexOf("AIB\\");
            string username = fullUsername.Substring(fullUsername.IndexOf("\\") + 1);
            string qry = string.Empty;
            qry = "select [Access_role] from [userMng] where username='" + username + "'";
            SqlConnection con = new SqlConnection(StrCon);
            con.Open();
            SqlCommand cmd = new SqlCommand(qry, con);

            string Access_role = Convert.ToString(cmd.ExecuteScalar());

            if (string.IsNullOrEmpty(Access_role))
            {
                Response.Redirect("error.aspx?ReturnPath=" + Server.UrlEncode(Request.Url.AbsoluteUri));
            }
            if (Access_role == "4")
            {
                Server.Transfer("register.aspx");
                



            }
        }
    }
}