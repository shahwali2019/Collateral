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
    public partial class ldr_records : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

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
                sqlQuery = "SELECT *FROM [LoanReg_tbl]";
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
                    resultLbl.Text = "Found" + counter + " Record.";
                }
                else

                    resultLbl.Text = "Found" + counter + " Record(s).";
            }
            //-------------------------
            if (!string.IsNullOrEmpty(txtComName.Text) && string.IsNullOrEmpty(txtAppNo.Text) && drop_down_facility_type.SelectedValue == "FT")
            {
                string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM [LoanReg_tbl] where [Company Name] like '%" + txtComName.Text + "%'";
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
                    resultLbl.Text = "Found" + counter + " Record.";
                }
                else

                    resultLbl.Text = "Found" + counter + " Record(s).";
            }
            //-------------------------

            if (string.IsNullOrEmpty(txtComName.Text) && !string.IsNullOrEmpty(txtAppNo.Text) && drop_down_facility_type.SelectedValue == "FT")
            {
                string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM [LoanReg_tbl] where [Approval Number] like '%" + txtAppNo.Text + "%'";
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
                    resultLbl.Text = "Found" + counter + " Record.";
                }
                else

                    resultLbl.Text = "Found" + counter + " Record(s).";
            }
            //-------------------------

            if (string.IsNullOrEmpty(txtComName.Text) && string.IsNullOrEmpty(txtAppNo.Text) && drop_down_facility_type.SelectedValue != "FT")
            {
                string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM [LoanReg_tbl] where [Facility Type]= '" + drop_down_facility_type.SelectedValue + "'";
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
                    resultLbl.Text = "Found" + counter + " Record.";
                }
                else

                    resultLbl.Text = "Found" + counter + " Record(s).";
            }
            //-------------------------

            if (!string.IsNullOrEmpty(txtComName.Text) && !string.IsNullOrEmpty(txtAppNo.Text) && drop_down_facility_type.SelectedValue == "FT")
            {
                string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM [LoanReg_tbl] where [Approval Number] like '%" + txtAppNo.Text + "%' AND [Company Name] LIKE '%" + txtComName.Text + "%'";
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
                    resultLbl.Text = "Found" + counter + " Record.";
                }
                else

                    resultLbl.Text = "Found" + counter + " Record(s).";
            }
            //-------------------------

            if (!string.IsNullOrEmpty(txtComName.Text) && string.IsNullOrEmpty(txtAppNo.Text) && drop_down_facility_type.SelectedValue != "FT")
            {
                string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM [LoanReg_tbl] where [Company Name] like '%" + txtComName.Text + "%' AND [Facility Type] = '" + drop_down_facility_type.SelectedValue + "'";
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
                    resultLbl.Text = "Found" + counter + " Record.";
                }
                else

                    resultLbl.Text = "Found" + counter + " Record(s).";
            }
            //-------------------------

            if (string.IsNullOrEmpty(txtComName.Text) && !string.IsNullOrEmpty(txtAppNo.Text) && drop_down_facility_type.SelectedValue != "FT")
            {
                string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM [LoanReg_tbl] where [Approval Number] like '%" + txtAppNo.Text + "%' AND [Facility Type] = '" + drop_down_facility_type.SelectedValue + "'";
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
                    resultLbl.Text = "Found" + counter + " Record.";
                }
                else

                    resultLbl.Text = "Found" + counter + " Record(s).";
            }
            //-------------------------

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "edit")
            {
                Session["Loan"] = e.CommandArgument.ToString();
                SqlConnection sqlCon = new SqlConnection(connectionString);
                string query = "SELECT *FROM [LoanReg_tbl] WHERE id = '" + Session["Loan"].ToString() + "'";
                SqlCommand sqlcmd = new SqlCommand(query, sqlCon);
                sqlCon.Open();
                SqlDataReader rdr = sqlcmd.ExecuteReader();
                if (rdr.Read())
                {
                    //READ THE DATA FROM COLLATERAL DATABASE AND SAVE THEM INTO SESSION
                    Session["id"] = (string)rdr["id"].ToString();
                    Session["rd"] = (string)rdr["Received Date"].ToString();
                    Session["company"] = (string)rdr["Company Name"].ToString();
                    Session["AppNo"] = (string)rdr["Approval Number"].ToString();
                    Session["FacType"] = (string)rdr["Facility Type"].ToString();
                    Session["DocType"] = (string)rdr["Document Received"].ToString();
                    Session["EnterBy"] = (string)rdr["Enter By"].ToString();
                    Session["2ndVerifier"] = (string)rdr["Second Verifier"].ToString();
                    Session["ComDate"] = (string)rdr["Completion Date"].ToString();
                    Session["Remark"] = (string)rdr["Remark"].ToString();
                    Session["ib"] = (string)rdr["Inserted By"].ToString();
                    sqlCon.Close();
                    sqlCon.Dispose();
                    Response.Redirect("newLRD_records.aspx");
                }
            }
        }
        protected void chkb1_CheckedChanged(object sender, EventArgs e)
        {

        }

        protected void excelExporter_Click(object sender, ImageClickEventArgs e)
        {

        }

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

        protected void excelExporter_Click1(object sender, ImageClickEventArgs e)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("Received Date");
            dt.Columns.Add("Company Name");
            dt.Columns.Add("Approval Number");
            dt.Columns.Add("Facility Type");
            dt.Columns.Add("Document Received");
            dt.Columns.Add("Enter By");
            dt.Columns.Add("Second Verifier");
            dt.Columns.Add("Completion Date");
            dt.Columns.Add("Remark");
            dt.Columns.Add("Approved By");

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
                    string Val11 = (gw.FindControl("Label13") as Label).Text; //
                    dt.Rows.Add(Val1, Val2, Val3, Val4, Val5, Val6, Val7, Val8, Val9, Val11);
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
            Response.Redirect("newLRD_records.aspx");
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
                    addNew.Enabled = false;

                }
                if (userType == "Admin")
                {
                    e.Row.Cells[1].Enabled = false;
                    addNew.Enabled = false;
                }

                if (userType == "Users")
                {
                    e.Row.Cells[1].Enabled = true;
                }
            }
        }
    }
}