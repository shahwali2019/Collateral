using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using OfficeOpenXml;
using System.IO;

namespace Collateral_int
{
    public partial class acgf_records : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
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

                if (Access_role == null)
                {
                    Response.Redirect("Loging.aspx");
                    Session.Remove("loading");
                }
            }
            }

        protected void searchBtn_Click(object sender, EventArgs e)
        {
            //by all
            if (string.IsNullOrEmpty(txtbname.Text) && string.IsNullOrEmpty(txtCode.Text) && string.IsNullOrEmpty(txtLog.Text) && statusList.SelectedValue == "GC")

            {
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM acgf";
                SqlCommand cmd = new SqlCommand(sqlQuery, sqlCon);
                cmd.ExecuteNonQuery();
                SqlDataAdapter DA = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DA.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                sqlCon.Close();
                int counter = GridView1.Rows.Count;
                resultLbl.Visible = true;
                resultLbl.Text = "All Records";
            }
            //---Search by name
            if (!string.IsNullOrEmpty(txtbname.Text) && string.IsNullOrEmpty(txtCode.Text) && string.IsNullOrEmpty(txtLog.Text) && statusList.SelectedValue == "GC")

            {
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM acgf where [Borrower Name] LIKE '%" + txtbname.Text.Trim() + "%'";
                SqlCommand cmd = new SqlCommand(sqlQuery, sqlCon);
                cmd.ExecuteNonQuery();
                SqlDataAdapter DA = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DA.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                sqlCon.Close();
                int counter = GridView1.Rows.Count;
                resultLbl.Visible = true;
                if (counter <= 1)
                {
                    resultLbl.Text = "Found " + counter + " Record.";
                }
                else
                    resultLbl.Text = "Found " + counter + " Record(s).";
            }
            //by LOG no
            if (string.IsNullOrEmpty(txtbname.Text) && string.IsNullOrEmpty(txtCode.Text) && !string.IsNullOrEmpty(txtLog.Text) && statusList.SelectedValue == "GC")
            {
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM acgf where [LOG No] = '" + txtLog.Text.Trim() + "'";
                SqlCommand cmd = new SqlCommand(sqlQuery, sqlCon);
                cmd.ExecuteNonQuery();
                SqlDataAdapter DA = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DA.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                sqlCon.Close();
                int counter = GridView1.Rows.Count;
                resultLbl.Visible = true;
                if (counter <= 1)
                {
                    resultLbl.Text = "Found " + counter + " Record.";
                }
                else
                    resultLbl.Text = "Found " + counter + " Record(s).";
            }


            //by CODE
            if (string.IsNullOrEmpty(txtbname.Text) && !string.IsNullOrEmpty(txtCode.Text) && string.IsNullOrEmpty(txtLog.Text) && statusList.SelectedValue == "GC")
            {
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM acgf where [Product Code] = '" + txtCode.Text.Trim() + "'";
                SqlCommand cmd = new SqlCommand(sqlQuery, sqlCon);
                cmd.ExecuteNonQuery();
                SqlDataAdapter DA = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DA.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                sqlCon.Close();
                int counter = GridView1.Rows.Count;
                resultLbl.Visible = true;
                if (counter <= 1)
                {
                    resultLbl.Text = "Found " + counter + " Record.";
                }
                else
                    resultLbl.Text = "Found " + counter + " Record(s).";

            }


            //by GC
            if (string.IsNullOrEmpty(txtbname.Text) && string.IsNullOrEmpty(txtCode.Text) && string.IsNullOrEmpty(txtLog.Text) && statusList.SelectedValue != "GC")
            {
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM acgf where [Guarantee Claimed] = '" +statusList.SelectedValue + "'";
                SqlCommand cmd = new SqlCommand(sqlQuery, sqlCon);
                cmd.ExecuteNonQuery();
                SqlDataAdapter DA = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                DA.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
                sqlCon.Close();
                int counter = GridView1.Rows.Count;
                resultLbl.Visible = true;
                if (counter <= 1)
                {
                    resultLbl.Text = "Found " + counter + " Record.";
                }
                else
                    resultLbl.Text = "Found " + counter + " Record(s).";
            }
        }
        protected void chkb1_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox ChkBoxHeader = (CheckBox)GridView1.HeaderRow.FindControl("chkb1");
            foreach (GridViewRow row in GridView1.Rows)
            {
                CheckBox ChkBoxRows = (CheckBox)row.FindControl("chkSelect");
                if (ChkBoxHeader.Checked == true)
                {
                    ChkBoxRows.Checked = true;
                }
                else
                {
                    ChkBoxRows.Checked = false;
                }
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //------------------------------
            if (e.CommandName == "Select")
            {
                string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                Session["acgf_id"] = e.CommandArgument.ToString();
                SqlConnection sqlCon = new SqlConnection(connectionString);
                string query = "SELECT *FROM acgf WHERE id = '" + Session["acgf_id"].ToString() + "'";
                SqlCommand sqlcmd = new SqlCommand(query, sqlCon);
                sqlCon.Open();
                SqlDataReader rdr = sqlcmd.ExecuteReader();
                if (rdr.Read())
                {
                    Session["id"] = (string)rdr["id"].ToString();
                    Session["bname"] = (string)rdr["Borrower Name"].ToString();
                    Session["fan"] = (string)rdr["Faciliy Approval No"].ToString();
                    Session["pc"] = (string)rdr["Product Code"].ToString();
                    Session["log"] = (string)rdr["LOG No"].ToString();
                    Session["MDF"] = (string)rdr["Maturity Date of Facility"].ToString();
                    Session["ACGF"] = (string)rdr["ACGF Expiry Date"].ToString();
                    Session["GC"] = (string)rdr["Guarantee Claimed"].ToString();
                    Session["Remark"] = (string)rdr["Remark"].ToString();
                    Session["IB"] = (string)rdr["InsertedBy"].ToString();
                    Session["AB"] = (string)rdr["Approved By"].ToString();
                    Session["UB"] = (string)rdr["Updated By"].ToString();
                    sqlCon.Close();
                }
                Response.Redirect("addNEW_acgf.aspx");
            }
            //End of Gridview ROW_COMMAND
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            string fullUsername = User.Identity.Name;
            string username = fullUsername.Substring(fullUsername.IndexOf("\\") + 1);

            SqlDataAdapter sda = new SqlDataAdapter("select * from [userMng] where username= '" + username + "'", connectionString);
            DataTable dtResult = new DataTable();
            sda.Fill(dtResult);

            string userType = dtResult.Rows[0]["Access_role"].ToString();

            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                if (userType == "Supper Admin")
                {
                    e.Row.Cells[1].Enabled = false;

                }
                if (userType == "Admin")
                {
                    e.Row.Cells[1].Enabled = false;
                }

                if (userType == "Users")
                {
                    e.Row.Cells[1].Enabled = true;
                }
            }
        }


    }
}