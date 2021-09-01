using OfficeOpenXml;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Collateral_int
{
    public partial class Loan__Covenant___Records : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            //URL Restriction
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
                //===================Validate back btn while updating records
                if (Session["id"] != null)
                {
                    Session.Remove("id");
                }
            }
        }

        protected void searchBtn_Click(object sender, EventArgs e)
        {
            //----------------------
            if (string.IsNullOrEmpty(txtComName.Text) && string.IsNullOrEmpty(txtAppNo.Text) && drop_down_facility_type.SelectedValue == "FT")
            {
                string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM [LCR]";
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
            //-------------------------
            if (!string.IsNullOrEmpty(txtComName.Text) && string.IsNullOrEmpty(txtAppNo.Text) && drop_down_facility_type.SelectedValue == "FT")
            {
                string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM [LCR] where [Customer Name] like '%" + txtComName.Text + "%'";
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
            //-------------------------

            if (string.IsNullOrEmpty(txtComName.Text) && !string.IsNullOrEmpty(txtAppNo.Text) && drop_down_facility_type.SelectedValue == "FT")
            {
                string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM [LCR] where [Approval Name] like '%" + txtAppNo.Text + "%'";
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
            //-------------------------


            if (string.IsNullOrEmpty(txtComName.Text) && string.IsNullOrEmpty(txtAppNo.Text) && drop_down_facility_type.SelectedValue != "FT")
            {
                string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM [LCR] where [Condition Status]= '" + drop_down_facility_type.SelectedValue + "'";
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
            //-------------------------


            if (!string.IsNullOrEmpty(txtComName.Text) && !string.IsNullOrEmpty(txtAppNo.Text) && drop_down_facility_type.SelectedValue == "FT")
            {
                string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM [LCR] where [Approval Name] like '%" + txtAppNo.Text + "%' AND [Customer Name] LIKE '%" + txtComName.Text + "%'";
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
            //-------------------------

            if (!string.IsNullOrEmpty(txtComName.Text) && string.IsNullOrEmpty(txtAppNo.Text) && drop_down_facility_type.SelectedValue != "FT")
            {
                string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM [LCR] where [Customer Name] like '%" + txtComName.Text + "%' AND [Condition Status] = '" + drop_down_facility_type.SelectedValue + "'";
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
            //-------------------------

            if (string.IsNullOrEmpty(txtComName.Text) && !string.IsNullOrEmpty(txtAppNo.Text) && drop_down_facility_type.SelectedValue != "FT")
            {
                string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM [LCR] where [Approval Name] like '%" + txtAppNo.Text + "%' AND [Condition Status] = '" + drop_down_facility_type.SelectedValue + "'";
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
            //-------------------------

            if (!string.IsNullOrEmpty(txtComName.Text) && !string.IsNullOrEmpty(txtAppNo.Text) && drop_down_facility_type.SelectedValue != "FT")
            {
                string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM [LCR] where [Customer Name] like '%" + txtComName.Text + "%' AND [Approval Name] like '%" + txtAppNo.Text + "%' AND [Condition Status] = '" + drop_down_facility_type.SelectedValue + "'";
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

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "edit")
            {
                Session["lcr_id"] = e.CommandArgument.ToString();
                SqlConnection sqlCon = new SqlConnection(connectionString);
                string query = "SELECT *FROM [LCR] WHERE id = '" + Session["lcr_id"].ToString() + "'";
                SqlCommand sqlcmd = new SqlCommand(query, sqlCon);
                sqlCon.Open();
                SqlDataReader rdr = sqlcmd.ExecuteReader();
                if (rdr.Read())
                {
                    //READ THE DATA FROM COLLATERAL DATABASE AND SAVE THEM INTO SESSION
                    Session["id"] = (string)rdr["id"].ToString();                                   //"(" +
                    Session["cm"] = (string)rdr["Customer Name"].ToString();                  //"@id," +
                    Session["appname"] = (string)rdr["Approval Name"].ToString();                  //"@cm," +
                    Session["dod"] = (string)rdr["Date of Disbursement"].ToString();           //"@duedate," +
                    Session["conds"] = (string)rdr["Conditions"].ToString();                     //"@appname," +
                    Session["duedate"] = (string)rdr["Due Date"].ToString();                       //"@constus," +
                    Session["constus"] = (string)rdr["Condition Status"].ToString();               //"@dod," +
                    Session["remark"] = (string)rdr["Remark"].ToString();                         //"@remark," +
                    Session["is"] = (string)rdr["Inserted By"].ToString();                    //"@conds," +
                    Session["ub"] = (string)rdr["Updated By"].ToString();                     //"@is," +
                    Session["ap"] = (string)rdr["Approved By"].ToString();                   //"@ub)";
                    sqlCon.Close();
                    sqlCon.Dispose();
                    Response.Redirect("newLCR.aspx");
                }
            }
        }

        protected void excelExporter_Click(object sender, ImageClickEventArgs e)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("Customer Name");
            dt.Columns.Add("Approval Name");
            dt.Columns.Add("Date of Disbursement");
            dt.Columns.Add("Conditions");
            dt.Columns.Add("Due Date");
            dt.Columns.Add("Condition Status");
            dt.Columns.Add("Remark");
            dt.Columns.Add("Inserted By");
            dt.Columns.Add("Updated By");
            dt.Columns.Add("Approved By");

            foreach (GridViewRow gw in GridView1.Rows)
            {
                var chkSelect = gw.FindControl("chkSelect") as CheckBox;
                if (chkSelect.Checked)
                {
                    //string Val1 = (gw.FindControl("Label2") as Label).Text;//
                    string Val2 = (gw.FindControl("Label3") as Label).Text;//
                    string Val3 = (gw.FindControl("Label4") as Label).Text;//
                    string Val4 = (gw.FindControl("Label5") as Label).Text;//
                    string Val5 = (gw.FindControl("Label6") as Label).Text;//
                    string Val6 = (gw.FindControl("Label7") as Label).Text;//
                    string Val7 = (gw.FindControl("Label8") as Label).Text;//
                    string Val8 = (gw.FindControl("Label9") as Label).Text;//
                    string Val9 = (gw.FindControl("Label10") as Label).Text;//
                    string Val11 = (gw.FindControl("Label11") as Label).Text;//
                    string Val12 = (gw.FindControl("Label12") as Label).Text;//
                    dt.Rows.Add( Val2, Val3, Val4, Val5, Val6, Val7, Val8, Val9, Val11, Val12);
                }
            }
            //--------------------------------
            var products = dt;
            ExcelPackage excel = new ExcelPackage();
            var workSheet = excel.Workbook.Worksheets.Add("LoanDocReg");
            var totalCols = products.Columns.Count;
            var totalRows = products.Rows.Count;

            for (var col = 1; col <= totalCols; col++)
            {
                workSheet.Cells[1, col].Value = products.Columns[col - 1].ColumnName;
            }
            for (var row = 1; row <= totalRows; row++)
            {
                for (var col = 0; col < totalCols; col++)
                {
                    workSheet.Cells[row + 1, col + 1].Value = products.Rows[row - 1][col];
                }
            }
            using (var memoryStream = new MemoryStream())
            {
                Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                Response.AddHeader("content-disposition", "attachment;  filename=LoanDocumentRegister.xlsx");
                excel.SaveAs(memoryStream);
                memoryStream.WriteTo(Response.OutputStream);
                Response.Flush();
                Response.End();
            }
        }

        protected void addNew_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("newLCR.aspx");
        }

        //protected void searchBtn_Click(object sender, EventArgs e)
        //{

        //}


        protected void chkb1_CheckedChanged1(object sender, EventArgs e)
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

        //protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        //{

        //}

        //protected void addNew_Click(object sender, ImageClickEventArgs e)
        //{

        //}

        //protected void excelExporter_Click(object sender, ImageClickEventArgs e)
        //{

        //}
    }
}