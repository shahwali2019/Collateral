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
            if (!this.IsPostBack)
            {
                this.BindGrid();
                bind();
            }
        }

        public void bind()
        {
            //SqlCommand cmd = new SqlCommand("select * from DayToDayTbl", con);
            //SqlDataAdapter da = new SqlDataAdapter(cmd);
            //DataSet ds = new DataSet();
            //da.Fill(ds, "con");
            //GridView1.DataSource = ds;
            //GridView1.DataBind();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //if (e.CommandName == "comdel1")
            //{

            //    int l = Convert.ToInt32(e.CommandArgument);
            //    con.Open();
            //    SqlCommand cmd = new SqlCommand("delete from DayToDayTbl where id=@id", con);
            //    cmd.Parameters.AddWithValue("@id", l);
            //    int i = cmd.ExecuteNonQuery();
            //    if (i == 1)
            //    {

            //        Response.Write("<p style='color: #FF0000; font-size: 14pt'>Record deleted");
            //        bind();
            //    }

            //    else
            //    {
            //        Response.Write("Recodrd not deleted...");
            //    }

            //    Page_Load(sender, e);
            //}
        }

        private void BindGrid()
        {
            string conn = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
            using (SqlConnection con = new SqlConnection(conn))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT customerno,Number,Number1,Number2,Total FROM calculate", con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            gvCustomers.DataSource = dt;
                            gvCustomers.DataBind();
                        }
                    }
                }
            }
        }

        protected void subbtn_Click(object sender, EventArgs e)
        {


            //string num;
            int num2;

            num2 = 40;

            //string total;
            //num = txtnumber.Text;
            // num1 = txtnumber1.Text;
            //num2 = txtnumber2.Text;

            //total = num - num1;


            //Response.Write(total);
            int a = Convert.ToInt32(txtnumber.Text);
            int b = Convert.ToInt32(txtnumber1.Text);
            int c = b - a;
            int t = c * num2;
            txttotal.Text = t.ToString();


            int recordsInserted = 0;

            string sql = "IF NOT EXISTS(SELECT id FROM calculate WHERE customerno = @customerno and Number = @Number and Number1 = @Number1 and Total = @Total) ";
            sql += "BEGIN ";
            sql += "INSERT INTO calculate (customerno,Number, Number1, Total) VALUES(@customerno,@Number, @Number1, @Total) ";
            sql += "END";

            string conString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlCommand cmd = new SqlCommand(sql))
                {

                    cmd.Connection = con;
                    cmd.Parameters.AddWithValue("@customerno", txtid.Text);
                    cmd.Parameters.AddWithValue("@Number", a);
                    cmd.Parameters.AddWithValue("@Number1", b);
                    cmd.Parameters.AddWithValue("@Total", t);
                    con.Open();
                    recordsInserted = cmd.ExecuteNonQuery();
                    con.Close();
                }
            }

            this.BindGrid();

            if (recordsInserted == -1)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Duplicate record. Please insert Unique data.');", true);
            }




        }
    }
}