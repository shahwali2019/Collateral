using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Collateral
{
    public partial class Test : System.Web.UI.Page
    {
        static string StrCon = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
        SqlConnection con = new SqlConnection(StrCon);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bind();
            }
        }

        public void bind()
        {
            SqlCommand cmd = new SqlCommand("select * from DayToDayTbl", con);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            da.Fill(ds, "con");
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "comdel1")
            {

                int l = Convert.ToInt32(e.CommandArgument);
                con.Open();
                SqlCommand cmd = new SqlCommand("delete from DayToDayTbl where id=@id", con);
                cmd.Parameters.AddWithValue("@id", l);
                int i = cmd.ExecuteNonQuery();
                if (i == 1)
                {

                    Response.Write("<p style='color: #FF0000; font-size: 14pt'>Record deleted");
                    bind();
                }

                else
                {
                    Response.Write("Recodrd not deleted...");
                }

                Page_Load(sender, e);
            }
        }
    }
}