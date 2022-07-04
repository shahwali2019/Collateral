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
    public partial class DaytoDay : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void searchBtn_Click(object sender, EventArgs e)
        {
            //----------------------
            if (string.IsNullOrEmpty(txtbname.Text) && string.IsNullOrEmpty(txtCode.Text) && FacilityType.SelectedValue == "FT")
            {
                string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM [DayToDayTbl]";
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
            if (!string.IsNullOrEmpty(txtbname.Text) && string.IsNullOrEmpty(txtCode.Text) && FacilityType.SelectedValue == "FT")
            {
                string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM [DayToDayTbl] where [Account Name] like '%" + txtbname.Text + "%'";
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

            if (string.IsNullOrEmpty(txtbname.Text) && !string.IsNullOrEmpty(txtCode.Text) && FacilityType.SelectedValue == "FT")
            {
                string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM [DayToDayTbl] where [Approval Number] like '%" + txtCode.Text + "%'";
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


            if (string.IsNullOrEmpty(txtbname.Text) && string.IsNullOrEmpty(txtCode.Text) && FacilityType.SelectedValue != "FT")
            {
                string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM [LCR] where [Condition Status]= '" + FacilityType.SelectedValue + "'";
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


            if (!string.IsNullOrEmpty(txtbname.Text) && !string.IsNullOrEmpty(txtCode.Text) && FacilityType.SelectedValue == "FT")
            {
                string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM [DayToDayTbl] where [Approval Number] like '%" + txtCode.Text + "%' AND [Account Name] LIKE '%" + txtbname.Text + "%'";
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
        protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("Account Name");
            dt.Columns.Add("Approval Number");
            dt.Columns.Add("Facility Type");
            dt.Columns.Add("Facility Amount");
            dt.Columns.Add("Currency");
            dt.Columns.Add("Action Taken");
            dt.Columns.Add("TFL Instructed On");
            dt.Columns.Add("Confirmed By");
            dt.Columns.Add("Date of Boking");
            dt.Columns.Add("CMLA SignOff Date");
            dt.Columns.Add("Remark");
            dt.Columns.Add("Inserted By");
            dt.Columns.Add("Updated By");
            dt.Columns.Add("Approved By");

            foreach (GridViewRow gw in GridView1.Rows)
            {
                var chkSelect = gw.FindControl("chkSelect") as CheckBox;
                if (chkSelect.Checked)
                {
                    string Val1 = (gw.FindControl("Label2") as Label).Text;//
                    string Val2 = (gw.FindControl("Label3") as Label).Text;//
                    string Val3 = (gw.FindControl("Label4") as Label).Text;//
                    string Val4 = (gw.FindControl("Label5") as Label).Text;//
                    string Val5 = (gw.FindControl("Label6") as Label).Text;//
                    string Val6 = (gw.FindControl("Label7") as Label).Text;//
                    string Val7 = (gw.FindControl("Label8") as Label).Text;//
                    string Val8 = (gw.FindControl("Label9") as Label).Text;//
                    string Val9 = (gw.FindControl("Label10") as Label).Text;//
                    string Val10 = (gw.FindControl("Label11") as Label).Text;//
                    string Val11 = (gw.FindControl("Label12") as Label).Text;//
                    string Val12 = (gw.FindControl("Label13") as Label).Text;//
                    string Val13 = (gw.FindControl("Label14") as Label).Text;//
                    string Val14 = (gw.FindControl("Label15") as Label).Text;//
                    dt.Rows.Add(Val1,Val2, Val3, Val4, Val5, Val6, Val7, Val8, Val9, Val10, Val11, Val12, Val13, Val14);
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
            if (e.CommandName == "Edit")
            {
                Session["dod_id"] = e.CommandArgument.ToString();
                string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                string query = "SELECT *FROM [DayToDayTbl] where id = '" + Session["dod_id"].ToString() + "'";
                SqlCommand sqlcmd = new SqlCommand(query, sqlCon);
                sqlCon.Open();
                SqlDataReader rdr = sqlcmd.ExecuteReader();
                if (rdr.Read())
                {
                    Session["id"] = (string)rdr["id"].ToString();
                    Session["acn"] = (string)rdr["Account Name"].ToString();
                    Session["appno"] = (string)rdr["Approval Number"].ToString();
                    Session["ftype"] = (string)rdr["Facility Type"].ToString();
                    Session["famount"] = (string)rdr["Facility Amount"].ToString();
                    Session["currency"] = (string)rdr["Currency"].ToString();
                    Session["actoken"] = (string)rdr["Action Taken"].ToString();
                    Session["tflinfs"] = (string)rdr["TFL Instructed On"].ToString();
                    Session["confby"] = (string)rdr["Confirmed By"].ToString();
                    Session["dboking"] = (string)rdr["Date of Boking"].ToString();
                    Session["csnoofdate"] = (string)rdr["CMLA SignOff Date"].ToString();
                    Session["Remark"] = (string)rdr["Remark"].ToString();
                    sqlCon.Close();

                }
                Response.Redirect("AddnewDaytoDayRecords");
            }
        }
    }
}