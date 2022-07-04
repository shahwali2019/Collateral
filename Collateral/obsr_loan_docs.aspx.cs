using OfficeOpenXml;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Collateral
{
    public partial class obsr_loan_docs : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void excelExporter_Click(object sender, ImageClickEventArgs e)
        {
            DataTable dt = new DataTable();
            dt.Columns.Add("id");
            dt.Columns.Add("Document checking date");
            dt.Columns.Add("Borrower");
            dt.Columns.Add("Department");
            dt.Columns.Add("Purpose of Application");
            dt.Columns.Add("Case Number");
            dt.Columns.Add("Facility type");
            dt.Columns.Add("Currency");
            dt.Columns.Add("Facility amount");
            dt.Columns.Add("Customers type");
            dt.Columns.Add("initial observations");
            dt.Columns.Add("Outstanding observations");
            dt.Columns.Add("Status of Observation");
            dt.Columns.Add("Status of Facility");
            dt.Columns.Add("1st checker");
            dt.Columns.Add("2nd checker");
            dt.Columns.Add("Remarks");
            dt.Columns.Add("Updated By");

            foreach (GridViewRow gw in GridView1.Rows)
            {
                var chkSelect = gw.FindControl("chkSelect") as CheckBox;
                if (chkSelect.Checked)
                {
                    string Val1 = (gw.FindControl("Label1") as Label).Text; //
                    string Val2 = (gw.FindControl("Label2") as Label).Text; //
                    string Val3 = (gw.FindControl("Label3") as Label).Text; //
                    string Val17 = (gw.FindControl("Label17") as Label).Text; //
                    string Val18 = (gw.FindControl("Label18") as Label).Text; //
                    string Val4 = (gw.FindControl("Label4") as Label).Text; //
                    string Val5 = (gw.FindControl("Label5") as Label).Text; //
                    string Val6 = (gw.FindControl("Label6") as Label).Text; //
                    string Val7 = (gw.FindControl("Label7") as Label).Text; //
                    string Val8 = (gw.FindControl("Label8") as Label).Text; //
                    string Val9 = (gw.FindControl("Label9") as Label).Text; //
                    string Val10 = (gw.FindControl("Label10") as Label).Text; //
                    string Val11 = (gw.FindControl("Label11") as Label).Text; //
                    string Val12 = (gw.FindControl("Label12") as Label).Text; //
                    string Val13 = (gw.FindControl("Label13") as Label).Text; //
                    string Val14 = (gw.FindControl("Label14") as Label).Text; //
                    string Val15 = (gw.FindControl("Label15") as Label).Text; //
                    string Val16 = (gw.FindControl("Label16") as Label).Text; //
                    dt.Rows.Add(Val1, Val2, Val3, Val17, Val18, Val4, Val5, Val6, Val7, Val8, Val9, Val10, Val11, Val12, Val13, Val14, Val15, Val16);
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
                Response.AddHeader("content-disposition", "attachment;  filename=AIB_OLDs.xlsx");
                excel.SaveAs(memoryStream);
                memoryStream.WriteTo(Response.OutputStream);
                Response.Flush();
                Response.End();
            }
        }

        protected void addNew_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("new-records_obsr_loan_docs.aspx");

        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "edit")
            {
                Session["olds_id"] = e.CommandArgument.ToString();
                SqlConnection sqlCon = new SqlConnection(connectionString);
                string query = "SELECT *FROM [OLDs] WHERE id = '" + Session["olds_id"].ToString() + "'";
                SqlCommand sqlcmd = new SqlCommand(query, sqlCon);
                sqlCon.Open();
                SqlDataReader rdr = sqlcmd.ExecuteReader();
                if (rdr.Read())
                {
                    //READ THE DATA FROM COLLATERAL DATABASE AND SAVE THEM INTO SESSION
                    Session["id"] = (string)rdr["id"].ToString();
                    Session["dcd"] = (string)rdr["Document checking date"].ToString(); //  [Document checking date]
                    Session["borr"] = (string)rdr["Borrower"].ToString(); //  [Borrower]
                    Session["deprt"] = (string)rdr["Department"].ToString(); //  [Department]
                    Session["profapp"] = (string)rdr["Purpose of Application"].ToString(); //  [Purpose of Application]
                    Session["cno"] = (string)rdr["Case Number"].ToString(); //  [Case Number]
                    Session["fctp"] = (string)rdr["Facility type"].ToString(); //  [Facility type]
                    Session["curr"] = (string)rdr["Currency"].ToString(); //  [Currency]
                    Session["fcamount"] = (string)rdr["Facility amount"].ToString(); //  [Facility amount]
                    Session["custp"] = (string)rdr["Customers type"].ToString(); //  [Customers type]  
                    Session["initialobsr"] = (string)rdr["initial observations"].ToString(); //  [initial observations]   
                    Session["outsobsr"] = (string)rdr["Outstanding observations"].ToString(); //  [Outstanding observations]        
                    Session["statusobsr"] = (string)rdr["Status of Observation"].ToString(); //  [Status of Observation]
                    Session["StatusFc"] = (string)rdr["Status of Facility"].ToString(); //  [Status of Facility]
                    Session["1stcheck"] = (string)rdr["1st checker"].ToString(); //  [1st checker]
                    Session["second_check"] = (string)rdr["2nd checker"].ToString(); //  [2nd checker]
                    Session["remark"] = (string)rdr["Remarks"].ToString(); //  [Remarks]
                    Session["up_by"] = (string)rdr["Updated By"].ToString(); //  [Updated By]
                    sqlCon.Close();
                    sqlCon.Dispose();
                    Response.Redirect("obser_update.aspx");
                }
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
        protected void searchBtn_Click(object sender, EventArgs e)
        {

            if (string.IsNullOrEmpty(txtcustcase.Text) && string.IsNullOrEmpty(txtststs_obsr.SelectedValue) && string.IsNullOrEmpty(txtcust_type.SelectedValue) && string.IsNullOrEmpty(txtFacilityTypeList.Text))
            {
                string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM [OLDs]";
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
            //----------------------
            if (string.IsNullOrEmpty(txtcustcase.Text) && txtststs_obsr.SelectedValue == "FT" && txtcust_type.SelectedValue == "CT")
            {
                string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM [OLDs]";
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
            if (!string.IsNullOrEmpty(txtststs_obsr.SelectedValue) && txtststs_obsr.SelectedValue == "FT" && txtcust_type.SelectedValue == "CT" && txtcustcase.Text != "")
            {
                string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM [OLDs] where [Case Number] LIKE '%" + txtcustcase.Text + "%' ";
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

            if (string.IsNullOrEmpty(txtcustcase.Text) && txtststs_obsr.SelectedValue != "FT" && txtcust_type.SelectedValue == "CT")
            {
                string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM [OLDs] where [Status of Observation]= '" + txtststs_obsr.SelectedValue + "'";
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
            if (string.IsNullOrEmpty(txtcustcase.Text) && txtststs_obsr.SelectedValue == "FT" && txtcust_type.SelectedValue != "CT")
            {
                string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM [OLDs] where [Customers type]= '" + txtcust_type.SelectedValue + "'";
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

            //--------------------------
            if (string.IsNullOrEmpty(txtcustcase.Text) && txtststs_obsr.SelectedValue == "FT" && txtcust_type.SelectedValue == "CT" && DropDownList1.SelectedValue != "DP")
            {
                string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM [OLDs] where [Department] = '" + DropDownList1.SelectedValue + "'";
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

            ///---------
            if (string.IsNullOrEmpty(txtcustcase.Text) && txtststs_obsr.SelectedValue == "FT" && txtcust_type.SelectedValue == "CT" && DropDownList1.SelectedValue == "DP" && txtborr.Text != "")
            {
                string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM [OLDs] where [Borrower] LIKE '%" + txtborr.Text + "%'";
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

            if (string.IsNullOrEmpty(txtcustcase.Text) && txtststs_obsr.SelectedValue == "FT" && txtcust_type.SelectedValue == "CT" && DropDownList1.SelectedValue == "DP" && txtborr.Text == "" && txtFacilityTypeList.Text != "")
            {
                string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM [OLDs] where [Facility type] LIKE '%" + txtFacilityTypeList.Text + "%'";
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

            if (string.IsNullOrEmpty(txtcustcase.Text) && txtcust_type.SelectedValue == "CT" && DropDownList1.SelectedValue == "DP" && txtborr.Text == "" && txtFacilityTypeList.Text == "" && txtststs_obsr.SelectedValue == "FT")
            {
                string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM [OLDs] where [Borrower] LIKE '%" + txtborr.Text + "%'  AND [Facility type] = '%" + txtFacilityTypeList.Text + "%'  AND [Status of Observation] = '" + txtststs_obsr.SelectedValue + "'";
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

            ///----------------------------------------------------------------------------
            if (string.IsNullOrEmpty(DropDownList1.SelectedValue) && string.IsNullOrEmpty(txtcustcase.Text) && txtborr.Text == "" && txtFacilityTypeList.Text == "" && DropDownList1.SelectedValue == "DP" && txtststs_obsr.SelectedValue == "FT" && txtcust_type.SelectedValue == "CT")
            {
                string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT *FROM [OLDs] where [Department] LIKE '" + DropDownList1.SelectedValue + "'  AND [Facility type] = '%" + txtFacilityTypeList.Text + "%'  AND [Status of Observation] = '" + txtststs_obsr.SelectedValue + "' AND [Customers type] = '" + txtcust_type.SelectedValue + "'";
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

            if (string.IsNullOrEmpty(txtststs_obsr.SelectedValue) && string.IsNullOrEmpty(txtcustcase.Text) && txtborr.Text == "" && txtFacilityTypeList.Text == "" && DropDownList1.SelectedValue == "DP" && txtststs_obsr.SelectedValue != "FT" && txtcust_type.SelectedValue != "CT")
            {
                string connectionString = ConfigurationManager.ConnectionStrings["DBCon"].ConnectionString;
                GridView1.DataSourceID = null;
                string sqlQuery;
                SqlConnection sqlCon = new SqlConnection(connectionString);
                sqlCon.Open();
                sqlQuery = "SELECT count(*)  FROM [OLDs] where [Status of Observation] LIKE '%'" + Convert.ToString(txtststs_obsr.SelectedValue.Trim()) + "''  AND [Customers type] LIKE '%'" + Convert.ToString(txtcust_type.SelectedValue.Trim()) + "''";
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

        protected void GridView1_DataBound(object sender, EventArgs e)
        {

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
                    e.Row.Cells[0].Enabled = true;
                    e.Row.Cells[1].Enabled = false;
                    addNew.Enabled = false;

                }
                if (userType == "Admin")
                {
                    e.Row.Cells[0].Enabled = true;
                    e.Row.Cells[1].Enabled = false;
                    addNew.Enabled = false;
                }

                if (userType == "Users")
                {
                    e.Row.Cells[0].Enabled = true;
                    e.Row.Cells[1].Enabled = true;
                }
            }
        }
    }
}