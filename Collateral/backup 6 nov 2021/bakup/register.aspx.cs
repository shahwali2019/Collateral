using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
namespace Collateral
{
    public partial class register : System.Web.UI.Page
    {
        static string StrCon = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
        SqlConnection con = new SqlConnection(StrCon);
        protected void Page_Load(object sender, EventArgs e)
        {
            //string fullUsername = User.Identity.Name;
            //int index_domain = fullUsername.IndexOf("AIB\\");
            //string username = fullUsername.Substring(fullUsername.IndexOf("\\") + 1);
            //string qry = string.Empty;
            //qry = "select [Access_role] from [userMng] where username='" + username + "'";
            //SqlConnection con = new SqlConnection(StrCon);
            //con.Open();
            //SqlCommand cmd = new SqlCommand(qry, con);

            //string Access_role = Convert.ToString(cmd.ExecuteScalar());

            //if (string.IsNullOrEmpty(Access_role))
            //{
            //    Response.Redirect("error.aspx?ReturnPath=" + Server.UrlEncode(Request.Url.AbsoluteUri));
            //}
            //if (Access_role == "4")
            //{
            //    //Server.Transfer("register.aspx");
                
                
            //}
        }

        protected void Save(object sender, EventArgs e)
        {
            string constr = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT * FROM userMng WHERE username = @username", con))
                {
                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        con.Open();
                        cmd.Parameters.AddWithValue("@username", this.txtusername.Text.Trim());
                        DataSet ds = new DataSet();
                        da.Fill(ds);
                        if (ds.Tables[0].Rows.Count > 0)
                        {

                            this.lblerrormessage.Text = "The Username is already existed! Please try again";
                        }
                        else
                        {
                            using (SqlConnection con2 = new SqlConnection(constr))
                            {
                                using (SqlCommand cmd2 = new SqlCommand("INSERT INTO userMng VALUES(@username,@Access_role, @CreatedBy, @Date)", con2))
                                {
                                    string fullUsername = User.Identity.Name;
                                    int index_domain = fullUsername.IndexOf("AIB\\");
                                    string CreatedBy = fullUsername.Substring(fullUsername.IndexOf("\\") + 1);

                                    string date = DateTime.Now.ToString();
                                    con2.Open();
                                    cmd2.Parameters.AddWithValue("@username", this.txtusername.Text.Trim());
                                    cmd2.Parameters.AddWithValue("@Access_role", this.DropDownList1.SelectedValue.Trim());
                                    cmd2.Parameters.AddWithValue("@CreatedBy", CreatedBy);
                                    cmd2.Parameters.AddWithValue("@Date", date);
                                    cmd2.ExecuteNonQuery();
                                    con2.Close();
                                }
                            }
                            lblMessage.Visible = true;
                            this.lblMessage.Text = "New User Inserted Sucessfully";
                        }

                    }
                }
            }
        }
    }
}