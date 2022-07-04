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

namespace Collateral
{
    public partial class MTR : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                Session["mrt_id"] = e.CommandArgument.ToString();
                string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                string query = "SELECT *FROM [mtr] where id = '" + Session["mrt_id"].ToString() + "'";
                SqlCommand sqlcmd = new SqlCommand(query, sqlCon);
                sqlCon.Open();
                SqlDataReader rdr = sqlcmd.ExecuteReader();
                if (rdr.Read())
                {
                    Session["id"] = (string)rdr["id"].ToString();
                    Session["val2"] = (string)rdr["Client Name"].ToString();
                    Session["val3"] = (string)rdr["Memo Ref"].ToString();
                    Session["val4"] = (string)rdr["Debit Account"].ToString();
                    Session["val5"] = (string)rdr["Credit Account"].ToString();
                    Session["val6"] = (string)rdr["Transaction Code"].ToString();
                    Session["val7"] = (string)rdr["Memo Submission"].ToString();
                    Session["val8"] = (string)rdr["Amount"].ToString();
                    Session["val9"] = (string)rdr["Currency"].ToString();
                    Session["val10"] = (string)rdr["Heading"].ToString();
                    Session["val11"] = (string)rdr["Transaction Detail"].ToString();
                    Session["val12"] = (string)rdr["Booding Date"].ToString();
                    Session["val13"] = (string)rdr["Value Date"].ToString();
                    Session["val14"] = (string)rdr["Status"].ToString();
                    Session["val15"] = (string)rdr["Remark"].ToString();
                    sqlCon.Close();

                }
                Response.Redirect("addnewmtr.aspx");
            }
        }

        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {

        }

        protected void ImageButton2_Click1(object sender, ImageClickEventArgs e)
        {

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

        protected void searchBtn_Click(object sender, EventArgs e)
        {
            //----------------------
            if (string.IsNullOrEmpty(txtCname.Text) && string.IsNullOrEmpty(txtBD.Text))
            {
                string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM [mtr]";
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
            if (!string.IsNullOrEmpty(txtCname.Text) && string.IsNullOrEmpty(txtBD.Text))
            {
                string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM [mtr] where [Client Name] like '%" + txtCname.Text + "%'";
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

            if (string.IsNullOrEmpty(txtCname.Text) && string.IsNullOrEmpty(txtBD.Text))
            {
                string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM [mtr] where [Booding Date]= '" + txtBD.Text + "'";
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

            if (!string.IsNullOrEmpty(txtCname.Text) && !string.IsNullOrEmpty(txtBD.Text))
            {
                string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM [mtr] where [Client Name] like '%" + txtCname.Text + "%' AND [Booding Date] LIKE '%" + txtBD.Text + "%'";
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
        }

        protected void ConvertTOExc_Click(object sender, ImageClickEventArgs e)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("Client Name");
            dt.Columns.Add("Memo Ref");
            dt.Columns.Add("Debit Account");
            dt.Columns.Add("Credit Account");
            dt.Columns.Add("Transaction Code");
            dt.Columns.Add("Memo Submission");
            dt.Columns.Add("Amount");
            dt.Columns.Add("Currency");
            dt.Columns.Add("Heading");
            dt.Columns.Add("Transaction Detail");
            dt.Columns.Add("Booding Date");
            dt.Columns.Add("Value Date");
            dt.Columns.Add("Status");
            dt.Columns.Add("Remark");
            dt.Columns.Add("InsertedBy");
            dt.Columns.Add("ApprovedBy");
            dt.Columns.Add("UpdatedBy");
            foreach (GridViewRow gw in GridView1.Rows)
            {
                var chkSelect = gw.FindControl("chkSelect") as CheckBox;
                if (chkSelect.Checked)
                {
                    string Val1 = (gw.FindControl("Label2") as Label).Text; //
                    string Val2 = (gw.FindControl("Label3") as Label).Text; //
                    string Val3 = (gw.FindControl("Label4") as Label).Text; //
                    string Val4 = (gw.FindControl("Label5") as Label).Text; //
                    string Val5 = (gw.FindControl("Label6") as Label).Text; //
                    string Val6 = (gw.FindControl("Label7") as Label).Text; //
                    string Val7 = (gw.FindControl("Label8") as Label).Text; //
                    string Val8 = (gw.FindControl("Label9") as Label).Text; //
                    string Val9 = (gw.FindControl("Label10") as Label).Text; //
                    string Val10 = (gw.FindControl("Label11") as Label).Text; //
                    string Val11 = (gw.FindControl("Label12") as Label).Text; //
                    string Val12 = (gw.FindControl("Label13") as Label).Text; //
                    string Val13 = (gw.FindControl("Label14") as Label).Text; //
                    string Val14 = (gw.FindControl("Label15") as Label).Text; //
                    string Val15 = (gw.FindControl("Label16") as Label).Text; //
                    string Val16 = (gw.FindControl("Label17") as Label).Text; //
                    dt.Rows.Add(Val1, Val2, Val3, Val4, Val5, Val6, Val7, Val8, Val9, Val10, Val11, Val12, Val13, Val14, Val15, Val16);
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
                Response.AddHeader("content-disposition", "attachment;  filename=mtrreport.xlsx");
                excel.SaveAs(memoryStream);
                memoryStream.WriteTo(Response.OutputStream);
                Response.Flush();
                Response.End();
            }
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
                   // addNew.Enabled = false;

                }
                if (userType == "Admin")
                {
                    e.Row.Cells[1].Enabled = false;
                  //  addNew.Enabled = false;
                }

                if (userType == "Users")
                {
                    e.Row.Cells[1].Enabled = true;
                }
            }
        }
    }
}