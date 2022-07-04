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
    public partial class LLR_View : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                //this.BindGrid();
                Pupulategv();

            }
        }

        void Pupulategv()

        {
            DataTable dt = new DataTable();
            using (SqlConnection sql = new SqlConnection(connectionString))
            {
                sql.Open();
                SqlDataAdapter sqlda = new SqlDataAdapter("select * from LoanDetail ", sql);
                sqlda.Fill(dt);
            }

            if (dt.Rows.Count > 0)
            {
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            else
            {
                dt.Rows.Add(dt.NewRow());
                GridView1.DataSource = dt;
                GridView1.DataBind();
                GridView1.Rows[0].Cells.Clear();
                GridView1.Rows[0].Cells.Add(new TableCell());
                GridView1.Rows[0].Cells[0].ColumnSpan = dt.Columns.Count;
                GridView1.Rows[0].Cells[0].Text = " no data found";
                GridView1.Rows[0].Cells[0].HorizontalAlign = HorizontalAlign.Center;
            }
        }
        protected void searchBtn_Click(object sender, EventArgs e)
        {

        }

        protected void excelExporter_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void addNew_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("LLR_Insert.aspx");
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            string fullUsername = User.Identity.Name;
            int index_domain = fullUsername.IndexOf("AIB\\");
            string username = fullUsername.Substring(fullUsername.IndexOf("\\") + 1);

            string id = e.CommandArgument.ToString();
           // string id1 = e.CommandArgument.ToString();
            string employees_name = fullUsername.Substring(fullUsername.IndexOf("\\") + 1);
            //if (e.CommandName != "edit")
            //{
            //    Response.Write("dddddddd");
            //}

            if (e.CommandName == "edit")
            {
                Session["olds_id"] = e.CommandArgument.ToString();
                SqlConnection sqlCon = new SqlConnection(connectionString);
                string query = "SELECT *FROM [LoanDetail] WHERE LoanID = '" + Session["olds_id"].ToString() + "'";
                SqlCommand sqlcmd = new SqlCommand(query, sqlCon);
                sqlCon.Open();
                SqlDataReader rdr = sqlcmd.ExecuteReader();
                if (rdr.Read())
                {
                    //READ THE DATA FROM COLLATERAL DATABASE AND SAVE THEM INTO SESSION
                    Session["LoanID"] = (string)rdr["LoanID"].ToString();
                    Session["BorrowerName"] = (string)rdr["BorrowerName"].ToString();
                    Session["AccountNumber"] = (string)rdr["AccountNumber"].ToString();
                    Session["ins_by"] = (string)rdr["Inserted By"].ToString(); //  [Updated By]
                    sqlCon.Close();
                    sqlCon.Dispose();

                    Response.Redirect("LL_Details.aspx");
                }
            }


            //if (e.CommandName == "Delete")
            //{
            //    using (SqlConnection conn = new SqlConnection(connectionString))
            //    {
            //        using (SqlCommand comm = new SqlCommand())
            //        {
            //            comm.Connection = conn;
            //            conn.Open();
            //            comm.CommandType = CommandType.StoredProcedure;
            //            comm.CommandText = "sp_deletelog_LoanDetails";
            //            //comm.CommandText = "sp_deletelog_Loandetail_records";
            //            comm.Parameters.AddWithValue("@LoanID", id);
            //           // comm.Parameters.AddWithValue("@LoanRecoveryID", id1);
            //            comm.Parameters.AddWithValue("@employees_name", employees_name);
            //            GridView1.EditIndex = -1;

            //            lblerrormessage.Text = "Selected Row Deleted";

            //            if (comm.ExecuteNonQuery() > 0)
            //            {
            //                Pupulategv();
            //            }
            //            else
            //            {
            //                Response.Write("<script>alert('Failed')</script>");
            //            }
            //            conn.Close();
            //        }
            //    }
            //}
        }

        protected void chkb1_CheckedChanged(object sender, EventArgs e)
        {

        }
    }
}